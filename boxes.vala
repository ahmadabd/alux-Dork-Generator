/*
 * This file uses for making box in window.
 */

using Gtk;

namespace box{
    public class boxes:Gtk.Box{

	private Gtk.TextView textBox;

	public boxes(Gtk.Orientation or, int space, string labelContent){

	    Object(orientation:or, spacing:space);
            Gtk.Label nameLabel = new Gtk.Label(labelContent);

            textBox = new TextView ();
            textBox.editable = true;
	    //textBox.border_width = 10;
            textBox.cursor_visible = false;
            textBox.set_wrap_mode (Gtk.WrapMode.WORD);

            Gtk.ScrolledWindow scroll = new ScrolledWindow (null, null);
            scroll.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
            scroll.add (textBox);
	    
    	    this.pack_start(nameLabel, false, false, 10);
	    this.pack_end(scroll, true, true, 10);
	
	    //this.contentBox = textBox.buffer.text;
	}


	public string content(){

	    return textBox.buffer.text;
	}
    }
}
