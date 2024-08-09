import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jewellery_erp_app/utils/app_colors.dart';

class AppWidgets {
  static Widget customButton(
      {required Size size,
      required String btnName,
      required Color color,
      void Function()? func,
      Color textColor = Colors.white}) {
    return GestureDetector(
      onTap: () => func!(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: size.height * .04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Center(
          child: Text(
            btnName,
            style: TextStyle(fontSize: 14, color: textColor),
          ),
        ),
      ),
    );
  }

  static Widget buildField(
      Size size, String hint, TextEditingController? controller,
      {TextInputType? textInputType = TextInputType.text,
      var maxLength,
      List<TextInputFormatter>? inputFormatters}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * .0055),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      //,vertical: 2
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        /*border: Border.all(
            color: AppColors.STEPPER_DONE_COLOR,
            width: 1,
          ),*/
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1.2,
            blurRadius: 0.5,
            offset: const Offset(1.0, 1.0),
          ),
        ],
      ),
      child: TextField(
        keyboardType: textInputType,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            hintStyle: const TextStyle(
              color: AppColors.HINT_TEXT_COLOR,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none),
      ),
    );
  }

  static Widget buildSearchableField(
      Size size, String hint, TextEditingController? controller,
      {bool isEnabled = false,
      void Function()? func,
      String? icons = "assets/images/search.svg"}) {
    return GestureDetector(
      onTap: () => func!(),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: size.height * .005,
          horizontal: size.width * 0.005,
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 6), //,vertical: 2
        padding: EdgeInsets.only(
          left: size.width * 0.008,
        ), //,left: 6
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1.2,
              blurRadius: 0.5,
              offset: const Offset(1.0, 1.0),
            ),
          ],
          /*border: Border.all(
              color: AppColors.STEPPER_DONE_COLOR,
              width: 1,
            ),*/
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: hint,
                    enabled: isEnabled,
                    hintStyle: const TextStyle(
                      color: AppColors.HINT_TEXT_COLOR,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none),
              ),
            ),
            Container(
              width: size.width * 0.14, //45,
              height: size.height * 0.065, //48,
              decoration: const BoxDecoration(
                color: AppColors.STEPPER_DONE_COLOR,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icons!,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildStepperContainer(Size size, {int pageNo = 1}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * .02),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: size.height * .005,
                    color: AppColors.LOGO_BACKGROUND_COLOR,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * .034, //26,
                      width: size.width * .085, //30,
                      decoration: BoxDecoration(
                          color: AppColors.LOGO_BACKGROUND_COLOR,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Customer",
                      style: TextStyle(
                        color: AppColors.LOGO_BACKGROUND_COLOR,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Divider(
                    thickness: size.height * .005,
                    color: pageNo == 2
                        ? AppColors.LOGO_BACKGROUND_COLOR
                        : AppColors.STEPPER_PENDING_COLOR,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * .034, //26,
                      width: size.width * .085, //30,
                      decoration: BoxDecoration(
                          color: pageNo == 2
                              ? AppColors.LOGO_BACKGROUND_COLOR
                              : AppColors.STEPPER_PENDING_COLOR,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Product",
                      style: TextStyle(
                        color: pageNo == 2
                            ? AppColors.LOGO_BACKGROUND_COLOR
                            : AppColors.STEPPER_PENDING_COLOR,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Divider(
                    thickness: size.height * .005,
                    color: pageNo == 2
                        ? AppColors.LOGO_BACKGROUND_COLOR
                        : AppColors.STEPPER_PENDING_COLOR,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTopContainer(Size size) {
    return Container(
      height: size.height * .18, //.22
      decoration: const BoxDecoration(
          color: AppColors.LOGO_BACKGROUND_COLOR,
          image: DecorationImage(
              image: AssetImage(
                "assets/images/doodle_bg.png",
              ),
              fit: BoxFit.cover)),
      child: Center(
        child: SvgPicture.asset(
          "assets/images/logo.svg",
          height: size.height * 0.08, //.1,
          width: size.width * 0.08, //.1,
        ),
      ),
    );
  }

  Widget buildTextFormField(
    Size size, {
    required TextEditingController? controller,
    required String hintText,
    required String labelText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.LOGO_BACKGROUND_COLOR,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          // filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.LOGO_BACKGROUND_COLOR, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: AppColors.LOGO_BACKGROUND_COLOR,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_COLOR,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust vertical padding here
        ),
      ),
    );

    /*Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
        horizontal: size.width * 0.005,
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.LOGO_BACKGROUND_COLOR,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            // borderSide: BorderSide(
            //   color: AppColors.LOGO_BACKGROUND_COLOR
            // )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.LOGO_BACKGROUND_COLOR, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          fillColor: AppColors.LOGO_BACKGROUND_COLOR,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_COLOR,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppColors.LOGO_BACKGROUND_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );*/
  }
}
