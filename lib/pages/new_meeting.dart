import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video/blocs/meeting_bloc.dart';
import 'package:video/video_call.dart';

class NewMeeting extends StatelessWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeetingBloc, MeetingState>(
      builder: (context, state) {
        if (state.meetingCode == null) {
          context.read<MeetingBloc>().add(GenerateMeetingCodeEvent());
        }
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    child: const Icon(Icons.arrow_back_ios_new_sharp, size: 35),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 50),
                Image.network(
                  "https://user-images.githubusercontent.com/67534990/127776392-8ef4de2d-2fd8-4b5a-b98b-ea343b19c03e.png",
                  fit: BoxFit.cover,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter meeting code below",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.link),
                      title: SelectableText(
                        state.meetingCode ?? 'Generating...',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(Icons.copy),
                    ),
                  ),
                ),
                const Divider(thickness: 1, height: 40, indent: 20, endIndent: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Implement share functionality if needed
                    // Example: Share.share("Meeting Code: ${state.meetingCode}");
                  },
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  label: const Text("Share invite", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 30),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: state.meetingCode != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VideoCall(channelName: state.meetingCode!),
                            ),
                          );
                        }
                      : null,
                  icon: const Icon(Icons.video_call),
                  label: const Text("Start call"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.indigo,
                    side: const BorderSide(color: Colors.indigo),
                    fixedSize: const Size(350, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
