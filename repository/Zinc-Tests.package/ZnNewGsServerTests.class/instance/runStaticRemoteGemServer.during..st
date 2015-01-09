private
runStaticRemoteGemServer: gemServer during: block
  "mount @/sys/stone/dirs/GsApplicationTools/tode /home gemserver"

  "abort; /home/gemserver/example --start=ZnServerBasedTestServer"

  "limit autoCommit false; eval `System transactionMode: #manualBegin` /home/gemserver/example --start=ZnServerBasedTestServer"

  System commitTransaction.
  self notify: 'Please abort and start static gem server'.
  [ block cull: gemServer ]
    ensure: [ gemServer unregister ]