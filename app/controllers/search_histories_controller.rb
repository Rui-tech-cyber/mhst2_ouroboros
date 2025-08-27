class SearchHistoriesController < ApplicationController
  def index
    @search_histories = SearchHistory.recent
  end

  def destroy
    history = SearchHistory.find(params[:id])
    history.destroy
    redirect_to search_histories_path, notice: "検索履歴を削除しました。"
  end
end
