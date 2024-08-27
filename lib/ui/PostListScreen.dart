import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/Bloc/%20PostBloc.dart';
import 'package:flutter_test_app/Bloc/PostState.dart';
import 'package:flutter_test_app/ui/AddPostScreen.dart';
import 'package:flutter_test_app/ui/PostDetailScreen.dart';

import '../Bloc/PostEvent.dart';

// class PostListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: BlocBuilder<PostBloc, PostState>(
//         builder: (context, state) {
//           if (state is PostLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is PostLoaded) {
//             return ListView.builder(
//               itemCount: state.posts.length,
//               itemBuilder: (context, index) {
//                 final post = state.posts[index];
//                 return ListTile(
//                   title: Text(post.title),
//                   subtitle: Text('${post.location} - \$${post.price}'),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PostDetailScreen(post: post),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (state is PostError) {
//             return Center(child: Text(state.message));
//           }
//           return Center(child: Text('No Posts Available'));
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (_) => AddPostScreen()));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


//////////

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<PostBloc>().add(LoadPosts());
              },
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text('${post.location} - \$${post.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailScreen(post: post),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context.read<PostBloc>().add(DeletePost(post.id!));
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No Posts Available'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



/////