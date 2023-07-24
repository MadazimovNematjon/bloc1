

import 'package:bloc1/bloc/create_post_event.dart';
import 'package:bloc1/bloc/create_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit
class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  String? _title;
  String? _body;

  void onTitleChanged(String title) {
    _title = title;
  }

  void onBodyChanged(String body) {
    _body = body;
  }

  Future<void> createPost() async {
    if (_title == null || _body == null) {
      emit(CreatePostError("Title and body cannot be empty."));
      return;
    }

    // Simulate an API call or data creation process here
    emit(CreatePostLoading());

    try {
      // Your data creation logic goes here
      await Future.delayed(Duration(seconds: 2)); // Simulating a delay for demo purposes
      emit(CreatePostSuccess());
    } catch (error) {
      emit(CreatePostError("Error creating the post."));
    }
  }
}