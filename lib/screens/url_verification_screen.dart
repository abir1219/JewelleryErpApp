import 'package:flutter/material.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';
import 'package:jewellery_erp_app/widgets/app_widgets.dart';

class UrlVerificationScreen extends StatefulWidget {
  const UrlVerificationScreen({super.key});

  @override
  State<UrlVerificationScreen> createState() => _UrlVerificationScreenState();
}

class _UrlVerificationScreenState extends State<UrlVerificationScreen> {
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
              AppWidgets().buildTextFormField(size,
                  controller: null, hintText: "Url", labelText: "Url"),
              AppWidgets.customButton(
                size: size,
                btnName: "Verify Url",
                color: Colors.white,
                textColor: AppColors.STEPPER_DONE_COLOR,
              )
            ],
          ),
        ),
      )),
    );
  }
}
