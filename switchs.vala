/*
 * This file uses for making switch in window.
 */

using Gtk;


namespace switchB{
    public class switchBtn{
	
	private Gtk.Switch _switch;
	private int urlMode;

	public switchBtn(){

	    _switch = new Gtk.Switch();

	    _switch.set_active(false);		// Changes the state to on
	
	}

	public Gtk.Switch sw(){
	
  	    return this._switch;
	}


	private void checkSwMode(){

                if (_switch.active) {

                    urlMode = 1;
                }
                else {

                    urlMode = 0;
                }
        }

	public int returnMode(){

		checkSwMode();
		return this.urlMode;
	}

    }
}
