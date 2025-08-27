class HomeController < ApplicationController
  def index
    # 検索フォームの入力があればフィルタ
    if params[:q].present?
      keyword = params[:q].strip
      @monsters = Monster.where("name LIKE ? OR kana LIKE ?", "%#{keyword}%", "%#{keyword}%")

      # 検索履歴の保存（最新10件）
      unless SearchHistory.exists?(keyword: keyword)
        SearchHistory.create!(keyword: keyword)
      end
    else
      @monsters = Monster.all
    end

    # 履歴取得（最新10件）
    @search_histories = SearchHistory.order(created_at: :desc).limit(10)
  end
end
