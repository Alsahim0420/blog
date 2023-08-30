import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sscc_blog/models/opinion_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends ChangeNotifier {
  List<OpinionModel> opinions = [];
  bool isLoading = false;

  // void getData() async {
  //   isLoading = true;
  //   opinions = [];
  //   notifyListeners();
  //   final response = await http
  //       .get(Uri.parse("https://blog-edc48-default-rtdb.firebaseio.com/.json"));

  //   final resp = jsonDecode(response.body);

  //   final tempList = resp;

  //   final list =
  //       List<OpinionModel>.from(tempList.map((x) => OpinionModel.fromJson(x)));

  //   opinions = list;
  //   isLoading = false;
  //   notifyListeners();
  // }

  // Future<void> createOpinion({required OpinionModel opinion}) async {
  //   final resp = await http.post(
  //     Uri.parse("https://blog-edc48-default-rtdb.firebaseio.com/.json"),
  //     body:
  //         '{"date": "${opinion.date.toString()}","name": "${opinion.name}","opinion": "${opinion.opinion}"}',
  //   );

  //   print(resp.body);
  // }

  Future<void> saveOpinion(List<OpinionModel> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(list);
    await prefs.setString('opinions', jsonString);
  }

  Future<List<OpinionModel>> getOpinions() async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listdata =
        '[{"date":"2023-05-28T19:31:32.356","name":"MySQL Analytics Engine: Oracle dota de inteligencia a las BBDD","opinion":"Oracle acaba de presentar Oracle MySQL Database Service con motor de análisis MySQL, un servicio optimizado y disponible exclusivamente en Oracle Cloud Infrastructure (OCI). Se trata del único servicio MySQL que ofrece a los clientes una plataforma individual y unificada tanto para cargas de trabajo Online Transactional Processing (OLTP) como para Online Analytics Processing (OLAP) para crear y ejecutar aplicaciones modernas de manera más rápida y segura. MySQL Analytics Engine, desarrollado para MySQL Database Service por el equipo de ingeniería MySQL de Oracle en colaboración con Oracle Labs, es un nuevo acelerador analítico in-memory que escala a miles de núcleos, admite análisis en tiempo real y es hasta 17 veces más rápido y un 66 por ciento menos costoso que Amazon Redshift."},{"date":"2023-05-28T19:40:32.356","name":"SAS explica cómo la analítica de datos ayuda en los momentos de crisis","opinion":"SAS ha publicado un informe sobre cómo la analítica de datos sirve para que la información recabada por los gobiernos y organizaciones gubernamentales estatales, europeas y globales cobre sentido, algo de vital importancia en este momento de propagación de COVID-19.Con la herramienta SAS Viya se están analizando los datos oficiales de la OMS para representar de una forma visual la evolución de la pandemia, con el fin de crear conciencia, comprender su impacto y ayudar en su prevención."},{"date":"2023-05-28T19:31:32.356","name":"Quint lanza una división para potenciar Cloud, Big Data y Automatización","opinion":"Quint ha anunciado su nuevo lanzamiento “Quint Technology” para celebrar este 2020 sus quince años de recorrido en España. Esta área surge de la necesidad de ofrecer soluciones de valor de extremo a extremo apoyadas en la última tecnología para extraer el valor de los datos, de la automatización de procesos y de RPA.Quint Technology abarca tres áreas de conocimiento: Value Data, Intelligent Automation y Journey to Cloud. Su enfoque integral, se comprende desde los procesos de negocio hasta la propia arquitectura de datos y sistemas."}]';
    String? jsonString = prefs.getString('opinions');

    if (jsonString != null) {
      List<dynamic> list = jsonDecode(jsonString);
      final tempList =
          List<OpinionModel>.from(list.map((x) => OpinionModel.fromJson(x)));
      List<dynamic> listTwo = jsonDecode(listdata);
      final tempListTwo =
          List<OpinionModel>.from(listTwo.map((x) => OpinionModel.fromJson(x)));
      opinions = tempList + tempListTwo;
      isLoading = false;
      notifyListeners();
      return tempList;
    } else {
      List<dynamic> listTwo = jsonDecode(listdata);
      final tempListTwo =
          List<OpinionModel>.from(listTwo.map((x) => OpinionModel.fromJson(x)));
      opinions = tempListTwo;
      isLoading = false;
      notifyListeners();
      return [];
    }
  }
}
