/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.service.impl;

import nn.nst.dao.KorisnikDAO;
import nn.nst.domen.Korisnik;
import nn.nst.domen.Loginparams;
import nn.nst.service.KorisnikService;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author P
 */
@Service
public class KorisnikServiceImpl implements KorisnikService{

    @Autowired
    private KorisnikDAO korisnikDAO;

    @Override
    public Korisnik login(String username, String password) {
        return korisnikDAO.login(username, password);
    }

    @Override
    public Korisnik findByUsername(String username) {
        return korisnikDAO.findByUsername(username);
    }

    @Override
    public String authenticate(Loginparams loginparams) throws Exception {
        Korisnik userDB = korisnikDAO.login(loginparams.getUsername(), loginparams.getPassword());
        if (userDB == null) {
            throw new Exception("Unknown user.");
        }
        String token = userDB.getLoginparams().getUsername() + ":" + userDB.getIme();
        return new String(Base64.encodeBase64(token.getBytes()));
    }
    
}
