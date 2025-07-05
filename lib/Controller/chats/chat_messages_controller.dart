import 'dart:convert';
import 'dart:developer';

import 'package:app/Constants/api.dart';
import 'package:app/Controller/chats/chat_controller.dart';
import 'package:app/Data/Network/request_client.dart';
import 'package:app/Model/chats/chat_message.dart';
import 'package:app/Utils/logging.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../Utils/comon.dart';

class ChatMessagesController extends GetxController {
  List<ChatMessage> allMessages = <ChatMessage>[].obs;
  String? errorMsg;
  bool isLoading = true;
  bool isLoadingMore = false;
  bool isLastData = false;
  int page = 0;
  int pageSize = 100;
  var selectionMode = false.obs;
  var selectedMessages = <String>[].obs;
  final Rx<ChatMessage?> replyMessage = Rx<ChatMessage?>(null);

  @override
  void onInit() {
    getMessages();
    super.onInit();
  }

  Future<void> getMessages() async {
    try {
      isLoading = true;
      update();
      final response = await NetworkClient.get(
          '${Apis.messages}/${Get.arguments}?page=$page&pageSize=$pageSize');
      Logger.message("Get Messages: ${response.statusCode}");
      if (response.statusCode == 200) {
        allMessages = (response.data as List)
            .map((e) => ChatMessage.fromJson(e))
            .toList();

        // Sort the messages by 'createdAt' in descending order
        allMessages.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      }
    } on DioException catch (e) {
      errorMsg = Common.getErrorMsgOfDio(e);
      Logger.error(errorMsg!);
    } catch (e) {
      errorMsg = e.toString();
      Logger.error("-get-messages- Error: $errorMsg");
    } finally {
      isLoading = false;
      update();
    }
  }

  void setReplyMessage(ChatMessage message) {
    replyMessage.value = message;
    update();
  }

  void clearReplyMessage() {
    replyMessage.value = null;
  }

  String getMessageContentById(String messageId) {
    log("Searching for message with ID: $messageId");
    final message = allMessages.firstWhereOrNull((msg) => msg.id == messageId);
    log("===========thisss ${message?.message}");
    return message?.message ?? "Message not found";
  }

// selection to delete multiple messages
  void toggleSelectionMode() {
    selectionMode.value = !selectionMode.value;
    if (!selectionMode.value) selectedMessages.clear();
  }

  void selectMessage(String messageId) {
    if (selectedMessages.contains(messageId)) {
      selectedMessages.remove(messageId);
    } else {
      selectedMessages.add(messageId);
    }
  }

  Future<void> deleteSelectedMessages() async {
    for (String messageId in selectedMessages) {
      await deleteMessage(messageId);
    }
    toggleSelectionMode(); // Exit selection mode after deletion
  }

  Future<void> deleteMessage(String messageId) async {
    try {
      final response =
          await NetworkClient.delete('${Apis.messages}/$messageId');
      Logger.message("Delete message: ${response.statusCode}");

      if (response.statusCode == 200) {
        allMessages.removeWhere((msg) => msg.id == messageId);
        update(); // Update the UI
      }
    } on DioException catch (e) {
      Logger.error("Delete message exception: ${Common.getErrorMsgOfDio(e)}");
    } catch (e) {
      Logger.error("-delete-message- Error: $e");
    }
  }

  Future<void> markAsRead({
    required String chatroomId,
    required String messageId,
  }) async {
    try {
      final response =
          await NetworkClient.put('${Apis.markRead}/$chatroomId/$messageId');
      Logger.message("Mark as read: ${response.statusCode}");
      Logger.message(jsonEncode(response.data));
      if (response.statusCode == 200) {
        ReadBy readBy = ReadBy.fromJson(response.data);
        for (var element in allMessages) {
          if (element.id == readBy.messageId) {
            element.readBy.add(readBy);
          }
        }

        final chatController = Get.find<ChatController>();

        for (var element in chatController.allChatroom) {
          if (element.id == chatroomId) {
            element.unreadCount = element.unreadCount! - 1;
          }
        }

        chatController.update();
        chatController.updateBadge();
        update();
      }
    } on DioException catch (e) {
      Logger.error("Mark as read exception: ${Common.getErrorMsgOfDio(e)}");
    } catch (e) {
      Logger.error("-mark-as-read- Error: $e");
    }
  }
}





  // _markAllMessagesAsRead() {
  //   try {
  //     for (int i = 0; i < allMessages.length; i++) {
  //       if (!allMessages[i]
  //           .readBy
  //           .map((e) => e.userId)
  //           .contains((Get.find<AuthController>().user!.id))) {
  //         markAsRead(chatroomId: Get.arguments, messageId: allMessages[i].id!);
  //       }
  //     }
  //   } catch (e) {
  //     // log("MARKING MESSAGES AS READ FAILED --> $e");
  //   }
  // }