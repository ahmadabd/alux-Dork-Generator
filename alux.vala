using Gtk;

public class aluxDG : Gtk.Window{
	
	public aluxDG(){
	
		this.title = "aluxDG";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(850, 450);		

		//----------
		Gtk.Box labelBox = new Gtk.Box(Orientation.VERTICAL, 10);		
		Gtk.Label nameLabel = new Gtk.Label("Name of pages");

		Gtk.TextView nameText = new TextView ();
        	nameText.editable = true;
        	nameText.cursor_visible = false;
		nameText.set_wrap_mode (Gtk.WrapMode.WORD);

        	Gtk.ScrolledWindow nameScroll = new ScrolledWindow (null, null);
        	nameScroll.set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
	        nameScroll.add (nameText);
	
		labelBox.pack_start(nameLabel, false, false, 10);
		labelBox.pack_start(nameScroll, true, true, 10);

		//typeText.buffer.text = "hello";

		//----------

		Gtk.Button button = new Gtk.Button.with_label ("click");
		button.clicked.connect (() => {
			print (nameText.buffer.text);
			print ("\n");
		});

		Gtk.Box bBox = new Gtk.Box(Orientation.HORIZONTAL, 10);
		bBox.pack_start (button, true, false, 50);

		Gtk.Box vBox = new Box (Orientation.HORIZONTAL, 0);
        	vBox.pack_start (labelBox, true, true, 10);

	        Gtk.Box mainBox = new Box (Orientation.VERTICAL, 0);
		mainBox.pack_start(vBox, true, true, 10);
		mainBox.pack_start(bBox, true, false, 0);	

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
