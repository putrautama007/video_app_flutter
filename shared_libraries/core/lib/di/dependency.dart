import 'package:common/utils/constant/api_constant.dart';
import 'package:core/network/dio_handler.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:core/method_channel/flutter_method_channel.dart';

class RegisterCoreModule {
  RegisterCoreModule() {
    _registerCore();
  }

  void _registerCore() {
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(() => DioHandler(
          apiBaseUrl: ApiConstant.baseUrl,
        ));
    sl.registerLazySingleton<FlutterMethodChannel>(
      () => FlutterMethodChannelImpl(),
    );
  }
}
