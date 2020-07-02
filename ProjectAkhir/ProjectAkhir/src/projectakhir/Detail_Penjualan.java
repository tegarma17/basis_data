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
public class Detail_Penjualan {
    
     Integer id_detail_penjualan;
    private Barang barang;
    private Penjualan penjualan;
    private Integer jumlah;
    
    public Integer getId_Detail_Penjualan(){
        return id_detail_penjualan;
    }
    
    public void setId_Detail_Penjualan(Integer id_detail_penjualan){
        this.id_detail_penjualan = id_detail_penjualan;
    }
    
    public Barang getBarang(){
        return barang;
    }
    
    public void setbarang(Barang barang){
        this.barang = barang;
    }
    
    public Integer getJumlah(){
        return jumlah;
    }
    
    public void setJumlah(Integer jumlah){
        this.jumlah = jumlah;
    }
}
