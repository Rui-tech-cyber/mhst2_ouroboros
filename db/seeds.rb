# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   en

rathalos = Monster.find_or_create_by!(name: "リオレウス", kana: "りおれうす") do |m|
  m.image_url = "/assets/placeholder.png"
end

# 既存を初期化(開発用)
rathalos.monster_states.destroy_all

rathalos.monster_states.create!([
  { state_name: "通常", element: :power },
  { state_name: "怒り", element: :power },
  { state_name: "飛行", element: :speed },
  { state_name: "怒り+飛行", element: :technique }
  # 形態変化が無い例。あるモンスターでは { state_name: "形態変化", element: :speed } を追加
])

puts "Seeded: #{Monster.count} monsters / #{MonsterState.count} states"
