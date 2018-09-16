package com.huhuhu.utils;

public class ThreadLocalUtils {
    private static final ThreadLocal threadLocal = new ThreadLocal();

    public static void set(Object value) {
        threadLocal.set(value);
    }

    public static Object get() {
        return threadLocal.get();
    }

    public static void clean() {
        threadLocal.remove();
    }
}
