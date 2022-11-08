import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUser extends StatelessWidget {

  final String documentID;
  const GetUser({super.key, required this.documentID});


  @override
  Widget build(BuildContext context) {

    //get the collection
    CollectionReference users  = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentID).get(),
      builder: ((context, snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data = snapshot.data!.data() as Map<String ,dynamic>;
        return Text(
            '${data['firstname']}' + ', ' +
                '${data['dept']}' + ', ' + '${data['semester']}' + 'th' + ' Semester');
      }
      return Center(child: CircularProgressIndicator());
    }),
    );
  }
}
