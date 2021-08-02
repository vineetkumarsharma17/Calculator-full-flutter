import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final img="assets/images/vineet.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(

              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Vineet kumar Sharma",style: TextStyle(color: Colors.white,fontSize: 24,
                      fontWeight: FontWeight.bold),),
                  accountEmail: Text("Vineetsha@student.iul.ac.in",style: TextStyle(color: Colors.white),),
                  currentAccountPicture: CircleAvatar(backgroundImage: AssetImage(img),),
                ),
            ),
            ListTile(
              title: Text("Home",style: TextStyle(color: Colors.white),textScaleFactor: 1.3,),
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
            ),
            ListTile(
              title: Text("Profile",style: TextStyle(color: Colors.white),textScaleFactor: 1.3,),
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
            ),
            ListTile(
              title: Text("About",style: TextStyle(color: Colors.white),textScaleFactor: 1.3,),
              leading: Icon(CupertinoIcons.person_2,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
