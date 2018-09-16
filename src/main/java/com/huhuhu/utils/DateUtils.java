package com.huhuhu.utils;

import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    private static final org.slf4j.Logger LOGGER = LoggerFactory.getLogger(DateUtils.class);

    public static String dataFormate(String date) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            formatter.setLenient(false);
            Date newDate = formatter.parse(date);
            formatter = new SimpleDateFormat("yyyy年MM月dd日");
            date = formatter.format(newDate);
        } catch (ParseException e) {
            LOGGER.error("DateUtils catch a exception,", e);
        }
        return date;
    }

    public static void main(String[] args) {
        System.out.println(dataFormate("2018-05-05 15:01:21.0"));
    }
}
