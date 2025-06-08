// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video/pages/join_meeting.dart';
// import 'package:video/pages/new_meeting.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Video Conference"), centerTitle: true),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
//             child: ElevatedButton.icon(
//               onPressed: () {
//                 Get.to(NewMeeting());
//               },
//               icon: Icon(Icons.add, color: Colors.white),
//               label: Text("New Meeting", style: TextStyle(color: Colors.white)),
//               style: ElevatedButton.styleFrom(
//                 fixedSize: Size(350, 30),
//                 backgroundColor: Colors.indigo,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//           ),
//           Divider(thickness: 1, height: 40, indent: 40, endIndent: 20),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
//             child: OutlinedButton.icon(
//               onPressed: () {
//                 Get.to(JoinWithCode());
//               },
//               icon: Icon(Icons.margin),
//               label: Text("Join with a code"),
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: Colors.indigo,
//                 side: BorderSide(color: Colors.indigo),
//                 fixedSize: Size(350, 30),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 150),
//           Image.network(
//             "https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png",
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video/blocs/meeting_bloc.dart';
import 'package:video/pages/join_meeting.dart';
import 'package:video/pages/new_meeting.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Conference"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<MeetingBloc>(context),
                    child:  NewMeeting(),
                  )),
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("New Meeting", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 30),
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const Divider(thickness: 1, height: 40, indent: 40, endIndent: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<MeetingBloc>(context),
                    child:  JoinWithCode(),
                  )),
                );
              },
              icon: const Icon(Icons.margin),
              label: const Text("Join with a code"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.indigo,
                side: const BorderSide(color: Colors.indigo),
                fixedSize: const Size(350, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          const SizedBox(height: 150),
          Image.network(
            "https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png",
          ),
        ],
      ),
    );
  }
}