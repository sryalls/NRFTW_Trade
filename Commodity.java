/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.util.Iterator;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sandy
 */
public class Commodity {
    public ArrayList theTags;
    public String theName;
    public int theStockLevel;
    public int thePrice;
    
    Commodity(){
    
    }
    
    Commodity(String aName){
        theName = aName;
        setupTags();
    }
    
    Commodity(String aName, int aStock, int aPrice){
        theName = aName;
        theStockLevel = aStock;
        thePrice = aPrice;
        
        setupTags();
    }
    /**
     * Prints the name and grade of the tag relating to this commodity.
     */
    private void displayTags(){
        for(Iterator<Tag> aTag = this.theTags.iterator(); aTag.hasNext();){
            Tag item = aTag.next();
            System.out.println("Tag: "+item.theName+" grade: "+item.theGrade);
            
        }
        
    }
    
    /**
     * Sets up the array list of tags relating to this commodity
     */
    private void setupTags(){
        ArrayList someTags = new ArrayList();
        if(theName != null){
            String tagsQuery = "select tag, grade from commodities_tags where commodity ='"+theName+"'";
            ResultSet results = NRFTW_Trade.dBQuery(tagsQuery);
            //theTags = someTags;
             try{
             //for each name returned
            while(results.next()){
                //get tags strings
                String aTagName = results.getString(1);
                int aGrade = results.getInt(2);
                //create tag object
                Tag aNewTag = new Tag(aTagName,aGrade);
                //add to tag arraylist
                someTags.add(aNewTag);
            }
            }catch(SQLException ex){
                System.out.println(ex);
            }
            try{
                results.close();
            }catch(SQLException ex){
                System.out.println(ex);
            }
        }
        theTags = someTags;
    }
    
}
