import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_impacta/screens/create_contact.dart';
import 'package:project_impacta/widgets/text_field_custom.dart';
import 'package:project_impacta/widgets/top_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: DashBoardScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amber[500],
      ),
    ),
  );
}

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color.fromARGB(255, 248, 189, 184),
          appBar: CustomAppBar(
            title: Text(
              'Meus Contatos',
              style:
                  GoogleFonts.rancho(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            leading: Icon(Icons.menu),
          ),
          body: SingleChildScrollView(
            child: Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     colors: [
              //       Color.fromARGB(255, 219, 128, 204),
              //       const Color.fromARGB(255, 250, 177, 171),
              //     ],
              //   ),
              // ),
              padding: EdgeInsets.fromLTRB(20, 60, 20, 5),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Meus Atalhos',
                      style: GoogleFonts.rancho(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Color(0XFFB71731),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0XFFB71731),
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateUser()),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Adicionar Contato',
                              style: GoogleFonts.rancho(
                                fontSize: 28,
                                fontWeight: FontWeight.w300,
                                color: Color(0XFFB71731),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            // CircleAvatar(
                            //   backgroundColor: Color(0XFFB71731),
                            //   child: IconButton(
                            //     icon: Icon(Icons.delete),
                            //     onPressed: () => Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => CreateUser()),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                            // Text(
                            //   'Deletar Contato',
                            //   style: GoogleFonts.rancho(
                            //     fontSize: 28,
                            //     fontWeight: FontWeight.w300,
                            //     color: Color(0XFFB71731),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       // ignore: deprecated_member_use
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(vertical: 15.0),
                  //           elevation: 8.0,
                  //           backgroundColor: Colors.blue,
                  //           shape: raisedButtonBorder(),
                  //         ),
                  //         onPressed: () => readData(),
                  //         child: Text('Ver',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white)),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       // ignore: deprecated_member_use
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(vertical: 15.0),
                  //           backgroundColor: Colors.orange,
                  //           elevation: 8.0,
                  //           shape: raisedButtonBorder(),
                  //         ),
                  //         onPressed: () => updateData(),
                  //         child: Text('Atualizar',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white)),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       // ignore: deprecated_member_use
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(vertical: 15.0),
                  //           elevation: 8.0,
                  //           backgroundColor: Colors.red,
                  //           shape: raisedButtonBorder(),
                  //         ),
                  //         onPressed: () => deleteData(),
                  //         child: Text('Deletar',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white)),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // Divider(thickness: 1.0, height: 25.0, color: Colors.green),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Últimos Contatos',
                      style: GoogleFonts.rancho(
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        color: Color(0XFFB71731),
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: new BoxDecoration(
                        color: Color.fromARGB(255, 255, 97, 97),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0),
                          bottomLeft: const Radius.circular(40.0),
                          bottomRight: const Radius.circular(40.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 25, right: 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nome',
                                    style: GoogleFonts.rancho(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0XFFB71731),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Text(
                                //     'Id',
                                //     style: GoogleFonts.rancho(
                                //         fontSize: 20,
                                //         fontWeight: FontWeight.w300,
                                //         color: Colors.white),
                                //   ),
                                // ),
                                Expanded(
                                  child: Text(
                                    'Telefone',
                                    style: GoogleFonts.rancho(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromARGB(255, 167, 1, 29),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Text(
                                //     'E-mail',
                                //     style: GoogleFonts.rancho(
                                //         fontSize: 20,
                                //         fontWeight: FontWeight.w300,
                                //         color: Colors.white),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            child: StreamBuilder(
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
                                          // Expanded(
                                          //   child: Padding(
                                          //     padding: EdgeInsets.only(
                                          //         left: 10.0, top: 5, right: 5),
                                          //     child: Align(
                                          //       alignment: Alignment.centerLeft,
                                          //       child: Text(
                                          //         documentSnapshot["nameUser"],
                                          //         textAlign: TextAlign.center,
                                          //         style: GoogleFonts.rancho(
                                          //           fontSize: 24,
                                          //           fontWeight: FontWeight.w300,
                                          //           color: Color.fromARGB(
                                          //               255, 255, 255, 255),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   child: Text(
                                          //     documentSnapshot["userId"],
                                          //     textAlign: TextAlign.center,
                                          //     style: TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   child: Padding(
                                          //     padding: EdgeInsets.only(
                                          //         left: 10.0, top: 5, right: 5),
                                          //     child: Align(
                                          //       alignment: Alignment.centerLeft,
                                          //       child: Text(
                                          //         documentSnapshot["phone"],
                                          //         textAlign: TextAlign.center,
                                          //         style: GoogleFonts.rancho(
                                          //           fontSize: 24,
                                          //           fontWeight: FontWeight.w300,
                                          //           color: Color.fromARGB(
                                          //               255, 255, 255, 255),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   child: Text(
                                          //     documentSnapshot["email"],
                                          //     textAlign: TextAlign.center,
                                          //     style: TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          // ),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
