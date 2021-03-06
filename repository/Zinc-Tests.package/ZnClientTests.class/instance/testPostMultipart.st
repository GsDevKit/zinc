testing
testPostMultipart
  | client filename |
  (System stoneVersionReport at: 'gsVersion') asMetacelloVersionNumber
    <= '3.1.0' asMetacelloVersionNumber
    ifTrue: [ 
      "skip the test for pre-3.1 GemStone versions"
      ^ self ].
  ZnFileSystemUtils deleteIfExists: 'testPostMultiPart.txt'.
  filename := ZnFileSystemUtils fullNameFor: 'testPostMultiPart.txt'.
  ZnFileSystemUtils
    newFileNamed: filename
    do: [ :stream | stream nextPutAll: '0123456789' ].
  self
    withServerDo: [ :server | 
      (client := ZnClient new)
        url: server localUrl;
        addPath: 'echo';
        addPart: (ZnMimePart fieldName: 'username' value: 'john');
        addPart: (ZnMimePart fieldName: 'foo' entity: (ZnEntity text: '123'));
        addPart: (ZnMimePart fieldName: 'file' fileNamed: filename);
        post.
      self assert: client isSuccess.
      self assert: (client contents includesSubstring: 'multipart') ].
  ZnFileSystemUtils deleteIfExists: 'testPostMultiPart.txt'