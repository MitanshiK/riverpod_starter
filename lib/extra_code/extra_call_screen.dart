// class CallScreen2 extends ConsumerWidget {
//   CallScreen2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final callVariables = ref.watch(callNotifierProvider);
//     final navigationState = ref.watch(navigationProvider);
//     final allHomeVariables = ref.read(homeNotifierProvider);

//     ref.read(callNotifierProvider.notifier).initializee();

//     ref.listen<SnackbarState?>(snackbarProvider, (previous, next) {
//       if (next != null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('${next.title}: ${next.message}'),
//             backgroundColor: next.backgroundColor,
//             behavior: SnackBarBehavior.floating,
//             duration: Duration(seconds: 2),
//           ),
//         );

//         ref.read(snackbarProvider.notifier).clear();
//       }
//     });

//     return PopScope(
//       onPopInvoked: (v) async {
//         ref.read(callNotifierProvider.notifier).resetVariables();
//         navigationState.navigateToOffAll(context, HomeScreen2());
//       },
//       child: Scaffold(
//         body: Container(
//           height: Get.height,
//           width: Get.width,
//           alignment: Alignment.center,
//           child: (callVariables['hangup'] == false)
//               ? Column(
//       children: [
//         const Spacer(),
//         Container(
//           height: 200,
//           width: 200,
//           alignment: Alignment.center,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.black,
//           ),
//           child: Container(
//             height: 180,
//             width: 180,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.black,
//             ),
//             child: const Icon(
//               Icons.person,
//               size: 100,
//               color: ColorConstatnts.white,
//             ),
//           ),
//         ),
//         const Spacer(),
//                 (callVariables['status'] == "onHangup-REQUEST_TIMEOUT" ||
//                           callVariables['status'] == "onHangup-NORMAL_HANGUP")
//                       ? const Text("Call Ended")
//                       : (callVariables['status'] == "onEstablished")
//                           ? const Text("Running.....")
//                           : const Text("Ringing"),
//         // Text(getStatusText(callVariables['status'])),
//         const Spacer(),

//         Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         InkWell(
//           onTap: ()  async{
           
//     //  if (allHomeVariables['onlineStatus'] == true) {
//       await ref.read(callNotifierProvider.notifier).muteUnmute();
//     // } else {
//     //   ref.read(snackbarProvider.notifier).showSnackbar("Error", "Please Check Internet Connection");
//     // }
//             },
//           child: Container(
//             height: 50,
//             width: 50,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(shape: BoxShape.circle),
//             child: Icon(callVariables['mute'] == false ? Icons.mic : Icons.mic_off),
//           ),
//         ),
//         InkWell(
//           onTap: () => toggleSpeaker(ref),
//           child: Container(
//             height: 50,
//             width: 50,
//             alignment: Alignment.center,
//             decoration: const BoxDecoration(shape: BoxShape.circle),
//             child: Icon(callVariables['speaker'] == false ? Icons.volume_up : Icons.volume_off),
//           ),
//         ),
//       ],
//     ),
//         // CallActionButtons(callVariables: callVariables, ref: ref),
//         const Spacer(),
//         InkWell(
//           onTap: () => hangUpCall(ref),
//           child: Container(
//             height: 50,
//             width: Get.width * 0.3,
//             alignment: Alignment.center,
//             color: ColorConstatnts.red,
//             child: const Text(
//               "Hang up call",
//               style: TextStyle(
//                 color: ColorConstatnts.white,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     )
//               //CallInProgressUI(callVariables: callVariables, ref: ref)
//               : CallEndedUI(callVariables: callVariables, ref: ref, navigationState: navigationState,),
//         ),
//       ),
//     );
//   }
//     void hangUpCall(WidgetRef ref) async {
//     final allHomeVariables = ref.read(homeNotifierProvider);
//     if (allHomeVariables['onlineStatus'] == true) {
//       await ref.read(callNotifierProvider.notifier).hangUpCall();
//     } else {
//       ref.read(snackbarProvider.notifier).showSnackbar("Error", "Please Check Internet Connection");
//     }
//   }
//     void toggleMute(WidgetRef ref) async {
//     final allHomeVariables = ref.read(homeNotifierProvider);
//     if (allHomeVariables['onlineStatus'] == true) {
//       await ref.read(callNotifierProvider.notifier).muteUnmute();
//     } else {
//       ref.read(snackbarProvider.notifier).showSnackbar("Error", "Please Check Internet Connection");
//     }
//   }

//   void toggleSpeaker(WidgetRef ref) async {
//     final allHomeVariables = ref.read(homeNotifierProvider);
//     if (allHomeVariables['onlineStatus'] == true) {
//       await ref.read(callNotifierProvider.notifier).speakerPhone();
//     } else {
//       ref.read(snackbarProvider.notifier).showSnackbar("Error", "Please Check Internet Connection");
//     }
//   }
// }


// class CallEndedUI extends StatelessWidget {
//   final Map<String, dynamic> callVariables;
//   final WidgetRef ref;
//   final NavigationService navigationState;

//   const CallEndedUI({required this.callVariables, required this.ref ,required this.navigationState});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//          Container(
//                             width: Get.width,
//                             height: 50,
//                             margin: const EdgeInsets.all(20),
//                             alignment: Alignment.centerLeft,
//                             child: InkWell(
//                                 onTap: () {
                     
//          ref.read(callNotifierProvider.notifier).resetVariables();
//         navigationState.navigateToOffAll(context, HomeScreen2());
                        
//                                 },
//                                 child: const Icon (
//                                   Icons.arrow_back_ios_new,
//                                   size: 20,
//                                 )), 
//                           ),
//        Text("Start Time: ${callVariables['startTimeIdGet']}"),
//         Text("End Time: ${callVariables['endTimeIdGet']}"),
//         Text("Call Duration: ${callVariables['callDurationIdGet']}"),
//         Text("Establish Time: ${callVariables['establishTimeIdGet']}"),
//       ],
//     );
//   }
// }

