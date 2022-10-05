
import 'package:flutter/material.dart';


class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pop(context),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
    );
  }
}