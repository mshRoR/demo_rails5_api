class ApiConstraints
  attr_reader :version
  ACTIVE_API_VERSIONS = %w[v1 v2]

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    # curl -H 'Accept: application/vnd.demo.v1' http://localhost:3000/api/posts
    if req.headers['Accept'] =~ /application\/vnd.demo.v([0-9]+)/
      ver = $1.to_i
      ACTIVE_API_VERSIONS.include?("v#{ver}") ? @version == ver : @default
    else
      @default
    end
    # curl -H 'Accept: v=1' http://localhost:3000/api/posts
    # @default || req.headers['Accept'].include?("v=#{@version}")
  end
end