import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:studtech/RealTimeDatabase%20CRUD/real_tim_crud.dart';

class forStudent extends StatefulWidget {
  const forStudent({super.key});

  @override
  State<forStudent> createState() => _forStudentState();
}

class _forStudentState extends State<forStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Student Database"),
      ),
      // For Read/Display Operaion
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: databaseReference,
                itemBuilder: (context, snapshot, index, animation) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        snapshot.child("name").value.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(snapshot.child("dob").value.toString()),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: Text(snapshot
                            .child("gender")
                            .value
                            .toString()
                            .toUpperCase()),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
