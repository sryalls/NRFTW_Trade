/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.util.List;  
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;
import java.util.Collections;

/**
 *
 * @author sandy
 */


public class TradeCycle {
    
    TradeCycle(){
        
    }
    
    public void run(ArrayList theMarkets, ArrayList theCommodities, ArrayList theTags){
        //The trade cycle
        //for each market. 
        for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){
            Market aMarket = aMarketItterator.next();
            //for each commodity
            for(Iterator<Commodity> aCommodityItterator = theCommodities.iterator(); aCommodityItterator.hasNext();){
                Commodity aCommodity = aCommodityItterator.next();
                String getPRateQuery = "select p_rate, stock from trade_matrix where market_name = '"+aMarket.theName+"' and commodity_name = '"+aCommodity.theName+"'";
                ResultSet pRateResults = NRFTW_Trade.dBQuery(getPRateQuery);
                int productionRate = 0;
                int stockPile = 0;
                try{
                    while(pRateResults.next()){
                        productionRate = pRateResults.getInt(1);
                        stockPile = pRateResults.getInt(2);
                }
                }catch(SQLException ex){
                    System.out.println(ex);
                } 
                //@todo - amalgamate prices into trade matrix db table
                String getPriceQuery = "select price from prices where market = '"+aMarket.theName+"' and commodity = '"+aCommodity.theName+"'";
                ResultSet priceResults = NRFTW_Trade.dBQuery(getPriceQuery);
                int price = 0;
                
                try{
                    while(pRateResults.next()){
                        price = priceResults.getInt(1);
                        
                }
                }catch(SQLException ex){
                    System.out.println(ex);
                } 
                //for each point of produciton rate
                for(int i=1;i<=productionRate;i++)
                {                
                    //add a unit to the stock pile
                    stockPile++;
                    //alter the price downwards price
                    if(price > 0){
                        price = (price - ((price/stockPile)/2));
                    }
                }
                //  write new stock and price to DB
                String stockInsertion = "update trade_matrix set stock = "+stockPile+" where market_name = '"+aMarket.theName+"' and commodity_name = '"+aCommodity.theName+"'";
                NRFTW_Trade.dBUpdate(stockInsertion);
                String newPrice = "update prices set price = "+price+"  where market = '"+aMarket.theName+"' and commodity = '"+aCommodity.theName+"'";
                NRFTW_Trade.dBUpdate(newPrice);
            //close comodity loop
            }
            //for each tag
            for(Iterator<Tag> aTagItterator = theTags.iterator(); aTagItterator.hasNext();){
                Tag aTag = aTagItterator.next();
                //get consumption rate
                String getPRateQuery = "select c_rate from trade_matrix where market_name = '"+aMarket.theName+"' and tag_name = '"+aTag.theName+"' and tag_grade = '"+aTag.theGrade+"'";
                ResultSet pRateResults = NRFTW_Trade.dBQuery(getPRateQuery);
                int consumptionRate = 0;
                
                try{
                    while(pRateResults.next()){
                        consumptionRate = pRateResults.getInt(1);                        
                    }
                }catch(SQLException ex){
                    System.out.println(ex);
                } 		
		//get each comodity
                    //include any of a higher tag
                String commodityQuery = "select trade_matrix.commodity_name, trade_matrix.stock, prices.price from trade_matrix inner join prices on trade_matrix.commodity_name = prices.commodity and trade_matrix.market_name = prices.market where trade_matrix.commodity_name in (select commodity from commodities_tags where tag = '"+aTag.theName+"' and grade >= "+aTag.theGrade+") and trade_matrix.market_name = '"+aMarket.theName+"' order by price asc";
                ResultSet commodityResults = NRFTW_Trade.dBQuery(commodityQuery);
                 ArrayList theConsumedCommodities = new ArrayList();
                try{                   
                    while(commodityResults.next()){
                        String thisCommodityName = commodityResults.getString(1);
                        int thisCommodityStock = commodityResults.getInt(2);
                        int thisCommodityPrice = commodityResults.getInt(3);
                        Commodity thisCommodity = new Commodity(thisCommodityName,thisCommodityStock,thisCommodityPrice);
                        theConsumedCommodities.add(thisCommodity);
                        Collections.sort(theConsumedCommodities);
        		//rank by local price
                    }                                                                  
                }catch(SQLException ex){
                    System.out.println(ex);
                } 
                //loop until consumption rate is satisfied
                int fulfilledConsumption = 0;
                while(fulfilledConsumption < consumptionRate){                	
                    //get cheapest commodity
                    Commodity forConsumption = (Commodity) theConsumedCommodities.get(0);
                        //if commodity has stockpile
                        if(forConsumption.theStockLevel > 0){
                            //..consume unit of that commodity
                            forConsumption.theStockLevel --;
                            forConsumption.thePrice = (forConsumption.thePrice + ((forConsumption.thePrice/forConsumption.theStockLevel)/2));
                            //adjust price of commodity
                        }else{
                            //adjust price of commodity by more
                            forConsumption.thePrice = (forConsumption.thePrice + (forConsumption.thePrice/2));
                        }
                    //add one to consumption rate satisfaction
                    fulfilledConsumption ++;
                    // resort commodities\
                }
            //close tag loop
            }
        //close market loop 
        }
        //for each market
        for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){
            //for each comodity
                //trade loop (loop until no trade is made)
                    //if stockpile <= 0 
                        //mark commodity shortage
			//find cheapest linked market
			//if market has stock & transfer total < tranfer rate & linked price < local price
                            //subtract 1 unit from linked market stockpile
                            //adjust linked marked price up
                            //add  1 unit to local stock pile	
                            //adjust local price down
		//Close trade loop
            //close comodity loop
        //close market loop
        }
    }
    
        
}
