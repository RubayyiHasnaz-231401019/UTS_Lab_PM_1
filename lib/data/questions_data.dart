import '../models/question.dart';

class QuestionsData {
  static const List<Question> allQuestions = [
    // KATEGORI 1: Planet & Tata Surya (5 soal)
    Question(
      id: 'p1',
      categoryId: 'planets',
      questionText: 'Planet terbesar di tata surya adalah?',
      options: ['Mars', 'Jupiter', 'Saturnus', 'Neptunus'],
      correctAnswerIndex: 1,
      explanation: 'Jupiter adalah planet terbesar dengan diameter 142.984 km.',
    ),
    Question(
      id: 'p2',
      categoryId: 'planets',
      questionText: 'Berapa jumlah planet dalam tata surya kita?',
      options: ['7', '8', '9', '10'],
      correctAnswerIndex: 1,
      explanation: 'Sejak 2006, tata surya memiliki 8 planet setelah Pluto diklasifikasi ulang.',
    ),
    Question(
      id: 'p3',
      categoryId: 'planets',
      questionText: 'Planet apa yang dijuluki "Planet Merah"?',
      options: ['Venus', 'Mars', 'Jupiter', 'Merkurius'],
      correctAnswerIndex: 1,
      explanation: 'Mars dijuluki Planet Merah karena permukaan tanahnya mengandung besi oksida.',
    ),
    Question(
      id: 'p4',
      categoryId: 'planets',
      questionText: 'Apa nama satelit alami Bumi?',
      options: ['Titan', 'Europa', 'Bulan', 'Io'],
      correctAnswerIndex: 2,
      explanation: 'Bulan adalah satu-satunya satelit alami yang dimiliki Bumi.',
    ),
    Question(
      id: 'p5',
      categoryId: 'planets',
      questionText: 'Planet manakah yang memiliki cincin paling mencolok?',
      options: ['Jupiter', 'Uranus', 'Saturnus', 'Neptunus'],
      correctAnswerIndex: 2,
      explanation: 'Saturnus memiliki sistem cincin paling besar dan mencolok yang terdiri dari es dan batuan.',
    ),

    // KATEGORI 2: Bintang & Galaksi (5 soal)
    Question(
      id: 's1',
      categoryId: 'stars',
      questionText: 'Galaksi tempat tata surya kita berada adalah?',
      options: ['Andromeda', 'Bima Sakti', 'Triangulum', 'Whirlpool'],
      correctAnswerIndex: 1,
      explanation: 'Tata surya kita berada di galaksi Bima Sakti (Milky Way).',
    ),
    Question(
      id: 's2',
      categoryId: 'stars',
      questionText: 'Bintang terdekat dengan Bumi (selain Matahari) adalah?',
      options: ['Sirius', 'Proxima Centauri', 'Betelgeuse', 'Vega'],
      correctAnswerIndex: 1,
      explanation: 'Proxima Centauri berjarak 4,24 tahun cahaya dari Bumi.',
    ),
    Question(
      id: 's3',
      categoryId: 'stars',
      questionText: 'Berapa lama waktu yang dibutuhkan cahaya matahari untuk sampai ke Bumi?',
      options: ['8 detik', '8 menit', '8 jam', '8 hari'],
      correctAnswerIndex: 1,
      explanation: 'Cahaya matahari memerlukan sekitar 8 menit untuk mencapai Bumi.',
    ),
    Question(
      id: 's4',
      categoryId: 'stars',
      questionText: 'Apa nama bintang paling terang di langit malam?',
      options: ['Polaris', 'Sirius', 'Vega', 'Betelgeuse'],
      correctAnswerIndex: 1,
      explanation: 'Sirius adalah bintang paling terang yang terlihat dari Bumi.',
    ),
    Question(
      id: 's5',
      categoryId: 'stars',
      questionText: 'Apa yang terjadi pada bintang yang sangat besar di akhir hidupnya?',
      options: ['Menjadi planet', 'Meledak menjadi supernova', 'Menghilang', 'Membeku'],
      correctAnswerIndex: 1,
      explanation: 'Bintang masif akan meledak sebagai supernova dan bisa menjadi lubang hitam.',
    ),

    // KATEGORI 3: Eksplorasi Luar Angkasa (5 soal)
    Question(
      id: 'e1',
      categoryId: 'exploration',
      questionText: 'Siapa astronot pertama yang mendarat di Bulan?',
      options: ['Yuri Gagarin', 'Buzz Aldrin', 'Neil Armstrong', 'Michael Collins'],
      correctAnswerIndex: 2,
      explanation: 'Neil Armstrong mendarat di Bulan pada 20 Juli 1969 dalam misi Apollo 11.',
    ),
    Question(
      id: 'e2',
      categoryId: 'exploration',
      questionText: 'Negara manakah yang pertama kali mengirim manusia ke luar angkasa?',
      options: ['Amerika Serikat', 'Uni Soviet', 'Tiongkok', 'India'],
      correctAnswerIndex: 1,
      explanation: 'Uni Soviet mengirim Yuri Gagarin pada 12 April 1961.',
    ),
    Question(
      id: 'e3',
      categoryId: 'exploration',
      questionText: 'Apa nama stasiun luar angkasa internasional yang masih beroperasi?',
      options: ['Mir', 'ISS', 'Skylab', 'Tiangong'],
      correctAnswerIndex: 1,
      explanation: 'International Space Station (ISS) masih beroperasi sejak tahun 2000.',
    ),
    Question(
      id: 'e4',
      categoryId: 'exploration',
      questionText: 'Wahana luar angkasa manakah yang berhasil mencapai Pluto?',
      options: ['Voyager 1', 'New Horizons', 'Pioneer 10', 'Cassini'],
      correctAnswerIndex: 1,
      explanation: 'New Horizons NASA terbang melewati Pluto pada Juli 2015.',
    ),
    Question(
      id: 'e5',
      categoryId: 'exploration',
      questionText: 'Siapa astronot wanita pertama yang pergi ke luar angkasa?',
      options: ['Sally Ride', 'Valentina Tereshkova', 'Mae Jemison', 'Eileen Collins'],
      correctAnswerIndex: 1,
      explanation: 'Valentina Tereshkova dari Uni Soviet terbang ke luar angkasa pada 1963.',
    ),

    // KATEGORI 4: Fenomena Langit (5 soal)
    Question(
      id: 'f1',
      categoryId: 'phenomena',
      questionText: 'Apa yang terjadi saat gerhana matahari total?',
      options: [
        'Bumi menghalangi matahari',
        'Bulan menghalangi matahari',
        'Mars menghalangi matahari',
        'Awan tebal menutupi matahari'
      ],
      correctAnswerIndex: 1,
      explanation: 'Gerhana matahari total terjadi ketika Bulan berada di antara Matahari dan Bumi.',
    ),
    Question(
      id: 'f2',
      categoryId: 'phenomena',
      questionText: 'Apa nama hujan meteor yang terjadi setiap Agustus?',
      options: ['Geminid', 'Perseid', 'Leonid', 'Orionid'],
      correctAnswerIndex: 1,
      explanation: 'Hujan meteor Perseid terjadi setiap Juli-Agustus dari konstelasi Perseus.',
    ),
    Question(
      id: 'f3',
      categoryId: 'phenomena',
      questionText: 'Apa sebutan untuk cahaya warna-warni di langit kutub?',
      options: ['Aurora', 'Pelangi', 'Halo', 'Korona'],
      correctAnswerIndex: 0,
      explanation: 'Aurora (Aurora Borealis/Australis) disebabkan oleh interaksi partikel matahari dengan atmosfer.',
    ),
    Question(
      id: 'f4',
      categoryId: 'phenomena',
      questionText: 'Komet terkenal yang muncul setiap 76 tahun adalah?',
      options: ['Komet Hale-Bopp', 'Komet Halley', 'Komet Hyakutake', 'Komet NEOWISE'],
      correctAnswerIndex: 1,
      explanation: 'Komet Halley terakhir terlihat pada 1986 dan akan muncul lagi pada 2061.',
    ),
    Question(
      id: 'f5',
      categoryId: 'phenomena',
      questionText: 'Apa yang dimaksud dengan "Bulan Purnama Super"?',
      options: [
        'Bulan lebih terang dari biasanya',
        'Bulan terlihat lebih besar dan terang',
        'Bulan berwarna merah',
        'Bulan terbit dua kali'
      ],
      correctAnswerIndex: 1,
      explanation: 'Supermoon terjadi ketika Bulan purnama berada di titik terdekat dengan Bumi.',
    ),

    // KATEGORI 5: Teknologi & Penemuan (5 soal)
    Question(
      id: 't1',
      categoryId: 'technology',
      questionText: 'Siapa yang menemukan teleskop pertama?',
      options: ['Isaac Newton', 'Galileo Galilei', 'Edwin Hubble', 'Johannes Kepler'],
      correctAnswerIndex: 1,
      explanation: 'Galileo Galilei membuat teleskop pertama untuk astronomi pada 1609.',
    ),
    Question(
      id: 't2',
      categoryId: 'technology',
      questionText: 'Teleskop luar angkasa terkenal milik NASA adalah?',
      options: ['Chandra', 'Hubble', 'Spitzer', 'Kepler'],
      correctAnswerIndex: 1,
      explanation: 'Teleskop Hubble diluncurkan pada 1990 dan masih beroperasi hingga kini.',
    ),
    Question(
      id: 't3',
      categoryId: 'technology',
      questionText: 'Apa nama rover NASA yang masih aktif di Mars?',
      options: ['Spirit', 'Opportunity', 'Curiosity', 'Sojourner'],
      correctAnswerIndex: 2,
      explanation: 'Curiosity rover mendarat di Mars pada 2012 dan masih aktif melakukan penelitian.',
    ),
    Question(
      id: 't4',
      categoryId: 'technology',
      questionText: 'Siapa ilmuwan yang merumuskan hukum gravitasi universal?',
      options: ['Albert Einstein', 'Isaac Newton', 'Stephen Hawking', 'Nicolaus Copernicus'],
      correctAnswerIndex: 1,
      explanation: 'Isaac Newton merumuskan hukum gravitasi universal pada abad ke-17.',
    ),
    Question(
      id: 't5',
      categoryId: 'technology',
      questionText: 'Apa nama perusahaan yang mengembangkan roket Falcon?',
      options: ['Blue Origin', 'SpaceX', 'Boeing', 'Lockheed Martin'],
      correctAnswerIndex: 1,
      explanation: 'SpaceX milik Elon Musk mengembangkan roket Falcon yang dapat digunakan kembali.',
    ),
  ];

  // Get questions by category
  static List<Question> getQuestionsByCategory(String categoryId) {
    return allQuestions.where((q) => q.categoryId == categoryId).toList();
  }
}