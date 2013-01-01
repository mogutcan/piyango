package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class database {
	  
	public static Connection conn = null;
	public static int biletNo;
	public static int odul;
	  
	
	public static void databaseOpen() throws ClassNotFoundException, SQLException{
		
       /*
       *  Veritabanini yok yere kaybetmeyelim
       */
        String url = "********************";
        String user = "*******************";
        String password = "***************";

       
        Class.forName("org.postgresql.Driver");
        
        conn = DriverManager.getConnection(url,user,password);
	}
	public static void getData(int biletID) throws SQLException{
		
		/*
		 * Olagan arama algoritması:
		 * 
		 * Ornek 1234567 numarasının tamamına, 
		 * sondan alti, bes, uc, iki
		 * ve son hanesine bakılır
		 * 
		 * 
		 */
		
		String s = "" + biletID;
		
		String searchQuery = "SELECT * from tSurprise where biletno='"+biletID+"' or biletno='"+s.substring(1)+"'" +
							 "or biletno='"+s.substring(2)+"' or biletno='"+s.substring(3)+"'" +
							 "or biletno='"+s.substring(4)+"' or biletno='"+s.substring(5)+"'" +
							 "or biletno='"+s.substring(6)+"'";
		PreparedStatement ifade = conn.prepareCall(searchQuery);
		ResultSet sonuc = ifade.executeQuery();     
		
		if(sonuc.next()){ 
			biletNo = sonuc.getInt("biletno");
			odul = sonuc.getInt("odul");
		}
		else{
			biletNo = biletID;
			odul = 0;
		}
	}
	public static void databaseClose() throws SQLException{
		conn.close();
	}
}


