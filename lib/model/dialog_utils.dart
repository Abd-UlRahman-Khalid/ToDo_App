import 'package:flutter/material.dart';

class DialogUtils {
  static void showProgressDialog(BuildContext context, String message,
      {bool isDissmisable = true}) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 15,
                ),
                Text(message),
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      String? negActionTitle,
      bool isDissmisable = true}) {
    showDialog(
        context: context,
        builder: (BuildContext) {
          List<Widget> actions = [];
          if (posActionTitle != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (posAction != null) {
                  posAction();}
                },
                child: Text(posActionTitle)));
          }
          if (negActionTitle != null) {
            actions
                .add(TextButton(onPressed: () {
                  Navigator.pop(context);
                  if(negAction!=null){
                    negAction();
                  }
                }, child: Text(negActionTitle)));
          }
          return AlertDialog(
            content: Text(message),
            actions: actions,
          );
        },
        barrierDismissible: isDissmisable);
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
