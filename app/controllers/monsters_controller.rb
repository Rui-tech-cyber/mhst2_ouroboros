class MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
    @states = @monster.monster_states.order(:id) # 好みで並び替え
    @has_form_change = @states.any? { |s| s.state_name == "形態変化" }

    # 初期表示は最初の状態(なければ none)
    @default_element = @states.first&.element || "none"
    @default_label = @states.first&.state_name || "形態変化なし"
  end

  def index
    if params[:q].present?
      @monsters = Monster.where("name LIKE ? OR kana LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @monsters = Monster.all
    end
  end
end
