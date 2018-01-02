/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.domen;

import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import nn.nst.domen.enumtype.UserRoleEnum;

/**
 *
 * @author P
 */
@Entity
@Table(name = "korisnik")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Korisnik.findAll", query = "SELECT k FROM Korisnik k"),
    @NamedQuery(name = "Korisnik.findById", query = "SELECT k FROM Korisnik k WHERE k.id = :id"),
    @NamedQuery(name = "Korisnik.findByIme", query = "SELECT k FROM Korisnik k WHERE k.ime = :ime"),
    @NamedQuery(name = "Korisnik.findByPrezime", query = "SELECT k FROM Korisnik k WHERE k.prezime = :prezime"),
    @NamedQuery(name = "Korisnik.findByTip", query = "SELECT k FROM Korisnik k WHERE k.tip = :tip"),
    @NamedQuery(name = "Korisnik.findByLp", query = "SELECT k FROM Korisnik k WHERE k.lp = :lp")})
public class Korisnik implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ime")
    private String ime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "prezime")
    private String prezime;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tip")
    private short tip;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lp")
    private int lp;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "korisnik")
    private Loginparams loginparams;
   // @ElementCollection(fetch = FetchType.EAGER, targetClass = UserRoleEnum.class)
   //@Enumerated(EnumType.STRING)
   //private Set<UserRoleEnum> roles;

    public Korisnik() {
    }

    public Korisnik(Integer id) {
        this.id = id;
    }

    public Korisnik(Integer id, String ime, String prezime, short tip, int lp) {
        this.id = id;
        this.ime = ime;
        this.prezime = prezime;
        this.tip = tip;
        this.lp = lp;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public short getTip() {
        return tip;
    }

    public void setTip(short tip) {
        this.tip = tip;
    }

    public int getLp() {
        return lp;
    }

    public void setLp(int lp) {
        this.lp = lp;
    }

    public Loginparams getLoginparams() {
        return loginparams;
    }

    public void setLoginparams(Loginparams loginparams) {
        this.loginparams = loginparams;
    }

 /*    public Set<UserRoleEnum> getRoles() {
        return roles;
    }

    public void setRoles(Set<UserRoleEnum> roles) {
        this.roles = roles;
    }
 */
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Korisnik)) {
            return false;
        }
        Korisnik other = (Korisnik) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "nn.nst.domen.Korisnik[ id=" + id + " ]";
    }
    
}
