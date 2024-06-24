

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../controller/shlok_controller.dart';
import '../controller/theme.dart';

class Detilsscreen extends StatelessWidget {
  final int index;

  Detilsscreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shlokProvider = context.watch<ShlokProvider>();
    final shlok = shlokProvider.shlokList[index];
    final themeProvider = Provider.of<ThemeProvider>(context);
    final providerFalse = Provider.of<ShlokProvider>(context, listen: false);

    String displaySaar;

    // Choose the text based on the selected language
    switch (shlokProvider.selectedLanguage) {
      case 'english':
        displaySaar = shlok.saar_enj ?? '';
        break;
      case 'gujarati':
        displaySaar = shlok.saar_guj ?? '';
        break;
      default:
        displaySaar = shlok.saar ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00796B),
        title: const Text(
          'कबीर दास जी के दोहे',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Share.share('${shlok.shlok}\n\n${displaySaar}');
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
              size: 28,
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.translate),
            onSelected: (value) {
              providerFalse.updateSelectedLanguage(value);
            },
            itemBuilder: (context) => const [
              PopupMenuItem<String>(
                value: 'hindi',
                child: Text('Hindi'),
              ),
              PopupMenuItem<String>(
                value: 'english',
                child: Text('English'),
              ),
              PopupMenuItem<String>(
                value: 'gujarati',
                child: Text('Gujarati'),
              ),
            ],
          )
        ],
        elevation: 3,
        shadowColor: const Color(0xff009688),
      ),
      body: Column(
        children: [
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  shlok.img ?? '',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            shlok.shlok ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const Text(
            "अर्थ:",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              displaySaar,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: index > 0
                      ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detilsscreen(index: index - 1),
                      ),
                    );
                  }
                      : null,
                  icon: Icon(Icons.arrow_back,
                      color: themeProvider.isDarkMode
                          ? Colors.grey.shade800
                          : Colors.black,
                      size: 35),
                ),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                      text: '${shlok.shlok}\n\n${displaySaar}',
                    ));
                  },
                  child: Icon(
                    Icons.copy,
                    size: 35,
                    color: themeProvider.isDarkMode
                        ? Colors.grey.shade800
                        : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: index < shlokProvider.shlokList.length - 1
                      ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detilsscreen(index: index + 1),
                      ),
                    );
                  }
                      : null,
                  icon: Icon(
                    Icons.arrow_forward,
                    color: themeProvider.isDarkMode
                        ? Colors.grey.shade800
                        : Colors.black,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
