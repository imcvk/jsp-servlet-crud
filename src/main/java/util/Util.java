package util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class Util {

    public static String formatDateTo_dd_MM_yyyy(java.util.Date date) {
        String dateToBeFormatted = date.toString();
        DateFormat formatter = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");
        DateFormat formatTo = new SimpleDateFormat("MM-dd-YYYY");
        java.util.Date date1 = null;
        try {
            date1 = (java.util.Date) formatter.parse(dateToBeFormatted);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String finalDate = formatTo.format(date1);
        return finalDate;
    }

}
