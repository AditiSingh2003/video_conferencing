import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class MeetingEvent extends Equatable {
  const MeetingEvent();
  @override
  List<Object> get props => [];
}

class GenerateMeetingCodeEvent extends MeetingEvent {}

class JoinMeetingEvent extends MeetingEvent {
  final String code;
  const JoinMeetingEvent(this.code);
  @override
  List<Object> get props => [code];
}

class MeetingState extends Equatable {
  final String? meetingCode;
  final bool isJoining;
  final String? errorMessage;
  const MeetingState({
    this.meetingCode,
    this.isJoining = false,
    this.errorMessage,
  });
  @override
  List<Object?> get props => [meetingCode, isJoining, errorMessage];
}

class MeetingBloc extends Bloc<MeetingEvent, MeetingState> {
  MeetingBloc() : super(const MeetingState()) {
    on<GenerateMeetingCodeEvent>((event, emit) {
      // Placeholder for meeting code generation (replace with uuid if needed)
      const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
      final random = Random();
      final code = List.generate(8, (_) => chars[random.nextInt(chars.length)]).join();
      emit(MeetingState(meetingCode: code));
    });

    on<JoinMeetingEvent>((event, emit) {
      final code = event.code.trim();
      if (code.length == 8) {
        emit(const MeetingState(isJoining: true));
      } else {
        emit(const MeetingState(errorMessage: 'Invalid meeting code'));
      }
    });
  }
}