import 'package:logger/logger.dart';

class LogService{


  static Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(),
  );

  static e(String message){
    _logger.e(message);
  }
  static d(String message){
    _logger.d(message);
  }

  static i(String message){
    _logger.i(message);
  }

  static w(String message){
    _logger.w(message);
  }

  static v(String message){
    _logger.v(message);
  }

}