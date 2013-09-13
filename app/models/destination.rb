require 'addressable/uri'

class Destination < ActiveRecord::Base

  def self.with_url(url_string)
    url = Addressable::URI.heuristic_parse(url_string).normalize
    where(url_string: url.to_s)
  end

  def self.with_base36(base36_id)
    where(id: base36_id.to_i(36))
  end

  def self.find_base36(base36_id)
    with_base36(base36_id).first!
  end

  def to_param
    self.id.to_s(36)
  end

  def canonical_path
    if custom_path.present?
      "#{custom_path}"
    else
      "x/#{to_param}"
    end
  end

  def custom_path
    @_custom_path ||= [].tap do |list|
      list << self.namespace if self.namespace.present?
      list << self.slug if self.slug.present?
    end.compact.join("/")
  end

  def custom_path=(path)
    @_custom_path = nil

    if path.nil? || path.empty?
      self.slug = self.namespace = ""
    else
      parts = path.split("/")[0,2]
      self.slug = parts.pop || ""
      self.namespace = parts.pop || ""
    end

    @_custom_path = ""
  end

  def url
    @uri_object ||= Addressable::URI.heuristic_parse(self.url_string)
  end

  def url=(uri_or_string)
    @uri_object = uri_or_string ? Addressable::URI.heuristic_parse(uri_or_string).normalize : nil
    self.url_string = uri_or_string.to_s
    @uri_object
  end

  def display_title
    # TODO: Make this configurable
    title.present? || title || display_url
  end

  def display_url
    "#{url.host}".tap do |display_uri|
      display_uri << url.path if url.path && url.path != "/"
      display_uri << "?#{url.query}" if url.query
      display_uri << "\##{url.fragment}" if url.fragment
    end
  end

  def as_json(options={})
    {
      id: to_param,
      title: title,
      displayTitle: display_title,
      displayURL: display_url,
      canonicalPath: canonical_path,
      customPath: custom_path,
      url: url.to_s,
      namespace: namespace,
      slug: slug,
      createdAt: created_at,
      updatedAt: updated_at
    }
  end

end
