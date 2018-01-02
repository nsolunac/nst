/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nn.nst.config;

import nn.nst.security.filter.CORSFilter;
import nn.nst.security.filter.TokenFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 *
 * @author P
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter{
    
    @Autowired
    private TokenFilter tokenFilter;
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS) //Ovde potrebna izmena kako nama treba sesija
                .and()
                .authorizeRequests()
                .antMatchers("/login").permitAll()
                .antMatchers("/mesto/**").hasAuthority("ROLE_ADMIN")
                .antMatchers("/kupac/**").hasAuthority("ROLE_ADMIN")
                .anyRequest().authenticated()
                .and()
                .addFilterBefore(new CORSFilter(), ChannelProcessingFilter.class)
                .addFilterBefore(tokenFilter, UsernamePasswordAuthenticationFilter.class);

    }
    
}
