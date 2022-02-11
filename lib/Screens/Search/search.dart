import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_check/Screens/Profile/logoutpage.dart';
import 'package:q_check/Screens/herbs/herbs.dart';
import '../ModelOutput/BlackPepperModel.dart';
import '../ModelOutput/EmbeliaRibesModel.dart';
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
import '../ModelOutput/PergulariaModel.dart';
import '../ModelOutput/PolyalthiaModel.dart';
import '../ModelOutput/SaracaAsocaModel.dart';
import '../ModelOutput/TinosporaModel.dart';
import '../Profile/profile.dart';
import '../herbs/herbs.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textController = TextEditingController();

  List<card_widget> allspicesandherbs = [
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
    card_widget(
      LabelText: 'Vitex Agnus Castus\n(Chaste Berry)',
      ImagePath: 'assets/images/vitex2.jpg',
      builder: ModelTestVitexAgnus(),
    ),
    card_widget(
      LabelText: 'Curcuma Longa\n(Haldi)',
      ImagePath: 'assets/images/curcuma_longa.jpg',
      builder: ModelTestCurcumaLonga(),
    ),
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
    card_widget(
      LabelText: 'Polyalthia Longifolia\n(False Asoka)',
      ImagePath: 'assets/images/ployalthia_longifolia.jpg',
      builder: ModelTestPolyalthia(),
    ),
    card_widget(
      LabelText: 'Saraca Asoca\n(Ashoka Bark)',
      ImagePath: 'assets/images/saraca_asoca.jpg',
      builder: ModelTestSaracaAshoka(),
    ),
    card_widget(
      LabelText: 'Pergularia Daemia\n(False Giloy)',
      ImagePath: 'assets/images/pergularia_daemia.jpg',
      builder: ModelTestPergularia(),
    ),
    card_widget(
      LabelText: 'Tinospora Cordifolia\n(Giloy)',
      ImagePath: 'assets/images/giloy.jpg',
      builder: ModelTestTinospora(),
    ),
  ];
  List<card_widget> foundspicesandherbs = [];

  @override
  void initState() {
    foundspicesandherbs = allspicesandherbs;
    super.initState();
  }

  void SearchOperation(String query) {
    final suggestions = allspicesandherbs.where((spicesandherbs) {
      final spicesandherbstitle = spicesandherbs.LabelText.toLowerCase();
      final input = query.toLowerCase();
      return spicesandherbstitle.contains(input);
    }).toList();
    setState(() {
      foundspicesandherbs = suggestions;
    });
  }

  List pages = [MenuPage(), Search(), ProfilePage(), LogoutPage()];
  int currentIndex = 1;
  int searchIndex = 1;
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
          currentIndex: searchIndex,
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
          backgroundColor: Color(0xff104e0b),
          elevation: 0,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 252, 253, 252)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: TextField(
              onChanged: SearchOperation,
              controller: textController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: "Search Spices And Herbs",
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Color(0xff104e0b)),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(35.0),
                  borderSide: BorderSide(color: Color(0xff104e0b)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 200),
              padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: foundspicesandherbs.length,
              itemBuilder: (context, index) {
                final spicesandherbs = foundspicesandherbs[index];
                return card_widget(
                  ImagePath: spicesandherbs.ImagePath,
                  LabelText: spicesandherbs.LabelText,
                  builder: spicesandherbs.builder,
                );
              },
            ),
          ),
        ]));
  }
}
