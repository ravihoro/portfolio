class ProjectsList {
  List<Project> get projects => _projects;

  List<Project> _projects = [
    Project(
      name: 'Cart',
      description: "A cart application built using Flutter.",
      features: [
        'Google Sign in',
        'View products',
        'Add to favorites/cart',
        'Dark/light theme',
      ],
      toolsUsed: [
        'Flutter',
        'Firebase',
        'Shared Preferences',
        'ChangeNotifierProvider',
      ],
      images: [
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart1.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart2.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart3.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart4.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart5.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart6.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart7.jpg',
        'https://raw.githubusercontent.com/ravihoro/cart/master/screenshots/cart8.jpg',
      ],
    ),
    Project(
      name: 'Chat',
      description:
          "A chat application built using Flutter for sending real time messages using Firebase.",
      features: [
        'Google Sign in',
        'Send text, images and documents',
        'Search users',
      ],
      toolsUsed: [
        'Flutter',
        'Firebase',
        'Shared Preferences',
      ],
      images: [
        'https://raw.githubusercontent.com/ravihoro/chat/master/screenshots/chat1.jpg',
        'https://raw.githubusercontent.com/ravihoro/chat/master/screenshots/chat2.jpg',
        'https://raw.githubusercontent.com/ravihoro/chat/master/screenshots/chat3.jpg',
        'https://raw.githubusercontent.com/ravihoro/chat/master/screenshots/chat4.jpg',
        'https://raw.githubusercontent.com/ravihoro/chat/master/screenshots/chat5.jpg',
      ],
    ),
    Project(
      name: 'Music Player',
      description:
          "A music player built using Flutter to play locally stored songs.",
      features: [
        'Play songs from local storage',
        'Play/pause current song',
        'Skip to previous/next song'
      ],
      toolsUsed: [
        'Flutter',
        'ChangeNotifierProvider',
        'Flutter Audio Query plugin'
      ],
      images: [
        'https://raw.githubusercontent.com/ravihoro/music_player/master/screenshots/musicPlayer1.jpg',
        'https://raw.githubusercontent.com/ravihoro/music_player/master/screenshots/musicPlayer2.jpg',
      ],
    ),
  ];
}

class Project {
  final String name;
  final String description;
  final List<String> features;
  final List<String> toolsUsed;
  final List<String> images;

  Project(
      {this.name,
      this.description,
      this.images,
      this.features,
      this.toolsUsed});
}
