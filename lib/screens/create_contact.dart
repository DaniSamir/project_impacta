import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project_impacta/screens/dashboard.dart';
import 'package:project_impacta/widgets/text_field_custom.dart';
import 'package:project_impacta/widgets/top_bar.dart';

import 'package:google_fonts/google_fonts.dart';

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


    Map<String, dynamic> students = ({
      "nameUser": nameUser,
      "userId": userId,
      "phone": phone,
      "email": email
    });

    // send data to Firebase
    documentReference.set(students).whenComplete(() => showMyDialog());
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(45))),
          content: const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Color.fromARGB(255, 167, 1, 29),
                  size: 45,
                ),
                SizedBox(height: 15),
                Text('Usuário criado com sucesso!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    )

                    // GoogleFonts.rancho(
                    //   fontSize: 40,
                    //   fontWeight: FontWeight.w300,
                    //   color: Color(0XFFB71731),
                    // ),
                    ),
              ],
            ),
          ),
          actions: <Widget>[
            Align(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 167, 1, 29),
                  ),
                ),
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashBoardScreen()),
                ),
              ),
            ),
          ],
        );
      },
    );
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
      backgroundColor: Color.fromARGB(255, 248, 189, 184),
      appBar: CustomAppBar(
        title: Text(
          'Criar Contato',
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
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/user.png'),
              ),
              SizedBox(height: 16),
              Container(
                height: 350,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 97, 97),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    )),
                child: Column(children: [
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 8, right: 15),
                    child: TextFormField(
                      style: simpleTextStyle(),
                      decoration: textFieldCustom(
                        'Nome',
                        const Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                        ),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      onChanged: (String name) {
                        setState(() {
                          getStudentName(name);
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 8, right: 15),
                    child: TextFormField(
                      style: simpleTextStyle(),
                      decoration: textFieldCustom(
                        'Id',
                        Icon(
                          Icons.perm_identity_outlined,
                          color: Colors.white,
                        ),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      onChanged: (String sID) {
                        getStudentID(sID);
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 8, right: 15),
                    child: TextFormField(
                      style: simpleTextStyle(),
                      decoration: textFieldCustom(
                        'Telefone',
                        Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                      ),
                      inputFormatters: [
                        phoneTextFormatter,
                        LengthLimitingTextInputFormatter(20)
                      ],
                      keyboardType: TextInputType.datetime,
                      onChanged: (String pID) {
                        getStudyProgramID(pID);
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 8, right: 15),
                    child: TextFormField(
                      style: simpleTextStyle(),
                      decoration: textFieldCustom(
                        'E-mail',
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      onChanged: (String gpa) {
                        getStudentCGPA(gpa);
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 45),
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
                        child: Text(
                          'Create',
                          style: GoogleFonts.rancho(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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

MaskTextInputFormatter phoneTextFormatter = MaskTextInputFormatter(
    mask: ' (##) # ####-####', filter: {"#": RegExp(r'[0-9]')});
