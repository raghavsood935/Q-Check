import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/account_pages/create_account2.dart';
import 'package:q_check/helper/data_parsing_next_screen.dart';
import 'package:q_check/theme_data.dart';
import 'login.dart';

class CreateAccount extends StatefulWidget {
  // CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final contactNumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool passwordVisibility1 = false;
  bool passwordVisibility2 = false;

  @override
  void initState() {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  User_Info obj = User_Info(
      firstName: '', lastName: '', contactNumber: 0, email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
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

                //first name field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("First Name cannot be Empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid name(Min. 3 Character)");
                        }
                        return null;
                      },
                      controller: firstNameEditingController,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        firstNameEditingController.text = value!;
                      },
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 14,
                            color: Colors.black38),
                        enabledBorder: OutlineInputBorder(
                          // ignore: prefer_const_constructors
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

                //last name field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Last Name cannot be Empty");
                        }
                        return null;
                      },
                      controller: lastNameEditingController,
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        lastNameEditingController.text = value!;
                      },
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 14,
                            color: Colors.black38),
                        enabledBorder: OutlineInputBorder(
                          // ignore: prefer_const_constructors
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

                //contact number field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                      controller: contactNumberEditingController,
                      validator: (value) {
                        if (value!.length != 10) {
                          return ('Mobile Number must be of 10 digit');
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        contactNumberEditingController.text = value!;
                      },
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
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

                //email field
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
                      controller: emailEditingController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        emailEditingController.text = value!;
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

                //password field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                      controller: passwordEditingController,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                      },
                      onSaved: (value) {
                        passwordEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      obscureText: !passwordVisibility1,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 14,
                              color: Colors.black38),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                              () => passwordVisibility1 = !passwordVisibility1,
                            ),
                            child: Icon(
                              passwordVisibility1
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xff104e0b),
                              size: 22,
                            ),
                          )),
                      style: theme.bodyText1),
                ),

                //Confirm password field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: TextFormField(
                      controller: confirmPasswordEditingController,
                      validator: (value) {
                        if (confirmPasswordEditingController.text !=
                            passwordEditingController.text) {
                          return "Password don't match";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmPasswordEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      obscureText: !passwordVisibility2,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 14,
                              color: Colors.black38),
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility2 = !passwordVisibility2,
                            ),
                            child: Icon(
                              passwordVisibility2
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xff104e0b),
                              size: 22,
                            ),
                          )),
                      style: theme.bodyText1),
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
                        obj = User_Info(
                            firstName: firstNameEditingController.text,
                            lastName: lastNameEditingController.text,
                            contactNumber:
                                int.parse(contactNumberEditingController.text),
                            email: emailEditingController.text,
                            password: passwordEditingController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount2(obj)), // 4
                        );
                      },
                      child: Text(
                        'Next',
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
                      'Already have an Account ?',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 14,
                          // fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 10, 10, 10)),
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
                        'LOGIN',
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
        ),
      ),
    ));
  }
}

// TextForm Field Widget //--

// class textFormField extends StatefulWidget {
//   final String? LabelText;
//   final TextEditingController? editingController;
//   final TextInputType? keyboardType;
//   final void Function(String?)? onSaved;
//   final TextInputAction? textInputAction;

//   // ignore: non_constant_identifier_names
//   textFormField(
//       {@required this.LabelText,
//       this.editingController,
//       this.keyboardType,
//       this.onSaved,
//       this.textInputAction});
//   // const textFormField({
//   //   Key? key,
//   // }) : super(key: key);

//   @override
//   State<textFormField> createState() => _textFormFieldState();
// }

// class _textFormFieldState extends State<textFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       child: TextFormField(
//           decoration: InputDecoration(
//             labelText: widget.LabelText,
//             labelStyle: GoogleFonts.poppins(
//                 textStyle: Theme.of(context).textTheme.bodyText1,
//                 fontSize: 14,
//                 color: Colors.black38),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: const Color(0xFFb2b2b2), width: 1),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xFFb2b2b2), width: 1),
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           style: theme.bodyText1),
//     );
//   }
// }
