import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

void main() {
  runApp(BeMyBuddyApp());
}

class BeMyBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMB - Be My Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserList(),
    );
  }
}

class User {
  String name;
  String photoUrl;
  String level;
  String levelLookingFor;

  User(
      {required this.name,
      required this.photoUrl,
      required this.level,
      required this.levelLookingFor});
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [
    User(
        name: 'John Doe',
        photoUrl: 'assets/john.jpg',
        level: 'Intermediate',
        levelLookingFor: 'Beginner'),
    User(
        name: 'Jane Smith',
        photoUrl: 'assets/jane.jpg',
        level: 'Beginner',
        levelLookingFor: 'Intermediate'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMB - Be My Buddy'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Image.asset(users[index].photoUrl, fit: BoxFit.cover),
                    ListTile(
                      title: Text(users[index].name),
                      subtitle: Text(
                          'Level: ${users[index].level}\nLooking for: ${users[index].levelLookingFor}'),
                    ),
                  ],
                ),
              );
            },
            itemCount: users.length,
            viewportFraction: 0.8,
            scale: 0.9,
            loop: false,
            onTap: (int index) {
              // Swiped
            },
          ),
        ),
      ),
    );
  }
}
