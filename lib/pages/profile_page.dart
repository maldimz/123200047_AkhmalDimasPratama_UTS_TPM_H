import 'package:flutter/material.dart';
import 'package:uts_123200047/data/users.dart';
import 'package:uts_123200047/pages/details_page.dart';
import 'package:uts_123200047/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  final Users user;
  ProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(user.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(user.name),
            SizedBox(height: 5),
            Text(user.username),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(user: user),
                          ));
                    },
                    child: Text('Details Profile')),
                SizedBox(width: 5),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false);
                    },
                    child: Text('Logout')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
