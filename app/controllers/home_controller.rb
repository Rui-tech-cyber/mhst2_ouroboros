class HomeController < ApplicationController
  def index
    if params[:q].present?
      keyword = params[:q]
      # モンスター検索
      @monsters = Monster.where("name LIKE ? OR kana LIKE ?", "%#{keyword}%", "%#{keyword}%")

      # すでに存在するなら作らない
      SearchHistory.find_or_create_by!(keyword: keyword)
      SearchHistory.order(created_at: :desc).limit(10).offset(10).destroy_all
    else
      @monsters = Monster.all
    end

    # ここで必ず履歴を渡す！
    @search_histories = SearchHistory.order(created_at: :desc).limit(10)
  end

  def destroy_history
    history = SearchHistory.find(params[:id])
    history.destroy
    redirect_to root_path, notice: "履歴を削除しました"
  end

end
