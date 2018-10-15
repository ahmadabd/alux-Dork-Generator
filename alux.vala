using Gtk;
using box;

public class aluxDG : Gtk.Window{
	
	public aluxDG(){
	
		this.title = "aluxDG";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(900, 450);		

		Gtk.Button button = new Gtk.Button.with_label ("click");
		Gtk.Box bBox = new Gtk.Box(Orientation.HORIZONTAL, 10);
		bBox.pack_start (button, true, false, 50);

		Gtk.Box vBox = new Box (Orientation.HORIZONTAL, 0);
		
		boxes name, pt, pt2, re;		

        	vBox.pack_start (name = new boxes(Gtk.Orientation.VERTICAL, 10, "Name of pages"), true, true, 10);
        	vBox.pack_start (pt = new boxes(Gtk.Orientation.VERTICAL, 10, "Page types"), true, true, 10);
        	vBox.pack_start (pt2 = new boxes(Gtk.Orientation.VERTICAL, 10, "Page types p.2"), true, true, 10);
        	vBox.pack_start (re = new boxes(Gtk.Orientation.VERTICAL, 10, "Requests"), true, true, 10);
	
                button.clicked.connect (() => {
                        stdout.printf (name.content());
                        stdout.printf ("\n");
                });

	        Gtk.Box mainBox = new Box (Orientation.VERTICAL, 0);
		mainBox.pack_start(vBox, true, true, 10);
		mainBox.pack_end(bBox, true, false, 0);	

	        this.add (mainBox);
	}

	
	public static int main(string[] args){

		Gtk.init(ref args);	
		var window = new aluxDG();
		window.show_all();
		Gtk.main();

		return 0;
	}
}
