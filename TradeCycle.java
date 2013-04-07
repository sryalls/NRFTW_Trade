/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.util.List;  
import java.util.ArrayList;
/**
 *
 * @author sandy
 */
import java.util.Iterator;

public class TradeCycle {
    
    TradeCycle(){
        
    }
    
    public void run(ArrayList theMarkets, ArrayList theCommodities){
        //The trade cycle
        //for each market. 
        for(Iterator<Market> aMarketItterator = theMarkets.iterator(); aMarketItterator.hasNext();){
            Market aMarket = aMarketItterator.next();
            //for each commodity
            for(Iterator<Commodity> aCommodityItterator = theCommodities.iterator(); aCommodityItterator.hasNext();){
                Commodity aCommodity = aCommodityItterator.next();
                //for each point of produciton rate
                    //add a unit to the stock pile
                    //subtract a unit from the price
                    //remove the consumption rate from the stock pile
			//subtract a unit from the stock pile
			//add a unit from the price
            //close comodity loop
            }
            //for each tag
		//get consumption rate
		//get each comodity
                    //include any of a higher tag
		//rank by local price
		//loop until consumption rate is satisfied
                    //for each commodity 
                    //if commodity has stockpile
                        //..consume unit of that commodity
			//adjust price of commodity
			//add one to consumption rate satisfaction
			//to next commodity
                    //close commodity loop
            //close tag loop
        //close market loop 
        //for each market
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
