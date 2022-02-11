import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/account_pages/create_account1.dart';
import 'package:q_check/helper/data_parsing_next_screen.dart';
import 'package:q_check/Screens/account_pages/login.dart';
import 'package:q_check/Screens/Home/menu_page.dart';
import 'package:q_check/model/user_model.dart';
import 'package:q_check/theme_data.dart';
import 'dart:ui';

import 'dropdown_button.dart';

class CreateAccount2 extends StatefulWidget {
  User_Info obj;
  CreateAccount2(this.obj);

  @override
  _CreateAccount2State createState() => _CreateAccount2State();
}

class _CreateAccount2State extends State<CreateAccount2> {
  String? dropDownValue;
  bool? checkboxListTileValue;
  String? userAddress;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final addressEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xff104e0b)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateAccount()), // 4
              );
            },
          ),
        ),
        body: SafeArea(
          child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline3,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff104e0b)),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                  child: DropDown(
                    options: [
                      'Farmer',
                      'Herb Collector',
                      'Creator',
                      'Buyer',
                      'Investree',
                      'Regulatory Official',
                      'Other'
                    ].toList(),
                    onChanged: (val) => setState(() => dropDownValue = val),
                    width: double.infinity,
                    height: 50,
                    textStyle: theme.bodyText1,
                    fillColor: Colors.white,
                    elevation: 2,
                    borderColor: const Color(0xFFb2b2b2),
                    borderWidth: 0,
                    borderRadius: 5.0,
                    margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                    initialOption: 'Farmer',
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                      controller: addressEditingController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{8,}$');
                        if (value!.isEmpty) {
                          return ("Address cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Address(Min. 8 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        addressEditingController.text = value!;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter Your Address",
                        labelStyle: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 14,
                            color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFb2b2b2), width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFb2b2b2), width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      style: theme.bodyText1),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          child: CheckboxListTile(
                            value: checkboxListTileValue ??= false,
                            onChanged: (newValue) => setState(
                                () => checkboxListTileValue = newValue),
                            title: Text('I accept the term of use',
                                textAlign: TextAlign.start,
                                style: theme.subtitle2),
                            tileColor: Colors.transparent,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // "Next" ---> Button Widget //

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xff104e0b),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        //parsing the value from previous page
                        widget.obj = User_Info(
                            firstName: widget.obj.firstName,
                            lastName: widget.obj.lastName,
                            contactNumber: widget.obj.contactNumber,
                            email: widget.obj.email,
                            password: widget.obj.password,
                            preference: dropDownValue,
                            address: addressEditingController.text);

                        signUp(widget.obj.email, widget.obj.password);
                      },
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 18,
                            // fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ?',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 14,
                          // fontWeight: FontWeight.w600,
                          color: const Color(0xFFb2b2b2)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()), // 4
                        );
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff104e0b)),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                  child: Divider(thickness: 3, color: Color(0xff104e0b)),
                )
              ]),
        ));
  }

  void signUp(String email, String password) async {
    // if (_formKey.currentState!.validate()) {

    //       .catchError((e) {
    //     Fluttertoast.showToast(msg: e!.message);
    //   });
    // }
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()});
  }

  postDetailsToFirestore() async {
    //calling firestore
    //calling user model
    //sending data
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = widget.obj.firstName;
    userModel.lastName = widget.obj.lastName;
    userModel.contactNumber = widget.obj.contactNumber.toString();
    userModel.preference = widget.obj.preference;
    userModel.address = widget.obj.address;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created Successfully :) ");

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => MenuPage()), (route) => false);
  }
}
