baseline
baseline: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                configuration: 'XML Support'
                with: [ 
                    spec
                        versionString: #'stable';
                        repository: 'http://www.squeaksource.com/MetacelloRepository' ];

               configuration: 'Neo JSON' 
               with: [
			 spec
				versionString: #'stable';
				repository: 'http://mc.stfx.eu/Neo' ].
			
		spec
			package: 'Zinc-Character-Encoding-Core';
			package: 'Zinc-Character-Encoding-Tests' with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
			package: 'Zinc-Resource-Meta-Core' with: [ spec requires: 'Zinc-Character-Encoding-Core' ];
			package: 'Zinc-Resource-Meta-Tests' with: [ spec requires: 'Zinc-Resource-Meta-Core' ];
			package: 'Zinc-HTTP' with: [ spec requires: #( 'Zinc-Character-Encoding-Core' 'Zinc-Resource-Meta-Core' ) ];
			package: 'Zinc-Patch-HTTPSocket' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-AWS' with: [ spec requires: #( 'Zinc-HTTP' 'XML Support' ) ];
			package: 'Zinc-REST' with: [ spec requires: #( 'Zinc-HTTP' 'Neo JSON' ) ];
		"	package: 'Zinc-Zodiac' with: [ spec requires: #( 'Zinc-HTTP' 'Zodiac-Core' 'Zodiac-Tests' ) ];"
			package: 'Zinc-WebSocket-Core' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-WebSocket-Tests' with: [ spec requires: 'Zinc-WebSocket-Core' ];
			package: 'Zinc-SSO-OAuth1-Core' with: [ spec requires: #( 'Zinc-HTTP' 'Neo JSON' ) ];
			package: 'Zinc-SSO-OAuth2-Core' with: [ spec requires: #( 'Zinc-HTTP' 'Neo JSON' ) ];
			package: 'Zinc-SSO-OpenID-Core' with: [ spec requires: #( 'Zinc-HTTP' 'XML Support' ) ];
			package: 'Zinc-SSO-Demo' with: [ spec requires: #( 'Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth2-Core' 'Zinc-SSO-OpenID-Core' ) ];
			package: 'Zinc-SSO-OAuth1-Tests' with: [ spec requires: #( 'Zinc-SSO-OAuth1-Core' ) ];
			package: 'Zinc-SSO-OpenID-Tests' with: [ spec requires: #( 'Zinc-SSO-OpenID-Core' ) ];
			package: 'Zinc-WebDAV' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-WWS-Server' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-WWS-Client' with: [ spec requires: 'Zinc-HTTP' ];
			package: 'Zinc-Tests' with: [ spec requires: 'Zinc-HTTP' ].
            spec
                group: 'default' with: #('Core');
                group: 'Core' with: #('Zinc-HTTP');
                group: 'Tests' with: #('Zinc-Tests' 'Zinc-Character-Encoding-Tests' 'Zinc-Resource-Meta-Tests');
                group: 'Character-Encoding' with: #('Zinc-Character-Encoding-Core' 'Zinc-Character-Encoding-Tests');
                group: 'Resource-Meta' with: #('Zinc-Resource-Meta-Core' 'Zinc-Resource-Meta-Tests');
                group: 'Tests' with: #('Zinc-Tests');
                group: 'AWS' with: #('Zinc-AWS');
                group: 'WebDAV' with: #('Zinc-WebDAV');
			group: 'WebSocket' with: #('Zinc-WebSocket-Core' 'Zinc-WebSocket-Tests');
			group: 'SSO-OAuth1' with: #('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth1-Tests');
			group: 'SSO-OAuth2' with: #('Zinc-SSO-OAuth2-Core');
			group: 'SSO-OpenID' with: #('Zinc-SSO-OpenID-Core' 'Zinc-SSO-OpenID-Tests');
			group: 'SSO-Demo' with: #('Zinc-SSO-OAuth1-Core' 'Zinc-SSO-OAuth2-Core' 'Zinc-SSO-OpenID-Core');
			group: 'SSO' with: #('SSO-OAuth1' 'SSO-OAuth2' 'SSO-OpenID' 'SSO-Demo' 'Zinc-SSO-Demo');
                group: 'WWS' with: #('Zinc-WWS-Server' 'Zinc-WWS-Client');
                group: 'REST' with: #('Zinc-REST') ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec 
			package: 'Zinc-Zodiac' with: [ spec requires: #( 'Zinc-HTTP' 'Zodiac-Core' 'Zodiac-Tests' ) ];
			package: 'Zinc-Patch-HTTPSocket' with: [ spec requires: 'Zinc-HTTP' ].
            spec group: 'Patch-HTTPSocket' with: #('Zinc-Patch-HTTPSocket') ].
    spec
        for: #'pharo1.x'
        do: [ 
            spec
                package: 'Zinc-FileSystem-Legacy';
			package: 'Zinc-Pharo-Forward-Compatibility';
			package: 'Zinc-HTTP' with: [ spec requires: #('Zinc-FileSystem-Legacy' 'Zinc-Pharo-Forward-Compatibility') ] ].
    spec
        for: #'pharo2.x'
        do: [ 
            spec
                package: 'Zinc-FileSystem';
                package: 'Zinc-HTTP' with: [ spec requires: 'Zinc-FileSystem' ] ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                configuration: 'GsCore'
                    with: [ 
                            spec
                                version: '0.247';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
                configuration: 'GsMisc'
                    with: [ 
                            spec
                                version: '0.242';
                                loads: #('Announcements');
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ];
                configuration: 'GsPharo'
                    with: [ 
                            spec
                                version: '0.9.2';
                                repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
            spec
                package: 'SocketStream'
                    with: [ 
                            spec
                                file: 'SocketStream-dkh.14';
                                repository: 'http://seaside.gemstone.com/ss/PharoCompat' ];
                package: 'Zinc-FileSystem-Legacy' with: [ spec requires: #('GsCore') ];
                package: 'Zinc-HTTP'
                    with: [ 
                            spec
                                requires: #('Zinc-FileSystem-Legacy');
                                includes: #('SocketStream') ];
                package: 'Zinc-Tests' with: [ spec requires: #('GsPharo') ] ]