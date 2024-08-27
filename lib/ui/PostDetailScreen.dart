import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/Post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(post.description),
            SizedBox(height: 16),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(post.location),
            SizedBox(height: 16),
            Text(
              'Price: \$${post.price}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
