package org.example.services;

import org.example.entity.Note;
import org.example.interfaces.Repository;

import java.util.List;

public class NoteService extends BaseService implements Repository<Note> {
    public NoteService(){super();}


    @Override
    public boolean create(Note o) {
        session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Note o) {
        return false;
    }

    @Override
    public boolean delete(Note o) {
        return false;
    }

    @Override
    public Note findById(Long id) {
        return null;
    }

    @Override
    public List<Note> findAll() {
        return null;
    }
}
