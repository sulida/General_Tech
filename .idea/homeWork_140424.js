//В рамках БД 190923_MUSIC напишите следующие запросы:
//Вывести среднюю реакцию по всем трекам
db.reactions.aggregate([
     {$group: {
             _id: null,
             averageReaction: { $avg: "$value" }
         }
     }
 ])
//Вывести среднюю реакцию по всем трекам с авторами (треков) из USA
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
        $unwind: "$track"
    },
    {
        $lookup: {
            from: "users",
            localField: "track.author_id",
            foreignField: "_id",
            as: "author"
        }
    },
    {
        $unwind: "$author"
    },
    {
        $match: {
            "author.country": "USA"
        }
    },
    {
        $group: {
            _id: null,
            averageReaction: { $avg: "$value" }
        }
    }
])
//Увеличить баланс всех незаблокированных юзеров на 0.5%
db.users.updateMany(
    { blocked: { $ne: true } },
    { $mul: { balance: 1.005 } }
)
//Вывести ко-во реакций с оценкой 4
db.reactions.aggregate([
  {$match: { value: 4 }
  },
  {$group: {
      _id: null,
      totalReactions: { $sum: 1 }
    }
  }
])
//Вывести три произвольных названия треков юзеров не из Germany
db.tracks.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "author_id",
      foreignField: "_id",
      as: "user"
    }
  },
  {
    $match: { "user.country": { $ne: "Germany" } }
  },
  {
    $sample: { size: 3 }
  },
  {
    $project: { title: 1, _id: 0 }
  }
])
//Вывести имена юзеров, у которых есть треки
db.users.aggregate([
  {
    $lookup: {
      from: "tracks",
      localField: "_id",
      foreignField: "author_id",
      as: "tracks"
    }
  },
  {$match: { tracks: { $exists: true, $ne: [] } }
  },
  {$project: { fullname: 1, _id: 0 }
  }
])
//Используя метод aggregate(), вывести ко-во юзеров с балансом до 1000 EUR (вкл.)
db.users.aggregate([
  {
    $match: { balance: { $lte: 1000 } }
  },
  {
    $count: "totalUsers"
  }
])