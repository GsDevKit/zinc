testing
testEntityTooLarge
  self
    withServerMaximumEntitySize: 1024
    do: [ :server | 
      | response client |
      self deny: server debugMode.
      client := ZnClient new
        url: server localUrl;
        addPathSegment: #'echo';
        entity: (ZnEntity with: (ByteArray new: 1024 + 1));
        yourself.
      response := client
        post;
        response.
      client close.
      self deny: response isSuccess.
      self assert: response code equals: 400.
      self assert: response contentType equals: ZnMimeType textPlain.
      self
        assert: (response entity contents includesSubstring: 'ZnEntityTooLarge') ]