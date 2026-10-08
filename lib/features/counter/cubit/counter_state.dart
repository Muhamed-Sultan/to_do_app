part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class IncrementCounter extends CounterState {}

final class DecrementCounter extends CounterState {}
