import 'package:cherrilog/cherrilog.dart';

void main() {
  CherriLog.init().logTo(CherriConsole(), options: CherriOptions()
    ..logLevelRange = CherriLogLevelRanges.all
    ..useBuffer = false,); // Use `CherriFile()` instead of `CherriConsole` if you want to log to file system

  debug('You are doing something right');

  info('You are doing something');

  warning('You are doing something wrong');

  error('You can not shutdown power');

  fatal('The power is off');
}
