import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PolyalthiaLongifolia extends StatefulWidget {
  const PolyalthiaLongifolia({Key? key}) : super(key: key);

  @override
  State<PolyalthiaLongifolia> createState() => _PolyalthiaLongifoliaState();
}

class _PolyalthiaLongifoliaState extends State<PolyalthiaLongifolia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xFFF5F5F5),
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
                height: 65,
                decoration: BoxDecoration(
                  color: Color(0x00C52121),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
                  child: Text(
                    'POLYALTHIA LONGIFOLIA (False Ashoka)',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontSize: 19.0,
                      color: Color(0xFFFFFAFA),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Material(
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                        height: 50,
                        thickness: 2,
                        indent: 120,
                        endIndent: 120,
                        color: Color(0xFF135821),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(45, 0, 45, 0),
                        child: Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFAFA),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFFFFFAFA),
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/images/ployalthia_longifolia.jpg',
                              width: double.infinity,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(45, 10, 45, 0),
                        child: Container(
                          width: double.infinity,
                          height: 375,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFAFA),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              "Common name: False Ashoka\n"
                              "Biological source: Bark\n"
                              "Family: Annonaceae\n"
                              "Main phytochemical constituents: Proanthocyanidins, vanillic, syringic and ferulic (cis- and trans-isomers) acids.\n"
                              "Medicinal uses: In treatment of fever, skin diseases, diabetes and helminthiasis. It has anti-microbial, hypotensive, anti-oxidant, anti-bacterial, anti-inflammatory, anti-cancer, hepatoprotective, anti-hyperglycaemic, anti-fungal, anti-leishmanial, anti-ulcer, termicidal etc.\n"
                              "Other uses: As ornamental street tree due to effectiveness in reducing the noise pollution. \n"
                              "It is one of the adulterants of Saraca asoca.\n",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
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
