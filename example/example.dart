import 'package:date_range/date_range.dart';

void main(){
  final DateTime dateTime = DateTime.now();
  final DateRange dateRange = monthDateRange(dateTime);
  /*
  final List<data> data = db.query(lt: dateRange.lastDateTime, gt: dateRange.firstDateTime)
   */
}