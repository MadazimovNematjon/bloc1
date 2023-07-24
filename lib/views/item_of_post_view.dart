import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../bloc/list_post_cubit.dart';
import '../model/post.dart';
Widget itemPost(BuildContext context,Post post) {
  return Slidable(
    startActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){

          },
        ),
        children: [SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);

          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.edit,
        )]
    ),
    endActionPane:  ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){

          },
        ),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          )]
    ),
    child: Container(
      padding: EdgeInsets.only(top: 10,left: 5,right: 5),
      child: Column(
        children: [
          Text(post.title!.toUpperCase()),
          SizedBox(
            height: 5,
          ),
          Text(post.body ?? ""),
        ],
      ),
    ),
  );
}