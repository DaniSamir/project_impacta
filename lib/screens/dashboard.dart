/* import 'package:firebase_database/firebase_database.dart';
  import 'package:flutter/material.dart';
  import 'package:project_impacta/widgets/text_field_custom.dart';

  class MyApp extends StatefulWidget {
    @override
    _MyAppState createState() => _MyAppState();
  }

  class _MyAppState extends State<MyApp> {
    // ====================================================== //
    late String nameUser;
    late String userId;
    late String phone;
    late String email;

    final databaseReference = FirebaseDatabase(
            databaseURL:
                'https://contact-list-firebase-97a94-default-rtdb.firebaseio.com')
        .ref();

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

    // TODO Create Data
    createData() {
      // DocumentReference documentReference =
      // FirebaseFirestore.instance.collection('user').doc(nameUser);

      // create Map to send data in key:value pair form
      Map<String, dynamic> students = ({
        "nameUser": nameUser,
        "userId": userId,
        "phone": phone,
        "email": email
      });

      // send data to Firebase
      databaseReference.child('user').set(students);
    }

    // TODO Read Data
    readData() {
      //databaseReference.get().then((dataSnapshot) {});
      final list = databaseReference.child('user').once().then(
          (DatabaseEvent databaseEvent) =>
              {if (databaseEvent.snapshot != null) {}});
      print(list);
    }

    // TODO Update Data
    updateData() {
      // DocumentReference documentReference =
      //  FirebaseFirestore.instance.collection('user').doc(stdName);

      Map<String, dynamic> students = ({
        "nameUser": nameUser,
        "userId": userId,
        "phone": phone,
        "email": email
      });

      // update data to Firebase
      databaseReference.update(students);
    }

    // TODO Delete Data
    deleteData() {
      //DocumentReference documentReference =
      //  FirebaseFirestore.instance.collection('user').doc(nameUser);

      // delete data from Firebase
      databaseReference.remove();
    }
    // ====================================================== //

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('CRUD App'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
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
                    'ID',
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
                    Icon(Icons.perm_identity_outlined),
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
                    Icon(Icons.confirmation_number_outlined),
                  ),
                  onChanged: (String gpa) {
                    getStudentCGPA(gpa);
                  },
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
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
                    Expanded(
                      // ignore: deprecated_member_use
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          elevation: 8.0,
                          backgroundColor: Colors.blue,
                          shape: raisedButtonBorder(),
                        ),
                        onPressed: () => readData(),
                        child: Text('Read',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      // ignore: deprecated_member_use
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          backgroundColor: Colors.orange,
                          elevation: 8.0,
                          shape: raisedButtonBorder(),
                        ),
                        onPressed: () => updateData(),
                        child: Text('Update',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                    Expanded(
                      // ignore: deprecated_member_use
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          elevation: 8.0,
                          backgroundColor: Colors.red,
                          shape: raisedButtonBorder(),
                        ),
                        onPressed: () => deleteData(),
                        child: Text('Delete',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1.0, height: 25.0, color: Colors.green),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Nome',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' ID',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Telefone',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'E-mail',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                StreamBuilder(
                  stream:
                    
                  // ignore: missing_return

                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];
                          return Row(
                            children: [
                              Expanded(
                                child: Text(
                                  documentSnapshot["nameUser"],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  documentSnapshot["userId"],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  documentSnapshot["phone"],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  documentSnapshot["email"],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      );
                    }
                  },
                ), 
              ],
            ),
          ),
        ),
      );
    }
  }*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_impacta/screens/create_contact.dart';
import 'package:project_impacta/widgets/text_field_custom.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber[500],
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ====================================================== //
  late String nameUser;
  late String userId;
  late String phone;
  late String email;

  FirebaseFirestore db = FirebaseFirestore.instance;

  // TODO Create Data

  // TODO Read Data
  readData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(nameUser);

    documentReference.get().then((dataSnapshot) {});
  }

  // TODO Update Data
  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(nameUser);

    Map<String, dynamic> students = ({
      "nameUser": nameUser,
      "userId": userId,
      "phone": phone,
      "email": email
    });

    // update data to Firebase
    documentReference
        .update(students)
        .whenComplete(() => print('$nameUser updated'));
  }

  // TODO Delete Data
  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('crud').doc(nameUser);

    // delete data from Firebase
    documentReference.delete().whenComplete(() => print('$nameUser deleted'));
  }
  // ====================================================== //

  Stream<dynamic>? list() {
    final userRef = db.collection('crud').snapshots();

    //  final result = userRef.collection('crud').snapshots();

    // return result;
    // QuerySnapshot query = await db.collection('crud').get();

    //FirebaseFirestore.instance.collection('crud').snapshots(),
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Contatos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 15.0),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateUser()),
                    ),
                    icon: Icon(Icons.create),
                    label: Text('Criar Usuário'),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        elevation: 8.0,
                        backgroundColor: Colors.blue,
                        shape: raisedButtonBorder(),
                      ),
                      onPressed: () => readData(),
                      child: Text('Ver',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        backgroundColor: Colors.orange,
                        elevation: 8.0,
                        shape: raisedButtonBorder(),
                      ),
                      onPressed: () => updateData(),
                      child: Text('Atualizar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  Expanded(
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        elevation: 8.0,
                        backgroundColor: Colors.red,
                        shape: raisedButtonBorder(),
                      ),
                      onPressed: () => deleteData(),
                      child: Text('Deletar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Divider(thickness: 1.0, height: 25.0, color: Colors.green),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Nome',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Id',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Telefone',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'E-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              StreamBuilder(
                stream: db.collection('crud').snapshots(),
                // db.collection('crud').snapshots(),
                //  FirebaseFirestore.instance.collection('crud').snapshots(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Row(
                          children: [
                            Expanded(
                              child: Text(
                                documentSnapshot["nameUser"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                documentSnapshot["userId"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                documentSnapshot["phone"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                documentSnapshot["email"],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
