// States
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CreatePostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {}

class CreatePostError extends CreatePostState {
  final String errorMessage;

  CreatePostError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}