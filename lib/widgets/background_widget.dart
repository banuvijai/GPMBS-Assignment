import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/r.dart';
import '../utils/s.dart';


class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color:S.colors.greyShade,
          ),
          Positioned(
              left: 0,
              child:Image.asset(R.images.backGround,height: 200,)),

          Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height * 0.45,
              child: Image.asset(R.images.backGround1,height:150,)),

          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(R.images.backGround2,height: 300)),
        ],
      ),
    );
  }
}