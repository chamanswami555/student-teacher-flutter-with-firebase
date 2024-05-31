import 'package:studtech/RealTimeDatabase%20CRUD/real_tim_crud.dart';
import 'package:flutter/material.dart';

import '../global/common/toast.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController genController = TextEditingController();
final TextEditingController dobController = TextEditingController();

void updateBottomSheet(BuildContext context, name, id, gen, dob) {
  nameController.text = name;
  genController.text = gen;
  dobController.text = dob;
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  "Create your items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "eg. Chaman Swami",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: genController,
                decoration: const InputDecoration(
                  labelText: "Gender",
                  hintText: "F/M",
                ),
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: "DOB",
                  hintText: "30 September 2006",
                ),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        genController.text.isEmpty ||
                        dobController.text.isEmpty) {
                      showToast(message: "All fields are required");
                    } else {
                      databaseReference.child(id).update({
                        'name': nameController.text.toString(),
                        'gender': genController.text.toString(),
                        'dob': dobController.text.toString(),
                      });

                      //For Dismiss the keyboard afte adding items
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Update"))
            ],
          ),
        );
      });
}

Future<void> _selectDate(BuildContext context) async {
  DateTime? _picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (_picked != null) {
    dobController.text = _picked.toString().split(" ")[0];
  }
}
