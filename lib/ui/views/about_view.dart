import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> titleList = [
      "¿Qué es un motor de bases de datos?",
      "Qué características tiene una base de datos relacional?",
      "¿Qué es una base de datos no relacional?",
      "¿Cuáles son las bases de datos no relacionales que se manejan en la actualidad?",
      "¿Cuáles son los motores de bases de datos relacionales licenciados más utilizados en el desarrollo de aplicaciones?",
      "¿Cuáles son los motores de bases de datos relacionales Open Source?",
      "¿Qué es la normalización de base de datos?",
      "¿Qué formas normales existen?",
      "¿Qué criterios se deben tener en cuenta para establecer estrategias de seguridad?",
    ];
    final List<String> dataList = [
      "Un motor de base de datos es un software o componente que se encarga de gestionar y proporcionar acceso a una base de datos. Es el núcleo de un sistema de gestión de bases de datos (SGBD) y se encarga de administrar y manipular los datos almacenados en la base de datos.",
      "Estructura tabular: Una base de datos relacional organiza los datos en tablas compuestas por filas y columnas.\nRelaciones entre tablas: Las bases de datos relacionales establecen relaciones entre tablas utilizando claves primarias y claves externas. \nIntegridad de los datos: Las bases de datos relacionales aplican reglas de integridad para garantizar la consistencia y precisión de los dato\nConsultas SQL: Las bases de datos relacionales utilizan el lenguaje de consulta estructurado (SQL) para realizar consultas y manipulaciones de datos. SQL proporciona una amplia gama de operaciones, como selección, inserción, actualización y eliminación de datos, así como consultas más complejas utilizando cláusulas JOIN, agregaciones y filtros.\n Escalabilidad y rendimiento: Las bases de datos relacionales son conocidas por su capacidad para manejar grandes cantidades de datos y consultas complejas. \n Transacciones ACID: Las bases de datos relacionales cumplen con las propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad). ",
      "Una base de datos no relacional, también conocida como base de datos NoSQL (Not Only SQL), es un tipo de sistema de gestión de bases de datos que difiere en su modelo de almacenamiento y recuperación de datos en comparación con las bases de datos relacionales tradicionales.",
      "En la actualidad, existen varios tipos de bases de datos NoSQL que se utilizan en diferentes contextos y escenarios. Algunas de las bases de datos NoSQL más populares son: \n-MongoDB\n-Cassandra\n-Redis\n-Neo4j\n-Couchbase\n-Amazon DynamoD",
      "En el desarrollo de aplicaciones, algunos de los motores de bases de datos relacionales licenciados más utilizados son:\n-Oracle Database\n-Microsoft SQL Server\n-IBM DB2\n-PostgreSQL",
      "Existen varios motores de bases de datos relacionales de código abierto (Open Source) ampliamente utilizados en el desarrollo de aplicaciones.",
      "La normalización de bases de datos es un proceso de diseño en el que se organizan los datos en una estructura lógica eficiente y libre de redundancias. El objetivo principal de la normalización es minimizar la redundancia de datos y garantizar la integridad de la información almacenada.",
      "Existen varias formas normales que definen reglas específicas para el diseño y la estructura de una base de datos relacional. Estas formas normales se conocen comúnmente como 1NF, 2NF, 3NF, BCNF (Boyce-Codd Normal Form) y 4NF, y cada una de ellas establece criterios adicionales para la organización de los datos.",
      "Al establecer estrategias de seguridad, se deben considerar varios criterios para garantizar la protección adecuada de los sistemas y los datos.",
    ];

    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Temas de discusión',
                style: GoogleFonts.montserratAlternates(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.grey[350],
                height: 500,
                width: 1000,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              titleList[index].toString(),
                              style: GoogleFonts.montserratAlternates(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            dataList[index].toString(),
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: 9,
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
