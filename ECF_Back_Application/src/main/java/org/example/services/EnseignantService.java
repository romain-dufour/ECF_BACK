package org.example.services;

import org.example.entity.Enseignant;
import org.example.interfaces.Repository;

import java.util.List;

public class EnseignantService extends BaseService implements Repository<Enseignant> {

    public EnseignantService(){super();}

    @Override
    public boolean create(Enseignant o) {
        session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Enseignant o) {
        return false;
    }

    @Override
    public boolean delete(Enseignant o) {
        return false;
    }

    @Override
    public Enseignant findById(Long id) {
        return null;
    }

    @Override
    public List<Enseignant> findAll() {
        return null;
    }
}
