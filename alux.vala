using Gtk;
using box;

public class aluxDG : Gtk.Window{
	
	public aluxDG(){
	
		this.title = "aluxDG";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(900, 450);		

		Gtk.Button button = new Gtk.Button.with_label ("click");
		button.clicked.connect (() => {
			print ("Hello");
			print ("\n");
		});

		Gtk.Box bBox = new Gtk.Box(Orientation.HORIZONTAL, 10);
		bBox.pack_start (button, true, false, 50);

		Gtk.Box vBox = new Box (Orientation.HORIZONTAL, 0);
        	vBox.pack_start (new box.boxes(Gtk.Orientation.VERTICAL, 10, "Name of pages"), true, true, 10);
        	vBox.pack_start (new box.boxes(Gtk.Orientation.VERTICAL, 10, "Page types"), true, true, 10);
        	vBox.pack_start (new box.boxes(Gtk.Orientation.VERTICAL, 10, "Page types p.2"), true, true, 10);
        	vBox.pack_start (new box.boxes(Gtk.Orientation.VERTICAL, 10, "Requests"), true, true, 10);

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
