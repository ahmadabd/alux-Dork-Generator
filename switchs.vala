/*
 * This file uses for making switch in window.
 */

using Gtk;


namespace switchB{
    public class switchBtn{
	
	private Gtk.Switch _switch;

	public switchBtn(){

	    _switch = new Gtk.Switch();

            _switch.notify["active"].connect (() => {

                if (_switch.active) {
                    print ("The switch is on!\n");
                } 
		else {
	            print ("The switch is off!\n");
                }
            });

            // Changes the state to on:
            _switch.set_active (true);

	}
	
	public Gtk.Switch sw(){
	
  	    return this._switch;
	}
    }
}
