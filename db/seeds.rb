# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   en

# リオレウス作成
rathalos = Monster.find_or_create_by!(name: "リオレウス", kana: "りおれうす") do |m|
  m.image_url = "rathalos.png"
end

# 既存の状態データを初期化（開発用）
rathalos.monster_states.destroy_all

# 状態ごとの3すくみデータ作成
rathalos.monster_states.create!([
  { state_name: "通常", element: :power, action_count: 1, action_pattern: "テイクオフフレイム使用後、飛行状態に移行" },
  { state_name: "怒り", element: :power, action_count: 1, action_pattern: "-" },
  { state_name: "飛行", element: :speed, action_count: 1, action_pattern: "-" },
  { state_name: "怒り+飛行", element: :technique, action_count: 1, action_pattern: "-" }
])

puts "Seeded: #{Monster.count} monsters / #{MonsterState.count} states"


# 白疾風ナルガクルガ作成
nargacuga = Monster.find_or_create_by!(name: "白疾風ナルガクルガ", kana: "しろはやてなるがくるが", image_url: "silverwind-nargacuga.png") do |m|
  m.image_url = "silverwind-nargacuga.png"
end

# 既存の状態データを初期化（開発用）
nargacuga.monster_states.destroy_all

# 状態ごとの3すくみデータ作成
nargacuga.monster_states.create!([
  { state_name: "通常", element: :technique, action_count: 1, action_pattern: "-" },
  { state_name: "怒り", element: :speed, action_count: 2, action_pattern: "-" }
])

puts "Seeded: #{Monster.count} monsters / #{MonsterState.count} states"
