import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:love_4_movies/core/theme/colors.dart';
import 'package:love_4_movies/core/theme/fonts.dart';
import 'package:love_4_movies/data/movie.dart';
import 'package:love_4_movies/widgets/custom_card.dart';
import 'package:love_4_movies/widgets/custom_card_thumbnail.dart';
import 'package:love_4_movies/widgets/custom_genre_card.dart';
import 'package:love_4_movies/widgets/custom_section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TabBar icons
  final List<IconData> _tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.video,
    FontAwesomeIcons.user,
  ];
  
  // Items
  final List<MovieModel> _forYouItemsList = List.of(forYouList);
  final List<MovieModel> _popularItemsList = List.of(popularList);
  final List<MovieModel> _genresItemsList = List.of(genresList);
  final List<MovieModel> _legendaryItemsList = List.of(legendaryList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hey, Enrico!',
                          style: titleStyle,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage('https://plus.unsplash.com/premium_photo-1710961232986-36cead00da3c?q=80&w=1984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            Positioned(
                              top: 2,
                              right: 2,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  color: kButtonColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kSearchbarColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Search for movies',
                            style: hintSearchTextFieldStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //For you section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text(
                      'For you',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  _forYouCardsLayout(_forYouItemsList),

                  // Center(
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8),
                  //     decoration: BoxDecoration(
                  //       color: kSearchbarColor,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: _buildPageIndicatorWidget(),
                  //     ),
                  //   ),
                  // ),
                  //Popular section
                  CustomSectionTitle(
                    title: 'Popular',
                    onPressed: () {},
                  ),
                  _movieListBuilder(_popularItemsList),
                  //Genre section
                  CustomSectionTitle(
                    title: 'Genres',
                    onPressed: () {},
                  ),
                  _genreListBuilder(_genresItemsList),
                  // Legendary Movies
                  CustomSectionTitle(
                    title: 'Legendary movies',
                    onPressed: () {},
                  ),
                  _movieListBuilder(_legendaryItemsList),
                ],
              ),

            ),
          ),
          Positioned(
            bottom: 10,
            left: 25,
            right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25.0,
                  sigmaY: 25.0
                ),
                child: Container(
                  color: kSearchbarColor.withOpacity(0.6),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ..._tabBarIcons.map((icon) {
                        return Icon(
                          icon,
                          color: icon == FontAwesomeIcons.house
                              ? Colors.white
                              : Colors.white54,
                          size: 22,
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _forYouCardsLayout(List<MovieModel> moviesList) {
    return CarouselSlider.builder(
      itemCount: moviesList.length,
      options: CarouselOptions(
        height: 350,
        autoPlay: true,
        viewportFraction: 0.60,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIndex) {
        return CustomCardThumbnail(
          imageAsset: moviesList[index].imageAsset,
        );
      },
    );
  }

  
  // // Indicators
  // List<Widget> _buildPageIndicatorWidget() {
  //   List<Widget> list = [];
  //   for (int i = 0; i < _forYouItemsList.length; i++) {
  //     list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  //   }
  //   return list;
  // }

  // Widget _indicator(bool isActive) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 150),
  //     margin: const EdgeInsets.symmetric(horizontal: 5),
  //     height: 8,
  //     width: 8,
  //     decoration: BoxDecoration(
  //       color: isActive ? Colors.white : Colors.white24,
  //       borderRadius: BorderRadius.circular(10)
  //     ),
      
  //   );
  // }

  Widget _movieListBuilder(List<MovieModel> moviesList) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      height: MediaQuery.of(context).size.height * 0.27,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            return CustomCard(movie: moviesList[index]);
        },
      ),
    );
  }

  Widget _genreListBuilder(List<MovieModel> moviesList) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: genresList.length,
        itemBuilder: (context, index) {
          return CustomGenreCard(
            movieModel: _genresItemsList[index],
          );
        },
      ),
    );
  }
}
