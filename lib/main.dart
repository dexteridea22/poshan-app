import 'dart:async';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Concert Reels',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ReelsScreen(),
    ComedyReelsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Concert Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_very_satisfied),
            label: 'Comedy Reels',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to Listen! Enjoy by watching reels.',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class ReelsScreen extends StatefulWidget {
  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final List<String> youtubeLinks = [
    'https://www.youtube.com/shorts/CzDmfNXHI70',
    'https://www.youtube.com/shorts/utJU6QvBhwI',
    'https://www.youtube.com/shorts/bgnrL_l6CdI',
    'https://www.youtube.com/shorts/m8QZthGw_30',
    'https://www.youtube.com/shorts/bAK7hfKq9Ac',
  ];

  late PageController _pageController;
  List<YoutubePlayerController> _videoControllers = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize YouTube player controllers
    _videoControllers = youtubeLinks.map((link) {
      return YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link)!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: youtubeLinks.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.black,
            child: Center(
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: YoutubePlayer(
                  controller: _videoControllers[index],
                  showVideoProgressIndicator: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ComedyReelsScreen extends StatefulWidget {
  @override
  _ComedyReelsScreenState createState() => _ComedyReelsScreenState();
}

class _ComedyReelsScreenState extends State<ComedyReelsScreen> {
  final List<String> comedyLinks = [
    // 'https://www.youtube.com/shorts/8rwbmLfUsew',
    // 'https://www.youtube.com/shorts/eEo4txcL0Rs',
    'https://www.youtube.com/shorts/L1EX_H_A1q4',
    'https://www.youtube.com/shorts/dXZ0oZn0kAI',
  ];

  late PageController _pageController;
  List<YoutubePlayerController> _videoControllers = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize YouTube player controllers
    _videoControllers = comedyLinks.map((link) {
      return YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link)!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: comedyLinks.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.black,
            child: Center(
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: Text('nath'+ index.toString())
                // YoutubePlayer(
                //   controller: _videoControllers[index],
                //   showVideoProgressIndircator: true,
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Concert reels',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BottomNavBar(),
//     );
//   }
// }
//
// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = [
//     HomeScreen(),
//     ReelsScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.video_library),
//             label: 'Concert Reels',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Welcome to Listen ! Enjoy by watching reels tab',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }
//
//
// class ReelsScreen extends StatefulWidget {
//   @override
//   _ReelsScreenState createState() => _ReelsScreenState();
// }
//
// class _ReelsScreenState extends State<ReelsScreen> {
//   final List<String> youtubeLinks = [
//     'https://www.youtube.com/shorts/CzDmfNXHI70',
//     'https://www.youtube.com/shorts/utJU6QvBhwI',
//     'https://www.youtube.com/shorts/bgnrL_l6CdI',
//     'https://www.youtube.com/shorts/m8QZthGw_30',
//     'https://www.youtube.com/shorts/bAK7hfKq9Ac',
//     'https://www.youtube.com/shorts/8m8-W1WaIZg',
//     'https://www.youtube.com/shorts/yLzsCp7q9Y8',
//     'https://www.youtube.com/shorts/D-qzRrb3zvg',
//     'https://www.youtube.com/shorts/dD6AiP70eeU'
//   ];
//
//   late PageController _pageController;
//   List<YoutubePlayerController> _videoControllers = [];
//   int _currentIndex = 0;
//   bool _isAutoScrolling = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//
//     // Initialize YouTube player controllers
//     _videoControllers = youtubeLinks.map((link) {
//       return YoutubePlayerController(
//         initialVideoId: YoutubePlayer.convertUrlToId(link)!,
//         flags: YoutubePlayerFlags(
//           autoPlay: true,
//           loop: false, // Disable loop so we can detect when a video ends
//           mute: false,
//         ),
//       );
//     }).toList();
//
//     // Attach listeners for auto-scrolling when videos finish
//     for (int i = 0; i < _videoControllers.length; i++) {
//       _videoControllers[i].addListener(() {
//         if (!_isAutoScrolling &&
//             _videoControllers[i].value.playerState == PlayerState.ended) {
//           _scrollToNextVideo();
//         }
//       });
//     }
//   }
//
//   void _scrollToNextVideo() {
//     if (_currentIndex < youtubeLinks.length - 1) {
//       setState(() {
//         _isAutoScrolling = true;
//         _currentIndex++;
//       });
//       _pageController.animateToPage(
//         _currentIndex,
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeInOut,
//       ).then((_) {
//         _videoControllers[_currentIndex].play(); // Play the next video
//         _isAutoScrolling = false;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     _videoControllers.forEach((controller) => controller.dispose());
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         controller: _pageController,
//         itemCount: youtubeLinks.length,
//         onPageChanged: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//
//           // Play the current video and pause all others
//           for (int i = 0; i < _videoControllers.length; i++) {
//             if (i == index) {
//               _videoControllers[i].play();
//             } else {
//               _videoControllers[i].pause();
//             }
//           }
//         },
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               // Video player
//               Container(
//                 color: Colors.black,
//                 child: Center(
//                   child: AspectRatio(
//                     aspectRatio: 9 / 16, // Shorts-like vertical aspect ratio
//                     child: YoutubePlayer(
//                       controller: _videoControllers[index],
//                       showVideoProgressIndicator: true,
//                     ),
//                   ),
//                 ),
//               ),
//
//               // Optional overlay UI
//               Positioned(
//                 top: 40,
//                 right: 20,
//                 child: IconButton(
//                   icon: Icon(Icons.volume_up, color: Colors.white),
//                   onPressed: () {
//                     _videoControllers[index].toggleFullScreenMode();
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


// ------
//

//
// class ReelsScreen extends StatefulWidget {
//   @override
//   _ReelsScreenState createState() => _ReelsScreenState();
// }
//
//
//
// class _ReelsScreenState extends State<ReelsScreen> {
//   final List<String> youtubeLinks = [
//     'https://www.youtube.com/shorts/CzDmfNXHI70', // Replace with your YouTube Shorts links
//     'https://www.youtube.com/shorts/utJU6QvBhwI',
//     'https://www.youtube.com/shorts/bgnrL_l6CdI',
//     'https://www.youtube.com/shorts/m8QZthGw_30',
//     'https://www.youtube.com/shorts/bAK7hfKq9Ac',
//     'https://www.youtube.com/shorts/8m8-W1WaIZg',
//     'https://www.youtube.com/shorts/yLzsCp7q9Y8',
//     'https://www.youtube.com/shorts/D-qzRrb3zvg',
//     'https://www.youtube.com/shorts/dD6AiP70eeU'
//   ];
//
//   late PageController _pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         controller: _pageController,
//         itemCount: youtubeLinks.length,
//         itemBuilder: (context, index) {
//           String videoId = YoutubePlayer.convertUrlToId(youtubeLinks[index])!;
//           YoutubePlayerController _controller = YoutubePlayerController(
//             initialVideoId: videoId,
//             flags: YoutubePlayerFlags(
//               autoPlay: true,
//               loop: true,
//               mute: false,
//             ),
//           );
//
//           return Stack(
//             children: [
//               // Background video container to fit the screen
//               Container(
//                 color: Colors.black,
//                 child: Center(
//                   child: AspectRatio(
//                     aspectRatio: 9 / 16, // Shorts-like vertical video aspect ratio
//                     child: YoutubePlayer(
//                       controller: _controller,
//                       showVideoProgressIndicator: false,
//                     ),
//                   ),
//                 ),
//               ),
//               // Optional overlay for additional UI (like captions, buttons, etc.)
//               Positioned(
//                 top: 40,
//                 right: 20,
//                 child: IconButton(
//                   icon: Icon(Icons.volume_up, color: Colors.white),
//                   onPressed: () {
//                     _controller.toggleFullScreenMode();
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
