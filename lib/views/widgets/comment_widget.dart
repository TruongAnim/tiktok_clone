import 'package:flutter/material.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget(
      {super.key, required this.controller, required this.sendEvent});
  final TextEditingController controller;
  final VoidCallback sendEvent;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        print(widget.controller.text);
      });
    });
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Add a comment...',
              ),
              controller: widget.controller,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: widget.controller.text.trim().isNotEmpty
                ? widget.sendEvent
                : () {},
            color: widget.controller.text.trim().isNotEmpty
                ? Colors.white
                : Colors.white.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}
