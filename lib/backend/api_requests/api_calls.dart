import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AuthenticationCall {
  static Future<ApiCallResponse> call({
    String? password = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Authentication',
      apiUrl: 'https://api.claijon.com/login',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.authToken''',
      ));
  static String? tokentype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.tokenType''',
      ));
  static String? accesstoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.accessToken''',
      ));
  static int? expiretime(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiresIn''',
      ));
  static String? refreshtoken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.refreshToken''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
