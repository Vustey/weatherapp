import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});

  final List<WeatherDetail> listData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        DateTime date = DateTime.parse(listData[index].dtT);
        String formatDate = DateFormat('EEEE').format(date);
        String formatTime = DateFormat('hh:MM').format(date);
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        createTemp(listData[index].main.temp, size: 30),
                        SizedBox(width: 10),
                        Text(
                          listData[index].weather.main,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      formatDate,
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 14, 132, 229),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      formatTime,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 4,
                child: Image.asset(
                  AssetCustom.getLinkImg(listData[index].weather.main),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => const SizedBox(height: 15),
      itemCount: 20,
    );
  }
}
