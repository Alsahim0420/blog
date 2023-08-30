import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingView extends StatefulWidget {
  static String name = "";
  static String opinion = "";

  @override
  State<PricingView> createState() => _PricingViewState();
}

class _PricingViewState extends State<PricingView> {
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;
  List<Map<String, dynamic>> dataMap = [
    {
      "name": "Centro María Auxiliadora",
      "image":
          "data:image/jpeg;base64,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",
      "data": {
        "info1": "fsdfas",
        "info2": "sa fsfaf sf a",
        "info3": "fs osah ks sg ",
        "info4": " as s asf ssf",
      },
    }
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => closeMenu(),
      child: Container(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Mapa de Centros',
                  style: GoogleFonts.abhayaLibre(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 13, 71, 161),
                        width: 3,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    height: size.height * 0.85,
                    width: size.width * 0.5,
                    child: Image.network(
                        "https://mapademexicosinnombres.com/wp-content/uploads/2023/03/Mapa-de-Colombia-a-color-y-con-nombres.png"),
                  ),
                  Positioned(
                    height: size.height * 0.81,
                    left: size.width * 0.212,
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          openMenu(size, "Bogotá", dataMap);
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.amber,
                            size: size.height * 0.04,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void closeMenu() {
    try {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } catch (_) {}
    _isMenuOpen = !_isMenuOpen;
  }

  void openMenu(Size size, String title, List<Map<String, dynamic>> data) {
    _overlayEntry = _overlayEntryBuilder(size, title, data);
    Overlay.of(context).insert(_overlayEntry!);
    _isMenuOpen = !_isMenuOpen;
  }

  OverlayEntry _overlayEntryBuilder(
    Size size,
    String title,
    List<Map<String, dynamic>> data,
  ) {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          left: 50,
          top: 20,
          width: size.width * 0.2,
          height: size.height * 0.5,
          child: GestureDetector(
            onTap: () => closeMenu(),
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 13, 71, 161),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.43,
                        width: size.width * 0.18,
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.church),
                              title: Text(data[index]["name"]),
                              onTap: () {
                                closeMenu();
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return InfoAlert(
                                      size: size,
                                      title: data[index]["name"],
                                      info: data[index]["data"],
                                      image: data[index]["image"],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class InfoAlert extends StatelessWidget {
  const InfoAlert({
    Key? key,
    required this.size,
    required this.title,
    required this.image,
    required this.info,
  }) : super(key: key);

  final Size size;
  final String title;
  final String image;

  final Map<String, dynamic> info;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: size.height * 0.7,
          width: size.width * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 13, 71, 161),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  height: size.height * 0.5,
                  color: Colors.red,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.1,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "cerrar".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pop(context, false);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> _onWillPop(BuildContext context) async {
  //   Navigator.pop(context);
  //   return false;
  // }
}
