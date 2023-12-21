module Filterable
  def filter!(model)
    store_filters(model)
    apply_filters(model)
  end

  private
  def filter_hash(model)
    session["#{model.to_s.underscore}_filters"]
  end

  def store_filters(model)
    filter_hash(model).merge!(filter_params_for(model))
  end

  def filter_params_for(model)
    params.permit(model::FILTER_PARAMS)
  end

  def apply_filters(model)
    model.filter(filter_hash(model))
  end
end