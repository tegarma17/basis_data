/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectakhir;
import java.util.Date;
/**
 *
 * @author hobel
 */
public class Penjualan {
    
    private Integer id_penjualan;
    private Us_er us_er;
    private Date tgl_penjualan;
    
    public Integer getId_Penjualan(){
        return id_penjualan;
    }
    
    public void setId_Penjualan(Integer id_penjualan){
        this.id_penjualan = id_penjualan;
    }
    
    public Us_er getUs_er(){
        return us_er;
    }
    
    public void setUs_er(Us_er us_er){
        this.us_er = us_er;
    }
    
    public Date getTgl_Penjualan(){
        return tgl_penjualan;
    }
    
    public void setTgl_Penjualan(Date tgl_penjualan){
        this.tgl_penjualan = tgl_penjualan;
    }
}
