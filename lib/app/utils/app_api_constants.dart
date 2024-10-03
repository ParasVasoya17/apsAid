import 'dart:core';

import 'package:flutter/foundation.dart';

class AppApiConstants {
  static const String apiTypePost = "post";
  static const String apiTypeGet = "get";
  static const String apiTypePatch = "patch";
  static const String apiTypeDelete = "delete";
  static const String apiTypePut = "put";

  static const String baseUrl = "http://192.168.0.118:8080";

  static const String apiKey =
      "aeeef2d8185bb6be4324ed2e95c81b50b5c5531f7eb82765bd0d8d930aa46fbd1c1dc00c9a2c65ef4dc78cc2b3f5c943decdc125b361a79b64444d31889b23d0";
  static const String userPath = "/api/auth";
  static const String user = "/api/user";

  static const String sendSignUpOtp = "$userPath/send-signup-opt";
  static const String signUp = "$userPath/signup";
  static const String login = "$userPath/login";
  static const String sendForgetPasswordOtp = "$userPath/send-change-password-opt";
  static const String changePassword = "$userPath/change-password";
  static const String verifyChangePasswordOtp = "$userPath/verify-change-password-opt";
  static const String sendEmailChangeOtp = "$userPath/send-change-email-opt";
  static const String verifyEmailChangeOtp = "$userPath/verify-change-email-opt";
  static const String logOut = "$userPath/logout";
  static const String delete = "$userPath/api/user";
  static const String contactUs = "$user/contact-us";

  static const String currency = "/api/currency";
  static const String bankApi = "/api/bank";
  static const String company = "/api/company";
  static const String customer = "/api/customer";
  static const String product = "/api/product";
  static const String invoice = "/api/invoice";
  static const String reminder = "/api/reminder";
  static const String quotation = "/api/quotation";
  static const String convert = "$quotation/convert";
  static const String invoiceTabular = "$invoice/tabular";
  static const String quotationTabular = "$quotation/tabular";

  static const String aboutUs = "https://lakhanitechnologies.com/about-us/";
  static const String termsConditions = "https://lakhanitechnologies.com/privacy-policy/";
  static const String privacyPolicy = "https://lakhanitechnologies.com/privacy-policy/";

  static const String planName = "p";
  static const String validateReceiptIos = kDebugMode ? 'https://sandbox.itunes.apple.com/verifyReceipt' : 'https://buy.itunes.apple.com/verifyReceipt';

// static const String validateReceiptIos = 'https://sandbox.itunes.apple.com/verifyReceipt';
}
