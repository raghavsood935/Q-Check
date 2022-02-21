/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/account_pages/login.dart';
import 'package:q_check/theme_data.dart';
import 'create_account1.dart';
import 'dropdown_button.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool isLoading = false;
  TextEditingController controller = TextEditingController();
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
                    'Reset Password',
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.headline3,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff104e0b)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Enter your Registered email to get reset link',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }
                      // reg expression for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    controller: controller,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      controller.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 14,
                          color: Colors.black38),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color(0xFFb2b2b2), width: 1),
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

              // "RESET PASSWORD BUTTON" ---> Button Widget //

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
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: controller.text)
                          .then((value) => {
                                Fluttertoast.showToast(
                                    msg:
                                        "Password Reset link has been sent succesfully"),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()))
                              });
                    },
                    child: (isLoading)
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ))
                        : Text(
                            'Reset',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 18,
                                // fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                child: Divider(thickness: 3, color: Color(0xff104e0b)),
              )
            ]),
      ),
    );
  }
}*/
