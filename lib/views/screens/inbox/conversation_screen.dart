import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConversationScreen extends StatelessWidget {
  final String userName;

  const ConversationScreen({Key? key, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // TODO: Implement video call functionality.
            },
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // TODO: Implement voice call functionality.
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('View profile'),
                value: 'view_profile',
              ),
              PopupMenuItem(
                child: Text('Block user'),
                value: 'block_user',
              ),
            ],
            onSelected: (value) {
              if (value == 'view_profile') {
                // TODO: Implement view profile functionality.
              } else if (value == 'block_user') {
                // TODO: Implement block user functionality.
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return Row(
                  mainAxisAlignment: message.isSent
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: message.isSent ? Colors.blue : Colors.grey[300],
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: message.isSent ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // TODO: Implement send message functionality.
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isSent;

  const Message({required this.text, required this.isSent});
}

final messages = [
  Message(text: 'Hello', isSent: false),
  Message(text: 'Hi there!', isSent: true),
  Message(text: 'How are you?', isSent: false),
  Message(text: "I'm doing well, thanks. How about you?", isSent: true),
  Message(text: 'Not too bad.', isSent: false),
];
