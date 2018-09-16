package com.huhuhu.service;

import com.huhuhu.dao.NoteBookDao;
import com.huhuhu.pojo.MyNoteBook;
import com.huhuhu.pojo.Notes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class NoteBookService {
    @Autowired
    NoteBookDao noteBookDao;

    public List<MyNoteBook> selectNoteBook(Map params) {
        List<MyNoteBook> list = noteBookDao.selectNoteBook(params);
        for (MyNoteBook myNoteBook : list) {
            int notesCount = noteBookDao.countNotes(myNoteBook.getNoteBookId());
            myNoteBook.setNotesCount(notesCount);
        }
        return list;
    }

    public List<Notes> selectNotes(Map<String, Object> params) {
        return noteBookDao.selectNotes(params);
    }

    public boolean addNoteBook(Map params) {
        return noteBookDao.addNoteBook(params) > 0;
    }

    public boolean addNotes(Map params) {
        return noteBookDao.addNotes(params) > 0;
    }

    public Notes selectNoteText(int noteId) {
        return noteBookDao.selectNoteText(noteId);
    }

    @Transactional
    public void deleteAllAboutOneBook(int noteBookId) {
        deleteBook(noteBookId);
        deleteNoteAll(noteBookId);
    }

    private void deleteBook(int noteBookId) {
        noteBookDao.deleteBook(noteBookId);
    }

    private void deleteNoteAll(int noteBookId) {
        noteBookDao.deleteNoteAll(noteBookId);
    }

    public boolean deleteNoteOne(int noteId) {
        return noteBookDao.deleteNoteOne(noteId) == 1;
    }

    public void updateNoteBook(Map params) {
        noteBookDao.updateNoteBook(params);
    }

    public boolean updateNote(Map params) {
        return noteBookDao.updateNote(params) == 1;
    }
}
