using Gtk;
using box;
using switchB;


public class aluxDG : Gtk.Window{
	
	private boxes name;
	private boxes pt;		
	private	boxes pt2;
	private boxes res;

	switchBtn sw = new switchBtn();
	
	public aluxDG(){
	
		this.title = "aluxDG";
		this.window_position = WindowPosition.CENTER;
		this.destroy.connect(Gtk.main_quit);
		this.set_default_size(1000, 450);		

		// Add css configs:
		var css_provider = new Gtk.CssProvider();
        	string path = "style.css";

	        // test if the css file exist
        	if (FileUtils.test (path, FileTest.EXISTS))
        	{
            		try {
                		css_provider.load_from_path(path);
		                Gtk.StyleContext.add_provider_for_screen(screen, css_provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);
            		} catch (Error e) {
                		error ("Cannot load CSS stylesheet: %s", e.message);
            		}
        	}

		Gtk.Button button = new Gtk.Button.with_label ("Start Generate");
		button.get_style_context().add_class("gnBtn");
		Gtk.Box bBox = new Gtk.Box(Orientation.HORIZONTAL, 10);
		bBox.pack_start (button, true, false, 50);

		Gtk.Box swBox = new Gtk.Box(Orientation.VERTICAL, 10);

		//swBox.pack_start(switchLabelDesigner("site :"), true, false, 0);
		//swBox.pack_start(switchLabelDesigner("type :"), true, false, 0);
		swBox.pack_start(switchLabelDesigner("inurl :"), true, false, 0);		

		bBox.pack_end(swBox, true, false, 0);				// Adding swBox to end of button box

		Gtk.Box vBox = new Box (Orientation.HORIZONTAL, 0);
		
        	vBox.pack_start (name = new boxes(Gtk.Orientation.VERTICAL, 10, "Name of pages"), true, true, 10);
        	vBox.pack_start (pt = new boxes(Gtk.Orientation.VERTICAL, 10, "Page types"), true, true, 10);
        	vBox.pack_start (pt2 = new boxes(Gtk.Orientation.VERTICAL, 10, "Page types p.2"), true, true, 10);
        	vBox.pack_start (res = new boxes(Gtk.Orientation.VERTICAL, 10, "Requests"), true, true, 10);
	
                button.clicked.connect (makingDorkFile);

	        Gtk.Box mainBox = new Box (Orientation.VERTICAL, 0);
		mainBox.pack_start(vBox, true, true, 10);
		mainBox.pack_end(bBox, true, false, 10);	

	        this.add (mainBox);
	}

	
	private Gtk.Box switchLabelDesigner(string labelName){

		Gtk.Box lbBox = new Gtk.Box(Orientation.HORIZONTAL, 10);     // Contains label and switch of inurl Button

                Gtk.Label lb = new Gtk.Label (labelName);

                lbBox.pack_start(lb, true, false, 0);                  // Adding label and switch to HORIZONTAL box
                lbBox.pack_start(sw.sw(), true, false, 0);
 		if(labelName != "inurl :"){

                        Gtk.Entry entry = new Gtk.Entry ();
                        lbBox.pack_start(entry, true, false, 0);
                }

		return lbBox;
	}


	private void makingDorkFile(Gtk.Button btn){

		string[] nameList = name.content().split("\n");
		string[] ptList = pt.content().split("\n");
		string[] pt2List = pt2.content().split("\n");
		string[] resList = res.content().split("\n");	
		string result;
		int rand = Random.int_range(1, 10000);

		int mode = sw.returnMode();

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

				    if(mode == 1){
				    
					result = "inurl:" + nameList[i] + ptList[j] + pt2List[k] + resList[q];
	            		        data_stream.put_string (result + "\n");  		// Writing result on file
				    }
				    else{

					result = nameList[i] + ptList[j] + pt2List[k] + resList[q];
                                        data_stream.put_string (result + "\n");                 // Writing result on file
				    }
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
