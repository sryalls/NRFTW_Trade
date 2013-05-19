/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;
import java.util.List;
import java.util.Collections; 
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Iterator;

/**
 *
 * @author Sandy Ryalls Sandy.ryalls@googlemail.com
 * @version 0.1
 * 
 */
public class NRFTW_Trade {



    /**
     * Main method. Calls the menue and processes menue selections into function calls
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ArrayList theMarkets = setupMarkets();
        ArrayList theCommodities = setupCommodities();
        ArrayList theTags = getTags();
        boolean selectionMade = false;
        int theSelection;
        do{
            theSelection = printMenu();
            switch (theSelection){    
                case 1:
                    TradeCycle theTradeCycle = new TradeCycle();
                    //run trade cycle
                    theTradeCycle.run(theMarkets,theCommodities);
                    selectionMade = true;
                    break;
                case 2:
                    setLevelsAll(theMarkets,theCommodities,theTags);
                    selectionMade = true;
                    break;
                case 3:
                    selectionMade = true;
                    setLevelsOne(theMarkets,theCommodities,theTags);
                    break;
                case 4:
                    selectionMade = true;
                    addTradeRoute(theMarkets,theCommodities);
                    break;
                case 5:
                    selectionMade = true;
                    displayTradeRoutes();
                    break;
                case 6:
                    selectionMade = true;
                    alterRouteCapacity(theMarkets,theCommodities);
                    break;
                case 7:
                    selectionMade = true;
                    theMarkets = addMarket(theMarkets,theCommodities,theTags);
                    break;
                case 8:
                    selectionMade = true;
                    removeTradeRoute(theMarkets);
                    break;
                case 9:
                    selectionMade = true;
                    viewPrices(theMarkets);
                    break;
                case 10:
                    selectionMade = true;
                    viewPricesAll(theMarkets);
                    break;
                 case 11:
                    selectionMade = true;
                    setPrices(theMarkets,theCommodities);
                    break;
                 case 12:
                    selectionMade = true;
                    setPricesAll(theMarkets,theCommodities);
                    break;
            }
        }while(theSelection != 0);
    }
    
    /**
     * interrogates the user for the name of a market and sets price for the commodities in that market
     * 
     * @param ArrayList theMarkets - an array list of all the markets in the system
     * @param ArrayList theCommodities - an array list of all the commodities in the system
     */
    public static void setPrices(ArrayList theMarkets, ArrayList theCommodities){
        ArrayList theMarketNames = printMarkets(theMarkets);
        System.out.println("which market would you like to set prices for");
        String theStartSelection = "";
        do{
            try{    
                InputStreamReader isr = new InputStreamReader(System.in);
                BufferedReader br = new BufferedReader(isr);
                theStartSelection = br.readLine();
            }catch(Exception e){
            }
            if(!theMarketNames.contains(theStartSelection)){
                System.out.println("No market with the name "+theStartSelection+"exists");
            }
        }while(!theMarketNames.contains(theStartSelection));
        for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){  
        //get the market
            Market aMarket = aMarketItterator.next();
            if(aMarket.theName.equals(theStartSelection)){
                aMarket.setPrices(theCommodities);
            }
         }
    }
    
    /**
     * sets the price for all commodities in all markets
     * @param ArrayList theMarkets - - an array list of all the markets in the system
     * @param ArrayList theCommodities  - - an array list of all the commodities in the system
     */
    public static void setPricesAll(ArrayList theMarkets, ArrayList theCommodities){
         for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){  
        //get the market
            Market aMarket = aMarketItterator.next();
            aMarket.setPrices(theCommodities);
         }    
    }
    
    /**
     * interrogates the user for the name of a market and displays the prices for all commodities traded in that market
     * @param theMarkets 
     */
    public static void viewPrices(ArrayList theMarkets){
        ArrayList theMarketNames = printMarkets(theMarkets);
        System.out.println("which market would you like to view prices for");
        String theStartSelection = "";
        do{
            try{    
                InputStreamReader isr = new InputStreamReader(System.in);
                BufferedReader br = new BufferedReader(isr);
                theStartSelection = br.readLine();
            }catch(Exception e){
            }
            if(!theMarketNames.contains(theStartSelection)){
                System.out.println("No market with the name "+theStartSelection+"exists");
            }
        }while(!theMarketNames.contains(theStartSelection));
        for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){  
        //get the market
            Market aMarket = aMarketItterator.next();
            if(aMarket.theName.equals(theStartSelection)){
                aMarket.displayPrices();
            }
         }
        
    }
    
    /**
     * Displays the prices for all commodities traded in all markets
     * 
     * @param theMarkets 
     */
    public static void viewPricesAll(ArrayList theMarkets){
         for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){  
        //get the market
            Market aMarket = aMarketItterator.next();
            aMarket.displayPrices();
         }
    
    }
    
    /**
     * Finds the id of a trade route given the start and end point (The two are 
     * interchangable for the purposes of this method). If no id is found then 0
     * will be returned
     * 
     * @param String theStartSelection - the start point of a trade route
     * @param String theEndSelection  - the end point of the same trade route
     * 
     * @return int - the ID of the corrosponding trade route
     */
    public static int getRouteByPoints(String theStartSelection,String theEndSelection){
        System.out.println("start: "+theStartSelection);
        System.out.println("end: "+ theEndSelection);
        //check if the start is in market_1 and end in market_2
        String routeQuery = "select id from trade_routes where market_1 = '"+theStartSelection+"' and market_2 = '"+theEndSelection+"'";
        ResultSet idResult = dBQuery(routeQuery);
        int theID = 0;
        try{
            if(idResult.first()){
                idResult.first();
                theID = idResult.getInt(1);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        if(theID == 0){
            //if not try vice versa
            routeQuery = "select id from trade_routes where market_1 = '"+theEndSelection+"' and market_2 = '"+theStartSelection+"'";
            idResult = dBQuery(routeQuery);
            try{
                if(idResult.first()){
                    idResult.first();
                    theID = idResult.getInt(1);
                }
            }catch(SQLException ex){
                System.out.println(ex);
            }
        }
        //return the result    
        return theID;
    }
    
    /**
     * Askes the user to select the start and end points of a trade route and 
     * removes the selected route from the system
     * @param ArrayList theMarkets - an array list of all the markets in the system
     */
    public static void removeTradeRoute(ArrayList theMarkets){
        String theStartSelection = "";
        String theEndSelection = "";
        try{
            String[] theSelections = selectATradeRoute(theMarkets,"remove");
            theStartSelection = theSelections[0];
            theEndSelection = theSelections[1];
        }catch(Exception e){
            System.out.println(e);
        }
        //find out which way round the selections go and return an ID.
        int routeID = getRouteByPoints(theStartSelection,theEndSelection);
        //build delete query
        String deleteRouteQuery ="DELETE FROM trade_routes where id = "+routeID; 
        dBUpdate(deleteRouteQuery);
        String deleteCapQuery ="DELETE FROM route_capacity where route = "+routeID; 
        dBUpdate(deleteCapQuery);
        return;
    }
    
    /**
     * Asks the user for the name of a new market, creates it, adds it to the 
     * system and prompts the user to set production rates for commodities and 
     * consumption rate of tags in the new market.
     * 
     * @param ArrayList theMarkets  - an array list of all the markets in the system
     * @param ArrayList theCommodities  - an array list of all the commodities in the system
     * @param ArrayList theTags - an array list of all the tags in the system
     * 
     * @return ArrayList - The revised array list of markets with the new market added
     */
    public static ArrayList addMarket(ArrayList theMarkets,ArrayList theCommodities,ArrayList theTags){
        //get name of new market
        String aNewMarketName = "";       
        ArrayList theMarketNames = new ArrayList();
        for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){
            Market thisMarket = aMarketItterator.next();
            theMarketNames.add(thisMarket.theName);
        }
        do{
            System.out.println("Please enter a name for the new market");
            try{    
                InputStreamReader isr = new InputStreamReader(System.in);
                BufferedReader br = new BufferedReader(isr);
                aNewMarketName  = br.readLine();
            }catch(Exception e){
            }
        if(theMarketNames.contains(aNewMarketName)){
            System.out.println("A Market called "+aNewMarketName+" already exists");
        }
        //ensure that it is unique            
        }while(theMarketNames.contains(aNewMarketName));                    
        // create new market object
        Market theNewMarket = new Market(aNewMarketName);
        // write new market to DB;
        String MarketInsertQuery = "insert ignore into markets (name) values ('"+theNewMarket.theName+"');";
        dBUpdate(MarketInsertQuery);
        // set levels for the new market
        setLevels(theNewMarket,theCommodities,theTags);
       // add it to theMarkets
        theMarkets.add(theNewMarket);
        // return theMarkets
        return theMarkets;
    }
    
    /**
     * Prompts the user to select a trade route, displays it's capacity and changes 
     * said capacity to a prompted for value
     * 
     * @param ArrayList theMarkets  - an array list of all the markets in the system
     * @param ArrayList theCommodities  - an array list of all the commodities in the system
     */
    public static void alterRouteCapacity(ArrayList theMarkets, ArrayList theCommodities){
        //display trade routes
        displayTradeRoutes();
        //get Id of route to be redefined
                int theSelection = 0;
        TradeRoute theTradeRoute = new TradeRoute();
        do{
            System.out.println("Please endter the ID of the route to be altered."); 
            try{    
                InputStreamReader isr = new InputStreamReader(System.in);
                BufferedReader br = new BufferedReader(isr);
                String str = br.readLine();
                theSelection = Integer.parseInt(str);
            }catch(Exception e){
            }
             theTradeRoute = new TradeRoute(theSelection);
             if (theTradeRoute.id != theSelection){
                 System.out.println("That was not a valid trade route ID.");
             } 
            }while (theTradeRoute.id != theSelection);
        //display old capacity
        String capacityQuery = "select rate from route_capacity where route = "+ theTradeRoute.id +" limit 0,1";
        ResultSet existingRateResult = dBQuery(capacityQuery);
        int existingRate = 0;
        try{ 
            existingRateResult.next();
            existingRate = existingRateResult.getInt(1);
        }catch(SQLException ex){
            System.out.println(ex);
        }
        System.out.println("The current capcity for comodities on this trade route is : "+existingRate );
        // send trade route for capacity alteration
        setRouteCapacity(theTradeRoute, theCommodities);
    }
    
    /**
     * queries the database for all trade routes in the system and displays them 
     * to the user with start point, end pont and route ID. The routes are 
     * displayed in a higherarchical structure by start point. Each route is 
     * displayed twice, once under each point so that the start and end points 
     * of the route are interchangable 
     */
    public static void displayTradeRoutes(){
        //get all distinct markets from trade routes table       
        //get distinct market_1s
        String market1Query = "select distinct market_1 from trade_routes;";
        ResultSet market1Results = dBQuery(market1Query);
        ArrayList theStartPoints = new ArrayList();
        try{
            //unpack results
            while(market1Results.next()){
                String aMarketName = market1Results.getString(1);
                theStartPoints.add(aMarketName);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        //get distinct market_2s
        String market2Query = "select distinct market_2 from trade_routes;";
        ResultSet market2Results = dBQuery(market2Query);
        try{
            //unpack results
            while(market2Results.next()){
                String aMarketName = market2Results.getString(1);
                //smudge the lists
                if(!theStartPoints.contains(aMarketName)){
                    theStartPoints.add(aMarketName);
                }                
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }        
        Collections.sort(theStartPoints);    
        for(Iterator<String> aMarketItterator = theStartPoints.iterator(); aMarketItterator.hasNext();){  
              String aMarket = aMarketItterator.next();
              //print out market name
              System.out.println(aMarket+":");
              //run getTradeRoutesByStart
              ArrayList theEndMarkets = getTradeRoutesByStart(aMarket);
              //print each end market              
              for(Iterator<TradeRoute> aTradeRouteItterator = theEndMarkets.iterator(); aTradeRouteItterator.hasNext();){
                  TradeRoute thisTradeRoute = aTradeRouteItterator.next();
                  System.out.println("  "+thisTradeRoute.endPoint+" - ID: "+thisTradeRoute.id);                          
              }
        }
                

    }
    
    /**
     * Displays a menu of options to the user and returns a number corrosponding 
     * to the selected piece of functionality
     * @return int - the number corrosponding to the selected functionality
     */
    public static int printMenu(){
        //@todo - funtionality for:

        // add commodity
            //to system
            //to given market
        // remove market
        
        // remove commodity from system
        // alter consumption rate
        // alter produciton rate 
                
        int theSelection = 99;
        System.out.println("Please make a selection:");
        System.out.println("Press 1 to run a cycle");
        System.out.println("Press 2 to set consumption and production levels for all markets");
        System.out.println("Press 3 to set consumption and production levels for a specific markets");
        // add trade route
        System.out.println("Press 4 to add a trade route");
        //// see trade routes
        System.out.println("Press 5 to see all trade routes");
        // alter trade route capactiy
        System.out.println("Press 6 to alter the capacity of a trade route");
        // add market
        System.out.println("Press 7 to add a market");
        // remove trade route
        System.out.println("Press 8 to remove a trade route");
         // view prices
        System.out.println("Press 9 to see prices in a market");
        // view pricess all
        System.out.println("Press 10 to see prices in all markets");
        // set prices - specific market
        System.out.println("Press 11 to set prices in a markets");
        // set prices - all markets
        System.out.println("Press 12 to set prices in all markets");
        System.out.println("Press 0 to exit");
        try{    
            InputStreamReader isr = new InputStreamReader(System.in);
            BufferedReader br = new BufferedReader(isr);
            String str = br.readLine();
            theSelection = Integer.parseInt(str);
        }catch(Exception e){
        }
    return  theSelection;
    }
    
    
    
    /**
     * prints out the names of all the markets and returns an array list of all 
     * the market names
     * 
     * @param ArrayList theMarkets  - an array list of all the markets in the system
     * 
     * @return ArrrayList containing the names of all the markets
     */
    public static ArrayList printMarkets(ArrayList theMarkets){
        //for each market
        ArrayList theMarketNames = new ArrayList();
        System.out.println("The Markets:");
          for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){  
              //get the market
              Market aMarket = aMarketItterator.next();
              theMarketNames.add(aMarket.theName);
              System.out.println(aMarket.theName);
          }
          return theMarketNames;
    }
    
    /**
     * identifies and returns all trade routes which include a given market name
     * 
     * @param String aMarketName - the name of a market
     * @return ArrayList - all the trade routes including the given market name
     */
    public static ArrayList getTradeRoutesByStart(String aMarketName){
        ArrayList someTradeRoutes = new ArrayList();
        String fromMarket1 = "select market_2, id from trade_routes where market_1 = '"+aMarketName+"';";
        ResultSet market1Results = dBQuery(fromMarket1);
        try{
            //unpack results
            while(market1Results.next()){
                TradeRoute aTradeRoute = new TradeRoute(aMarketName, market1Results.getString(1), market1Results.getInt(2));
                someTradeRoutes.add(aTradeRoute);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        String fromMarket2 = "select market_1, id from trade_routes where market_2 = '"+aMarketName+"';";
        ResultSet market2Results = dBQuery(fromMarket2);
        try{
            //unpack results
            while(market2Results.next()){
                TradeRoute aTradeRoute = new TradeRoute(aMarketName, market2Results.getString(1), market2Results.getInt(2));
                someTradeRoutes.add(aTradeRoute);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return someTradeRoutes;
    }
    
    /**
     * Depending on whether it is called with an "add" or "remove" flag 
     * allows the user to select the start and end points of a valid trade route 
     * that explicitly does not yet or one that explicitly does exist.
     *
     * @param ArrayList theMarkets  - an array list of all the markets in the system
     * @param String theFunction - should contain either "add" or "remove". An indication of whether the validation of the route should be inclusive or exclusive
     *
     * @return String[] the start point and end point of either an existing trade route or a route that does not yet exist, depending on the theFunction paramater
     */
    public static String[] selectATradeRoute(ArrayList theMarkets,String theFunction){
     //show all markets
        String[] theSelections = new String[2];
        try{
            boolean shouldExist = false;
            if(theFunction.equals("add")){
                shouldExist = false;
            }else if(theFunction.equals("remove")){
                shouldExist = true;
            } else{
                throw new Exception("the selectATradeRoute funciton must be called with 'add' or 'remove as the 2nd paramater");
            }
            ArrayList theMarketNames = printMarkets(theMarkets);
            ArrayList theEndMarketNames = new ArrayList();
            //get a start market
            System.out.println("Please select a Market for the start of Trade Route:");
            //show all routes for that market       
            String theStartSelection = "";
            do{

                try{    
                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    theStartSelection = br.readLine();
                }catch(Exception e){
                }
                if(!theMarketNames.contains(theStartSelection)){
                    System.out.println("No market with the name "+theStartSelection+"exists");
                }
            }while(!theMarketNames.contains(theStartSelection));        
            ArrayList someTradeRoutes = getTradeRoutesByStart(theStartSelection);
            if(someTradeRoutes.isEmpty()){
                System.out.println("There are no routes from "+theStartSelection+" already");
            }else{
                System.out.println("Allready connected to "+theStartSelection+": ");
                for(Iterator<TradeRoute> someTradeRoutesItterator = someTradeRoutes.iterator(); someTradeRoutesItterator.hasNext();){
                    TradeRoute thisTradeRoute = someTradeRoutesItterator.next();
                    theEndMarketNames.add(thisTradeRoute.endPoint);
                    System.out.println(thisTradeRoute.endPoint);
                }
            }
            //get end market
            String theEndSelection = ""; 

            boolean failFlag = false;
            boolean existsFlag = false;
            do{
                System.out.println("Please select a Market for the end of Trade Route:");
                theEndSelection = "";
                failFlag = false;
                try{    
                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    theEndSelection = br.readLine();
                }catch(Exception e){
                }
                if(!theMarketNames.contains(theEndSelection)){
                    System.out.println("No market with the name "+theEndSelection+"exists");
                    failFlag = true;
                }
                if(theEndMarketNames.contains(theEndSelection))
                {
                //if here is another route between A & B
                //inform user that this route already exists.
                    System.out.println(theEndSelection+" is already connected to "+ theStartSelection);
                    existsFlag = true;
                }else{
                    System.out.println(theEndSelection+" is not already connected to "+ theStartSelection);
                    existsFlag = false;
                }
            }while(failFlag == true || existsFlag != shouldExist);

            theSelections[0] = theStartSelection;
            theSelections[1] = theEndSelection;
            
        }catch(Exception e){
            System.out.println(e);
        }
        return theSelections;
    }
    
    /**
     * Interrogates the user for the start and end point of a trade route and, 
     * if this route does not already exit, creates the route in the database 
     * and sets the trade capactities for the commodities on the route.
     * 
     * @param theMarkets - an array list of all the markets in the system
     * @param theCommodities - an array list of all the commodities in the system
     */
    public static void addTradeRoute(ArrayList theMarkets, ArrayList theCommodities){
        String theStartSelection = "";
        String theEndSelection = "";
        try{
            String[] theSelections = selectATradeRoute(theMarkets,"add");
            theStartSelection = theSelections[0];
            theEndSelection = theSelections[1];
        }catch(Exception e){
            System.out.println(e);
        }
        String routeCreateQuery = "insert into trade_routes (market_1,market_2) values ('"+theStartSelection+"','"+theEndSelection+"')";
        dBUpdate(routeCreateQuery);
        //set route capacaties
        String getNewRouteId = "select id from trade_routes where market_1 = '"+theStartSelection+"' and market_2 = '"+theEndSelection+"'";
        ResultSet idResult = dBQuery(getNewRouteId);
        
        
        int theId = 0;
        try{
            idResult.first();
            theId = idResult.getInt(1);
       
        }catch(SQLException ex){
            System.out.println(ex);
        }
        
        if(theId != 0){
            TradeRoute theNewRoute= new TradeRoute(theStartSelection, theEndSelection, theId);
            setRouteCapacity(theNewRoute,theCommodities);
        }
 
    } 
    
    /**
     * interrogates the user for a capacity for the passed trade route and 
     * applies that capacity to that route for all the existing commodities. 
     * 
     * @param theTradeRoute -  a TradeRoute object to the capacities relating to it set in the database.
     * @param theCommodities - an array list of all the commodities in the system
     */
    public static void setRouteCapacity(TradeRoute theTradeRoute, ArrayList theCommodities){
            //get route capacity;
            System.out.println("What is the per commodity capacity for this route?");
            int theCapacity = -1;
            do{            
                try{    
                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    String str = br.readLine();
                    theCapacity = Integer.parseInt(str);
                }catch(Exception e){
                }
                if(theCapacity < 0){
                    System.out.println("The capacity must be a positive integer");
                }
                }while(!(theCapacity >= 0));
        theTradeRoute.setRouteCapacaties(theCommodities,theCapacity);
    }
    
    /**
     * runs through all markets in the passed array and applies the function to 
     * set production and consumption levels to them
     * 
     * @param theMarkets - an array list of all the markets in the system
     * @param theCommodities - an array list of all the commodities in the system
     * @param theTags  - an array list of all the tags in the system
     */
    public static void setLevelsAll(ArrayList theMarkets,ArrayList theCommodities, ArrayList theTags){
    //for each market
      for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){  
        //get the market
        Market aMarket = aMarketItterator.next();
        //run through setLevels
        setLevels(aMarket, theCommodities, theTags);
      }
    }
    
    /**
     * Displays the list of markets to the user and applies the function to set
     * it's production and consumption rates to a market selected from that list.
     * 
     * @param theMarkets - an array list of all the markets in the system
     * @param theCommodities - an array list of all the commodities in the system
     * @param theTags  - an array list of all the tags in the system 
     */
    public static void setLevelsOne(ArrayList theMarkets,ArrayList theCommodities, ArrayList theTags){
           System.out.println("The markets are: ");
           for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){
                Market aMarket = aMarketItterator.next();
                System.out.println(aMarket.theName);
           }
           boolean selectionMade = false;
           do{
               System.out.println("Which market would you like to set rates for?");
               String aMarketName = "";
               try{

                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    aMarketName = br.readLine();                   
                }catch(Exception e){
                   
                }
                for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){
                    Market aMarket = aMarketItterator.next();
                    if(aMarket.theName.equalsIgnoreCase(aMarketName)){
                        selectionMade = true;
                        setLevels(aMarket,theCommodities, theTags);
                        return;
                    }
                }
           }while(selectionMade == false);
    }
    
    /**
     * interrogates the user for production rates for each commodity and 
     * consumption rates for each tag as to be applied to the passed Market and 
     * applies them to said Market.
     * 
     * @param theMarket - a Market object which is to have it's production and consumption rates set
     * @param theCommodities - an array list of all the commodities in the system
     * @param theTags  - an array list of all the tags in the system
     */
    public static void setLevels(Market theMarket, ArrayList theCommodities, ArrayList theTags){
         //go through the commodities
        // set up key value pair (tag => consumption rate)
        System.out.println("Market: "+ theMarket.theName);
        Map<String,Integer> productionRates = new HashMap<String, Integer>();
        for(Iterator<Commodity> aCommodityItterator = theCommodities.iterator(); aCommodityItterator.hasNext();){
            Commodity aCommodity = aCommodityItterator.next();
            //take production rate
            int theProductionRate = -1;
            do{
                System.out.println("What is the prodction rate (units) for "+aCommodity.theName+" in "+theMarket.theName+"?");
                try{

                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    String str = br.readLine();
                    theProductionRate = Integer.parseInt(str);                   
                }catch(Exception e){
                   
                } 
            }while(theProductionRate < 0);            
            // add pair to arraylist
            productionRates.put(aCommodity.theName,theProductionRate);
        }
        
        // set up key value pair (tag => consumption rate)
        Map<String,Integer> consumptionRates = new HashMap<String, Integer>();
        //go through the tags
        for(Iterator<Tag> aTagItterator = theTags.iterator(); aTagItterator.hasNext();){
            Tag aTag = aTagItterator.next();
            //take consumption rate
            int theConsumptionRate = -1;
            do{
                System.out.println("What is the consumption rate (units) for "+aTag.theName+" Grade "+aTag.theGrade+" in "+theMarket.theName+"?");
                try{

                    InputStreamReader isr = new InputStreamReader(System.in);
                    BufferedReader br = new BufferedReader(isr);
                    String str = br.readLine();
                    theConsumptionRate = Integer.parseInt(str);
                }catch(Exception e){
                }  
            }while(theConsumptionRate < 0);
            // add pair to arraylist
            consumptionRates.put(aTag.theName+aTag.theGrade, theConsumptionRate);
        }
        //store consumption and production rates.
        //build start of query
        String levelsQuery = "";
        //get existing entries for this market
        //build query
        String marketQuery = "Select commodity_name, tag_name, tag_grade from trade_matrix where market_name = '"+theMarket.theName+"'";
        //execute query
        ResultSet results = dBQuery(marketQuery);
        try{
            //unpack results
            while(results.next()){
            //if commodities
                if(results.getString(1) != null){
                    //alter production rate
                    //add to query
                    levelsQuery += "update trade_matrix set p_rate = "+productionRates.get(results.getString(1))+" where market_name = '"+theMarket.theName+"' and commodity_name = '"+results.getString(1)+"'; ";
                    dBUpdate(levelsQuery);
                    levelsQuery = "";
                    //remove entry from productionRates
                    productionRates.remove(results.getString(1));
                }else if(results.getString(1) != null && results.getInt(2) != 0){
                    //if tag
                    //alter consumption rate
                    //add to query
                    levelsQuery += "update trade_matrix set c_rate = "+consumptionRates.get(results.getString(1)+results.getInt(2)) +" where market_name = '"+theMarket.theName+"' and tag_name = '"+results.getString(1)+"' and tag_grade = "+results.getInt(2)+"; ";
                    dBUpdate(levelsQuery);
                    levelsQuery = "";
                    //remove entry from consumptionRates
                    consumptionRates.remove(results.getString(1)+results.getInt(2));
                }
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        try{
            results.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }

        //build start of insertions query
        if(!productionRates.isEmpty() || !consumptionRates.isEmpty()){
            levelsQuery += "Insert into trade_matrix (commodity_name, p_rate, tag_name, tag_grade, c_rate, market_name) values ";
            //cycle through production rates
            
            Iterator conRateIterator = consumptionRates.entrySet().iterator();
            Iterator prodRateIterator = productionRates.entrySet().iterator();
            while(prodRateIterator.hasNext()){
                Map.Entry<String,Integer> someProductionRates = (Map.Entry)prodRateIterator.next();
                //add query section for production rate ('<comodity name>',<production rate>,'',,,'<market name>')
                levelsQuery += "('"+someProductionRates.getKey()+"',"+someProductionRates.getValue()+",null,null,null,'"+theMarket.theName+"')";
                if(conRateIterator.hasNext() || prodRateIterator.hasNext()){
                    levelsQuery += ", ";
                }                
            }
            //cycle through consumption rates
            
            while(conRateIterator.hasNext()){
                 Map.Entry<String,Integer> someConsumptionRates = (Map.Entry)conRateIterator.next();
                 String aTagKey = someConsumptionRates.getKey();
                 String aTagGrade = aTagKey.substring(aTagKey.length()-1);
                 String aTagName = aTagKey.substring(0,aTagKey.length()-1);
                //add query section for consumption rate ('',,'<tag name>',<grade>,<consumption rate>,'<market name>')
                levelsQuery += "(null,null,'"+aTagName+"',"+aTagGrade+","+someConsumptionRates.getValue()+",'"+theMarket.theName+"')";
                if(conRateIterator.hasNext()){
                    levelsQuery += ", ";
                }
            }
            //ensure query is closed
            levelsQuery += ";";
        }
        dBUpdate(levelsQuery);
   }
    
    /**
     * Interrogates the database for tag data and returns it in an ArrayList 
     * containing all Tags in the system
     * @return - Arraylist - contains a Tag object for each tag in the databse. 
     */
    private static ArrayList getTags(){
        ArrayList someTags = new ArrayList();
        //set tags query 
        String tagsQuery  = "select distinct tag, grade from commodities_tags";
        ResultSet results = dBQuery(tagsQuery);
        try{
            //unpack results
            while(results.next()){
                //create new tag object for each one
                Tag aTag = new Tag(results.getString(1),results.getInt(2));
                //store it
                someTags.add(aTag);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        try{
            results.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
               
    //return
    return someTags;
    }
    
    /**
     * executes a database query that doesn't expect a response. 
     * @param query - The query to be executed on the database.
     */
    public static void dBUpdate(String query){
        String url = "jdbc:mysql://localhost/NRFTW_trade";
        String user = "root";
        String password = "password";
                       
        Connection con = null;
        Statement st = null;
        //open db connection
        
        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            st.executeUpdate(query);

        }catch (SQLException ex) {
            System.out.println(ex);
           
        }finally{            
            try {
                if (st != null) {
                    
                }
                if (con != null) {
                   
                }

            } catch (Exception ex) {
                
            }
        }    
    }
    
    /**
     * executes a database query that does expect a response.
     * @param query - The query to be executed on the database.
     * @return ResultSet - the results returned from the database in response to the query
     */
    public static ResultSet dBQuery(String query){
        
    String url = "jdbc:mysql://localhost/NRFTW_trade";
    String user = "root";
    String password = "password";
                       
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
                
        //open db connection
        
        try {
            con = DriverManager.getConnection(url, user, password);
            st = con.createStatement();
            rs = st.executeQuery(query);

        }catch (SQLException ex) {
            System.out.println(ex);
           
        }finally{            
            try {
                if (rs != null) {
                   
                }
                if (st != null) {
                    
                }
                if (con != null) {
                   
                }

            } catch (Exception ex) {
                
            }
        }    
        return rs;    
    }
    
    /**
     * Returns an arraylist of the commodities in the system
     * 
     * @return ArrayList - Contains a Commodity object representing each commodity in the database 
     */
    private static ArrayList setupCommodities(){
        ArrayList theCommodities = new ArrayList();
        //setup query to get commodity names
        String query = "SELECT name from commodities";
        ResultSet results = dBQuery(query);
        try{
             //for each name returned
            while(results.next()){
                //instantiate commodity obbject
                Commodity aCommodity = new Commodity(results.getString(1));
                //add to commodditties array
                theCommodities.add(aCommodity);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        try{
            results.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        
        return theCommodities;
    }
    
    /**
     * Returns an arraylist of the markets in the system
     * 
     * @return ArrayList - Contains a Market object representing each market in the database 
     */
    private static ArrayList setupMarkets(){
        ArrayList theMarkets = new ArrayList();
        String query = "SELECT name from markets";
        ResultSet results = dBQuery(query);
        try{
             //for each name returned
            while(results.next()){
                //instantiate commodity obbject
               Market aMarket = new Market(results.getString(1));
                //add to commodditties array
                theMarkets.add(aMarket);
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
        try{
            results.close();
        }catch(SQLException ex){
            System.out.println(ex);
        }
        return theMarkets;
    }
    
}