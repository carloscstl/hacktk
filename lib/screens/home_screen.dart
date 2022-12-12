import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/menu_item.dart';
import '../services/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<MItem> items = [
    MItem(
        "Instalaciones",
        const Icon(
          Icons.settings,
          size: 70.0,
          color: Colors.white,
        ),
        'install',
        Color(0xffffad2b)),
    MItem(
        "Cursos",
        const Icon(
          Icons.cast_for_education,
          size: 70.0,
          color: Colors.white,
        ),
        'courses',
        Colors.green),
    MItem(
        "Artesanos",
        const Icon(
          Icons.people,
          size: 70.0,
          color: Colors.white,
        ),
        'craftsmen',
        Colors.blue),
    MItem(
        "Asistencia",
        const Icon(
          Icons.help,
          size: 70.0,
          color: Colors.white,
        ),
        'chat-detail',
        Colors.red)
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socket = Provider.of<SocketProvider>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () async {
            await authService.logout();
            socket.disconnect();
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * .07),
              //   color: Colors.red,
              height: size.height * .13,
              width: size.width,
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg?w=2000'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Fernando Hernandez',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      maxLines: 2)
                ],
              ),
            ),
            // SizedBox(
            //   height: size.height * .,
            // ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              width: size.width,
              // color: Colors.green,
              child: const Text(
                'Welcome Back',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Image(image: AssetImage('assets/images/logo.png')),
              height: size.height * .3,
              width: size.width * .85,
              decoration: BoxDecoration(
                color: const Color(0xffffad2b),
                // color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // height: size.height * .1,
              width: size.width,
              // color: Colors.green,
              child: const Text(
                'Menu',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: size.height * .18,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, items[index].route);
                    },
                    child: Container(
                      height: size.height * 0.18,
                      width: size.width * 0.4,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: items[index].color, //const Color(0xffffad2b),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            items[index].icon,
                            Text(
                              items[index].title,
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'videochat');
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
