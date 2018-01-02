/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.controller.rest;

import nn.nst.domen.Korisnik;
import nn.nst.domen.Loginparams;
import nn.nst.service.KorisnikService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author P
 */
@RestController
public class KorisnikRestController {

    @Autowired
    private KorisnikService korisnikService;

    @RequestMapping(value = "/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
    public @ResponseBody
    Object login(@RequestBody Loginparams loginparams) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(korisnikService.authenticate(loginparams));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Unknown user.");
        }
    }

}
