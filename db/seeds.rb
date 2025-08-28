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


# 紫毒姫リオレイア作成
rathian = Monster.find_or_create_by!(name: "紫毒姫リオレイア", kana: "しどくひめりおれいあ", image_url: "dreadqueen-rathian.png") do |m|
  m.image_url = "dreadqueen-rathian.png"
end

rathian.monster_states.destroy_all

rathian.monster_states.create!([
  { state_name: "通常", element: :technique, action_count: 1, action_pattern: "-" },
  { state_name: "怒り", element: :speed, action_count: 1, action_pattern: "-" }
])

puts "Seeded: #{Monster.count} monsters / #{MonsterState.count} states"


# クルルヤック作成
kulu = Monster.find_or_create_by!(name: "クルルヤック", kana: "くるるやっく", image_url: "kulu-ya-ku.png") do |m|
  m.image_url = "kulu-ya-ku.png"
end

kulu.monster_states.destroy_all

kulu.monster_states.create!([
  { state_name: "通常", element: :technique, action_count: 1, action_pattern: "-" },
  { state_name: "ホールドロック", element: :power, action_count: 1, action_pattern: "・ホールドロックを使用・ロックスタンプを行う" }
])

puts "Seeded: #{Monster.count} monsters / #{MonsterState.count} states"


# 燼滅刃ディノバルド作成
glavenus = Monster.find_or_create_by!(name: "燼滅刃ディノバルド", kana: "じんめつじんでぃのばるど", image_url: "hellblade-glavenus.png") do |m|
  m.image_url = "hellblade-glavenus.png"
end

glavenus.monster_states.destroy_all

glavenus.monster_states.create!([
  { state_name: "通常", element: :power, action_count: 1, action_pattern: "・パワー攻撃多用・数ターン経過後「滅火球溜め」使用" },
  { state_name: "滅火球(溜め)", element: :speed, action_count: 1, action_pattern: "・スピード攻撃多用・数ターン経過後「フレアチャクラム」使用（尻尾赤熱状態に移行）" },
  { state_name: "尻尾赤熱", element: :no_form, action_count: 1, action_pattern: "・ノータイプ攻撃「エクスプロードテイル」使用・3ターン目に全体攻撃「爆熱刃」使用(通常状態(尻尾赤熱解除後)に移行)" },
  { state_name: "通常(尻尾赤熱解除後)", element: :power, action_count: 1, action_pattern: "・パワー攻撃多用・数ターン経過後「フレアチャクラム」使用(尻尾赤熱状態に移行)" },
  { state_name: "尻尾赤熱(尻尾破壊後)", element: :technique, action_count: 1, action_pattern: "・テクニック攻撃多用・3ターン目に全体攻撃「爆熱刃」使用(通常状態(尻尾赤熱解除後)に移行)" }
])

puts "Seeded: #{Monster.count} monsters / #{MonsterState.count} states"


# プケプケ作成
pukei = Monster.find_or_create_by!(name: "プケプケ", kana: "ぷけぷけ", image_url: "pukei-pukei.png")

pukei.monster_states.destroy_all

pukei.monster_states.create!([
  { state_name: "通常", element: :technique, action_count: 1, action_pattern: "HP減少時ぱくぱく(もぐもぐ)タイムを行う" },
  { state_name: "食糧(貯蔵時)", element: :power, action_count: 1, action_pattern: "毒付与攻撃や全体攻撃も使用" }
])
