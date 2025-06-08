import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video/blocs/meeting_bloc.dart';
import 'package:video/video_call.dart';

class JoinWithCode extends StatelessWidget {
  const JoinWithCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return BlocConsumer<MeetingBloc, MeetingState>(
      listener: (context, state) {
        if (state.isJoining) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoCall(channelName: controller.text.trim()),
            ),
          );
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }
      },
      builder: (context, state) {
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
                  "https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png",
                  fit: BoxFit.cover,
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Enter meeting code below",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: controller,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Example: abcdefgh",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<MeetingBloc>().add(JoinMeetingEvent(controller.text));
                  },
                  child: const Text("Join", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 30),
                    backgroundColor: Colors.indigo,
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