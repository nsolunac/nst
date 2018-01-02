/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.service;

import nn.nst.domen.Korisnik;
import nn.nst.domen.Loginparams;

/**
 *
 * @author P
 */
public interface KorisnikService {
    Korisnik login(String username, String password);

    Korisnik findByUsername(String username);

    String authenticate(Loginparams loginparams) throws Exception;
}
