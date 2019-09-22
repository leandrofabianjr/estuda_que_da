import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime date) {
    return DateFormat("H'h' m'm' s's'").format(date);
  }

  static String formatDuration(Duration duration) {
    return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}s';
  }
}