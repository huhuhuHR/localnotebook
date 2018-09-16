package com.huhuhu.controller;

import com.huhuhu.pojo.MyNoteBook;
import com.huhuhu.pojo.Notes;
import com.huhuhu.pojo.Result;
import com.huhuhu.service.NoteBookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/v1")
public class NoteBookController {
    @Autowired
    NoteBookService service;
    private static final Logger LOGGER = LoggerFactory.getLogger(NoteBookController.class);

    /**
     * 笔记本列表
     * 
     * @param model
     * @param params
     * @return
     */
    @RequestMapping(value = "/initNoteBookList")
    public String v2initNoteBookList(Model model, @RequestParam Map<String, Object> params) {
        List<MyNoteBook> noteBooks = service.selectNoteBook(params);
        model.addAttribute("books", noteBooks);
        return "books";
    }

    /**
     * 笔记列表
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/initNotes")
    public String v2initNotes(Model model, @RequestParam Map<String, Object> params) {
        List<Notes> notes = service.selectNotes(params);
        if (notes != null && notes.size() > 0) {
            Notes note = notes.get(0);
            Notes oneNote = service.selectNoteText(note.getNoteId());
            String value = "<div class=\"title\">\n" + "<div class=\"createTime\">" + oneNote.getCreateTime()
                    + "</div>\n" + "<div class=\"updateTime\">" + oneNote.getUpdateTime() + "</div>\n" + "</div>\n"
                    + "<div class=\"text\">\n" + "<div class=\"note-name\">\n" + oneNote.getNoteName() + "</div>\n"
                    + "<div class=\"note-text\">\n" + oneNote.getNoteText() + "</div>\n" + "</div>";
            oneNote.setNoteText(value);
            model.addAttribute("oneNote", oneNote);
        }
        model.addAttribute("notes", notes);
        model.addAttribute("bookId", params.get("noteBookId"));
        return "notes";
    }

    @RequestMapping(value = "/editNote")
    public String v2editNote(Model model, Notes notes) {
        model.addAttribute("bookId", notes.getNoteBookId());
        model.addAttribute("note", service.selectNoteText(notes.getNoteId()));
        return "editNote";
    }

    @ResponseBody
    @RequestMapping(value = "/addNoteBook", method = RequestMethod.POST)
    public Result addNoteBook(@RequestParam Map params) {
        Result result = new Result();
        try {
            if (service.addNoteBook(params)) {
                result.setCode("1");
                result.setMsg("新增成功");
                return result;
            }
        } catch (Exception e) {
            LOGGER.error("NoteBookController.addNoteBook catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("新增失败");
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/addNote", method = RequestMethod.POST)
    public Result addNote(@RequestParam Map params) {
        Result result = new Result();
        if (StringUtils.isEmpty(params.get("noteId"))) {
            return toAddNote(params, result);
        } else {
            return toEditNote(params, result);
        }
    }

    private Result toEditNote(@RequestParam Map params, Result result) {
        try {
            if (service.updateNote(params)) {
                result.setCode("1");
                result.setMsg("编辑成功");
                result.setData(params.get("noteBookId"));
                return result;
            }
        } catch (Exception e) {
            LOGGER.error("NoteBookController.addNote catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("编辑失败");
        return result;
    }

    private Result toAddNote(@RequestParam Map params, Result result) {
        try {
            if (service.addNotes(params)) {
                result.setCode("1");
                result.setMsg("新增笔记成功");
                result.setData(params.get("noteBookId"));
                return result;
            }
        } catch (Exception e) {
            LOGGER.error("NoteBookController.addNote catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("新增笔记失败");
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/updateNoteBook", method = RequestMethod.POST)
    public Result updateNoteBook(@RequestParam Map params) {
        Result result = new Result();
        try {
            service.updateNoteBook(params);
            result.setCode("1");
            result.setMsg("修改成功");
            return result;
        } catch (Exception e) {
            LOGGER.error("NoteBookController.updateNoteBook catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("修改失败");
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteBook", method = RequestMethod.POST)
    public Result deleteBook(int noteBookId) {
        Result result = new Result();
        try {
            service.deleteAllAboutOneBook(noteBookId);
            result.setCode("1");
            result.setMsg("删除成功");
            return result;
        } catch (Exception e) {
            LOGGER.error("NoteBookController.deleteBook catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("删除失败");
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteNote", method = RequestMethod.POST)
    public Result deleteNote(int noteId) {
        Result result = new Result();
        try {
            if (service.deleteNoteOne(noteId)) {
                result.setCode("1");
                result.setMsg("删除成功");
                return result;
            }
        } catch (Exception e) {
            LOGGER.error("NoteBookController.deleteBook catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("删除失败");
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/swithNoteId", method = RequestMethod.POST)
    public Result swithNoteId(int noteId) {
        Result result = new Result();

        try {
            Notes note = service.selectNoteText(noteId);
            result.setCode("1");
            result.setMsg("成功");
            String value = "<div class=\"title\">\n" + "<div class=\"createTime\">" + note.getCreateTime() + "</div>\n"
                    + "<div class=\"updateTime\">" + note.getUpdateTime() + "</div>\n" + "</div>\n"
                    + "<div class=\"text\">\n" + "<div class=\"note-name\">\n" + note.getNoteName() + "</div>\n"
                    + "<div class=\"note-text\">\n" + note.getNoteText() + "</div>\n" + "</div>";
            result.setData(value);
            return result;

        } catch (Exception e) {
            LOGGER.error("NoteBookController.swithNoteId catch a exception,", e);
        }
        result.setCode("0");
        result.setMsg("失败");
        return result;
    }
}
