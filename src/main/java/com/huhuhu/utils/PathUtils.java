package com.huhuhu.utils;

import com.huhuhu.ueditor.ConfigManager;
import org.junit.Test;

import java.io.File;

public class PathUtils {
    private String getRootPath() {
        String path = null;

        try {
            path = ConfigManager.class.getResource("/").toURI().getPath();
            path = path.substring(1, path.length() - 1);
            String str = "classes";
            int i = path.indexOf(str);
            if (i > 0) {
                path = path.substring(0, i);
            }
        } catch (Exception var4) {
            var4.printStackTrace();
        }

        return path;
    }

    private String getConfigPath() {
        StringBuffer strBuffer = new StringBuffer();
        strBuffer.append(this.getRootPath());
        strBuffer.append("springmvc");
        strBuffer.append(File.separator);
        strBuffer.append("ueditor");
        strBuffer.append(File.separator);
        strBuffer.append("jsp");
        strBuffer.append(File.separator);
        strBuffer.append("config.json");
        return strBuffer.toString();
    }

    @Test
    public void test() throws Exception {
        System.out.println(getRootPath());
        // Users/huorong/Documents/github/springmvc/src/main/webapp/WEB-INF/ueditor/jsp/config.json
        System.out.println(getConfigPath());
        // Users/huorong/Documents/github/springmvc/target/
        // Users/huorong/Documents/github/springmvc/target/springmvc/ueditor/jsp/config.json
        // Users/huorong/Documents/github/springmvc/target/springmvc/ueditor/jsp/config.json
        // Users/huorong/Documents/github/springmvc/target/springmvc/ueditor/jsp/config.json
        assert "Users/huorong/Documents/github/springmvc/target/springmvc/ueditor/jsp/config.json"
                .equals(getConfigPath());

    }
}
