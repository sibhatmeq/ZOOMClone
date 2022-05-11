
import 'package:ezoom/screens/history_meeting_screen.dart';
import 'package:ezoom/utilis/colors.dart';
import 'package:ezoom/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';

import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page =0;
  onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }
  List<Widget> pages =[
     MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    const Text('Settings'),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
         elevation: 0,
        title: const Text('Meet & Chat  '),
        centerTitle: true,
      ),

      body: pages[_page],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
            label: 'Meet & Chat'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Meetings'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Contacts'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings'
          ),
        ],
      ), 
    );
  }
}

