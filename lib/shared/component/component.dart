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
  required context,
  TextEditingController? controller,
  required String label,
  IconData ? prefix,
  String ? initialValue,
  TextInputType ?keyboardType,
  Function(String)? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData ?suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: onSubmit,
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      style:Theme.of(context).textTheme.bodyText1,
      initialValue:initialValue ,
      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        labelText:label ,
        border:const OutlineInputBorder(),
        prefixIcon: Icon(prefix,),
        suffixIcon: suffix != null ? IconButton(onPressed: suffixPressed,
            icon: Icon(suffix)) : null,

      ),
    );

Widget space({
  double? height,
  double? width,
}) {
  return SizedBox(
    height: height,
    width: width,
  );
}



Widget defaultTextButton({
  required String title,
  required Function onPressed,
}) =>
    TextButton(
        onPressed: () {
          onPressed;
        },
        child: Text(title));

Widget defaultButton({
  required VoidCallback onTap,
  required String text,
  double? width = double.infinity,

}) => Container(
  height: 40,
  width: width,
  decoration:const BoxDecoration(
    color: Colors.red,
  ),
  child: ElevatedButton(
    onPressed: onTap,
    child: Text(
      '$text',
      style:const TextStyle(
        color: Colors.white,
        fontSize: 17,
      ),
    ),
  ),
);

