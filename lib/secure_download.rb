require "secure_download/version"
require "secure_download/util"

module SecureDownload
  class SecureUrl
    # +secret+ is the secret string that the application uses to create valid URLs (tokens).
    def initialize(secret, options = {})
      @secret = secret

      raise ArgumentError, 'secret is missing'            unless @secret.is_a?(String)
    end

    # Checks whether the current +request+ satisfies the following requirements:
    #
    # 1. The expiration time lies in the future (i.e., not expired)
    # 2. The token is valid for the requested URL and the given timestamp
    #
    # If either condition doesn't hold true, access to the requested resource
    # is denied!
    def check_access(request_params, request_path)
      timestamp, token = Util.split(request_params[Util::TOKEN_KEY] || '')

      return false if timestamp < Time.now.to_i || token != Util.token(@secret, request_path, timestamp)

      return true
    end
  end
end
