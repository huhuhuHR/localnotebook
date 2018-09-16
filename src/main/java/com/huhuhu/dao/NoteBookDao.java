package com.huhuhu.dao;

import com.huhuhu.pojo.MyNoteBook;
import com.huhuhu.pojo.Notes;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface NoteBookDao {
    List<MyNoteBook> selectNoteBook(Map params);

    int countNotes(@Param("noteBookId") int noteBookId);

    List<Notes> selectNotes(Map<String, Object> params);

    int addNoteBook(Map params);

    int addNotes(Map params);

    Notes selectNoteText(@Param("noteId") int noteId);

    int deleteBook(@Param("noteBookId") int noteBookId);

    int deleteNoteAll(@Param("noteBookId") int noteBookId);

    int deleteNoteOne(@Param("noteId") int noteId);

    int updateNoteBook(Map params);

    int updateNote(Map params);

}
