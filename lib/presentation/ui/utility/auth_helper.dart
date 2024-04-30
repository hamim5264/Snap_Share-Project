import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthHelper {
  static customProgressBar(
    BuildContext context,
  ) {
    return showDialog(
        barrierColor: Colors.white.withOpacity(.5),
        barrierDismissible: false,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(120.0),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/new_progress.json',
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  static showDialogue(
      BuildContext context, String tittle, DialogType dialogType,
      {String? descriotion,
      String? OkButtonName,
      String? CancelButtonName,
      Color? btnOkColor,
      Color? btnCancelColor,
      Color? backgroundColor}) {
    return AwesomeDialog(
      titleTextStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
      descTextStyle: const TextStyle(fontWeight: FontWeight.w300,color: Colors.red),
      dismissOnTouchOutside: false,
      //customHeader: Text("Done"),
      barrierColor: Colors.white.withOpacity(.5),
      isDense: true,
      context: context,
      title: tittle,
      desc: descriotion,
      dialogType: dialogType,
      animType: AnimType.topSlide,
      btnOkOnPress: () {},
      btnOkText: OkButtonName ,
      btnOkColor: btnOkColor,
      btnOkIcon: Icons.done,
    ).show();
  }
}
