//В рамках БД 190923_MUSIC напишите след/запросы:
//Вывести названия двух произвольных треков с тегом awesome
db.track.find(
 { "tags": "awesome" },
   { "title": 1, "_id": 0 }
).limit(2)

db.track.aggregate([
  { $match: { tags: "awesome" } },
  { $limit: 2 },
  { $project: {title: 1, _id: 0 } }
])

//Вывести имя юзера с самым минимальным балансом
db.users.aggregate([
  { $sort: { balance: 1 } },
  { $limit: 1 },
  { $project: { _id: 0, fullname: 1 } }
])

//Используя метод countDocuments(), вывести ко-во заблокированных юзеров с балансом от 10 до 1000 EUR
db.users.countDocuments({
  is_blocked: true,
  balance: { $gte: 10, $lte: 1000 }
})

//Используя метод aggregate(), вывести ко-во незаблокированных юзеров не из Germany и не из France с балансом до 1000 EUR
db.users.aggregate([
  {
    $match: {
      is_blocked: { $ne: true },
      country: { $nin: ["Germany", "France"] },
      balance: { $lte: 1000 }
    }
  },
  {
    $group: {
      _id: null,
      totalUsers: { $sum: 1 }
    }
  }
])

//Также очень коротко опишите, как работает агрегация в MongoDB
//Агрегация работает , как конвейер этапов обработки данных, передавая результат этапа на следующий этап обработки.
