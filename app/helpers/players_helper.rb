module PlayersHelper
  def sort_link(column:, label:)
    if params[:column] == column
      link_to(label, list_players_path(column: column, direction: next_direction))
    else
      link_to(label, list_players_path(column: column, direction: 'asc'))
    end
  end

    def next_direction
      params[:direction] == 'asc' ? 'desc' : 'asc'
    end
end