import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_impacta/screens/dashboard.dart';
import 'package:project_impacta/widgets/top_bar.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 189, 184),
      appBar: CustomAppBar(
        title: Text(
          'Todos os Contatos',
          style: GoogleFonts.rancho(fontSize: 34, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBoardScreen()),
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: Text(' Criar Usuário'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(
            children: [
              Container(
                child: StreamBuilder(
                  stream:
                      //db.collection('crud').snapshots(),
                      //  db.collection('crud').snapshots(),
                      FirebaseFirestore.instance.collection('crud').snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot!.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

                              return ListTile(
                                title: Padding(
                                  padding: EdgeInsets.only(left: 10.0, top: 10, right: 5),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      documentSnapshot["nameUser"],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.rancho(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Text(
                                //     documentSnapshot["userId"],
                                //     textAlign: TextAlign.center,
                                //     style: TextStyle(
                                //         color: Colors.white),
                                //   ),
                                // ),
                                subtitle: Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0, top: 5, right: 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        documentSnapshot["phone"],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.rancho(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   child: Text(
                                //     documentSnapshot["email"],
                                //     textAlign: TextAlign.center,
                                //     style: TextStyle(
                                //         color: Colors.white),
                                //   ),
                                // ),
                                leading: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: AssetImage('images/user.png'),
                                ),
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                                ),
                              );
                            },
                          ),
                        ],
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
    );
  }
}
