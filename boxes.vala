/*
 * This file uses for making box in window.
 */

using Gtk;

namespace box{
    public class boxes:Gtk.Box{
	public string contentBox;

	public boxes(Gtk.Orientation or, int space, string labelContent){
	    Object(orientation:or, spacing:space);
            Gtk.Label nameLabel = new Gtk.Label(labelContent);

            Gtk.TextView textBox = new TextView ();
            textBox.editable = true;
            textBox.cursor_visible = false;
            textBox.set_wrap_mode (Gtk.WrapMode.WORD);

            Gtk.ScrolledWindow scroll = new ScrolledWindow (null, null);
            scroll.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
            scroll.add (textBox);
	    
    	    this.pack_start(nameLabel, false, false, 10);
	    this.pack_end(scroll, true, true, 10);
	
	    contentBox = textBox.buffer.text;
	}
    }
}
