import 'package:ezoom/resources/auth_methods.dart';
import 'package:ezoom/resources/jitsi_meet_methods.dart';
import 'package:ezoom/utilis/colors.dart';
import 'package:ezoom/widgets/meeting_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetMethods =JitsiMeetMethods();

  bool isAudioMuted = true;
  bool isVideoMuted =true;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    meetingIdController =TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);

  }

   @override
   void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();


   }
  _joinMeeting(){
   _jitsiMeetMethods.createMeeting(roomName: meetingIdController.text , isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted)

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation:0 ,
          backgroundColor: backgroundColor,
          title: const Text('Join a Meeting', style: TextStyle(
            fontSize: 18
          ),
          ),
          centerTitle: true,
        ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller:meetingIdController ,
              maxLines: 1,
              textAlign : TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller:nameController ,
              maxLines: 1,
              textAlign : TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
             child: Text('Join', style: TextStyle(
               fontSize: 16,
             )),
            ),
          ),
          const SizedBox(height: 20,),
          MeetingOption(text: 'Mute Audio', isMute:isAudioMuted , onChange: onAudioMuted),
          MeetingOption(text: 'Turn off my video', isMute:isAudioMuted , onChange: onVideoMuted),
        ],
      ),
    );
  }
  onAudioMuted(bool val){
   setState(() {
     isAudioMuted =val;
   });
  }

  onVideoMuted(bool val){
   setState(() {
     isVideoMuted =val;
   });

  }
}
