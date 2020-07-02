/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projectakhir;

/**
 *
 * @author hobel
 */
public class Barang {
    
    private Integer id_barang;
    private String nama_barang;
    private Integer stok;
    private Integer harga;
    
    public Integer getId_Barang(){
        return id_barang;
    }
    
    public void setId_Barang(Integer id_barang){
        this.id_barang = id_barang;
    }
    
    
    public String getNama_Barang(){
        return nama_barang;
    }
    
    public void setNama_Barang(String nama_barang){
        this.nama_barang = nama_barang;
    }
    
    public Integer getStok(){
        return stok;
    }
    
    public void getStok(Integer stok){
        this.stok = stok;
    }
    
    public Integer getHarga(){
        return harga;
    }
    
    public void getHarga(Integer harga){
        this.harga = harga;
    }
}
