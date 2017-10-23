# frozen_string_literal: true

module Mushroom
  class Collection
    def initialize(documents)
      @documents = documents
    end

    def find
      @documents
    end
  end

  class Client
    def initialize(collections)
      @collections = collections
    end

    def [](collection_name)
      @collections[collection_name]
    end

    def with_collection(name, documents)
      self.class.new(@collections.merge(name => Collection.new(documents)))
    end
  end

  def self.fake
    Client.new({})
  end
end
