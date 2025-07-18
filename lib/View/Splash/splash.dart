import 'package:app/Constants/color.dart';
import 'package:app/Controller/app_controller.dart';
import 'package:app/Controller/auth_controller.dart';
import 'package:app/Data/Local/hive_storage.dart';
import 'package:app/Data/Network/request_client.dart';
import 'package:app/Model/ip_data.dart';
import 'package:app/Utils/comon.dart';
import 'package:app/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Response;
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<IPData> getIpData() async {
    try {
      final res = await NetworkClient.get('http://ip-api.com/json',
          isTokenRequired: false);
      return IPData.fromJson(res.data);
    } on DioException catch (e) {
      throw Common.getErrorMsgOfDio(e);
    } catch (e) {
      throw e.toString();
    }
  }

  bool isFirstOpen = true;

  @override
  void initState() {
    Get.put<AppController>(AppController(), permanent: true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkForConsent();
    });
    super.initState();
  }

  Future<void> checkForConsent() async {
    bool isFirstOpenValue = LocalStorage.getFirstOpen;
    if (isFirstOpenValue != isFirstOpen) {
      setState(() {
        isFirstOpen = isFirstOpenValue;
      });
    }
    if (isFirstOpen) {
      await Common.showPrivacyPolicyBottomSheet(context);

      setState(() {});
    }
    await Future.delayed(const Duration(milliseconds: 500));
    checkForConsent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: isFirstOpen
                ? buildWidget()
                : FutureBuilder<IPData>(
                    future: getIpData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(snapshot.error.toString()),
                            const SizedBox(height: 20),
                            FilledButton.icon(
                              onPressed: () {
                                setState(() {});
                              },
                              icon: const Icon(Icons.refresh),
                              label: Text('Retry'.tr),
                            ),
                          ],
                        );
                      } else if (snapshot.hasData) {
                        ipData = snapshot.requireData;
                        Future.delayed(const Duration(seconds: 1)).then(
                          (a) => Get.put(AuthController(), permanent: true),
                        );
                        return buildWidget();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return buildWidget();
                      }
                      return buildWidget();
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget buildWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.2),
          child: SvgPicture.asset('assets/svgs/logo-text.svg'),
        ),
        const SizedBox(height: 60),
        Lottie.asset('assets/Animation/loading.json', height: 80),
      ],
    );
  }
}


// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   Future<IPData> getIpData() async {
//     try {
//       final res = await NetworkClient.get('http://ip-api.com/json',
//           isTokenRequired: false);
//       return IPData.fromJson(res.data);
//     } on DioException catch (e) {
//       throw Common.getErrorMsgOfDio(e);
//     } catch (e) {
//       throw e.toString();
//     }
//   }

//   bool isFirstOpen = true;

//   @override
//   void initState() {
//     Get.put<AppController>(AppController(), permanent: true);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       checkForConsent();
//     });
//     super.initState();
//   }

//   Future<void> checkForConsent() async {
//     // Check the "First Open" flag using LocalStorage
//     bool isPolicyAccepted = !LocalStorage.getFirstOpen;
//     if (!isPolicyAccepted) {
//       // Show Privacy Policy Bottom Sheet if not accepted
//       bool accepted = await Common.showPrivacyPolicyBottomSheet(context);
//       if (accepted) {
//         // Mark policy as accepted in LocalStorage
//         await LocalStorage.setFirstOpen();
//         setState(() {
//           isFirstOpen = false; // Update state to proceed
//         });
//       }
//     } else {
//       setState(() {
//         isFirstOpen = false; // Proceed directly if policy is already accepted
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Center(
//             child: isFirstOpen
//                 ? buildWidget()
//                 : FutureBuilder<IPData>(
//                     future: getIpData(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasError) {
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(snapshot.error.toString()),
//                             const SizedBox(height: 20),
//                             FilledButton.icon(
//                               onPressed: () {
//                                 setState(() {}); // Retry fetching IP data
//                               },
//                               icon: const Icon(Icons.refresh),
//                               label: Text('Retry'.tr),
//                             ),
//                           ],
//                         );
//                       } else if (snapshot.hasData) {
//                         ipData = snapshot.requireData;
//                         Future.delayed(const Duration(seconds: 1)).then(
//                           (a) => Get.put(AuthController(), permanent: true),
//                         );
//                         return buildWidget();
//                       } else if (snapshot.connectionState ==
//                           ConnectionState.waiting) {
//                         return buildWidget();
//                       }
//                       return buildWidget();
//                     },
//                   ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget buildWidget() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: MediaQuery.sizeOf(context).width * 0.2),
//           child: SvgPicture.asset('assets/svgs/logo-text.svg'),
//         ),
//         const SizedBox(height: 60),
//         Lottie.asset('assets/Animation/loading.json', height: 80),
//       ],
//     );
//   }
// }


// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   bool isFirstOpen = true;
//   bool isPrivacyPolicyAccepted = false;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     Get.put<AppController>(AppController(), permanent: true);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       initializeSplash();
//     });
//   }

//   Future<void> initializeSplash() async {
//     // Check if Privacy Policy has been accepted
//     isFirstOpen = LocalStorage.getFirstOpen;
//     if (isFirstOpen) {
//       // Show Privacy Policy agreement
//       isPrivacyPolicyAccepted =
//           await Common.showPrivacyPolicyBottomSheet(context);
//       if (isPrivacyPolicyAccepted) {
//         LocalStorage.setFirstOpen();
//       } else {
//         // Navigate to fallback/restricted page
//         // Get.offAll(() => const PendingPrivacyPolicy());
//         Get.offAll(() => Common.showPrivacyPolicyBottomSheet(context));
//         return;
//       }
//     }

//     // Fetch IP Data if policy accepted
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       ipData = await getIpData();
//       Get.put(AuthController(), permanent: true);
//       navigateToNext();
//     } catch (error) {
//       showError(error.toString());
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   Future<IPData> getIpData() async {
//     try {
//       final res = await NetworkClient.get('http://ip-api.com/json',
//           isTokenRequired: false);
//       return IPData.fromJson(res.data);
//     } on DioException catch (e) {
//       throw Common.getErrorMsgOfDio(e);
//     } catch (e) {
//       throw e.toString();
//     }
//   }

//   void navigateToNext() {
//     // Redirect to the appropriate page
//     Get.offAll(() => const LandingView());
//   }

//   void showError(String message) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text('Error'.tr),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               initializeSplash(); // Retry on error
//             },
//             child: Text('Retry'.tr),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: Center(
//         child: isLoading
//             ? CircularProgressIndicator()
//             : Text(
//                 'Loading...'.tr,
//                 style: Get.textTheme.headlineMedium,
//               ),
//       ),
//     );
//   }
// }
