import 'package:bloc1/bloc/create_post_cubit.dart'; // Import the CreatePostCubit
import 'package:bloc1/bloc/create_post_state.dart'; // Import the CreatePostState
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateData extends StatefulWidget {
  static String get id => "create_data";

  const CreateData({Key? key}) : super(key: key);

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Data")),
      body: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          if (state is CreatePostError) {
            return createPost(state.errorMessage); // Pass error message to createPost widget
          }
          // Handle other states here if needed, e.g., loading or success state
          return Container(); // Return an empty container for now
        },
      ),
    );
  }

  Widget createPost(String errorMessage) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Title",
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _bodyController,
            decoration: const InputDecoration(
              hintText: "Body",
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _onCreateButtonPressed();
            },
            child: const Text("Create"),
          ),
          if (errorMessage.isNotEmpty) // Show error message if available
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  void _onCreateButtonPressed() {
    String title = _titleController.text.trim();
    String body = _bodyController.text.trim();
    CreatePostCubit createPostCubit = BlocProvider.of<CreatePostCubit>(context);
    createPostCubit.onTitleChanged(title);
    createPostCubit.onBodyChanged(body);
    createPostCubit.createPost();
  }
}
