import 'package:test/test.dart';
import 'package:date_range/date_range.dart';

void main() {
  test("4", (){ //april. 30 days.
    final DateTime dateTime = DateTime.utc(2019, 4, 4, 4, 4, 4, 4, 4);
    final DateRange dateRange = monthDateRange(dateTime);
    expect(dateRange.lastDateTime.difference(dateRange.firstDateTime).inDays, equals(30));
  });
  test("5", (){ //may. 31 days.
    final DateTime dateTime = DateTime.utc(2019, 5, 4, 4, 4, 4, 4, 4);
    final DateRange dateRange = monthDateRange(dateTime);
    expect(dateRange.lastDateTime.difference(dateRange.firstDateTime).inDays, equals(31));
  });
  test("12", (){ //december. 31 days. month int jumps from 12 to 1
    final DateTime dateTime = DateTime.utc(2019, 12, 4, 4, 4, 4, 4, 4);
    final DateRange dateRange = monthDateRange(dateTime);
    expect(dateRange.lastDateTime.difference(dateRange.firstDateTime).inDays, equals(31));
    expect(dateRange.firstDateTime.month, equals(DateTime.december));
    expect(dateRange.lastDateTime.month, equals(DateTime.january));
    expect(dateRange.firstDateTime.day, equals(1));
    expect(dateRange.lastDateTime.day, equals(1));
  });
}
