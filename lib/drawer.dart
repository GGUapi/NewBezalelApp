import 'faqlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'info.dart';
import 'servicelist.dart';
import 'faqlist.dart';

class ResDrawer extends StatelessWidget {
  ResDrawer();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFEAEAEA),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 105,  // Reduced height here
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0), // Custom padding around the text
                    child: Text('Bezalel設備', style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close,color: Colors.white,))
                ],
              ),

              decoration: BoxDecoration(
                color: Color(0xFF4B9BE1),
              ),
              margin: EdgeInsets.all(0),  // Remove margins if needed
              padding: EdgeInsets.all(0),  // Adjust padding if needed
            ),
          ),
          ListTile(
            leading: Image.asset('assets/user.png'),
            title: Text('帳戶資訊'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InfoScreen())); // Close the drawer
            },
          ),

          ListTile(
            leading: Image.asset('assets/devices.png'),
            title: Text('設備'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServicelistScreen()));
            },
          ),

          ListTile(
            leading: Image.asset('assets/help.png'),
            title: Text('客戶服務FAQ'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FaqlistScreen()));
            },
          ),

          ListTile(
            leading: Image.asset('assets/arrow.png'),
            title: Text('English/中文'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen()));
            },
          ),

          ListTile(
            leading: Image.asset('assets/logout.png'),
            title: Text('登出'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen()));
              // Navigate to settings page
            },
          ),
          // Add more options as needed...
        ],
      ),
    );
  }
}