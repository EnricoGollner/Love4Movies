import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:love_4_movies/core/theme/colors.dart';
import 'package:love_4_movies/data/movie.dart';
import 'package:love_4_movies/widgets/custom_cast_and_crew.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<MovieModel> popularItems = List.of(popularList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: LinearGradient(
                        colors: [
                          kBackgroundColor.withOpacity(0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        popularItems[0].imageAsset,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dune',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '2021, Denis Villenueve',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          _buildTitleInformation(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTag('Epic'),
                              const SizedBox(width: 10),
                              _buildTag('Fantasy'),
                              const SizedBox(width: 10),
                              _buildTag('Drama'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: ReadMoreText(
                              'Lorem ipsum tal tal',
                              trimLines: 5,
                              trimMode: TrimMode.Line,
                              moreStyle: TextStyle(color: kButtonColor),
                              lessStyle: TextStyle(color: kButtonColor),
                              style: TextStyle(
                                color: Colors.white70,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomCastAndCrew(casts: popularItems[0].cast!),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Trailer',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 180, width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      image: const DecorationImage(
                                      image: AssetImage('assets/trailer.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                  child: Icon(
                                    FontAwesomeIcons.play,
                                    color: kButtonColor.withOpacity(0.8),
                                    size: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildTitleInformation() {
    return const Row(
                          children: [
                            Text('8.2', style: TextStyle(
                              color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.yellow,
                              size: 15,
                            ),
                          ],
                        );
  }
  
  Widget _buildTag(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: kSearchbarColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white30,
          fontSize: 16,
        ),
      ),
    );
  }
}
