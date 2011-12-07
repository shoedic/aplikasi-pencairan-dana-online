/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package apdol.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author wahid
 */
@Entity
public class Dipa implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nomorDipa;
    private Float pagu;
    private Float realisasi;
    private Float sisaDana;
    private Kegiatan kegiatan;
    private Output output;
    private MataAnggaran mataAnggaran;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNomorDipa() {
        return nomorDipa;
    }

    public void setNomorDipa(String nomorDipa) {
        this.nomorDipa = nomorDipa;
    }

    public Float getPagu() {
        return pagu;
    }

    public void setPagu(Float pagu) {
        this.pagu = pagu;
    }

    public Float getRealisasi() {
        return realisasi;
    }

    public void setRealisasi(Float realisasi) {
        this.realisasi = realisasi;
    }

    public Float getSisaDana() {
        return sisaDana;
    }

    public void setSisaDana(Float sisaDana) {
        this.sisaDana = sisaDana;
    }

    public Kegiatan getKegiatan() {
        return kegiatan;
    }

    public void setKegiatan(Kegiatan kegiatan) {
        this.kegiatan = kegiatan;
    }

    public MataAnggaran getMataAnggaran() {
        return mataAnggaran;
    }

    public void setMataAnggaran(MataAnggaran mataAnggaran) {
        this.mataAnggaran = mataAnggaran;
    }

    public Output getOutput() {
        return output;
    }

    public void setOutput(Output output) {
        this.output = output;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

   
@Override
        public String toString() {
        return "apdol.entity.Dipa[ id=" + id + " ]";
    }
}