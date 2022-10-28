import 'package:deezcent_project/modules/forms/screens/navigator_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../forms/screens/form_screen_fixed.dart';

void main() {
  runApp(const DashBoard());
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  final classForm = const Forms();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 2) {
      FirebaseAuth.instance.signOut();
    } else if (_selectedIndex == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Forms()),
      );
    }
  }

  void _selectMenu(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Forms()),
      );
    }
    // ignore: no_leading_underscores_for_local_identifiers
    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Bruhhh()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular', primaryColor: Colors.teal[600]),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list_fill),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clear_circled_solid),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal[600],
          unselectedItemColor: const Color(0xffD3DEFA),
          onTap: _onItemTapped,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 50,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back \n${user.email!}!',
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Lets get back to work, \nshall we?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/a/ALm5wu33WwLGF4iu4zW44QldZ-7B7kgRCqU5Jl24juyB8A=s288-p-rw-no',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              courseLayout(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget courseLayout(BuildContext context) {
  List<String> imageFileList = [
    'gold.png',
    'lavender.png',
    'leaf.png',
    'merah.png',
    'navy.png',
    'purple.png',
    'teal.png',
  ];

  return MasonryGridView.count(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    mainAxisSpacing: 27,
    crossAxisSpacing: 23,
    itemCount: imageFileList.length,
    itemBuilder: (context, index) {
      final _DashBoardState ontaps = _DashBoardState();
      final indexes = imageFileList.indexOf(imageFileList[index]);

      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => ontaps._selectMenu(indexes),
          onDoubleTap: () => print(indexes),
          child: Image.asset(
            'lib/assets/images/${imageFileList[index]}',
          ),
        ),
      );
    },
  );
}
