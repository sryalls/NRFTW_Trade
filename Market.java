/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sandy
 */
public class Market {
    String theName;
    Market(){
    }
    
    Market(String aName){
        theName = aName;
    }
    
    public void setPrices(ArrayList theCommodities){
    
    }
    
    /**
     * interrogats the database for price data relating to this market and prints it to screen
     */
    public void displayPrices(){
        System.out.println(theName+":");
        //build query to get price data
        String priceQuery = "select commodity, price from prices where market = 'theName' order by commodity asc";
        //execute query
        ResultSet results = NRFTW_Trade.dBQuery(priceQuery);
        try{
            while(results.next()){
                String aCommodityName = results.getString(1);
                int aPrice = results.getInt(2);
                System.out.println(aCommodityName+"\t\t"+aPrice);
            
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        //display data
    }
}
