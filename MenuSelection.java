/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package nrftw_trade;
import java.util.ArrayList;
/**
 *
 * @author sandy
 */
public class MenuSelection {

    private int theSelection;
    private ArrayList theParamaters;   
    
    MenuSelection(){
    }
    
    MenuSelection(int aSelection){
        theSelection = aSelection;
    }
    
    public void addParamater(Object aParamater){
        theParamaters.add(aParamater);
    }
   
    public void setSelection(int aSelection){
        theSelection = aSelection;
    }
    
    public int getSelection(){
        return theSelection;
    }
    
    public ArrayList getParamaters(){
        return theParamaters;
    }
}
