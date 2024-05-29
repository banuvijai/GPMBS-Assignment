import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpmbs/utils/dimensions.dart';
import 'package:gpmbs/widgets/background_widget.dart';
import '../../controllers/user/user_controller.dart';
import '../../utils/s.dart';
import '../../widgets/app_widgets.dart';

class UserDetailScreen extends StatelessWidget {
  final int? selectedIndex;
  UserDetailScreen({super.key,this.selectedIndex});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:S.colors.greyShade,),
        body: Stack(
          children: [
            const BackGroundWidget(),

            Positioned(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
                child: userHeaderSection(context)),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              child:userDetailSection(context),
            ),

          ],
        ),
      ),
    );
  }

  Widget userHeaderSection(context){
    return  Container(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(color: S.colors.colorTransparent,
        borderRadius:BorderRadius.circular(15.0),
        border: Border.all(color: S.colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50,
            backgroundColor: S.colors.circleAvatarColor,
            child: const Icon(Icons.person,size: 70,),),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          AppWidgets.buildText(
              text:userController.userList.value.results![selectedIndex!].name.toString(),
              textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget userDetailSection(context){
    var userDetails = userController.userList.value.results![selectedIndex!];
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width:MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color:Colors.transparent),
      child: Column(

        children: [
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          AppWidgets.buildText(text:"Birth Year : "
              "${userDetails.birthYear}".toString(),
              textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          AppWidgets.buildText(text:"Height : "
              "${userDetails.height}".toString(),
              textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          AppWidgets.buildText(text:"Skin Colour : "
              "${userDetails.skinColor}".toString(),
              textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          AppWidgets.buildText(text:"Gender : "
              "${userDetails.gender}".toString(),
              textStyle: S.textStyles.titleTextStyle(fontSize: 14)),

        ],
      ),
    );
  }
}
