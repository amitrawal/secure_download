secure_download
===============


Generate secure urls by adding token and timestamps which expire after a while. 

Examples
--------

In Controller

    before_filter :validate_download

    def validate_download
      sd = SecureDownload::SecureUrl.new('secret')
  
      allowed = sd.check_access(params, request.path)
  
      head(:forbidden) and return if !allowed
  
    end


To generate Urls

    download_url = SecureDownload::SecureUrl::Util.secure_url('secret', /downloads/1, 1.minute.from_now)
    <= link_to "Download", download_url %>
