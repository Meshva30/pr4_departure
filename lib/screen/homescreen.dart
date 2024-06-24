import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              inactiveThumbColor: Colors.white,
              value:
                  Provider.of<ThemeProvider>(context, listen: true).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value);
              },
            ),

          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff00796B),
        title: Text(
          'कबीर के दोहे',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_sharp,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 3,
        shadowColor: Color(0xff009688),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'dohe');
              },
              child: Center(
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/Kabirdas.png')),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'कबीर दास जी के दोहे',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
