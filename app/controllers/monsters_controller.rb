require 'ostruct'

class MonstersController < ApplicationController
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

  def show
    @monster = Monster.find(params[:id])
    @states = @monster.monster_states.order(:id)
    @default_state = @states.first || OpenStruct.new(state_name: "形態変化なし", action_count: "-", element: "none", action_pattern: "-")
  end

  def state
    monster = Monster.find(params[:id])
    state = monster.monster_states.find(params[:state_id])

    render json: {
      state_name: state.state_name,
      action_count: state.action_count,
      element: state.element,
      action_pattern: state.action_pattern,
      image_url: ActionController::Base.helpers.asset_path("#{state.element}.png")
    }
  end
end
