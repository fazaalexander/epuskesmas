import 'package:epuskesmas/Pasien/dashboard_p.dart';
import 'package:epuskesmas/handler/chat/chat.handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatP extends StatefulWidget {
  final String conversationId;
  final String currentUserId;

  const ChatP({required this.conversationId, required this.currentUserId});

  @override
  _ChatPState createState() => _ChatPState();
}

class _ChatPState extends State<ChatP> {
  late DatabaseReference _messagesRef;
  late TextEditingController _textEditingController;
  late ScrollController _scrollController;
  List<Message> _messages = [];

  String? conversationId;
  final String currentUserId =
      (FirebaseAuth.instance.currentUser?.uid).toString();

  @override
  void initState() {
    super.initState();
    _messagesRef = FirebaseDatabase.instance
        .ref()
        .child('conversations')
        .child(widget.conversationId)
        .child('messages');
    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
    _loadMessages();
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      final message = Message(
        sender: currentUserId,
        text: text,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        message_id: _messagesRef.push().key!,
      );

      _messagesRef.push().set(message.toMap());

      _textEditingController.clear();
    }
  }

  void _loadMessages() {
    final messages = <Message>[];

    _messagesRef.onValue.listen((DatabaseEvent event) {
      DataSnapshot messageSnapshot = event.snapshot;

      if (messageSnapshot.value != null) {
        final messageMap = messageSnapshot.value as Map<dynamic, dynamic>;

        for (var msg in messageMap.entries) {
          Map<String, dynamic> messageData =
              Map<String, dynamic>.from(msg.value as Map<dynamic, dynamic>);

          final message = Message.fromMap(msg.key, messageData);
          messages.add(message);
        }
        messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
      }

      setState(() {
        for (var message in messages) {
          bool messageExists =
              _messages.any((m) => m.message_id == message.message_id);

          if (!messageExists) {
            _messages.add(message);
          }
        }
      });

      // Scroll to the bottom of the chat
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            onPressed: () {
              deleteConversation(widget.conversationId.toString());
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                    title: const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 40,
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Berhasil menyelesaikan konsultasi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DashboardP()),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('OK'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];

                final align = message.sender == currentUserId
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start;

                return Row(
                  mainAxisAlignment: align == CrossAxisAlignment.end
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: align == CrossAxisAlignment.end
                            ? Colors.blue
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: align == CrossAxisAlignment.end
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Ketikkan pesan...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _sendMessage(_textEditingController.text);
                  },
                  icon: const Icon(Icons.send),
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
  final String sender;
  final String text;
  final int timestamp;
  final String message_id;

  Message(
      {required this.sender,
      required this.text,
      required this.timestamp,
      required this.message_id});

  factory Message.fromMap(String messageId, Map<String, dynamic> map) {
    return Message(
      sender: map['sender'],
      text: map['text'],
      timestamp: map['timestamp'],
      message_id: messageId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'text': text,
      'timestamp': timestamp,
      'message_id': message_id,
    };
  }
}
