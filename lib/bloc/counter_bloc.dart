// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test/main.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const _CounterState(count: 0)) {
    on<_Increment>((event, emit) {
      if (state.count < data.length - 1) {
        emit(state.copyWith(count: state.count + 1));
      } else {
        emit(state.copyWith(count: 0));
      }
    });
    on<_Decrement>((event, emit) {
      if (state.count == 0) {
        emit(state.copyWith(count: data.length - 1));
      } else {
        emit(state.copyWith(count: state.count - 1));
      }
    });
  }
}
