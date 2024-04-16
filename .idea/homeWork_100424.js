//Завершите описание схемы БД “Приложение доставки блюд из ресторанов”.

https://dbdiagram.io/d/66164b2103593b6b61a49403

//В рамках БД 190923_MUSIC напишите следующие запросы:
//Вывести общее ко-во реакций, используя метод aggregate()
db.reactions.aggregate([
  {$group: {
      _id: null,
      totalReactions: { $sum: 1 }
    }
  }
])

//Вывести данные о реакциях, включая название трека и имя автора
db.reactions.aggregate([
  {
    $lookup: {
      from: "tracks",
      localField: "track_id",
      foreignField: "_id",
      as: "track"
    }
  },

  {
    $lookup: {
      from: "authors",
      localField: "author_id",
      foreignField: "_id",
      as: "author"
    }
  },

  {
    $project: {
      "_id": 0,
      "reaction_id": "$_id",
      "track_name": "$track.name",
      "author_name": "$author.name"
    }
  }
])

