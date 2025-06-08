// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';

// class VideoCall extends StatelessWidget {
//   final AgoraClient _client = AgoraClient(
//     agoraConnectionData: AgoraConnectionData(
//       appId: "96c782160d8a483ea98ee09273cddb82",
//       tempToken:
//           "007eJxTYLjv9cXh0J6ToW+3PLHtuSzgvH3Tf0VHLYY37hy6DQb5sj0KDJZmyeYWRoZmBikWiSYWxqmJlhapqQaWRubGySkpSRZG+3v0MxoCGRkmBjkzMjJAIIjPwlCSWlzCwAAAXLMe6g==",
//       channelName: "test",
//     ),
//     enabledPermission: [
//       Permission.camera,
//       Permission.microphone
//     ]
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Stack(
//         children: [
//           AgoraVideoViewer(client: _client),
//           AgoraVideoButtons(client: _client)
//         ],
//       )),
//     );
//   }
// }
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatelessWidget {
  final String channelName;
  const VideoCall({Key? key, required this.channelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "96c782160d8a483ea98ee09273cddb82",
        tempToken:
            "007eJxTYLjv9cXh0J6ToW+3PLHtuSzgvH3Tf0VHLYY37hy6DQb5sj0KDJZmyeYWRoZmBikWiSYWxqmJlhapqQaWRubGySkpSRZG+3v0MxoCGRkmBjkzMjJAIIjPwlCSWlzCwAAAXLMe6g==",
        channelName: channelName,
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}