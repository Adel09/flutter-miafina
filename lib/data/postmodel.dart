class Post{
   String id;
   String confession;
   String owner;
   String image;

   Post(this.id, this.confession, this.owner, this.image);

   Post.fromJson(Map<dynamic, dynamic> json)
       : id = json['id'] as String,
         confession = json['confession'] as String,
         owner = json['owner'] as String,
         image = json['image'] as String;

   Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
     'id': id.toString(),
     'confession': confession,
     'owner': owner,
     'image': image,
   };
}