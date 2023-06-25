class VillaImage{
  int? id;
  String? image;
  int? villaOwner;
  int? villa;
  VillaImage({
  this.id,
  this.image,
  this.villa,
  this.villaOwner,
  });
  factory VillaImage.fromJson(Map<String, dynamic> json){
   return VillaImage(
   id: json['id'],
   image: json['image'],
   villa: json['villa'],
   villaOwner: json['villa_owner'],
   );
  }
  Map<String, dynamic> toJson()=>{
    'id' : id,
    'image': image,
    'villa': villa,
    'villa_owner': villaOwner,
  };
}
