import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:gpmbs/utils/dimensions.dart';
import 'package:gpmbs/views/user/user_details_screen.dart';
import 'package:gpmbs/widgets/app_textformfield.dart';
import 'package:gpmbs/widgets/app_widgets.dart';
import 'package:gpmbs/widgets/background_widget.dart';
import '../../controllers/user/user_controller.dart';
import '../../models/user/user_model.dart';
import '../../routes/routes.dart';
import '../../utils/responsive_layout.dart';
import '../../utils/s.dart';

class UserScreen extends StatefulWidget {
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
      child: Scaffold(
        body: Stack(
          children: [
            const BackGroundWidget(),
            AppTextFormField(
              controller: userController.searchController,
              rightPaddingIcon:Icons.search,
            ),

            Positioned(
              top: Responsive.isDesktop(context)?MediaQuery.of(context).size.height * 0.17
                  :MediaQuery.sizeOf(context).width * 0.20,
              left:Responsive.isDesktop(context)? MediaQuery.sizeOf(context).width * 0.05:2,
              child:userController.firstSearch ? listViewWidget(context) : _performSearch(),
            ),
          ]
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
        itemCount: userController.userList.value.results!.length,
        itemBuilder: (context, index) {
          var user = userController.userList.value.results![index];
          return GestureDetector(
            onTap: (){
              Get.to(() => UserDetailScreen(selectedIndex: index));
            },
            child: Container(
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.fromLTRB(12.0,8.0,12.0,8.0),
                decoration: BoxDecoration(color:S.colors.lightGrey,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 20,
                      backgroundColor: S.colors.circleAvatarColor,child: const Icon(Icons.person),),
                    const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
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

  // Widget listViewWidget(context){
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height,
  //     width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width * 0.9:
  //     MediaQuery.of(context).size.width,
  //     child: Obx(()=> userController.isLoading.value?
  //      AppWidgets.loadingWidget():
  //     ListView.builder(
  //       itemCount: userController.userList.value.results!.length,
  //       itemBuilder: (context, index) {
  //         var user = userController.userList.value.results![index];
  //         return GestureDetector(
  //           onTap: (){
  //             Get.to(() => UserDetailScreen(selectedIndex: index));
  //           },
  //           child: Container(
  //               padding: const EdgeInsets.all(15.0),
  //               margin: const EdgeInsets.fromLTRB(12.0,8.0,12.0,8.0),
  //               decoration: BoxDecoration(color:S.colors.lightGrey,
  //                   borderRadius: BorderRadius.circular(15.0)),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   CircleAvatar(radius: 20,
  //                     backgroundColor: S.colors.circleAvatarColor,child: const Icon(Icons.person),),
  //                   const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
  //                   AppWidgets.buildText(text:user.name.toString(),
  //                       textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
  //                 ],
  //               )
  //           ),
  //         );
  //       },
  //     ),
  //     ),
  //   );
  // }

  Widget _performSearch() {
    userController.filteredList=[];
    userController.filterListName = [];
    for (int i = 0; i <userController.userList.value.results!.length; i++) {
      var item = userController.userList.value.results![i].name;
      if (item!.toLowerCase().contains(userController.query.toLowerCase())) {
        userController.filteredList!.add(item);
        userController.filterListName!.add(userController.userList.value.results![i].name.toString());
        print(userController.filteredList);
        print("Selected Index UI");
        print(userController.userList.value.results![i].name!.indexOf(item));
        userController.filterListIndex=i;
        // print(userController.userList.value.results![userController.userList.value.results![i].name!.indexOf(item)].name!);
      }
    }
    return _createFilteredListView();
  }

  // Widget _performSearch() {
  //   userController.filteredList=[];
  //   userController.filterListName = [];
  //   for (int i = 0; i <userController.userList.value.results!.length; i++) {
  //     var item = userController.userList.value.results![i].name;
  //     if (item!.toLowerCase().contains(userController.query.toLowerCase())) {
  //       userController.filterListName!.add(userController.userList.value.results![
  //         userController.userList.value.results![i].filteredIndex!].name.toString());
  //       print(userController.filteredList!);
  //       print("Selected Index UI");
  //       print(userController.userList.value.results![userController.userList.value.results![i].filteredIndex!].filteredIndex!);
  //      userController.filterListIndex = i;
  //
  //     }
  //   }
  //   return _createFilteredListView();
  // }
  Widget _createFilteredListView() {
    return  userController.filterListName!.isNotEmpty?SizedBox(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child:ListView.builder(
          itemCount: userController.filterListName!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                // print("Index --> ${userController.userList.value.results![userController.userList.value.results![userController.filterListIndex!].filteredIndex!].filteredIndex!}");
                Get.to(() => UserDetailScreen(selectedIndex: userController.filterListIndex));
              },
              child: Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color:S.colors.lightGrey,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(radius: 20,
                        backgroundColor: S.colors.circleAvatarColor,child: const Icon(Icons.person),),
                      const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
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
        margin: EdgeInsets.all(20),
        height: 40,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(color: S.colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: AppWidgets.buildText(text:'No User Found')));
  }

}



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:get/get.dart';
// import 'package:gpmbs/utils/dimensions.dart';
// import 'package:gpmbs/views/user/user_details_screen.dart';
// import 'package:gpmbs/widgets/app_textformfield.dart';
// import 'package:gpmbs/widgets/app_widgets.dart';
// import 'package:gpmbs/widgets/background_widget.dart';
// import '../../controllers/user/user_controller.dart';
// import '../../models/user/user_model.dart';
// import '../../routes/routes.dart';
// import '../../utils/responsive_layout.dart';
// import '../../utils/s.dart';
//
// class UserScreen extends StatefulWidget {
//   @override
//   State<UserScreen> createState() => _UserScreenState();
// }
//
// class _UserScreenState extends State<UserScreen> {
//
//   final UserController userController = Get.put(UserController());
//
//
//   _UserScreenState() {
//     userController.searchController.addListener(() {
//       if (userController.searchController.text.isEmpty) {
//         setState(() {
//           userController.firstSearch = true;
//           userController.query = "";
//         });
//       } else {
//         setState(() {
//           userController.firstSearch = false;
//           userController.query = userController.searchController.text;
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             const BackGroundWidget(),
//             AppTextFormField(
//               controller: userController.searchController,
//               rightPaddingIcon:Icons.search,
//             ),
//
//             Positioned(
//               top: Responsive.isDesktop(context)?MediaQuery.of(context).size.height * 0.17
//                   :MediaQuery.sizeOf(context).width * 0.22,
//               left:Responsive.isDesktop(context)?
//               MediaQuery.sizeOf(context).width * 0.05:2,
//               child:userController.firstSearch ? listViewWidget(context) : _performSearch(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget listViewWidget(context){
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       width:Responsive.isDesktop(context)?MediaQuery.of(context).size.width * 0.9:
//       MediaQuery.of(context).size.width,
//       child: Obx(()=> userController.isLoading.value?
//       const Center(child: CircularProgressIndicator(color: Colors.grey,)):
//       ListView.builder(
//         itemCount: userController.userList.value.results!.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: (){
//               Get.to(() => UserDetailScreen(selectedIndex: index));
//             },
//             child: Container(
//                 padding: const EdgeInsets.all(15.0),
//                 margin: const EdgeInsets.fromLTRB(12.0,8.0,12.0,8.0),
//                 decoration: BoxDecoration(color:S.colors.lightGrey,
//                     borderRadius: BorderRadius.circular(15.0)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     CircleAvatar(radius: 20,
//                       backgroundColor: S.colors.circleAvatarColor,child: const Icon(Icons.person),),
//                     const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
//                     AppWidgets.buildText(text:userController.userList.value.results![index].name.toString(),
//                         textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
//                   ],
//                 )
//             ),
//           );
//         },
//       ),
//       ),
//     );
//   }
//
//   Widget _performSearch() {
//     userController.filteredList=[];
//     userController.filterListName = [];
//     for (int i = 0; i <userController.userList.value.results!.length; i++) {
//       var item = userController.userList.value.results![i].name;
//       if (item!.toLowerCase().contains(userController.query.toLowerCase())) {
//         userController.filteredList!.add(item);
//         userController.filterListName!.add(
//             userController.userList.value.results![i].name.toString());
//         print(userController.filteredList);
//         print("Selected Index UI");
//         print(userController.userList.value.results![i].name!.indexOf(item));
//         // print(userController.userList.value.results![userController.userList.value.results![i].name!.indexOf(item)].name!);
//        userController.filterListIndex=i;
//       }
//     }
//     return _createFilteredListView();
//   }
//
//   // Widget _performSearch() {
//   //   userController.filteredList=[];
//   //   userController.filterListName = [];
//   //   for (int i = 0; i <userController.userList.value.results!.length; i++) {
//   //     var item = userController.userList.value.results![i].name;
//   //     if (item!.toLowerCase().contains(userController.query.toLowerCase())) {
//   //       userController.filterListName!.add(userController.userList.value.results![
//   //         userController.userList.value.results![i].filteredIndex!].name.toString());
//   //       print(userController.filteredList!);
//   //       print("Selected Index UI");
//   //       print(userController.userList.value.results![userController.userList.value.results![i].filteredIndex!].filteredIndex!);
//   //      userController.filterListIndex = i;
//   //
//   //     }
//   //   }
//   //   return _createFilteredListView();
//   // }
//   Widget _createFilteredListView() {
//     return  userController.filterListName!.isNotEmpty?SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width:MediaQuery.of(context).size.width,
//         child:ListView.builder(
//           itemCount: userController.filterListName!.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: (){
//                 // print("Index --> ${userController.userList.value.results![userController.userList.value.results![userController.filterListIndex!].filteredIndex!].filteredIndex!}");
//                 Get.to(() => UserDetailScreen(selectedIndex: userController.filterListIndex));
//               },
//               child: Container(
//                   padding: EdgeInsets.all(15.0),
//                   margin: EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(color:S.colors.lightGrey,
//                       borderRadius: BorderRadius.circular(15.0)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       CircleAvatar(child: Icon(Icons.person),radius: 20,
//                         backgroundColor: S.colors.circleAvatarColor,),
//                       const SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE,),
//                       AppWidgets.buildText(text:userController.filterListName![index].toString(),
//                           textStyle: S.textStyles.titleTextStyle(fontSize: 14)),
//                     ],
//                   )
//               ),
//             );
//           },
//         )
//     ):
//     Container(
//         margin: EdgeInsets.all(20),
//         height: 40,
//         width: MediaQuery.of(context).size.width * 0.9,
//         decoration: BoxDecoration(color: S.colors.white,
//             borderRadius: BorderRadius.circular(10)),
//         child: Center(child: AppWidgets.buildText(text:'No User Found')));
//   }
//
// }

