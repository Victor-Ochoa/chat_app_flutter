import 'package:chat_app/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

final kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);
final kdefaultTheme = ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orangeAccent[400]);
final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

Future<void> ensureLoggedIn() async {
  var user = googleSignIn.currentUser;
  if (user == null) user = await googleSignIn.signInSilently();
  if (user == null) user = await googleSignIn.signIn();

  if (await auth.currentUser() == null) {
    var credentials = await googleSignIn.currentUser.authentication;
    await auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: credentials.idToken, accessToken: credentials.accessToken));
  }
}

handleSubmite(String text) async {
  await ensureLoggedIn();
  sendMessage(text: text);
}

void sendMessage({String text, String imageUrl}){
    Firestore.instance.collection("messages").add({
      "text": text,
      "imageUrl": imageUrl,
      "senderName": googleSignIn.currentUser.displayName,
      "senderPhotoUrl": googleSignIn.currentUser.photoUrl
    });
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Online',
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? kIOSTheme
          : kdefaultTheme,
      home: ChatScreen(),
    );
  }
}
