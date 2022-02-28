import 'package:dio/dio.dart';
import '../models/models.dart' as models;
import '../utils/utils.dart' as utils;

class MellopadRepository {
  final Dio _dio;

  MellopadRepository()
      : _dio = Dio(
          BaseOptions(
            baseUrl: utils.baseUrl,
          ),
        );

  Future<models.Mellopad> getMellopadData() async {
    Response<Map<String, dynamic>> response = await _dio.get(
      utils.path,
    );
    return models.Mellopad.fromJson(json: response.data!);
  }
}
