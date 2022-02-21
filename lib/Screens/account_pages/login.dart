import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/account_pages/forget_password.dart';
import 'package:q_check/Screens/Home/menu_page.dart';
import 'package:q_check/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create_account1.dart';
import 'dropdown_button.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //form key
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  //Editing COntroler
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  bool passwordVisibility1 = false;

  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  static const snackBarDuration = Duration(seconds: 3);
  final snackBar = SnackBar(
    content: Text('Press back again to leave'),
    duration: snackBarDuration,
  );

  late DateTime backButtonPressTime;

  onAlertButtonPressed(context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "ERROR!",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 22),
      ),
      content: Text(
        errorMessage!,
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  onAlertButtonPressed1(context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Some Error Occured!",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 22),
      ),
      content: Text(
        "Please Enter The Email ",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
          ),
          onPressed: () {
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  onAlertButtonPressed2(context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Some Error Occured!",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 22),
      ),
      content: Text(
        "Please Enter The Password ",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
          ),
          onPressed: () {
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  onAlertButtonPressed3(context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Some Error Occured!",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 22),
      ),
      content: Text(
        "Please Check Your Username/Email",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
          ),
          onPressed: () {
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  onAlertButtonPressed4(context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Some Error Occured!",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 22),
      ),
      content: Text(
        "Please Check Your Password\nMin 6 Characters Required",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'OK',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 15),
          ),
          onPressed: () {
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<bool> handleWillPop(BuildContext context) async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            now.difference(backButtonPressTime) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      Scaffold.of(context).showSnackBar(snackBar);
      return false;
    }

    return true;
  }

  @override
  void initState() {
    passwordVisibility1 = false;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xff104e0b)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()), // 4
                );
              },
            ),
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 5, 50, 25),
                      child: Image.asset(
                        "assets/images/splash_logo.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 20),
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline3,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff104e0b)),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              onAlertButtonPressed1(context);
                              return ("Please Enter your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              onAlertButtonPressed3(context);
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Username or Email',
                            labelStyle: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              onAlertButtonPressed2(context);
                              return ("Password is required for Login");
                            }
                            if (!regex.hasMatch(value)) {
                              onAlertButtonPressed4(context);
                              return ("Enter Valid Password(Min. 6 Characters)");
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          obscureText: !passwordVisibility1,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 14,
                                  color: Colors.black38),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFb2b2b2), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF707070), width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => passwordVisibility1 =
                                      !passwordVisibility1,
                                ),
                                child: Icon(
                                  passwordVisibility1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xff104e0b),
                                  size: 22,
                                ),
                              )),
                          style: theme.bodyText1),
                    ),

                    /*Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(220, 10, 5, 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()), // 4
                          );
                        },
                        child: Text('Forgot Password?',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff104e0b))),
                      ),
                    ),*/

                    // "Login" ---> Button Widget //

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 32),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xff104e0b),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            signIn(
                                emailController.text, passwordController.text);
                            setState(() {
                              isLoading = true;
                            });
                            await Future.delayed(const Duration(seconds: 5));
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
                                  'Login',
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account ?',
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 14,
                              // fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 8, 8, 8)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()), // 4
                            );
                          },
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff104e0b)),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                      child: Divider(thickness: 3, color: Color(0xff104e0b)),
                    )
                  ]),
            ),
          )),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MenuPage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        onAlertButtonPressed(context);
        Fluttertoast.showToast(msg: "Please Try Again");
        setState(() {
          isLoading = false;
        });
      }
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', 'useremail@gmail.com');
    @override
    void dispose() {
      super.dispose();
    }
  }
}
