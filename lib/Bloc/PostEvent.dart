import '../model/Post.dart';

abstract class PostEvent {}

class LoadPosts extends PostEvent {}

class AddPost extends PostEvent {
  final Post post;
  AddPost(this.post);
}

class DeletePost extends PostEvent {
  final int id;
  DeletePost(this.id);
}
