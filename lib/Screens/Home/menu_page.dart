import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/Profile/profile.dart';
import 'package:q_check/Screens/Search/search.dart';
import 'package:q_check/Screens/spices/spices.dart';
import '../Profile/logoutpage.dart';
import '../herbs/herbs.dart';
import 'help_info.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  static const snackBarDuration = Duration(seconds: 3);
  final snackBar = SnackBar(
    content: Text('Press back again to leave'),
    duration: snackBarDuration,
  );

  late DateTime backButtonPressTime;

  List pages = [MenuPage(), Search(), ProfilePage(), LogoutPage()];
  int currentIndex = 0;
  int homeIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    } else if (currentIndex == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    } else if (currentIndex == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    } else if (currentIndex == 3) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF135821),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          showUnselectedLabels: false,
          onTap: onTap,
          currentIndex: homeIndex,
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
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF135821),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: IconButton(
                icon: Icon(
                  Icons.help_outline,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpInfo()),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF135821),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0x00C52121),
                ),
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 800,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            height: 20,
                            thickness: 2,
                            indent: 120,
                            endIndent: 120,
                            color: Color(0xFF135821),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              'assets/images/splash_leaf1.png',
                              height: 200,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 200,
                          // ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MenuButton(
                                labelText: 'Q-Check\nHerbs',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HerbsMenu()), // 4
                                  );
                                },
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              MenuButton(
                                  labelText: 'Q-Check\nSpices',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SpicesMenu()), // 4
                                    );
                                  })
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 190, bottom: 3, top: 3),
                            child: Image.asset(
                              'assets/images/splash_leaf2.png',
                              height: 200,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
}

//menu button widget

class MenuButton extends StatelessWidget {
  // const MenuButton({
  //   Key? key,
  // }) : super(key: key);
  String labelText;
  void Function()? onPressed;
  MenuButton({required this.labelText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
        color: const Color(0xff104e0b),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        elevation: 10,
        onPressed: onPressed,
        child: Text(
          labelText,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyText1,
              fontSize: 18,
              // fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
