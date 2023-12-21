class Player < ApplicationRecord
  belongs_to :team

  FILTER_PARAMS = %i[name column direction team_id].freeze

  scope :by_name, ->(name) { where('players.name ilike ?', "%#{name}%")}
  scope :by_team, ->(team_id) { where('players.team_id = ?', team_id) if team_id.present? }

  def self.filter(filters)
    Player.includes(:team)
          .by_name(filters['name'])
          .by_team(filters['team_id'])
          .order("#{filters['column']} #{filters['direction']}")
  end
end
