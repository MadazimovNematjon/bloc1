// Events
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TitleChanged extends CreatePostEvent {
  final String title;

  TitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

class BodyChanged extends CreatePostEvent {
  final String body;

  BodyChanged(this.body);

  @override
  List<Object?> get props => [body];
}

class CreatePostButtonPressed extends CreatePostEvent {}
