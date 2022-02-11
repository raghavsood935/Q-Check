import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ScanMenu extends StatefulWidget {
  ScanMenu({Key? key}) : super(key: key);

  @override
  _ScanMenuState createState() => _ScanMenuState();
}

class _ScanMenuState extends State<ScanMenu> {
  File? image;
  bool _loading = false;
  List? _outputs;

  // Function to LoadModel
  // loadModel() async {
  //   await Tflite.loadModel(
  //       model: 'assets/models/blackpepper_model.tflite',
  //       labels: 'assets/labels/blackpepper_labels.txt');
  // }
  loadModel() async {
    //this function loads our model
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  //Function to pick Image
  pickImage() async {
    //this try-catch block will catch the exception if the user denied the access of gallery.
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      //if image not selected then it will return null
      if (image == null) return;

      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Falied to pick image: $e');
    }

    classifyImage(image!);
  }

  //classify Image Function;
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.5,
      imageMean: 300,
      imageStd: 300,
    );

    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xff104e0b)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {},
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body:
          // _loading
          //  ? Container(
          //  alignment: Alignment.center,
          //  child: const CircularProgressIndicator(),
          //  ) :
          Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF135821),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0x00C52121),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                elevation: 15,
                shape: const RoundedRectangleBorder(
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
                  decoration: const BoxDecoration(
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
                    children: [
                      const Divider(
                        height: 40,
                        thickness: 2,
                        indent: 120,
                        endIndent: 120,
                        color: Color(0xFF135821),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 14,
                              color: Color(0xFF175122)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 250,
                          width: 250,

                          //if image is selected then it will be displyaed and if not default image will be shown
                          child: image != null
                              ? Image.file(
                                  image!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                              : const Image(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/scan_bg.png'),
                                ),
                        ),
                      ),

                      //Upload Button
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: UploadButton(
                          labelText: 'Upload Photo',
                          onPressed: () {
                            pickImage();
                          },
                          height: 40,
                          width: 170,
                          icon: Icons.file_upload,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //ScanButton
                      ScanButton(
                          labelText: 'ScanButton',
                          onPressed: () {
                            pickImage();
                            // classifyImage(image!);
                          },
                          icon: Icons.qr_code_scanner,
                          height: 100,
                          width: 250),
                      SizedBox(
                        height: 5.0,
                      ),
                      _outputs != null
                          ? Text(
                              // "${_outputs![0]["label"]}"
                              //     .replaceAll(RegExp(r'[0-9]'), ''),
                              " ${_outputs![0]['label']}!",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 14,
                                  color: Color(0xFF175122)),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Upload Photo Button Widget
class UploadButton extends StatelessWidget {
  // const MenuButton({
  //   Key? key,
  // }) : super(key: key);
  String labelText;
  double height;
  double width;
  void Function()? onPressed;
  IconData? icon;
  UploadButton(
      {required this.labelText,
      required this.onPressed,
      required this.height,
      required this.width,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xff104e0b),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        elevation: 10,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  fontSize: 15,
                  // fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Icon(
              icon,
              color: Colors.white70,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}

// Scan Photo Button Widget
class ScanButton extends StatelessWidget {
  // const MenuButton({
  //   Key? key,
  // }) : super(key: key);
  String labelText;
  double height;
  double width;
  void Function()? onPressed;
  IconData? icon;
  ScanButton(
      {required this.labelText,
      required this.onPressed,
      required this.height,
      required this.width,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color(0xff104e0b),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        elevation: 10,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 40,
            ),
            Text(
              labelText,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  fontSize: 18,
                  // fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
