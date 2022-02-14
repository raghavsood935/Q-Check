import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/Profile/logoutpage.dart';
import 'package:q_check/Screens/Profile/profile.dart';
import 'package:q_check/Screens/Search/search.dart';
import 'package:q_check/model/user_model.dart';

import '../Home/menu_page.dart';

class ProfileUpdation extends StatefulWidget {
  const ProfileUpdation({Key? key}) : super(key: key);

  @override
  _ProfileUpdationState createState() => _ProfileUpdationState();
}

class _ProfileUpdationState extends State<ProfileUpdation> {
  final _formKey = GlobalKey<FormState>();

  final nameEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final designationEditingController = TextEditingController();
  final numberEditingController = TextEditingController();
  bool _displayNameValid = true;
  bool _addressValid = true;
  bool _numberValid = true;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      nameEditingController.text = '${loggedInUser.firstName}';
      addressEditingController.text = '${loggedInUser.address}';
      emailEditingController.text = '${loggedInUser.email}';
      designationEditingController.text = '${loggedInUser.preference}';
      numberEditingController.text = '${loggedInUser.contactNumber}';
      setState(() {});
    });
  }

  Future<void> updateUser() {
    print(FirebaseAuth.instance.currentUser!.uid);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //users.doc(FirebaseAuth.instance.currentUser!.uid).update;
    return users.doc(FirebaseAuth.instance.currentUser!.uid).update({
      'firstName': '${nameEditingController.text}',
      'address': '${addressEditingController.text}',
      'contactNumber': '${numberEditingController.text}'
    }).then((value) {
      Future.delayed(Duration(milliseconds: 1700), () {
        Fluttertoast.showToast(msg: "Profile Has Been Updated");
      });
    }).catchError((error) {
      Future.delayed(Duration(milliseconds: 1700), () {
        Fluttertoast.showToast(msg: "Couldn't Update Profile :$error");
      });
    });
  }

// Function to update data
  Future<void> updateProfileData() async {
    setState(() {
      //Condition to check name field
      nameEditingController.text.trim().length < 3 ||
              nameEditingController.text.isEmpty
          ? _displayNameValid = false
          : _displayNameValid = true;

      //Condition to check address field
      addressEditingController.text.trim().length > 100
          ? _addressValid = false
          : _addressValid = true;

      //Condition to check number field
      numberEditingController.text.trim().length < 10 ||
              numberEditingController.text.trim().length > 10
          ? _numberValid = false
          : _numberValid = true;
    });

    //  if(_displayNameValid && _addressValid && _numberValid){
    //    loggedInUser.doc(widget.user.uid)

    if (_displayNameValid && _addressValid && _numberValid) {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      print('Success');
      await updateUser();
    }

    //  }
  }

  List pages = [MenuPage(), Search(), ProfilePage(), LogoutPage()];
  int currentIndex = 2;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
    if (currentIndex == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
    if (currentIndex == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
    if (currentIndex == 3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF135821),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        showUnselectedLabels: false,
        onTap: onTap,
        currentIndex: currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF135821),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      key: _formKey,
      backgroundColor: Color(0xFF135821),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF135821),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0x00C52121),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      fontSize: 20,
                      color: Color(0xFFFFFAFA),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                elevation: 15,
                child: Container(
                  width: double.infinity,
                  height: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                        child: Text(
                          'FULL NAME',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 10,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                        child: TextFormField(
                          controller: nameEditingController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Update name',
                            errorText:
                                _displayNameValid ? null : "Name is too short",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF222222),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF222222),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                        child: Text(
                          'ADDRESS',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 10,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                        child: TextFormField(
                          controller: addressEditingController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Update Address',
                            errorText:
                                _addressValid ? null : "Address is too long",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF222222),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF222222),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                        child: Text(
                          'MOBILE NO.',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 10,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                        child: TextFormField(
                          controller: numberEditingController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Update mobile number',
                            errorText: _numberValid
                                ? null
                                : 'Enter valid number - 10 digits',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF222222),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF222222),
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.local_phone,
                              color: Colors.black,
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      //Button

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 32),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color(0xFF135821),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: (isLoading)
                              ? Center(
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      color: Color(0xFF135821),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.0,
                                      )))
                              : MaterialButton(
                                  onPressed: () {
                                    updateProfileData();
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Future.delayed(Duration(milliseconds: 2000),
                                        () {
                                      /*Fluttertoast.showToast(
                                          msg: "Profile Has Been Updated");*/
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  ProfilePage())));
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'SUBMIT',
                                        style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            fontSize: 18,
                                            // fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
