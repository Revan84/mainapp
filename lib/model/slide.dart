class Slide {
  
  final String title;
  final String description;

  Slide({
    
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    
    title: 'COMMANDES',
    description: 'Retrouvez ici toutes vos commandes',
  ),
  Slide(
    
    title: 'FIDÉLITÉ',
    description: 'Retrouvez ici tout vos points de fidélité dans les différents points de vente',
  ),
  
];