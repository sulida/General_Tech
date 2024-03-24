//Отправляла задание, но, оказывается , прикрепила не ту ссылку.
//В рамках БД 190923_MUSIC напишите след/запросы:
//Заблокировать юзеров не из France с балансом от 200 до 500 EUR
db.users.updateMany(
{country: 'France',
balance: {$gte: 200, $lte:500}
},

    {$set: {is_blocked: false}
    }

)

//Вывести имена и баланс незаблокированных юзеров из Germany и France
db.users.find(
{
    $or: [{country: 'Germnay'},
    {country: 'France'}],

    is_blocked: {$ne: true}
},

    {fullname: 1, balance: 1, _id: 0}

)
//Разблокировать юзеров из UK и Germany с положительным балансом
db.users.updateMany(
{
 $or: [
            { country: 'UK' },
            { country: 'Germany' }
        ],


blocked: true,
balance: { $gt: 0 }
    },
    { $set: { blocked: false } }
)
//Увеличить баланс на 3.5% и разблокировать всех юзеров из UK с положительным балансом
db.users.updateMany(
    {country: 'UK',
     balance: { $gt: 0 }
    },

        {
$set: { blocked: false },
   $mul: { balance: 1.035 } }

)
//Уменьшить баланс на 20 EUR всех юзеров из France с балансом от 500 EUR и более
db.users.updateMany(
    {country: 'France',
     balance: { $gte: 500 }
    },

        {
$set: { blocked: false },
   $inc: { balance: -20 } }

)