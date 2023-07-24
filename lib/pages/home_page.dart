
import 'package:bloc1/bloc/list_post_cubit.dart';
import 'package:bloc1/bloc/list_post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/post.dart';
import '../service/network.dart';
import '../views/item_of_post_view.dart';

class HomePage extends StatefulWidget {
  static String get id => "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Post> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<ListPostCubit,ListPostState>(
        builder: (BuildContext context,ListPostState state){
          if(state is ListPostError){
            return viewOfHome(items,false);
          }

          if(state is ListPostLoaded){
             items = state.posts!;
            return viewOfHome(items,false);
          }
          return viewOfHome(items,true );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
      ),
    );
  }

  Widget viewOfHome(List<Post> items,bool isLoading){
    return Stack(
      children:[ ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          Post post = items[index];
          return itemPost(context,post);
        },
      ),
        isLoading ? Center(
          child: CircularProgressIndicator(),
        ):SizedBox.shrink()
    ]);
  }



}
