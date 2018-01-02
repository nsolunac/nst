/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.dao;

import nn.nst.domen.Korisnik;
import nn.nst.domen.Loginparams;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author P
 */
@Repository
public interface KorisnikDAO extends JpaRepository<Loginparams, Integer> {
    //SELECT DISTINCT p FROM Department d JOIN d.employees e JOIN e.projects p")
    @Query("SELECT k FROM Loginparams lp JOIN lp.korisnik k WHERE lp.username = ?1 AND lp.password = ?2")
    Korisnik login(String username, String password);

    @Query("SELECT k FROM Loginparams lp JOIN lp.korisnik k WHERE lp.username = ?1")
    Korisnik findByUsername(String username);

}
