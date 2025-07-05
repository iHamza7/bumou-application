// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/privacy/widgets/bold_text.dart';
import 'package:app/privacy/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Privacy Policy for Bumou (咘呣) App".tr,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              NormalText(
                  text:
                      'Effective date: April, 1 2024 - Last updated: Nov, 28 2024'
                          .tr),

              /// 1
              BoldText(
                text: "Introduction".tr,
              ),
              SizedBox(height: 8),
              NormalText(
                text:
                    "Welcome to the Bumou (咘呣) App. We commit to protecting the privacy of our users, which includes students, teachers, and adults. Our Privacy Policy describes how we collect, use, store, and protect the personal information of our users."
                        .tr,
              ),

              /// 2
              BoldText(text: "Developer and Company Information".tr),
              SizedBox(height: 8),
              NormalText(text: "Name: Jing Yang".tr),
              NormalText(text: "Company: 上海旭修信息技术有限公司".tr),
              NormalText(text: "Email:  273219010@qq.com".tr),
              NormalText(text: "Phone: +8618201840625".tr),
              NormalText(
                  text:
                      "Address: 中国上海市奉贤区海湾镇五四公路4399号37幢1479室, Postal Code: 221100"
                          .tr),
              //// 3
              BoldText(text: "Information Collection and Usage".tr),
              SizedBox(height: 8),
              NormalText(
                  text: 'We collect the following types of information:'.tr),
              NormalText(
                  text:
                      'Identification Data: Full name, email address, username, date of birth.'
                          .tr),
              NormalText(text: 'Contact Data: Phone number.'.tr),
              NormalText(
                  text: 'Content Data: Images, videos, and audio content.'.tr),
              NormalText(text: 'Device Data: IP address, DeviceID.'.tr),
              NormalText(
                  text:
                      'Usage Data: App interaction data, mood tracking entries.'
                          .tr),
              NormalText(
                  text: "Each piece of data is actively provided by users.".tr),
              NormalText(
                  text:
                      'We do not collect any information automatically without user consent.'
                          .tr),
              ///// 4
              BoldText(text: 'Purpose of Data Processing'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'The data we collect is used for the following purposes:'
                          .tr),
              NormalText(text: 'To create and manage user accounts'.tr),
              NormalText(
                  text:
                      'To facilitate social connections and communication.'.tr),
              NormalText(text: 'To enable mood tracking functionalities'.tr),
              NormalText(text: 'To operate the emergency help feature'.tr),
              ///// 5
              BoldText(text: 'Data Sharing and Disclosure'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'Personal information is not shared with third parties, nor is it used for marketing.'
                          .tr),
              NormalText(
                  text:
                      'We store all data within AWS China, in compliance with Chinese data protection laws.'
                          .tr),
              NormalText(
                  text:
                      'Disclosure only occurs when required by Chinese law, under legal processes, or government requests.'
                          .tr),
              //// 6
              BoldText(text: 'User Consent and Rights'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'By creating an account or using Bumou (咘呣), you consent to this Privacy Policy.'
                          .tr),
              NormalText(text: 'Users have the right to:'.tr),
              NormalText(text: 'Access their personal information.'.tr),
              NormalText(text: 'Update or correct their information.'.tr),
              NormalText(text: 'Request deletion of their data or account.'.tr),
              ///// 7
              BoldText(text: 'Data Security'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'We adopt industry-standard security measures to protect personal information against unauthorized access, alteration, disclosure, or destruction.'
                          .tr),
              NormalText(
                  text:
                      'Despite our efforts, no security measures are entirely impenetrable.'
                          .tr),
              BoldText(
                  text: 'Third-party SDKs and there proposes / 第三方SDK及其用途'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'We integrate third-party SDKs to enhance the functionality of our app. Below is a list of SDKs we use, the data they collect, and their purposes:'
                          .tr),

              NormalText(text: '1. Alibaba Cloud Push (com.aliyun)'.tr),
              NormalText(text: '2. OPPO Push (com.heytap.msp)'.tr),
              NormalText(text: '3. Xiaomi Push (com.xiaomi.push)'.tr),
              ////// 8
              BoldText(text: 'Data Collection'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'Device information, unique identifiers, network information.'
                          .tr),
              BoldText(text: 'Purpose:'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'To enable push notifications and message delivery.'.tr),
              NormalText(
                  text:
                      'To provide notification services for OPPO devices.'.tr),
              NormalText(
                  text:
                      'To enable notification services for Xiaomi devices.'.tr),
              NormalText(
                  text:
                      'We ensure that all SDKs comply with applicable privacy laws. For more information, please refer to their respective privacy policies'
                          .tr),

              ////// 9
              BoldText(text: 'Data Storage and Transfer'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'Data resides exclusively within secure servers of AWS China, with no international transfer.'
                          .tr),
              NormalText(
                  text:
                      "This complies with regulations regarding data sovereignty within the People's Republic of China."
                          .tr),
              //// 10
              BoldText(text: 'Children’s Privacy'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'We recognize the importance of protecting childrens personal information.'
                          .tr),
              NormalText(text: 'The app requires:'.tr),
              NormalText(
                  text:
                      'Users to input their date of birth upon registration for age verification.'
                          .tr),
              NormalText(
                  text: 'Parental consent for users under the age of 14.'.tr),
              ////// 11
              BoldText(text: 'Updates to This Policy'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'We reserve the right to modify this Privacy Policy at any time.'
                          .tr),
              NormalText(
                  text:
                      'Any changes will be communicated to users via in-app notifications, phone, or email.'
                          .tr),
              NormalText(
                  text:
                      'Users will be required to give new consent for additional data processing activities not covered by the previous policy.'
                          .tr),
              ///// 12
              BoldText(text: 'Contact Us'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'For further questions regarding this Privacy Policy, please contact us using the information provided above.'
                          .tr),
              ///// 13
              BoldText(text: 'Self-starting and Related Launches'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'To ensure that Bumou (咘呣) can receive broadcast messages such as push notifications when the app is closed or running in the background, we utilize self-start capabilities.'
                          .tr),
              NormalText(
                  text:
                      'This may involve the app waking up periodically through system broadcasts to enable the receipt of push notifications or to restore a previous state.'
                          .tr),
              NormalText(
                  text:
                      "These actions are strictly necessary to render the app's functionalities and services effectively."
                          .tr),
              NormalText(
                  text:
                      'If you open a content-based push notification, with your explicit consent, the app will redirect you to the related content.'
                          .tr),
              NormalText(
                  text:
                      'Without your consent, the app will not initiate any related launch.'
                          .tr),
              ////// 14
              BoldText(text: 'Push Notifications'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'Push notifications are used to improve your experience with Bumou (咘呣) by keeping you informed about chat messages and help requests, even when the app is not actively in use.'
                          .tr),
              NormalText(
                  text:
                      'To receive these notifications, our app may require to self-start or be woken by a system broadcast designed for this purpose.'
                          .tr),
              NormalText(
                  text:
                      "Your consent will be sought before enabling push notifications and can be configured via the app settings or your device's notification settings."
                          .tr),
              ////// 15
              BoldText(text: 'Download Management'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      'In-app downloads, such as update packages, are managed carefully.'
                          .tr),
              NormalText(
                  text:
                      'Our app processes the HTTP connection, monitors changes in status during downloads, and handles system restart scenarios to ensure downloads are completed.'
                          .tr),
              NormalText(
                  text:
                      "This may entail the app's background processes self-starting to continue downloads while you are using other apps or after the device restarts."
                          .tr),
              NormalText(
                  text:
                      'When a download is completed, our app aids in acquiring the APK file for installation.'
                          .tr),
              ////// 16
              BoldText(text: 'Widgets'.tr),
              SizedBox(height: 8),
              NormalText(
                  text:
                      "For users who take advantage of Bumou (咘呣)'s desktop widget features, our app needs to listen for system broadcasts (android.appwidget.action.APPWIDGET_UPDATE) to refresh the widget's content."
                          .tr),
              NormalText(
                  text:
                      "This system broadcast dictates whether an update is necessary; our app's self-start capabilities may be used to wake up the necessary services to update the widget data."
                          .tr),
            ]),
          ),
        ),
      ),
    );
  }
}
