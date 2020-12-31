class Place
{
  final String name;
  final String state;
  final double rating;
  final String description;
  final String image;
  final String card_image;

  Place({this.name, this.state, this.rating, this.description, this.image, this.card_image});
}

final List<Place> places = <Place>[
  Place(name: 'Group of Monuments, Hampi',
      state: 'Karnataka',
      rating: 0.0,
      description: 'Hampi was the capital of the Vijayanagara Empire in the 14th century.',
      image: 'images/hampi.jpg',
      card_image: 'images/hampi_card.jpg',
  ),
  Place(name: 'Nanda Devi and Valley of Flowers',
    state: 'Uttarakhand',
    rating: 0.0,
    description: 'Nanda Devi and Valley of Flowers National Park was added to UNESCO Heritage Sites because of its remarkable beauty and its flora and fauna',
    image: 'images/nanda_devi.jpg',
    card_image: 'images/nanda_devi_card.jpg',
  ),
  Place(name: 'Champaner-Pavagadh Archaeological Site',
    state: 'Gujarat',
    rating: 0.0,
    description: 'About a an hour away from the Statue of Unity is the Champaner Pavagadh Archaeological Site located on the Pavagadh Hill',
    image: 'images/champaner_pavagadh.jpg',
    card_image: 'images/champaner_card_2.jpg',
  ),
  Place(name: 'Bhimbetka Rock Caves',
    state: 'Madhya Pradesh',
    rating: 0.0,
    description: 'There are about 750 rock caves at Bhimbetka. Many of the Caves have rock paintings from early ages inside.',
    image: 'images/bhimbetka.jpg',
    card_image: 'images/bhimbetka_card.jpg',
  ),
  Place(name: 'Kanchendzonga National Park',
    state: 'Sikkim',
    rating: 0.0,
    description: 'Kanchendzonga National Park located at the border of India and Bhutan contains the third highest peak Kanchenjunga',
    image: 'images/kanchendzonga.jpg',
    card_image: 'images/kanchendzonga_card.jpg',
  ),
  Place(name: 'Sanchi Stupa',
    state: 'Madhya Pradesh',
    rating: 0.0,
    description: 'Sanchi Stupa is one of the great buddhist complex. It is one of the oldest stone structures in India and a very important archaeological site. Located about 50 kms from Bhopal',
    image: 'images/sanchi_stupa.jpg',
    card_image: 'images/sanchi_stupa_card.jpg',
  ),
];