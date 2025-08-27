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
      keyword = params[:q].strip
      @monsters = Monster.where("name LIKE ? OR kana LIKE ?", "%#{keyword}%", "%#{keyword}%")

      unless SearchHistory.exists?(keyword: keyword)
        SearchHistory.create!(keyword: keyword)
      end
    else
      @monsters = Monster.all
    end

    @search_histories = SearchHistory.recent
  end

  def destroy_history
    history = SearchHistory.find(params[:id])
    history.destroy
    redirect_to root_path, notice: "検索履歴を削除しました。"
  end
end
