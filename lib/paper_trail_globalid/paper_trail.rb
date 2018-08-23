module PaperTrailGlobalid
  module PaperTrail
    def whodunnit=(value)
      value = value.respond_to?(:to_global_id) ? value.to_global_id : value
      if defined?(request)
        request.whodunnit = value
      else
        super(value)
      end
    end

    def actor
      ::GlobalID::Locator.locate(whodunnit) || whodunnit
    end
  end
end
