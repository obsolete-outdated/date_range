library date_range;

class DateRange{
  final DateTime firstDateTime;
  final DateTime lastDateTime;
  const DateRange(this.firstDateTime, this.lastDateTime);

  DateRange update({final DateTime firstDateTime, final DateTime lastDateTime}) => DateRange(
    firstDateTime ?? this.firstDateTime,
    lastDateTime ?? this.lastDateTime,
  );

  DateRange.month(final DateTime inner) :
        firstDateTime = DateTime(inner.year, inner.month),
        lastDateTime = DateTime(inner.year, inner.month, daysInMonthOfDateTime(inner), 23, 59, 59, 999, 999);

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
      case DateTime.november :
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
}