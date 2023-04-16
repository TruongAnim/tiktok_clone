import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controllers/comment_controller.dart';
import 'package:tiktok_clone/models/comment.dart';
import 'package:tiktok_clone/views/widgets/comment_widget.dart';
import 'package:timeago/timeago.dart' as TimeAgo;

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.postId});
  final String postId;
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  late CommentController commentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentController = Get.find();
    commentController.updatePostId(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount:
                    commentController.comments.length, // replace with real data
                itemBuilder: (BuildContext context, int index) {
                  Comment comment = commentController.comments[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      backgroundImage: NetworkImage(
                          comment.profileImage), // replace with real data
                    ),
                    title: Text(comment.username), // replace with real data
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.68,
                              child: Text(
                                comment.comment,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer()
                          ]),
                          Text(TimeAgo.format(
                              (comment.publicDate as Timestamp).toDate())),
                        ]), // replace with real data

                    trailing: Column(children: [
                      IconButton(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.favorite,
                          color: comment.likes.contains(authController.user.uid)
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          commentController.likeComment(comment.id);
                        },
                      ),
                      Text(comment.likes.length.toString()),
                    ]),
                  );
                },
              );
            }),
          ),
          const Divider(height: 1),
          CommentWidget(
            controller: _commentController,
            sendEvent: () {
              commentController.postComment(_commentController.text);
              _commentController.clear();
            },
          ),
        ],
      ),
    );
  }
}
