@theme '~/.cache/wal/rofi-colors.rasi'

configuration {{
	show-icons: true;
}}

window {{
    transparency:                "real";
    location:                    center;
    anchor:                      center;
    border:                      2px;
    border-color:                @foreground;
    fullscreen:                  false;
    width:                       50%;
  	height: 					 50%; 
	x-offset:                    0px;
    y-offset:                    0px;

    enabled:                     true;
    border-radius:               30px 5px 30px 5px;
    cursor:                      "default";
    background-color:            @background;
}}

mainbox {{
    enabled:                     true;
    spacing:                     0px;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ "inputbar", "listbox" ];
}}

listbox {{
    spacing:                     20px;
    padding:                     20px;
    background-color:            transparent;
    orientation:                 vertical;
    border-color:                @foreground;
    children:                    [ "message", "listview" ];
}}

inputbar {{
    enabled:                     true;
    spacing:                     10px;
    padding:                     30px 60px;
    background-color:            transparent;
    background-image: 			 url("{wallpaper}", width);
    text-color:                  @foreground;
	border-radius: 				 15px 5px 15px 5px;
    orientation:                 horizontal;
    children:                    [ "textbox-prompt-colon", "entry", "dummy", "entry-counter"];
}}

textbox-prompt-colon {{
    enabled:                     true;
    expand:                      false;
    str:                         " ";
    padding:                     10px 15px;
    border-radius:               15px 5px 15px 5px;
    background-color:            rgba({background.rgb}, 0.75);
    text-color:                  inherit;
}}
entry {{
    enabled:                     true;
    expand:                      false;
    width:                       250px;
    padding:                     12px 16px;
    border-radius:               5px 15px 5px 15px;
    background-color:            rgba({background.rgb}, 0.75);
    text-color:                  inherit;
    cursor:                      text;
    placeholder:                 "Search";
    placeholder-color:           rgba({foreground.rgb}, 0.5);
}}
dummy {{
    expand:                      true;
    background-color:            transparent;
}}

entry-counter {{
    enabled: 					 true; 
    expand:                      false;
	orientation:				 horizontal;	
    padding:                     12px 16px;
	border-radius:               15px 5px 15px 5px;
    background-color:            rgba({background.rgb}, 0.75);
    text-color:                  inherit;
	children: 					 [ num-filtered-rows, textbox-divider, num-rows ];
}}

#num-filtered-rows {{
	enabled: 					 true;	
	text-color: 				 inherit;
}}

#textbox-divider {{
	enabled: 					 true;
	text-color: 				 inherit;
	str: 						 "/";
}}

#num-rows {{
	enabled: 					 true;
	text-color: 				 inherit;
}}

listview {{
    enabled:                     true;
    columns:                     1;
    lines:                       6;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   true;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    
    background-color:            transparent;
    text-color:                  @foreground;
    cursor:                      "default";
}}

scrollbar {{
	enabled:					 true;
    width: 						 4px;
	border-radius: 				 5px;
	margin: 					 0px 0px 0px 10px;		
	background-color: 			 rgba({foreground.rgb}, 0.3);
	handle-color: 				 {color2};
    handle-width: 				 4px;
}}

element {{
    enabled:                     true;
    spacing:                     10px;
    padding:                     10px;
    border-radius:               15px 5px 15px 5px;
    background-color:            transparent;
    text-color:                  @foreground;
    cursor:                      pointer;
}}
element normal.normal {{
    background-color:            inherit;
    text-color:                  inherit;
}}
element normal.urgent {{
    background-color:            @urgent-background;
    text-color:                  @urgent-foreground;
}}
element normal.active {{
    background-color:            @normal-background;
    text-color:                  @normal-foreground;
}}
element selected.normal {{
    background-color:            @selected-normal-background;
    text-color:                  @selected-normal-foreground;
}}
element selected.urgent {{
    background-color:            @selected-urgent-background;
    text-color:                  @selected-urgent-foreground;
}}
element selected.active {{
    background-color:            @selected-active-background;
    text-color:                  @selected-active-foreground;
}}
element-icon {{
    background-color:            transparent;
    text-color:                  inherit;
    size:                        32px;
    cursor:                      inherit;
    border-radius:               15px 5px 15px 5px;
}}
element-text {{
    background-color:            transparent;
    text-color:                  inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.0;
}}

