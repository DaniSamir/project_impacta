// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_impacta/screens/dashboard.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;

  @override
  final Size preferredSize;

  TopBar({
    required this.title,
    required this.child,
    required this.onPressed,
  }) : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'topBarBtn',
                child: Card(
                  elevation: 10,
                  shape: kBackButtonShape,
                  child: MaterialButton(
                    height: 50,
                    minWidth: 50,
                    elevation: 10,
                    shape: kBackButtonShape,
                    onPressed: () {
                      MaterialPageRoute(
                          builder: (context) => DashBoardScreen());
                    },
                    child: child,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      MaterialPageRoute(
                          builder: (context) => DashBoardScreen());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              // color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  color: Colors.black54,
);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.elevation = 2.0,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Wrap(
        children: [
          Container(
            color: Color(0XFFB71731),
            // decoration:
            // const BoxDecoration(
            //   gradient: RadialGradient(
            //     radius: 2.5,
            //     stops: [
            //       0.0,
            //       0.27,
            //       1.0,
            //     ],
            //     colors: [
            //       Color(0XFFB71731),
            //       Color(0XFFB71731),
            //       Color(0XFFA5004E),
            //     ],
            //   ),
            // ),
            child: AppBar(
              centerTitle: true,
              leading: leading,
              title: Padding(child: title, padding: EdgeInsets.only(top: 25)),
              backgroundColor: Color(0XFFB71731),
              actions: actions,
            ),
          ),
          SizedBox.fromSize(
            size: preferredSize,
            child: LayoutBuilder(
              builder: (context, constraint) {
                return ClipRect(
                  child: Container(
                    padding: EdgeInsets.all(0),
                    height: 100,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFB71731),
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(40.0),
                            bottomRight: const Radius.circular(40.0),
                          )),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(70, 40, 20, 0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage:
                                      AssetImage('images/user.png'),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Usuário Teste',
                                      style: GoogleFonts.rancho(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150.0);
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 8;
        return ClipRect(
          child: OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: SizedBox(
              width: width,
              height: width,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: width / 2 - preferredSize.height / 2),
                child:
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     boxShadow: [
                    //       BoxShadow(color: Colors.black54, blurRadius: 10.0)
                    //     ],
                    //     gradient: RadialGradient(
                    //       radius: 2.5,
                    //       stops: [
                    //         0.0,
                    //         0.27,
                    //         1.0,
                    //       ],
                    //       colors: [
                    //         Color(0XFFB71731),
                    //         Color(0XFFB71731),
                    //         Color(0XFFA5004E),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0XFFB71731),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: 10.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}
