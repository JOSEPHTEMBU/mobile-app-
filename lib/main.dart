import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/Bloc/%20PostBloc.dart';
import 'package:flutter_test_app/Bloc/PostEvent.dart';
import 'package:flutter_test_app/model/db/DatabaseHelper.dart';
import 'package:flutter_test_app/ui/PostListScreen.dart';

void main() {
  final databaseHelper = DatabaseHelper();
  runApp(MyApp(databaseHelper: databaseHelper));
}

class MyApp extends StatelessWidget {
  final DatabaseHelper databaseHelper;

  MyApp({required this.databaseHelper});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(databaseHelper)..add(LoadPosts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostListScreen(),
      ),
    );
  }
}
