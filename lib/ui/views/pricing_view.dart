import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pablos_blog/models/opinion_model.dart';
import 'package:pablos_blog/providers/page_provider.dart';
import 'package:pablos_blog/services/app_services.dart';
import 'package:pablos_blog/services/preferences.dart';
import 'package:provider/provider.dart';

class PricingView extends StatelessWidget {
  static String name = "";
  static String opinion = "";
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    final serviceProvider = Provider.of<AppServices>(context, listen: false);
    return Container(
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Deja tu opinion',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Ingresa tu nombre",
              style: GoogleFonts.montserratAlternates(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey[700]!,
              ),
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            width: 400,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                hintText: "Pepito Perez Mendez",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Dejanos tu aporte",
              style: GoogleFonts.montserratAlternates(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey[700]!,
              ),
              color: Colors.brown[200],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 200,
            width: double.infinity,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value) {
                opinion = value;
              },
              maxLines: 10,
              decoration: InputDecoration(
                hintText:
                    "Aquí puedes dejarnos tu aporte, es muy valioso para nosotros saber que opinas ;)",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.brown,
                ),
                onPressed: () async {
                  final tempList = await serviceProvider.getOpinions();
                  tempList.add(
                    OpinionModel(
                        date: DateTime.now(), name: name, opinion: opinion),
                  );
                  await serviceProvider.saveOpinion(tempList);

                  await pageProvider.goTo(3);
                },
                child: Text(
                  "Enviar",
                  style: GoogleFonts.montserratAlternates(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
