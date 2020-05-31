library date_range;

class DateRange{
  final DateTime firstDateTime;
  final DateTime lastDateTime;
  const DateRange(this.firstDateTime, this.lastDateTime);

  DateRange update({final DateTime firstDateTime, final DateTime lastDateTime}) => DateRange(
    firstDateTime ?? this.firstDateTime,
    lastDateTime ?? this.lastDateTime,
  );

  static DateTime lastDateTimeByDay(final int year, final int month, final int day) => DateTime(year, month, day, 23, 59, 59, 999, 999);

  const DateRange._(this.firstDateTime, this.lastDateTime);

  DateRange.month(final DateTime inner) :
        firstDateTime = DateTime(inner.year, inner.month),
        lastDateTime = lastDateTimeByDay(inner.year, inner.month, daysInMonthOfDateTime(inner));

  //ToDo replace with switch. switch((month + 2) ~/ 3) for season, switch(month ~/3) for quarter
  // ignore: missing_return
  factory DateRange.season(final DateTime inner){ //ToDo untested
    final int month = inner.month;
    final int year = inner.year;
    //ToDo in reverse-order search, could simplify 3 out of 4 if clauses.
    if(month >= DateTime.december && month <= DateTime.february){
      final int lastMonth = DateTime.february;
      return DateRange._(
        DateTime(year, DateTime.december),
        lastDateTimeByDay(year, lastMonth, daysInMonthOfDateTime(DateTime(year,lastMonth))),
      );
    } else if(month >= DateTime.june && month <= DateTime.august){
      final int lastMonth = DateTime.august;
      return DateRange._(
        DateTime(year, DateTime.june),
        lastDateTimeByDay(year, lastMonth, daysInMonthOfDateTime(DateTime(year,lastMonth))),
      );
    } if(month >= DateTime.march && month <= DateTime.may){
      final int lastMonth = DateTime.may;
      return DateRange._(
        DateTime(year, DateTime.march),
        lastDateTimeByDay(year, lastMonth, daysInMonthOfDateTime(DateTime(year,lastMonth))),
      );
    } else {
      final int lastMonth = DateTime.november;
      return DateRange._(
        DateTime(year, DateTime.september),
        lastDateTimeByDay(year, lastMonth, daysInMonthOfDateTime(DateTime(year, lastMonth))),
      );
    }
  }

  int get days => daysInMonthOfDateTime(firstDateTime);

  // ignore: missing_return
  static int daysInMonthOfDateTime(final DateTime dateTime){
    switch(dateTime.month){
      case DateTime.january:
      case DateTime.march:
      case DateTime.may:
      case DateTime.july:
      case DateTime.august:
      case DateTime.october:
      case DateTime.december:
        return thirtyOneDays;
      case DateTime.april:
      case DateTime.june:
      case DateTime.september:
      case DateTime.november:
        return thirtyDays;
      case DateTime.february:
        if(dateTime.year%4 == 0){
          return twentyNineDays;
        } else {
          return twentyEightDays;
        }
    }
  }

  static const int thirtyOneDays = 31;
  static const int thirtyDays = 30;
  static const int twentyNineDays = 29;
  static const int twentyEightDays = 28;

  // ignore: missing_return
  String get month {
    final DateTime dateTime = firstDateTime.add(const Duration(days: 13));
    switch(dateTime.month){
      case DateTime.january:
        return "January";
      case DateTime.february:
        return "February";
      case DateTime.march:
        return "March";
      case DateTime.april:
        return "April";
      case DateTime.may:
        return "May";
      case DateTime.june:
        return "June";
      case DateTime.july:
        return "July";
      case DateTime.august:
        return "August";
      case DateTime.september:
        return "September";
      case DateTime.october:
        return "October";
      case DateTime.november:
        return "November";
      case DateTime.december:
        return "December";
    }
  }

  int get year => firstDateTime.add(const Duration(days: 13)).year;

  @override
  int get hashCode => firstDateTime.millisecondsSinceEpoch & lastDateTime.millisecondsSinceEpoch;

  @override
  bool operator ==(final dynamic other) {
    if(other.runtimeType == DateRange){
      final DateRange otherAsDR = other as DateRange;
      return otherAsDR.firstDateTime == firstDateTime && otherAsDR.lastDateTime == lastDateTime;
    } else {
      return false;
    }
  }
}