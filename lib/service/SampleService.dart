import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:allcareapp/model/AllServiceListResponseModel.dart';
import 'package:flavor_config/flavor_config.dart';
import 'package:http/http.dart' as http;
import 'package:allcareapp/model/TransDetailModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SampleService {
  Future<List<AllService>> getBookingService(transDetailMessage transBody) async {

    try {
      final http.Response response = await http.get(
        Uri.parse('${FlavorConfig.getValue('commonFlavorBaseUrl')}/all-service-list'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'x-api-key': FlavorConfig.getValue('commonFlavorApiKey')
        },
      );

      String res = utf8.decode(response.bodyBytes);
      if (response.statusCode == 200) {
        Map map = json.decode(res);
        AllServiceListResponseModel msg = AllServiceListResponseModel.fromJson(map);
        return msg.result;
      }
    } on SocketException catch (_) {
      throw Exception("networkErrorStatusCode");
    } on TypeError catch (_) {
      throw Exception("typeErrorStatusCode");
    } on TimeoutException catch (_) {
      throw Exception("timeoutStatusCode");
    } on FormatException catch (_) {
      throw Exception("badGatewayStatusCode");
    } catch (_) {
      throw Exception('${_.message}');
    }
  }

  Future<TransDetailResult> getOrderDetail(String orderId,
      String storeId,) async {
    final storage = new FlutterSecureStorage();
    // await AuthService.refreshToken(storage);
    await storage.write(key: "accessToken", value: "AAA");
    try {
      String accessToken = await storage.read(key: "accessToken");
      String bearerAuth = 'Bearer $accessToken';

      final http.Response response = await http.get(
        Uri.parse(
            '${FlavorConfig.getValue('commonFlavorBaseUrl')}/part/detail?storeId=$storeId&orderId=$orderId'),
        headers: <String, String>{
          'authorization': bearerAuth,
          'x-api-version': FlavorConfig.getValue('commonFlavorOrderApiVersion')
        },
      );

      if (response.statusCode == 200) {
        Map map = json.decode(response.body);
        transDetailMessage msg = transDetailMessage.fromJson(map);
        return msg.result;
      }
    } on SocketException catch (_) {
      throw Exception("networkErrorStatusCode");
    } on TypeError catch (_) {
      throw Exception("typeErrorStatusCode");
    } on TimeoutException catch (_) {
      throw Exception("timeoutStatusCode");
    } on FormatException catch (_) {
      throw Exception("badGatewayStatusCode");
    } catch (_) {
      throw Exception('${_.message}');
    }
  }
}