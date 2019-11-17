library date_range;

class DateRange{
  final DateTime firstDateTime;
  final DateTime lastDateTime;
  const DateRange(this.firstDateTime, this.lastDateTime);
}

DateTime _lastMonthDateTime(final DateTime firstDateTime){
  switch(firstDateTime.month){
    case DateTime.december:
      return DateTime(firstDateTime.year+1, 1);
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