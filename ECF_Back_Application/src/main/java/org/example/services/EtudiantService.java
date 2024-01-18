package org.example.services;

import org.example.entity.Etudiant;
import org.example.interfaces.Repository;

import java.util.List;

public class EtudiantService extends BaseService implements Repository<Etudiant> {

    public EtudiantService(){super();}

    @Override
    public boolean create(Etudiant o) {
        session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Etudiant o) {
        return false;
    }

    @Override
    public boolean delete(Etudiant o) {
        return false;
    }

    @Override
    public Etudiant findById(Long id) {
        Etudiant etudiant  = null;
        session = sessionFactory.openSession();
        etudiant = (Etudiant) session.get(Etudiant.class, id);
        session.close();
        return etudiant;
    }

    @Override
    public List<Etudiant> findAll() {
        return null;
    }
}
