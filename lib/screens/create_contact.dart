import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_impacta/screens/dashboard.dart';
import 'package:project_impacta/widgets/text_field_custom.dart';
import 'package:project_impacta/widgets/top_bar.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late String nameUser;
  late String userId;
  late String phone;
  late String email;
  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(nameUser);

    // create Map to send data in key:value pair form
    Map<String, dynamic> students = ({
      "nameUser": nameUser,
      "userId": userId,
      "phone": phone,
      "email": email
    });

    // send data to Firebase
    documentReference.set(students).whenComplete(() => AlertDialog(
          icon: Icon(Icons.check_circle_rounded),
          title: Text('Usuário adicionado com sucesso'),
        ));
  }

  getStudentName(name) {
    this.nameUser = name;
  }

  getStudentID(id) {
    this.userId = id;
  }

  getStudyProgramID(pid) {
    this.phone = pid;
  }

  getStudentCGPA(result) {
    this.email = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopBar(
      //   title: ' Criar Usuário',
      //   child: Container(),
      //   onPressed: () {
      //     MaterialPageRoute(builder: (context) => MyApp());
      //   },
      // ),
      appBar: AppBar(
        title: Text(' Criar Usuário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: 150,
              ),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldCuston(
                  'Nome',
                  Icon(Icons.account_circle_outlined),
                ),
                onChanged: (String name) {
                  setState(() {
                    getStudentName(name);
                  });
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldCuston(
                  'Id',
                  Icon(Icons.perm_identity_outlined),
                ),
                onChanged: (String sID) {
                  getStudentID(sID);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldCuston(
                  'Telefone',
                  Icon(Icons.phone_android),
                ),
                onChanged: (String pID) {
                  getStudyProgramID(pID);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                style: simpleTextStyle(),
                decoration: textFieldCuston(
                  'E-mail',
                  Icon(Icons.email),
                ),
                onChanged: (String gpa) {
                  getStudentCGPA(gpa);
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          elevation: 8.0,
                          backgroundColor: Colors.green,
                          shape: raisedButtonBorder(),
                        ),
                        onPressed: () => createData(),
                        child: Text('Create',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
