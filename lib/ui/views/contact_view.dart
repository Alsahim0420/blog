import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pablos_blog/services/app_services.dart';
import 'package:provider/provider.dart';

class ContactView extends StatefulWidget {
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  void initState() {
    super.initState();
    final appService = Provider.of<AppServices>(context, listen: false);
    appService.getOpinions();
  }

  @override
  Widget build(BuildContext context) {
    final appService = Provider.of<AppServices>(context);
    return Container(
      color: Colors.purple[100],
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            children: [
              Text(
                'Noticias y Opiniones',
                style: GoogleFonts.montserratAlternates(
                    fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              appService.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 10,
                      ),
                    )
                  : Container(
                      color: Colors.cyan[50],
                      height: 500,
                      width: 1000,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: appService.opinions.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            color: Colors.grey[300],
                            width: 300,
                            child: Column(
                              children: [
                                Text(
                                  appService.opinions[index].name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserratAlternates(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  appService.opinions[index].opinion,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserratAlternates(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  appService.opinions[index].date.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserratAlternates(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
