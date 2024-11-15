import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'unity_bloc_event.dart';
part 'unity_bloc_state.dart';

class UnityBlocBloc extends Bloc<UnityBlocEvent, UnityBlocState> {
  UnityBlocBloc() : super(UnityBlocInitial()) {
    on<UnityBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
