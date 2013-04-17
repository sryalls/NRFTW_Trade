/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sandy
 */
public class TradeRoute {
    public String startPoint;
    public String endPoint;
    public int id;
    
    TradeRoute(){
    
    }
    
    /**
     * Constructor - When only an id  is passed to the TradeRoute constructor 
     * the database is queried for details of a trade route with that id. If one 
     * is found then it's details are popultated to the new TradeRoute object.
     * 
     * @param anId - the Id of the existing route to be found
     */
    TradeRoute(int anId){
        //query database for an existing trade route with the passed ID
        String routeQuery = "select market_1, market_2, id from trade_routes where id = "+anId;
        ResultSet theExistingRoute = NRFTW_Trade.dBQuery(routeQuery);
        //if one exists
                    //add the start and end points to the object
            //and set the object ID
        try{
            theExistingRoute.next();
            startPoint = theExistingRoute.getString(1);
            endPoint = theExistingRoute.getString(2);
            id = theExistingRoute.getInt(3);
        }catch(SQLException ex){
            System.out.println(ex);
        }
        //if not
            //do nothing
    }
    
    /**
     * When a start point, end point and id are passed to the constructor a new 
     * TradeRoute object is created with those details set to it's approptiate 
     * attributes. 
     * 
     * @param aStartPoint - a start point
     * @param anEndPoint - an end point
     * @param anId - an id
     */
    TradeRoute(String aStartPoint, String anEndPoint, int anId){
        startPoint = aStartPoint;
        endPoint = anEndPoint;
        id = anId;
    }
    
    /**
     * Updates the database so that each commodity relating to the trage route has the passed capacity
     * 
     * @param theCommodities - an array list containing all commodities in the system
     * @param aCapacity - the capcity all commodities on the route are to be set to. 
     */
    public void setRouteCapacaties(ArrayList theCommodities, int aCapacity){    
        //construct sql query
        String theCapacityEnquiery = "select commodity from route_capacity where route = "+id+";";
        ResultSet theExistingCapcacaties = NRFTW_Trade.dBQuery(theCapacityEnquiery);
        ArrayList theExisitingCapacityStrings = new ArrayList(); 
        try{
            //unpack results
            while(theExistingCapcacaties.next()){
                
                theExisitingCapacityStrings.add(theExistingCapcacaties.getString(1));
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        //make sure existing capacaties use set rather than insert queries 
            //itterate through the existing capacaties
                //for each, write a "Set" query
                //delete relevent comodity from the Commodities
        String theCapacityUpdateQuery = "update route_capacity set rate = "+aCapacity+" where route = "+id+" and commodity in('";
        String theCapacityInsertQuery = "insert into route_capacity(route, commodity, rate) values ";
        int insertCount = 0;
        int updateCount = 0;
        // for each commodity
        for(Iterator<Commodity> commodityItterator = theCommodities.iterator(); commodityItterator.hasNext();){
            Commodity aCommodity = commodityItterator.next();
            if(theExisitingCapacityStrings.contains(aCommodity.theName)){
                if(updateCount > 0){
                    theCapacityUpdateQuery += ",'";
                }
                theCapacityUpdateQuery += aCommodity.theName+"'";
                updateCount = updateCount+1;
            }else{
                if(insertCount > 0){
                    theCapacityInsertQuery += ",";
                }
                theCapacityInsertQuery += "("+id+",'"+aCommodity.theName+"',"+aCapacity+")";
                insertCount = insertCount+1;                                   
            }
        }
         theCapacityInsertQuery += ";";
         theCapacityUpdateQuery += ");";
         if(insertCount >0){
             NRFTW_Trade.dBUpdate(theCapacityInsertQuery);
         }
         if(updateCount >0){
             NRFTW_Trade.dBUpdate(theCapacityUpdateQuery);
         }
        // insert line in route_capacaties
        //update db
    }
    
}
