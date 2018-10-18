using Gtk;
using box;

public class aluxDG : Gtk.Window{
	
	private boxes name;
	private boxes pt;		
	private	boxes pt2;
	private boxes res;	

	public aluxDG(){
	
		this.title = "aluxDG";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(1000, 450);		

		Gtk.Button button = new Gtk.Button.with_label ("Generate");
		Gtk.Box bBox = new Gtk.Box(Orientation.HORIZONTAL, 10);
		bBox.pack_start (button, true, false, 50);

		Gtk.Box vBox = new Box (Orientation.HORIZONTAL, 0);
		
        	vBox.pack_start (name = new boxes(Gtk.Orientation.VERTICAL, 10, "Name of pages"), true, true, 10);
        	vBox.pack_start (pt = new boxes(Gtk.Orientation.VERTICAL, 10, "Page types"), true, true, 10);
        	vBox.pack_start (pt2 = new boxes(Gtk.Orientation.VERTICAL, 10, "Page types p.2"), true, true, 10);
        	vBox.pack_start (res = new boxes(Gtk.Orientation.VERTICAL, 10, "Requests"), true, true, 10);
	
                button.clicked.connect (makingDorkFile);

	        Gtk.Box mainBox = new Box (Orientation.VERTICAL, 0);
		mainBox.pack_start(vBox, true, true, 10);
		mainBox.pack_end(bBox, true, false, 0);	

	        this.add (mainBox);
	}


	private void makingDorkFile(Gtk.Button btn){

		string[] nameList = name.content().split("\n");
		string[] ptList = pt.content().split("\n");
		string[] pt2List = pt2.content().split("\n");
		string[] resList = res.content().split("\n");	
		string result;
		int rand = Random.int_range(1, 10000);

		makeResultDir();  							// Makes result dir

		var file = File.new_for_path (@"result/result$rand.txt");    		// Making File
		
		{ // File Block
		    var file_stream = file.create (FileCreateFlags.NONE);  		// Creating File

            	    if (file.query_exists ()) {
                        stdout.printf ("File successfully created.\n");
                    } 

		    var data_stream = new DataOutputStream (file_stream);

		    for(int i = 0; i < nameList.length; i++){
			for(int j = 0; j < ptList.length; j++){
			    for(int k = 0; k < pt2List.length; k++){
			        for(int q = 0; q < resList.length; q++){
			 
				    result = nameList[i] + ptList[j] + pt2List[k] + resList[q];
	            		    data_stream.put_string (result + "\n");  		// Writing result on file
				}
			    }
			}
                    }

		} // End of File block
	}


	public void makeResultDir(){

		if (!GLib.FileUtils.test("result", GLib.FileTest.IS_DIR)) {
			stdout.printf("result Directory Created.\n");
			File file = File.new_for_commandline_arg ("result");
			file.make_directory ();
		}
	}

	
	public static int main(string[] args){

		Gtk.init(ref args);

		var window = new aluxDG();
		window.show_all();
		Gtk.main();

		return 0;
	}
}
