import 'package:bloc1/bloc/list_post_state.dart';
import 'package:bloc/bloc.dart';

import '../model/post.dart';
import '../service/network.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit() : super(ListPostInit());

  void apiPostList()async{
    // emit(ListPostLoaded());

    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    print(response);
    if (response != null) {
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    } else {
      emit(ListPostError(error: "Couldn't fetch posts"));
    }
  }


  void apiPostDelete(Post post)async{
    emit(ListPostLoaded());
    final response = Network.DEL(Network.API_DELETE+post.id.toString(),Network.paramsEmpty());
    print(response);
    if(response != null){
      apiPostList();
    }else{
      emit(ListPostError(error: "Error"));
    }
  }
}