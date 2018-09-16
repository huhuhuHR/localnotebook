package com.huhuhu.pojo;
//create table hr_note_notes

//        (
//        note_id bigint auto_increment comment '笔记id'
//        primary key,
//        note_book_id bigint not null comment '笔记本id',
//        note_name varchar(50) not null comment '笔记名称',
//        note_text text not null comment '笔记内容',
//        create_time timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
//        update_time timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
//        remove char default '0' not null comment '0 未删除 1 删除'
//        )
//        comment '笔记' engine=InnoDB;

import com.huhuhu.utils.DateUtils;

public class Notes {
    private int noteId;
    private int noteBookId;
    private String noteName;
    private String noteText;
    private String createTime;
    private String updateTime;
    private String remove;

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public int getNoteBookId() {
        return noteBookId;
    }

    public void setNoteBookId(int noteBookId) {
        this.noteBookId = noteBookId;
    }

    public String getNoteName() {
        return noteName;
    }

    public void setNoteName(String noteName) {
        this.noteName = noteName;
    }

    public String getNoteText() {
        return noteText;
    }

    public void setNoteText(String noteText) {
        this.noteText = noteText;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = DateUtils.dataFormate(createTime);
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = DateUtils.dataFormate(updateTime);
    }

    public String getRemove() {
        return remove;
    }

    public void setRemove(String remove) {
        this.remove = remove;
    }
}
