library;

import 'package:cherrilog/logger/logger.dart';
import 'package:cherrilog/model/options.dart';
import 'package:cherrilog/model/message.dart';

export 'package:cherrilog/cherrilog.dart';
export 'package:cherrilog/wrapper.dart';
export 'package:cherrilog/formatter/timestamp.dart';
export 'package:cherrilog/logger/logger.dart';
export 'package:cherrilog/logger/loggers/logger_console.dart';
export 'package:cherrilog/logger/loggers/logger_file.dart';
export 'package:cherrilog/level/log_level.dart';
export 'package:cherrilog/level/log_level_ranges.dart';
export 'package:cherrilog/model/options.dart';

class CherriLog {
  static CherriLog? instance;

  static CherriLog init( ) {
    instance = CherriLog();

    return instance!;
  }

  List<CherriLogger> loggers = List.empty(growable: true);

  CherriLog logTo(CherriLogger logger, {CherriOptions? options}) {
    loggers.add(logger..withOptions(options ?? CherriOptions()));
    return this;
  }

  void log(CherriMessage message) {
    loggers.forEach((logger) {
      logger.log(message);
    });

    // TODO: Implement flush interval
  }
}

extension CherriLogExtensions on CherriLog {}
