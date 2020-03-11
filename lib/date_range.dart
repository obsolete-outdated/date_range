library date_range;

class DateRange{
  final DateTime firstDateTime;
  final DateTime lastDateTime;
  const DateRange(this.firstDateTime, this.lastDateTime);

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

DateTime _lastMonthDateTime(final DateTime firstDateTime){
  switch(firstDateTime.month){
    case DateTime.december:
      return DateTime(firstDateTime.year+1, DateTime.january);
    default:
      return DateTime(firstDateTime.year, firstDateTime.month+1);
  }
}

DateRange monthDateRange(final DateTime dateTime){
  final DateTime firstDateTime = DateTime(dateTime.year, dateTime.month);
  return DateRange(
    firstDateTime,
    _lastMonthDateTime(firstDateTime),
  );
}