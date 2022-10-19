class CamperActivitySerializer < ActiveModel::Serializer
  attributes :camper_activities

  def camper_activities
    Object.activites
  end

end
