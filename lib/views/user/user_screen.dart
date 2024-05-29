import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpmbs/utils/dimensions.dart';
import 'package:gpmbs/views/user/user_details_screen.dart';
import 'package:gpmbs/widgets/app_textformfield.dart';
import 'package:gpmbs/widgets/app_widgets.dart';
import '../../controllers/user/user_controller.dart';
import '../../utils/responsive_layout.dart';
import '../../utils/s.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  final UserController userController = Get.put(UserController());

  _UserScreenState() {
    userController.searchController.addListener(() {
      if (userController.searchController.text.isEmpty) {
        setState(() {
          userController.firstSearch = true;
          userController.query = "";
        });
      } else {
        setState(() {
          userController.firstSearch = false;
          userController.query = userController.searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor:S.colors.greyShade,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppTextFormField(
                  controller: userController.searchController,
                  rightPaddingIcon:Icons.search,
                ),
                userController.firstSearch ? listViewWidget(context) : _performSearch(),
              ]
            ),
          ),
        ),
      ),
    );
  }

  Widget listViewWidget(context){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width * 0.9:
      MediaQuery.of(context).size.width,
      child: Obx(()=> userController.isLoading.value?
      AppWidgets.loadingWidget():
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userController.userList.value.results!.length,
        itemBuilder: (context, index) {
          final user = userController.userList.value.results![index];
          return GestureDetector(
            onTap: (){
              Get.to(() => UserDetailScreen(selectedIndex: index));
            },
            child: Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.fromLTRB(12.0,6.0,12.0,6.0),
                decoration: BoxDecoration(color:S.colors.lightGrey,
                    border: Border.all(color: S.colors.grey),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                    CircleAvatar(radius: 20,
                      backgroundColor: S.colors.circleAvatarColor,child:
                      Icon(Icons.person,color: S.colors.black,),),
                    const SizedBox(width: Dimensions.paddingSizeExtraLarge,),
                    AppWidgets.buildText(text:user.name.toString(),
                        textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
                  ],
                )
            ),
          );
        },
      ),
      ),
    );
  }

  Widget _performSearch() {
    userController.filterListName = [];
    for (int i = 0; i <userController.userList.value.results!.length; i++) {
      var item = userController.userList.value.results![i].name;
      if (item!.toLowerCase().contains(userController.query.toLowerCase())) {
        userController.filterListName!.add(userController.userList.value.results![i].name.toString());
        userController.filterListIndex=i;
      }
    }
    return _createFilteredListView();
  }


  Widget _createFilteredListView() {
    return  userController.filterListName!.isNotEmpty?SizedBox(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child:ListView.builder(
          itemCount: userController.filterListName!.length,
          itemBuilder: (context,index) {
            return GestureDetector(
              onTap: (){
                Get.to(() => UserDetailScreen(selectedIndex: userController.filterListIndex));
              },
              child: Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.fromLTRB(12.0,4.0,12.0,4.0),
                  decoration: BoxDecoration(color:S.colors.lightGrey,
                      border: Border.all(color: S.colors.grey),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 20,
                        backgroundColor: S.colors.circleAvatarColor,child: const Icon(Icons.person),),
                      const SizedBox(width: Dimensions.paddingSizeExtraLarge,),
                      AppWidgets.buildText(text:userController.filterListName![index].toString(),
                          textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
                    ],
                  )
              ),
            );
          },
        )
    ):
    Container(
        margin: const EdgeInsets.all(15),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: S.colors.white,
            border: Border.all(color: S.colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: AppWidgets.buildText(text:'No User Found')));
  }

}







