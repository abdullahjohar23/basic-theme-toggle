import 'package:flutter/material.dart';

class Toggle extends StatefulWidget {
    const Toggle({super.key});

    @override
    State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
    bool isDarkMode = false;

    @override
    Widget build(BuildContext context) {
        final double deviceWidth = MediaQuery.of(context).size.width;
        final double deviceHeight = MediaQuery.of(context).size.height;
        
        final bgColor = isDarkMode ? Color(0xFF1E1E1E) : Colors.white;
        final textColor = isDarkMode ? Colors.white : Colors.black;
        final switchBgColor = isDarkMode ? Colors.yellow : Color(0xFF1E1E1E);
        final switchColor = isDarkMode ? Color(0xFF1E1E1E) : Colors.white;

        return Scaffold(
            backgroundColor: bgColor,
            
            appBar: AppBar(
                backgroundColor: bgColor,
                title: Text(
                    'Theme Toggle',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                    ),
                ),
                centerTitle: true,
                
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(1), // Size.fromHeight(1) creates a Size(width: unspecified, height: 1)
                    child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey, // customize the line color
                    ),
                ),
            ),

            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        // Theme (dark / light) Label
                        Text(
                            isDarkMode ? "DARK MODE" : "LIGHT MODE",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                            ),
                        ),
                        
                        SizedBox(height: deviceHeight*0.035),
                        
                        GestureDetector(
                            onTap: () {
                                setState(() {
                                    isDarkMode = !isDarkMode;
                                });
                            },
                            
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: deviceWidth*0.17,
                                height: deviceHeight*0.045,
                                padding: EdgeInsets.all(4),
                                
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: switchBgColor,
                                    boxShadow: isDarkMode
                                    ?
                                    [
                                        BoxShadow(
                                            color: Colors.yellow.withAlpha(153), // 153 = 60% opacity
                                            blurRadius: 15,
                                            offset: Offset(0, 3), // control the position of the shadow → Offset(x, y): x = 0 as no horizontal shift, y = 3 as push the shadow 3 pixels downward
                                        ),
                                    ]
                                    :
                                    [
                                        // do nothing
                                    ]
                                ),
                                
                                // switch
                                child: AnimatedAlign(
                                    duration: const Duration(milliseconds: 300),
                                    alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
                                    
                                    child: Container(
                                        width: 30, // width of the switch
                                        height: 30, // height of the switch
                                        decoration: BoxDecoration(
                                            color: switchColor,
                                            shape: BoxShape.circle, // switch shape
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
