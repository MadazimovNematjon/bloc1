import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_post_cubit.dart';
import '../bloc/create_post_state.dart';

// Import the CreatePostCubit, CreatePostState, and CreatePostEvent classes from the provided code

class CreateData extends StatelessWidget {
  static String get id => "create_data";

  const CreateData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Data")),
      body: BlocProvider(
        create: (_) => CreatePostCubit(),
        child: CreatePostForm(),
      ),
    );
  }
}

class CreatePostForm extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostError) {
          _showSnackBar(context, state.errorMessage);
        } else if (state is CreatePostSuccess) {
          _showSnackBar(context, "Post created successfully!");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _titleController,
                onChanged: (value) => context.read<CreatePostCubit>().onTitleChanged(value),
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _bodyController,
                onChanged: (value) => context.read<CreatePostCubit>().onBodyChanged(value),
                decoration: const InputDecoration(
                  hintText: "Body",
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.read<CreatePostCubit>().createPost(),
                child: const Text("Create"),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
