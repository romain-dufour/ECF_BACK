package org.example.services;

import org.example.entity.Emplois_du_temps;
import org.example.interfaces.Repository;

import java.util.List;

public class Emplois_du_tempsService extends BaseService implements Repository<Emplois_du_temps> {
    public Emplois_du_tempsService(){super();}

    @Override
    public boolean create(Emplois_du_temps o) {
        session = sessionFactory.openSession();
        session.getTransaction().begin();
        session.save(o);
        session.getTransaction().commit();
        session.close();
        return true;
    }

    @Override
    public boolean update(Emplois_du_temps o) {
        return false;
    }

    @Override
    public boolean delete(Emplois_du_temps o) {
        return false;
    }

    @Override
    public Emplois_du_temps findById(Long id) {
        return null;
    }

    @Override
    public List<Emplois_du_temps> findAll() {
        return null;
    }
}
