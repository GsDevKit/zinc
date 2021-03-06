testing
testUsernamePassword
  (System stoneVersionReport at: 'gsVersion') asMetacelloVersionNumber
    <= '3.1.0' asMetacelloVersionNumber
    ifTrue: [ 
      "skip the test for pre-3.1 GemStone versions"
      ^ self ].
  self
    withServerDo: [ :server | 
      | client |
      server
        authenticator: (ZnBasicAuthenticator username: 'foo' password: 'secret').
      (client := ZnClient new)
        url: server localUrl;
        addPathSegment: 'echo';
        get.
      self deny: client isSuccess.
      self assert: client response isAuthenticationRequired.
      client
        username: 'foo' password: 'secret';
        get.
      self assert: client isSuccess.
      self assert: (client contents includesSubstring: 'Zinc').
      client close ]