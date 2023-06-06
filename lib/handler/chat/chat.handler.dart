import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

void createNewConversation(
    String dokterID, Function(String) onCreateResult) async {
  final DatabaseReference conversationRef =
      FirebaseDatabase.instance.ref().child('conversations');

  final pasienID = (FirebaseAuth.instance.currentUser?.uid).toString();

  final chat = await getConversationIDByPasienID(pasienID);

  if (chat == null) {
    DatabaseReference namaDokterRef =
        FirebaseDatabase.instance.ref().child("users/$dokterID/fullName");

    final Map<String, dynamic> participants = {
      "pasienID": pasienID,
      "dokterID": dokterID,
    };

    final Map<String, dynamic> conversationData = {
      "participants": participants,
      "messages": {},
    };

    await conversationRef.push().set(conversationData);
    onCreateResult("success");
  } else {
    onCreateResult("failed");
  }
}

Future<String?> getConversationIDByPasienID(String pasienID) async {
  final completer = Completer<String?>();

  final DatabaseReference conversationRef =
      FirebaseDatabase.instance.ref('conversations');

  conversationRef.onValue.listen((DatabaseEvent event) {
    final conversations = event.snapshot.value;
    if (conversations != null) {
      final Map<dynamic, dynamic> conversationsData =
          Map<dynamic, dynamic>.from(conversations as Map<dynamic, dynamic>);

      for (var conversationId in conversationsData.keys) {
        final conversationData = conversationsData[conversationId];

        final participants = conversationData['participants'];

        if (participants != null &&
            participants.containsKey('pasienID') &&
            participants['pasienID'] == pasienID) {
          completer.complete(conversationId);
          return;
        }
      }
    }
    completer.complete(null);
  });

  return completer.future;
}

Future<String?> getConversationIDByDokterID(String dokterID) async {
  final completer = Completer<String?>();

  final DatabaseReference conversationRef =
      FirebaseDatabase.instance.ref('conversations');

  conversationRef.onValue.listen((DatabaseEvent event) {
    final conversations = event.snapshot.value;
    if (conversations != null) {
      final Map<dynamic, dynamic> conversationsData =
          Map<dynamic, dynamic>.from(conversations as Map<dynamic, dynamic>);

      for (var conversationId in conversationsData.keys) {
        final conversationData = conversationsData[conversationId];

        final participants = conversationData['participants'];

        if (participants != null &&
            participants.containsKey('dokterID') &&
            participants['dokterID'] == dokterID) {
          completer.complete(conversationId);
          return;
        }
      }
    }
    completer.complete(null);
  });

  return completer.future;
}

void sendMessage(String conversationId, String sender, String text) async {
  if (text.isNotEmpty) {
    final DatabaseReference conversationRef = FirebaseDatabase.instance
        .ref()
        .child('conversations/$conversationId/messages');

    final int timestamp = DateTime.now().millisecondsSinceEpoch;

    final Map<String, dynamic> messageData = {
      "sender": sender,
      "text": text,
      "timestamp": timestamp,
    };

    await conversationRef.push().set(messageData);
  }
}

void deleteConversation(String? conversationId) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("conversations");
  return ref.child(conversationId!).remove();
}
