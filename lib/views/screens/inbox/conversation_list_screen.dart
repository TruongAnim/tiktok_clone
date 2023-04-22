import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/screens/inbox/conversation_screen.dart';

class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversations'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality.
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Settings'),
                value: 'settings',
              ),
            ],
            onSelected: (value) {
              if (value == 'settings') {
                // TODO: Implement settings functionality.
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (BuildContext context, int index) {
          final conversation = conversations[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(conversation.avatarUrl),
            ),
            title: Text(conversation.name),
            subtitle: Text(conversation.lastMessage),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(conversation.timestamp),
                if (conversation.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.blue,
                    ),
                    child: Text(
                      conversation.unreadCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // TODO: Navigate to conversation screen.
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const ConversationScreen(userName: 'Alice')));
            },
          );
        },
      ),
    );
  }
}

class Conversation {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String timestamp;
  final int unreadCount;

  const Conversation({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.timestamp,
    required this.unreadCount,
  });
}

final conversations = [
  const Conversation(
    name: 'Alice',
    avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    lastMessage: 'Hey, how are you?',
    timestamp: '10:21 AM',
    unreadCount: 2,
  ),
  const Conversation(
    name: 'Bob',
    avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    lastMessage: 'What are you up to today?',
    timestamp: '9:47 AM',
    unreadCount: 0,
  ),
  const Conversation(
    name: 'Charlie',
    avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
    lastMessage: 'Did you see the game last night?',
    timestamp: 'Yesterday',
    unreadCount: 1,
  ),
];
