import 'package:flutter/material.dart';
import 'package:uts_123200047/data/users.dart';

class DetailsPage extends StatelessWidget {
  final Users user;
  const DetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  user.image,
                  fit: BoxFit.cover,
                )),
            headerContent(user.name, user.username),
            rowDetailContent(
                Icons.location_city, 'Tempat, Tanggal Lahir', user.born),
            rowDetailContent(Icons.school, 'Class', user.classes),
            rowDetailContent(Icons.cloud, 'Hope/Wishes', user.hope),
          ],
        ));
  }
}

Widget rowDetailContent(IconData icon, String title, String content) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(content),
          ],
        ),
      ],
    ),
  );
}

Widget headerContent(String name, String username) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 5),
          Text(username),
        ],
      ));
}
