package edu.itis.webapp.mvc.validator;

public class IsNumberUtil {

    public static boolean isNumber(Object o) {
        return o instanceof Integer;
    }
}
