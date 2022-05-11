
import 'dart:math';

import 'package:ezoom/resources/jitsi_meet_methods.dart';
import 'package:ezoom/screens/video_call_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
   MeetingScreen({Key? key}) : super(key: key);

   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
   createNewMeeting()async{
     var random= Random();
     String roomName =(random.nextInt(10000000)+10000000).toString();

     _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
   }
   joinMeeting( BuildContext context) {
     WidgetsBinding.instance?.addPostFrameCallback((_) {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => VideoCallScreen()));
     });
   }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed:createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onPressed: joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              onPressed: (){},
              icon: Icons.calendar_today,
              text: 'Schedule',
            ),
            HomeMeetingButton(
              onPressed: (){},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text('Create/Join Meetings with a just a click!',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ],
    );
  }
}
