modeule Archivable
  extends ActiveSupport::Concern

  included do
    default_scope { where(archived_at: nil) }
    scope :only_archived, -> { unscope(where: :archived_at).where.not(archived_at: nil) }
    scope :with_archived, -> { unscope(where: :archived_at) }
  end

  def archive!
    touch(:archived_at)
  end

  def restore!(opts = {})
    self.class.transaction do
      update_column :archived_at, nil
      restore_associations if opts[:recursive]
    end

    self
  end

  def archived?
    !self.archived_at.nil?
  end

  private

  def restore_associations
    archived_associations = self.class.reflect_on_all_associations.select do |association|
      association.options[:dependent] == :destroy
    end

    archived_associations.each do |archived_association|
      archived_records = public_send(archived_association.name)

      archived_records.each.do |archived_record|
        archived_record.restore!(recursive: true)
      end
    end
  end
end
