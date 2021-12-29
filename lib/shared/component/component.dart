import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required Function validator,
  required String labelText,
  required IconData prefixIcon,
   IconData? suffixIcon ,
   Function? onSubmit,
   Function? suffixPressed,
   Function? onChange,
   Function? onTap,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    validator: (value ){
      validator;
    },
    onChanged: (value) {
      onChange;
    },
    onTap: (){
      onTap;
    },
    decoration:  InputDecoration(
      labelText: labelText,
      border:const OutlineInputBorder(),
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon != null
          ? IconButton(
        onPressed: (){suffixPressed;},
        icon: Icon(
          suffixIcon,
        ),
      )
          : null,
  )
  );
}

Widget space({double ? height,
double ? width,
}){
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: (){
          function;
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({required String title, required Function onPressed,})=>TextButton(onPressed: (){
  onPressed;
}, child: Text(title));