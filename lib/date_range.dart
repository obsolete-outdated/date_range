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

//The following is an obsolete code from an app removed from Play Store

/*
const String string_JAN = "January";
const String string_FEB = "February";
const String string_MAR = "March";
const String string_APR = "April";
const String string_MAY = "May";
const String string_JUN = "June";
const String string_JUL = "July";
const String string_AUG = "August";
const String string_SEP = "September";
const String string_OCT = "October";
const String string_NOV = "November";
const String string_DEC = "December";

const String string_WIN = "Winter";
const String string_SPR = "Spring";
const String string_SUM = "Summer";
const String string_AUT = "Autumn";


const String string_Q1 = "Q1";
const String string_Q2 = "Q2";
const String string_Q3 = "Q3";
const String string_Q4 = "Q4";

DateRange getDateRange(DateTime timeInRange, {Account account}){
  DateTime firstDate; DateTime secondDate; String name;
  switch((account??currentDataPickNotifier.value.account).seasoningType){

    case Account.type_MONTHLY:
      if(timeInRange.month==12){
        firstDate = DateTime.utc(timeInRange.year, 12);
        secondDate = DateTime.utc(timeInRange.year+1, 1);
      } else {
        firstDate = DateTime.utc(timeInRange.year, timeInRange.month);
        secondDate = DateTime.utc(timeInRange.year, timeInRange.month+1);
      }
      switch(timeInRange.month){
        case 1: name=string_JAN; break;
        case 2: name=string_FEB; break;
        case 3: name=string_MAR; break;
        case 4: name=string_APR; break;
        case 5: name=string_MAY; break;
        case 6: name=string_JUN; break;
        case 7: name=string_JUL; break;
        case 8: name=string_AUG; break;
        case 9: name=string_SEP; break;
        case 10: name=string_OCT; break;
        case 11: name=string_NOV; break;
        case 12: name=string_DEC; break;
      }
      break;

    case Account.type_SEASONALLY:
      if(timeInRange.month==12 || timeInRange.month<=2){
        firstDate = DateTime.utc(timeInRange.year-1, 12);
        secondDate = DateTime.utc(timeInRange.year, 3);
        name=string_WIN;
      } else if (timeInRange.month<=5){
        firstDate = DateTime.utc(timeInRange.year, 3);
        secondDate = DateTime.utc(timeInRange.year, 6);
        name=string_SPR;
      } else if (timeInRange.month<=8){
        firstDate = DateTime.utc(timeInRange.year, 6);
        secondDate = DateTime.utc(timeInRange.year, 9);
        name=string_SUM;
      } else if (timeInRange.month<=11){
        firstDate = DateTime.utc(timeInRange.year, 9);
        secondDate = DateTime.utc(timeInRange.year, 12);
        name=string_AUT;
      }
      break;

    case Account.type_QUARTERLY:
      if(timeInRange.month>=10){
        firstDate = DateTime.utc(timeInRange.year, 10);
        secondDate = DateTime.utc(timeInRange.year+1, 1);
        name=string_Q4;
      } else if (timeInRange.month>=7){
        firstDate = DateTime.utc(timeInRange.year, 7);
        secondDate = DateTime.utc(timeInRange.year, 10);
        name=string_Q3;
      } else if (timeInRange.month>=4){
        firstDate = DateTime.utc(timeInRange.year, 4);
        secondDate = DateTime.utc(timeInRange.year, 7);
        name=string_Q2;
      } else if (timeInRange.month>=1){
        firstDate = DateTime.utc(timeInRange.year, 1);
        secondDate = DateTime.utc(timeInRange.year, 4);
        name=string_Q1;
      }
      break;
  }
  name+=" ${timeInRange.year}";
  return DateRange(firstDate: firstDate, secondDate: secondDate, name: name);
} */