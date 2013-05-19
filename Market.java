/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.io.BufferedReader;
import java.io.InputStreamReader;

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
    
   /**
     * Interrogats the user for the new prices for the commodities and writes them to the database
     * @param ArrayList theCommodities - an array list of all the commodities in the system
     */ 
    public void setPrices(ArrayList theCommodities){
        // get list of commodites with prices for this market from the DB
        String getCommoditiesQuery = "select commodity from prices where market = '"+theName+"'";
        ResultSet results = NRFTW_Trade.dBQuery(getCommoditiesQuery);
        // load the commodities into an array list
        ArrayList existingPrices = new ArrayList();
        try{
            while(results.next()){
                existingPrices.add(results.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }        
        String setPriceQueries = "";
        String insertPriceQuery = "";
        // itterate through the passed commodities
        for(Iterator<Commodity> newPricesItterator = theCommodities.iterator(); newPricesItterator.hasNext();){
            Commodity thisCommodity = newPricesItterator.next();
            //interrogate the user for a price            
            int thePrice = -1;
            do{
                System.out.println("What is the price of "+thisCommodity.theName+" in "+theName+"?");
                try{
                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    String str = br.readLine();
                    thePrice = Integer.parseInt(str);                   
                }catch(Exception e){                   
                } 
            }while(thePrice < 0);
            //if array list of retrieved commodities contains the current commodity            
            if(existingPrices.contains(thisCommodity.theName)){
                //add an update query to the query string
                setPriceQueries += "update prices set price = '"+thePrice+"' where market = '"+theName+"' and commodity = '"+thisCommodity.theName+"'; ";
                NRFTW_Trade.dBUpdate(setPriceQueries);
                setPriceQueries = "";
            //else
            }else{
                //add an insert query to the query string
                if(insertPriceQuery.equals("")){
                    insertPriceQuery = "Insert into prices (market, price, commodity) Values ('"+theName+"','"+thePrice+"','"+thisCommodity.theName+"')";
                } else{
                insertPriceQuery += ", ('"+theName+"','"+thePrice+"','"+thisCommodity.theName+"')";
                }
                
            }                        
        } 
        if (!insertPriceQuery.equals("")){
            insertPriceQuery += ";";
        }
        //execute the query string
        NRFTW_Trade.dBUpdate(insertPriceQuery);
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
