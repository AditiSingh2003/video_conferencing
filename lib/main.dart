import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/meeting_bloc.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Conferencing',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: BlocProvider(
        create: (context) => MeetingBloc(),
        child: const HomePage(),
      ),
    );
  }
}