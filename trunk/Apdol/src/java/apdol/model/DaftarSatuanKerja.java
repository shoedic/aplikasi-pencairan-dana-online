/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apdol.model;

import apdol.entity.Dipa;
import apdol.entity.SatuanKerja;
import apdol.model.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;

/**
 *
 * @author Accio
 */
public class DaftarSatuanKerja implements Serializable {

    public DaftarSatuanKerja() {
        emf = Persistence.createEntityManagerFactory("ApdolPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public List<SatuanKerja> getSatuanKerja() {
        List<SatuanKerja> satker = new ArrayList<SatuanKerja>();

        EntityManager em = getEntityManager();
        try {
            Query q = em.createQuery("SELECT a FROM SatuanKerja AS a");
            satker = q.getResultList();

        } finally {
            em.close();
        }
        return satker;
    }

    public SatuanKerja findSatuanKerja(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(SatuanKerja.class, id);
        } finally {
            em.close();
        }
    }

    public void rekamSatuanKerja(SatuanKerja satker) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(satker);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(SatuanKerja satker) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            satker = em.merge(satker);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            SatuanKerja satker;
            try {
                satker = em.getReference(SatuanKerja.class, id);
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("satker belum dipilih.", enfe);
            }
            em.remove(satker);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
