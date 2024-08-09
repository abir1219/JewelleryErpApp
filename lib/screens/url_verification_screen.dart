import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

class UrlVerificationScreen extends StatefulWidget {
  const UrlVerificationScreen({super.key});

  @override
  State<UrlVerificationScreen> createState() => _UrlVerificationScreenState();
}

class _UrlVerificationScreenState extends State<UrlVerificationScreen> {

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.LOGO_BACKGROUND_COLOR,
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/doodle_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                  horizontal: size.width * 0.005,
                ),
                child: TextFormField(
                  controller: null,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black, // Set text color to black
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    filled: true,
                    fillColor: Colors.white, // Set background to white
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black, width: 1.0), // Set border color to black when focused
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    hintText: "Enter a valid URL",
                    hintStyle: const TextStyle(
                      color: Colors.black, // Set hint text color to black
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: "Enter a valid URL",
                    labelStyle: const TextStyle(
                      color: Colors.black, // Set label color to black
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                )

              ),
              // AppWidgets().buildTextFormField(size,
              //     controller: null, hintText: "Url", labelText: "Url"),
              Container(
                margin: EdgeInsets.only(top: size.height *.02),
                width: size.width *.4,
                child: AppWidgets.customButton(
                  size: size,
                  btnName: "Verify Url",
                  color: Colors.white,
                  textColor: AppColors.STEPPER_DONE_COLOR,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
