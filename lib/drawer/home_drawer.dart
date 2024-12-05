import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    TextStyle ? tittleLargeStyle = Theme.of(context).textTheme.titleLarge ?.copyWith(fontSize: 24);
    return SizedBox(
      width: screenSize.width*0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: screenSize.height*0.2 ,
            width: double.infinity,
            color: AppTheme.primary,
            child: Text("News App!",
            style: tittleLargeStyle,
            ),
          ),

          Expanded(
            child: Container(
              color: AppTheme.white,
                padding: const EdgeInsetsDirectional.only(top: 30,start: 12),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {} ,
                      child: Row(
                        children: [
                          Icon(Icons.menu),
                          SizedBox(width: 8,),
                          Text("Categories",
                            style: tittleLargeStyle ?.copyWith(color: AppTheme.black),
                          ),
                          
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 12,),

                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.settings),
                           SizedBox(width: 8,),
                          Text("Settings",
                            style: tittleLargeStyle ?.copyWith(color: AppTheme.black),
                           ),
                          
                        ],
                      ),
                    )
                  ]
                  ),
              
            ),
          )
        ],
      ),
    );
  }
}