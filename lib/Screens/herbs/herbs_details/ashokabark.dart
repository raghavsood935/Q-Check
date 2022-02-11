import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaracaAsoca extends StatefulWidget {
  const SaracaAsoca({Key? key}) : super(key: key);

  @override
  State<SaracaAsoca> createState() => _SaracaAsocaState();
}

class _SaracaAsocaState extends State<SaracaAsoca> {
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
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0x00C52121),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
                  child: Text(
                    'SARACA ASOCA (Ashoka Bark)',
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
                              'assets/images/saraca_asoca.jpg',
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
                              "Common name: Ashoka\n"
                              "Biological source: Bark\n"
                              "Family: Caesalpinaceae\n"
                              "Main phytochemical constituents: Catechin, Epicatechin\n"
                              "Medicinal uses: Used in treatment of uterine disorders, uterine bleeding. It has anti-bacterial, anti-implantation, anti-tumour, anti-estrogenic, anti-arthritic and anti-cancer properties. It is useful in dyspepsia, fever, biliousness, burning sensation, abnormal enlargement of visceral organs, colic, dysentery, internal bleeding, haemorrhoids, ulcers, uterine affections, menorrhagia especially due to uterine fibroids, menometrorrhagia, leucorrhoea, pimples etc.\n",
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
