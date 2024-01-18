package org.example.services;

import org.example.entity.Departement;
import org.example.entity.Etudiant;
import org.example.interfaces.Repository;

import java.util.List;

public class DepartementService extends BaseService implements Repository<Departement> {

    public DepartementService(){super();}

    @Override
    public boolean create(Departement o) {
        session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Departement o) {
        return false;
    }

    @Override
    public boolean delete(Departement o) {
        return false;
    }

    @Override
    public Departement findById(Long id) {
        Departement departement   = null;
        session = sessionFactory.openSession();
        departement = (Departement) session.get(Departement.class, id);
        session.close();
        return departement;
    }

    @Override
    public List<Departement> findAll() {
        return null;
    }

    public void begin(){
        session = sessionFactory.openSession();
    }


    public void end(){

        //  session.close();
        sessionFactory.close();
    }
}
