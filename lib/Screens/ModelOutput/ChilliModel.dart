import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';
import '../spices/spices_details/mirch.dart';

class ModelTestChilli extends StatefulWidget {
  @override
  _ModelTestChilliState createState() => _ModelTestChilliState();
}

class _ModelTestChilliState extends State<ModelTestChilli> {
  bool _loading = false;
  File? _image;
  List? _output;
  final picker = ImagePicker();
  var alert;
  @override

  //Here we have to load the tflite model
  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel();
  }

  _onAlertButtonPressed1(context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "WRONG IMAGE!",
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.bodyText1, fontSize: 22),
      ),
      content: Text(
        "Please Select the Image Of Correct Category And Continue",
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

  //THis is the function which runs the image on model and provide us the output
  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 6,
        threshold: 0,
        imageMean: 255.0,
        imageStd: 255.0);

    setState(() {
      _output = output;
      _loading = false;
    });

    _output != null && (_output![0]['label'].toString().substring(0, 1) == "0")
        ? Future.delayed(Duration(milliseconds: 1000), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CapsicumAnnum()));
          })
        : Future.delayed(Duration(milliseconds: 1000), () {
            _onAlertButtonPressed1(context);
          });
  }

  void loadModel() async {
    await Tflite.loadModel(
      model: "assets/models/model_chilli.tflite",
      labels: "assets/labels/labelschilli.txt",
    );
  }

  //This function picks the image from gallery
  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = File(image.path);
    }
    classifyImage(_image!);
  }

  //This function is used in end to dispose the tflite model.
  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

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
      backgroundColor: Color(0xFF135821),
      body: Container(
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
              height: 50,
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
                          'Please Click the image with White Background and keep the distance less than 1 cm.',
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
                          child: _image != null
                              ? const Image(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/scan_bg.png'),
                                )
                              : const Image(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/scan_bg.png'),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //ScanButton
                      ScanButton(
                          labelText: 'Scan Image',
                          onPressed: () {
                            pickGalleryImage();

                            // classifyImage(image!);
                          },
                          icon: Icons.qr_code_scanner,
                          height: 100,
                          width: 250),
                      SizedBox(
                        height: 5.0,
                      ),
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

//Widgets --
// Upload Photo Button Widget
class UploadButton extends StatelessWidget {
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
