/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectakhir;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author tegar
 */

public class koneksiOracle {
       
    public static Connection KoneksiDB(){
        try{
           Class.forName("oracle.jdbc.driver.OracleDriver");
           Connection koneksi = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ferdin_06920", "12");
                System.out.println("Koneski Database Sukses");
                return koneksi;
           }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
            return null;
        
           }
    }
}
    
