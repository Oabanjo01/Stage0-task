class Country {
  final String name;
  final String officialName;
  final String flag;
  final String region;
  final int population;
  final List<String> capital;
  final List<String> timezones;
  final String currency;
  final List<String> languages;

  Country({
    required this.name,
    required this.officialName,
    required this.flag,
    required this.region,
    required this.population,
    required this.capital,
    required this.timezones,
    required this.currency,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    // Safely extract nested data
    String currency = json['currencies'] != null
        ? (json['currencies'].entries.first.value['name'] ?? 'Unknown')
        : 'Unknown';

    List<String> languages = json['languages'] != null
        ? (json['languages'].values.cast<String>().toList())
        : ['Unknown'];

    return Country(
      name: json['name']['common'] ?? 'Unknown',
      officialName: json['name']['official'] ?? 'Unknown',
      flag: json['flags']['png'] ?? '',
      region: json['region'] ?? 'Unknown',
      population: json['population'] ?? 0,
      capital: json['capital']?.cast<String>() ?? ['Unknown'],
      timezones: json['timezones']?.cast<String>() ?? ['Unknown'],
      currency: currency,
      languages: languages,
    );
  }
}
