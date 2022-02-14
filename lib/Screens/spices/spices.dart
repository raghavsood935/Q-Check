import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:q_check/Screens/Home/menu_page.dart';
import 'package:q_check/Screens/ModelOutput/AmomumModel.dart';
import 'package:q_check/Screens/ModelOutput/AnethumModel.dart';
import 'package:q_check/Screens/ModelOutput/BlackPepperModel.dart';
import 'package:q_check/Screens/ModelOutput/CardamomumModel.dart';
import 'package:q_check/Screens/ModelOutput/CarviModel.dart';
import 'package:q_check/Screens/ModelOutput/ChilliModel.dart';
import 'package:q_check/Screens/ModelOutput/CitrusModel.dart';
import 'package:q_check/Screens/ModelOutput/CuminModel.dart';
import 'package:q_check/Screens/ModelOutput/CurcumaAmadaModel.dart';
import 'package:q_check/Screens/ModelOutput/CurcumaCasiaModel.dart';
import 'package:q_check/Screens/ModelOutput/CurcumaLongaModel.dart';
import 'package:q_check/Screens/ModelOutput/CurcumaZeodariaModel.dart';
import 'package:q_check/Screens/ModelOutput/EmbeliaRibesModel.dart';
import 'package:q_check/Screens/ModelOutput/FoeniculumModel.dart';
import 'package:q_check/Screens/ModelOutput/NigelModel.dart';
import 'package:q_check/Screens/ModelOutput/PapayaModel.dart';
import 'package:q_check/Screens/ModelOutput/SchinusMoleModel.dart';
import 'package:q_check/Screens/ModelOutput/VitexAgnusModel.dart';
import 'package:q_check/Screens/Profile/logoutpage.dart';
import 'package:q_check/Screens/Profile/profile.dart';
import 'package:q_check/Screens/Search/search.dart';

class SpicesMenu extends StatefulWidget {
  SpicesMenu({Key? key}) : super(key: key);

  @override
  _SpicesMenuState createState() => _SpicesMenuState();
}

class _SpicesMenuState extends State<SpicesMenu> {
  int currentIndex = 0;
  List pages = [MenuPage(), Search(), ProfilePage(), LogoutPage()];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    if (currentIndex == 0) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
    if (currentIndex == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
    if (currentIndex == 2) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
    if (currentIndex == 3) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => pages[currentIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF135821),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white30,
        unselectedItemColor: Colors.white30,
        showUnselectedLabels: false,
        showSelectedLabels: false,
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
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xFF104E0B),
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.asset(
                    'assets/images/DST_withBack.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Text(
                    'Q - Check Spices',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/splash_logo.png',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Piper Nigrum\n(Kali Mirch)',
                        ImagePath: 'assets/images/blackpepper2.jpg',
                        builder: ModelTestBlackPepper(),
                      ),
                      card_widget(
                        LabelText: 'Embelia Ribes\n(Awala)',
                        ImagePath: 'assets/images/embelia_ribes.jpg',
                        builder: ModelTestEmbeliaRibes(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Carica Papaya\n(Papaya)',
                        ImagePath: 'assets/images/Carica papaya.jpg',
                        builder: ModelTestPapaya(),
                      ),
                      card_widget(
                        LabelText: 'Schinus Mole\n(False Pepper)',
                        ImagePath: 'assets/images/schinus_mole.jpg',
                        builder: ModelTestSchinusMole(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Vitex Agnus Castus\n(Chaste berry)',
                        ImagePath: 'assets/images/vitex2.jpg',
                        builder: ModelTestVitexAgnus(),
                      ),
                      card_widget(
                        LabelText: 'Curcuma Longa\n(Haldi)',
                        ImagePath: 'assets/images/curcuma_longa.jpg',
                        builder: ModelTestCurcumaLonga(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Curcuma Amada\n(Amba Haldi)',
                        ImagePath: 'assets/images/curcuma_amada.png',
                        builder: ModelTestCurcumaAmada(),
                      ),
                      card_widget(
                        LabelText: 'Curcuma Casia\n(Kali Haldi)',
                        ImagePath: 'assets/images/curcuma_cesia.png',
                        builder: ModelTestCurcumaCasia(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Curcuma Zeoderia\n(Karchur)',
                        ImagePath: 'assets/images/curcuma_zeoderia.png',
                        builder: ModelTestCurcumaZeodaria(),
                      ),
                      card_widget(
                        LabelText: 'Amomum Sublatum\n(Badi Elaichi)',
                        ImagePath: 'assets/images/amomum_sublatum.jpg',
                        builder: ModelTestAmomumSublatum(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Citurs Sinensis\n(Orange)',
                        ImagePath: 'assets/images/citrus_sinensis.png',
                        builder: ModelTestCitrusSinesis(),
                      ),
                      card_widget(
                        LabelText: 'Elettaria Cardamomum\n(Elaichi)',
                        ImagePath: 'assets/images/elettaria_cardamomum.png',
                        builder: ModelTestCardamomum(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Capsicum Annum\n(Mirch)',
                        ImagePath: 'assets/images/capsicum_annum.jpg',
                        builder: ModelTestChilli(),
                      ),
                      card_widget(
                        LabelText: 'Foeniculum Vulgare\n(Saunf)',
                        ImagePath: 'assets/images/foeniculum_vulgare.jpg',
                        builder: ModelTestFoeniculum(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Anethum Graveolens\n(Dill)',
                        ImagePath: 'assets/images/anethum_graveolens.png',
                        builder: ModelTestAnethum(),
                      ),
                      card_widget(
                        LabelText: 'Carum Carvi\n(Shahi Jeera)',
                        ImagePath: 'assets/images/carum_carvi.png',
                        builder: ModelTestCarvi(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      card_widget(
                        LabelText: 'Nigel Sativa\n(Mangerela)',
                        ImagePath: 'assets/images/nigella_sativa.jpeg',
                        builder: ModelTestNigelSativa(),
                      ),
                      card_widget(
                        LabelText: 'Cuminum Cyminum\n(Jeera)',
                        ImagePath: 'assets/images/cyminum_cuminum.png',
                        builder: ModelTestCuminumCyminum(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Card Widget

class card_widget extends StatelessWidget {
  final String? LabelText;
  final String? ImagePath;
  Widget builder;
  // Function router();

  card_widget(
      {@required this.LabelText,
      @required this.ImagePath,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => builder),
        );
      },
      child: Material(
        color: Colors.transparent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          width: 140,
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xFFE2E0E0),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                color: Color(0xFF222222),
                spreadRadius: 0.3,
              )
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  ImagePath!,
                  width: 140,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                child: Text(
                  LabelText!,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      color: Color(0xFF2B2B2B),
                      fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*

 Original Widget

 GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ModelTest()),
                          );
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: 125,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Color(0xFFE2E0E0),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 1,
                                  color: Color(0xFF222222),
                                  offset: Offset(1, 1),
                                  spreadRadius: 0.5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    'https://picsum.photos/seed/143/600',
                                    width: 125,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    'Name',
                                    style: GoogleFonts.poppins(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      color: Color(0xFF2B2B2B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
*/