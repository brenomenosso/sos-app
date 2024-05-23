part of 'sos_cubit.dart';

@immutable
sealed class SosState {}

final class SosInitial extends SosState {}

final class SosOnDistress extends SosState {}

final class SosOffDistress extends SosState {}
