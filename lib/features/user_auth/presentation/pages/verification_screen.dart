import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studtech/features/user_auth/firebase_auth_implementation/wrapper.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    sendverifylink();
    super.initState();
  }

  sendverifylink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) {
      Get.snackbar('Link sent', 'A link has been send to your email',
          margin: EdgeInsets.all(30), snackPosition: SnackPosition.BOTTOM);
    });
  }

  reload() async {
    await FirebaseAuth.instance.currentUser!
        .reload()
        .then((value) => {Get.offAll(Wrapper())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Text(
              "Open your mail and click on the link provided to verify email & reload this page."),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reload,
        child: Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}
