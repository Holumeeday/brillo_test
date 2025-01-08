import 'package:flutter/material.dart';

class PostContentView extends StatelessWidget {
  const PostContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Post Title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text("Post description goes here."),
              ],
            ),
          ),
        );
      },
    );
  }
}
