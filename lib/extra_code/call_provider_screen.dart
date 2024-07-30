// import 'dart:async';
// import 'dart:io';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:infobipplugin/infobipplugin.dart';
// import 'package:infobipplugin_example/Utils/StringRes.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';


// final callNotifierProvider = NotifierProvider<CallNotifier,Map<String,dynamic>>((){
//   //  final allVariables=ref.watch(homeNotifierProvider);  // home 
//  CallNotifier().initializee();
//   return CallNotifier();
// });


// class CallNotifier extends Notifier<Map<String,dynamic>> {

//   var startTimeIdGet = '';
//   var endTimeIdGet = '';
//   var callDurationIdGet = '';
//   var establishTimeIdGet = '';
//   bool speaker = false;
//   bool mute = false;
//   var status = '';
//   var videoCallStatus = '';
//   var hangup = false;

// //  var allHomeVariables;

//   @override
//   Map<String, dynamic> build() {

//     //  allHomeVariables=ref.watch(homeNotifierProvider);  // home 
//     return {
//       "startTimeIdGet": startTimeIdGet,
//       "endTimeIdGet": endTimeIdGet,
//       "callDurationIdGet": callDurationIdGet,
//       "establishTimeIdGet": establishTimeIdGet,
//       "speaker": speaker,
//       "mute": mute,
//       "status": status,
//       "videoCallStatus": videoCallStatus,
//       "hangup": hangup

//    };
//   }

//   /// ---- mute/unmute ----
//   /// 
  

//   muteUnmute() async {
//     // if (allHomeVariables['onlineStatus'] == true) {
//       var muteOrUnmute = await InfoBip().muteUnmute();  // bool
//       state["mute"] = muteOrUnmute;

//       // update(['hang']);
//     // } 

//   }

//   /// ---- speaker phone ----

//   speakerPhone() async {
//     // if (allHomeVariables['onlineStatus'] == true) {
//       var speakerPhone = await InfoBip().speakerPhone();
//       state["speaker"] = speakerPhone;
//       // update(['hang']);
//     // } 
 
//   }

//   // ---- establish time ----

//   establishTime() async {
//     var establish = await InfoBip().establishTime();
//     state["establishTimeIdGet"] = establish.toString();

//     // update(['hang']);
//   }

//   /// ---- hang duration ----

//   callDuration() async {
//     var callDurationTime = await InfoBip().callDuration();
//     state["callDurationIdGet"] = callDurationTime.toString();

//     // update(['hang']);
//   }

//   /// ---- start Time ----

//   startTime() async {
//     var startTimeId = await InfoBip().startTime();
//     state["startTimeIdGet"] = startTimeId;

//     // update(['hang']);
//   }

//   /// ---- End Time ----

//   endTime() async {
//     var endTimeId = await InfoBip().endTime();
//     state["endTimeIdGet"] = endTimeId;

//     // update(['hang']);
//   }

//   /// ---- hang up hang ----

//   hangUpCall() async {

//       var hangcall = await InfoBip().callHang();
//       callTime();
//       state["hangup"] = hangcall;
//       // update(['hang']);
//   }


//   callTime() async {
//     // if (allHomeVariables['onlineStatus'] == true) {
//       await startTime();
//       await endTime();
//       await establishTime();
//       await callDuration();
//    // } 
 
//   }

//   initSdk() async {
//     await InfoBip().sdkInit(
//         appKey: StringRes.apiKey,
//         applicationId: StringRes.applicationId,
//         baseUrl: StringRes.baseUrl,
//         callStatus: (callStatusString) {
//           state["status"] = callStatusString;
//           // update(['hang']);
//         },
//         videoCallStatus: (videoCallStaus) {
//           if (Platform.isAndroid) {
//             state["videoCallStatus"] = videoCallStaus;
//           }
//           // update(['hang']);
//         });
//   }


//   void initializee() {
//     initSdk();
//     Timer.periodic(const Duration(seconds: 2), (timer) {
//       // init();
//       if (state["status"] == "onHangup-REQUEST_TIMEOUT") {
//         state["hangup"] = true;
//         callTime();
//         // Get.to(const NotAnsweredScreen());                 //TC navi
//         timer.cancel();
//       } else if (state["status"] == "onHangup-NORMAL_HANGUP") {
//         state["hangup"] = true;
//         callTime();
//         timer.cancel();
//       } else if (state["status"] == "onHangup-NETWORK_ERROR") {
//         InfoBip().callHang();
//         state["hangup"] = true;
//         callTime();
//         timer.cancel();
//         // Get.offAll(HomeScreen());                        //TC navi
//       }
//     });

//   }
  

// }
/////////////////////////
///
///
///
///
///
///
///
//screen



// class CallScreen2 extends ConsumerWidget {
//   CallScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final allHomeVariables=ref.watch(homeNotifierProvider); // home notifier
//     final callVariables = ref.watch(callNotifierProvider); // call notifier
//     final navigationState = ref.watch(navigationProvider);   // navigation

//      ref.listen<SnackbarState?>(snackbarProvider, (previous, next) {
//       if (next != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('${next.title}: ${next.message}'),
//             backgroundColor: next.backgroundColor,
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 2),
//           ),
//         );

