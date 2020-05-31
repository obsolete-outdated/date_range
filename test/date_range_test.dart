import 'package:test/test.dart';
import 'package:date_range/date_range.dart';

int daysInMonth(final int month){
  switch(month){
    case DateTime.january:
    case DateTime.march:
    case DateTime.may:
    case DateTime.july:
    case DateTime.august:
    case DateTime.october:
    case DateTime.december:
      return 1;
    case DateTime.april:
    case DateTime.june:
    case DateTime.september:
    case DateTime.november:
      return 2;
    case DateTime.february:
      return 4;
  }
}

void main() {
  test("equality operator", (){
    final DateTime dateTime = DateTime.now();
    final DateRange dateRange1 = DateRange.month(dateTime);
    final DateRange dateRange2 = DateRange.month(dateTime);
    final Map<DateRange, String> map = {
      dateRange1: "abc",
    };
    expect(true, equals(map.containsKey(dateRange2)));
  });
  test("april days count", (){ //april. 30 days.
    final DateTime dateTime = DateTime.utc(2019, DateTime.april, 4, 4, 4, 4, 4, 4);
    final DateRange dateRange = DateRange.month(dateTime);
    expect(dateRange.days, equals(30));
  });
  test("february days count", (){ //april. 30 days.
    final DateTime dateTime1 = DateTime.utc(2020, DateTime.february, 4, 4, 4, 4, 4, 4);
    final DateTime dateTime2 = DateTime.utc(2021, DateTime.february, 4, 4, 4, 4, 4, 4);
    final DateRange dateRange1 = DateRange.month(dateTime1);
    final DateRange dateRange2 = DateRange.month(dateTime2);
    expect(dateRange1.days, equals(29));
    expect(dateRange2.days, equals(28));
  });
}
