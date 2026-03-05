import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest {
  final Dio dio = Dio();

  DioRequest() {
    dio.options.baseUrl = GlobalConstants.baseUrl;
    dio.options.connectTimeout = Duration(seconds: GlobalConstants.timeout);
    dio.options.receiveTimeout = Duration(seconds: GlobalConstants.timeout);
    // 修复1：移除全局sendTimeout配置（Web下GET请求无body会报错）
    // dio.options.sendTimeout = Duration(seconds: GlobalConstants.timeout);
    _addInterceptors();
  }

  // 拦截器
  void _addInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        // 请求拦截器
        onRequest: (options, handler) {
          // 可选优化：如果是有请求体的请求（POST/PUT等），动态添加sendTimeout
          if (options.method != 'GET' && options.sendTimeout == null) {
            options.sendTimeout = Duration(seconds: GlobalConstants.timeout);
          }
          handler.next(options);
        },
        // 响应拦截器
        onResponse: (response, handler) {
          // 修复2：移除非空断言，增加空值判断，避免空指针
          final statusCode = response.statusCode;
          if (statusCode != null && statusCode >= 200 && statusCode < 300) {
            handler.next(response);
            return;
          }
          handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              message: '响应状态码异常: $statusCode',
            ),
          );
        },
        // 错误拦截器
        onError: (e, handler) {
          // 修复3：保留原始异常信息，便于排查
          print('请求错误详情: ${e.message}');
          handler.reject(e);
        },
      ),
    );
  }

  // GET请求（无body，不使用sendTimeout）
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _handleResponse(
      dio.get(url, queryParameters: queryParameters),
    );
  }

  // 可选：添加POST请求方法（有body，可使用sendTimeout）
  Future<dynamic> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _handleResponse(
      dio.post(url, data: data, queryParameters: queryParameters),
    );
  }

  // 处理响应
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> response = await task;
      final data = response.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.successCode) {
        return data['result'];
      }
      throw Exception(data['msg'] ?? '加载异常');
    } catch (e) {
      // 修复4：打印原始异常，方便定位问题
      print('响应处理错误: $e');
      throw Exception(e);
    }
  }
}

// 单例对象
final dioRequest = DioRequest();
