import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  //text controllers
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _uniNameController = TextEditingController();
  final _semesterController = TextEditingController();
  final _deptController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _uniNameController.dispose();
    _semesterController.dispose();
    _deptController.dispose();
    super.dispose();
  }

  Future signUp() async {
    userDetails(
      _firstnameController.text.trim(),
      _lastnameController.text.trim(),
      _uniNameController.text.trim(),
      int.parse(_semesterController.text.trim()),
      _deptController.text.trim(),
    );
  }

  Future userDetails(String firstname, String lastname, String universityName,
      int semester, String dept) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstname,
      'lastname': lastname,
      'universityName': universityName,
      'semester': semester,
      'dept': dept,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          'Enter your Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    child: Text(
                      'Enter Data',
                      style: TextStyle(fontSize: 42, fontWeight: FontWeight.w600),
                    ),
                  ),

                  //first name text field
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          controller: _firstnameController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'First Name'),
                        ),
                      ),
                    ),
                  ),

                  //last name text field
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          controller: _lastnameController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Last Name'),
                        ),
                      ),
                    ),
                  ),

                  //university
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          controller: _uniNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'University Name'),
                        ),
                      ),
                    ),
                  ),

                  //Semester
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                            controller: _semesterController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Your Current Semester'),
                        ),
                      ),
                    ),
                  ),

                  //department
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          controller: _deptController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Department Name'),
                        ),
                      ),
                    ),
                  ),

                  //button for Create Data
                  GestureDetector(
                    onTap: () {
                      signUp();
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48.0,bottom: 100),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
