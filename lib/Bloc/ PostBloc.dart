import 'package:bloc/bloc.dart';
import 'package:flutter_test_app/Bloc/PostState.dart';
import 'package:flutter_test_app/model/db/DatabaseHelper.dart';

import 'PostEvent.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final DatabaseHelper databaseHelper;

  PostBloc(this.databaseHelper) : super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<AddPost>(_onAddPost);
    on<DeletePost>(_onDeletePost);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final posts = await databaseHelper.getPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostError("Failed to load posts"));
    }
  }

  Future<void> _onAddPost(AddPost event, Emitter<PostState> emit) async {
    try {
      await databaseHelper.insertPost(event.post);
      add(LoadPosts());
    } catch (e) {
      emit(PostError("Failed to add post"));
    }
  }

  Future<void> _onDeletePost(DeletePost event, Emitter<PostState> emit) async {
    try {
      await databaseHelper.deletePost(event.id);
      add(LoadPosts());
    } catch (e) {
      emit(PostError("Failed to delete post"));
    }
  }
}
