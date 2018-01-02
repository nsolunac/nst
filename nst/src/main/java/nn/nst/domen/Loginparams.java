/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.domen;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author P
 */
@Entity
@Table(name = "loginparams")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Loginparams.findAll", query = "SELECT l FROM Loginparams l"),
    @NamedQuery(name = "Loginparams.findByKorisnikId", query = "SELECT l FROM Loginparams l WHERE l.korisnikId = :korisnikId"),
    @NamedQuery(name = "Loginparams.findByUsername", query = "SELECT l FROM Loginparams l WHERE l.username = :username"),
    @NamedQuery(name = "Loginparams.findByPassword", query = "SELECT l FROM Loginparams l WHERE l.password = :password"),
    @NamedQuery(name = "Loginparams.findByLock", query = "SELECT l FROM Loginparams l WHERE l.lock = :lock"),
    @NamedQuery(name = "Loginparams.findByQstnA", query = "SELECT l FROM Loginparams l WHERE l.qstnA = :qstnA")
    //@NamedQuery(name = "Loginparams.findUser", query = "SELECT k FROM Loginparams lp JOIN lp.korisnik k WHERE lp.username = :username")  
})
    
public class Loginparams implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "korisnikId")
    private Integer korisnikId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "password")
    private String password;
    @Column(name = "lock")
    private Boolean lock;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "qstnA")
    private String qstnA;
    @JoinColumn(name = "korisnikId", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Korisnik korisnik;
    @JoinColumn(name = "qstn", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Secretqstn qstn;

    public Loginparams() {
    }

    public Loginparams(Integer korisnikId) {
        this.korisnikId = korisnikId;
    }

    public Loginparams(Integer korisnikId, String username, String password, String qstnA) {
        this.korisnikId = korisnikId;
        this.username = username;
        this.password = password;
        this.qstnA = qstnA;
    }

    public Integer getKorisnikId() {
        return korisnikId;
    }

    public void setKorisnikId(Integer korisnikId) {
        this.korisnikId = korisnikId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getLock() {
        return lock;
    }

    public void setLock(Boolean lock) {
        this.lock = lock;
    }

    public String getQstnA() {
        return qstnA;
    }

    public void setQstnA(String qstnA) {
        this.qstnA = qstnA;
    }

    public Korisnik getKorisnik() {
        return korisnik;
    }

    public void setKorisnik(Korisnik korisnik) {
        this.korisnik = korisnik;
    }

    public Secretqstn getQstn() {
        return qstn;
    }

    public void setQstn(Secretqstn qstn) {
        this.qstn = qstn;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (korisnikId != null ? korisnikId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Loginparams)) {
            return false;
        }
        Loginparams other = (Loginparams) object;
        if ((this.korisnikId == null && other.korisnikId != null) || (this.korisnikId != null && !this.korisnikId.equals(other.korisnikId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "nn.nst.domen.Loginparams[ korisnikId=" + korisnikId + " ]";
    }
    
}
