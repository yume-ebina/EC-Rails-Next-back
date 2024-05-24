# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  provider: "google",
  uid: "hoge",
  name: "test",
  avatar: nil
)

Product.create(
  [
    {
      name: "オリジナルブレンド",
      description: "バランスの良いブレンドです",
      price: 700,
      status: 1
    },
    {
      name: "モカブレンド",
      description: "少し酸味のあるブレンドです",
      price: 700,
      status: 1
    },
    {
      name: "マンデリンブレンド",
      description: "苦味とコクが特徴のブレンドです",
      price: 700,
      status: 1
    },
    {
      name: "キリマンジャロブレンド",
      description: "優しい酸味とフルーティーさのあるブレンドです",
      price: 700,
      status: 1
    },
    {
      name: "デカフェ",
      description: "デカフェのシングルオリジンです",
      price: 700,
      status: 1
    },
    {
      name: "オーガニック",
      description: "オーガニックのシングルオリジンです",
      price: 900,
      status: 1
    },
  ]
)
