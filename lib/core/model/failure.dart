import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
  @override
  List<Object> get props => [];
}

// General failures

class LocalFailure extends Failure {
  const LocalFailure({message}) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure({message}) : super(message: message);
}

class ValidationFailure extends Failure {
  const ValidationFailure({message}) : super(message: message);
}