//         // Clear the snackbar state after showing it
//         ref.read(snackbarProvider.notifier).clear();
//       }
//     });
// ////////////////////
//     return
//     PopScope(
//      onPopInvoked : (v) async {
//         callVariables['hangup'] = false;
//         callVariables['startTimeIdGet'] = '';
//         callVariables['endTimeIdGet'] = '';
//         callVariables['callDurationIdGet'] = '';
//         callVariables['establishTimeIdGet'] = '';
//         callVariables['status'] = "";
//         callVariables['speaker'] = false;
//         callVariables['mute'] = false;
//         callVariables['hangup'] = false;

//         // callVariables.update(['hang']);
//         navigationState.navigateToOffAll(context, HomeScreen2());            //cc                  //////////////
//         // return true;
//       },
//       child:
//        Scaffold(
//           body:
//               //  GetBuilder<CallController>(
//               //     id: "hang",
//               //     builder: (con) {
//               //       return
//               Container(
//         height: Get.height,
//         width: Get.width,
//         alignment: Alignment.center,
//         child: (callVariables['hangup'] == false)
//             // if call has'nt ended
//             ? Column(
//                 children: [
//                   const Spacer(),
//                   Container(
//                     height: 200,
//                     width: 200,
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.black),
//                     child: Container(
//                       height: 180,
//                       width: 180,
//                       alignment: Alignment.center,
//                       decoration: const BoxDecoration(
//                           shape: BoxShape.circle, color: Colors.black),
//                       child: const Icon(
//                         Icons.person,
//                         size: 100,
//                         color: ColorConstatnts.white,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   (callVariables['status'] == "onHangup-REQUEST_TIMEOUT" ||
//                           callVariables['status'] == "onHangup-NORMAL_HANGUP")
//                       ? const Text("Call Ended")
//                       : (callVariables['status'] == "onEstablished")
//                           ? const Text("Running.....")
//                           : const Text("Ringing"),
//                   const Spacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       /// mute/unmute button
//                       InkWell(
//                         onTap: () async{

//                           if (allHomeVariables['onlineStatus'] == true) {
//                               await ref.read(callNotifierProvider.notifier).muteUnmute();     // calling fun
//                               print("mute variable status in ${callVariables['mute']}");

//                           }else{
//                               ref.read(snackbarProvider.notifier).showSnackbar(   // show snack bar net Connection
//                               "Error", "Please Check Internet Connection");
//                           }

//                         },
//                         child: Container(
//                           height: 50,
//                           width: 50,
//                           alignment: Alignment.center,
//                           decoration:
//                               const BoxDecoration(shape: BoxShape.circle),
//                           child: (callVariables['mute'] == false)
//                               ? const Icon(Icons.mic)
//                               : const Icon(Icons.mic_off),
//                         ),
//                       ),

//                       /// Speaker ON/OFF button
//                       InkWell(
//                         onTap: () async{

//                          await ref.read(callNotifierProvider.notifier).speakerPhone();

//                           print("state of speaker id ${callVariables['speaker']}");
//                           ///
//                         },
//                         child: Container(
//                           height: 50,
//                           width: 50,
//                           alignment: Alignment.center,
//                           decoration:
//                               const BoxDecoration(shape: BoxShape.circle),
//                           child: (callVariables['speaker'])
//                               ? const Icon(Icons.volume_up)
//                               : const Icon(Icons.volume_off),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),

//                   /// Hang up call button
//                   InkWell(
//                     onTap: () async {                 ///////////////////
//                   if (allHomeVariables['onlineStatus'] == true) {

//                       await ref.read(callNotifierProvider.notifier).hangUpCall();

//                       print(" value of hangUp variable is ${callVariables['hangup'] }");
//                       callVariables['hangup'] = true;

//                     }
//                     else{
//                          ref.read(snackbarProvider.notifier).showSnackbar(           // show snack bar net Connection
//                               "Error", "Please Check Internet Connection");
//                     }
//                     },
//                     child: Container(
//                       height: 50,
//                       width: Get.width * 0.3,
//                       alignment: Alignment.center,
//                       color: ColorConstatnts.red,
//                       child: const Text(
//                         "Hang up call",
//                         style: TextStyle(
//                           color: ColorConstatnts.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text("hangUp value is ${ callVariables['hangup']}"),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               )

//             // if the call is ended
//             : 
// Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: Get.width,
//                     height: 50,
//                     margin: const EdgeInsets.all(20),
//                     alignment: Alignment.centerLeft,
//                     child: InkWell(
//                         onTap: () {
//                           callVariables['hangup'] = false;
//                           callVariables['startTimeIdGet'] = '';
//                           callVariables['endTimeIdGet'] = '';
//                           callVariables['callDurationIdGet'] = '';
//                           callVariables['establishTimeIdGet'] = '';
//                           callVariables['status'] = "";
//                           callVariables['speaker'] = false;
//                           callVariables['mute'] = false;
//                           callVariables['hangup'] = false;
//                           // callVariables.update(['hang']);

//                           Get.offAll(HomeScreen());
//                         },
//                         child: const Icon(
//                           Icons.arrow_back_ios_new,
//                           size: 20,
//                         )),
//                   ),
//                   const Spacer(),
//                   Text("Establish Time: ${callVariables['establishTimeIdGet']}"),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text("Call Duration: ${callVariables['callDurationIdGet']}"),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text("Call Start Time: ${callVariables['startTimeIdGet']}"),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text("Call End Time: ${callVariables['endTimeIdGet']}"),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//       )
//           // }),
//           ),
//     );
//   }
// }
// /////////////////////////////