import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            buildTop(),
            buildContent(),
            const SizedBox(height: 16),
            buidAbout(),
          ],
        ),
      ),
    );
  }

  buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Indra Kurniawwan',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 10),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
            ),
          )
        ],
      );
  buidAbout() => Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              'About',
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hello my name is Indra Kurniawan, I am undergraduate student at Padjadjaran University.I have an interest in the development of mobile phones both in terms of hardware, software, and apps development. Experienced at creating webiste and creating some simple mobile apps with kotlin and dart. ',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            )
          ],
        ),
      );

  buildTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          child: buildCoverImage(),
          padding: const EdgeInsets.only(bottom: 100),
        ),
        Positioned(top: 200, child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(('assets/img/unpad.jpg'),
            width: double.infinity, height: 280, fit: BoxFit.cover),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: 80,
        backgroundColor: Colors.blue.shade900,
        child: ClipOval(
          child: Image.asset(
            'assets/img/profile.jpg',
          ),
        ),
      );
}
