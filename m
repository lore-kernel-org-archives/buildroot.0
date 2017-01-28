From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 08:29:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-27
Message-ID: <20170128072936.1EFDF20DEF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-27
================================

      successes : 139
       failures : 68 
       timeouts : 0  
          TOTAL : 207

Classification of failures by reason
====================================

               sdl2_ttf-2.0.14 | 10
                  samba4-4.5.4 | 8 
                    ruby-2.4.0 | 7 
                 sngrep-v1.4.2 | 6 
                   ortp-0.27.0 | 5 
          janus-gateway-v0.2.1 | 4 
                  fbterm-1.7.0 | 3 
            host-heimdal-7.1.0 | 2 
            lttng-libust-2.9.0 | 2 
                    mpd-0.20.3 | 2 
                 synergy-1.3.1 | 2 
               bctoolbox-0.4.0 | 1 
                  boost-1.61.0 | 1 
                  cppcms-1.0.5 | 1 
               domoticz-3.5877 | 1 
                  guile-2.0.13 | 1 
               libepoxy-v1.3.1 | 1 
             libsidplay2-2.1.1 | 1 
                log4cxx-0.10.0 | 1 
             lttng-tools-2.9.3 | 1 
                    mpd-0.20.2 | 1 
                    mpv-0.23.0 | 1 
                 opencv-2.4.13 | 1 
               qt5webkit-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
        riemann-c-client-1.9.1 | 1 
               trousers-0.3.13 | 1 
                 wavpack-5.1.0 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/d4813f1c9d86d09a3dc8ae29abbd854e6b651469
         arc |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/ecc81e2981dd830b8abae44f16e6146687999fd2
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/67a5b51058c273f56006a35853b42b220926c281
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/ba165edb45625a88df582954b258a2f03467a67b
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/6162811754681339bbaae0820f44f7d62a63e5e7
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/92e8af16cc0780316ea957459f98b02f601f873c
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/bf18cee699688d3f2a052edd47c7fc587b93a3b0
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/3009c94493d11546886176ddbf194519df9673bb
    mips64el |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/f578ac7325228b5e8957fb267e59f457a87e2197
     sparc64 |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/4db579542ce3d9e6012c7454746b4e957aa5bffc
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/091786b5e1bccfdb4a656803caaa8d0dbd5c1b9c
        sh4a |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/6b0af951321fafce322adba1418c999cd8da881d
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/eea51409262c2c90af5e8b83b61303c638de5c70
        i686 |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/247e9a978a22924337b74b638ff799211737e495
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/bb4caf9d96706a0e4a485ab32145eaf842af4358
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/fdea0b4dc25521179ba2682278d7a683974b6b65
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/de8f2b132084a10fbe8efb38c7b31adca4562852
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/b0d5bf3e38afc343ea80fa31ffa54ff67c26ed34
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/e29dacd5b088200cab2d7f5a569c09996d183fe3
      x86_64 |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/ae91330f90fd084cfe401fe943553557dcc45af1
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/c060e1353f7250e95aceb83950c2baddf15ccdb4
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/76dc8849cd5584e795d5c22648748dcd7775f8de
       sparc |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/1474bcaa1634e07e09e8f47aa53f7c4be99b35b6
         arm |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/89062ba57eb367dc67a192e1554468b0419ae141
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/d508c2c0881ac2950b493e535dea23f494987d96
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/d934d2c8e92bb364e2125d61d6cafef4ed0d9a7b
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/0acd9eee181643333340971e1181ebd2ab799ec9
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/353e75eb2fc27539b2b31bc201667ab6eef0c672
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/4a5b13880a770470b4e0fcfab28da22712d69aa4
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/902b7ef9d477d7b20afdbcbca21cc8dc078afc4a
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/8ad63ee1b6be2ebe4e7405d7a8fbb81f67cfdcb0
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/57098d53fab4512c41d6972ea4e158eab30a3cd6
         arm |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/9270ec52ce98733c86bf413e8dd7c7057a339c95
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/085ec169882e0eb6185a363ab54950af42508592
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/b9547e86d4d68ef853159692ed93a2a0e3b603d7
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/43e4c5fe8b9fdd3035be92e6449f5a9377a5e52b
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/720b9ad3aac3e75953d212aacd31c7563474df17
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/5fd02602824cc8066bed702e5339a95e8c40603c
         sh4 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/2fd3f7b3c6ecfa5e6196a876126315cddec766a6
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/0672f70df20f232604bd701d74d7c5a2acaf8865
         arm |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/5d0c3ef9576807beb937a0f65957f1a1d97d1646
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/4266a1690b85bde8da130a84845d1985128bda63
      mipsel |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/8c5dbc23ba14eba30f72a42f5859fa753f96e31a
      mipsel |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/67904c6d54ab8244f44e5ca5ecfba916d38a365e
    mips64el |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/181064d57519e56db813bd979e3f13e2a98f2b1d
      xtensa |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/28e7c89903afe1c62765c37dc9a175fa038d60e8
      x86_64 |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/c10155e278a2c0329a70f49dfe463ec9c7ccfae2
        sh4a |                   samba4-4.5.4 | NOK | http://autobuild.buildroot.net/results/668c75ebf5ed67ebdca3a6bbed38cdb84a94ead6
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a89c6792799db5c61619e8f59ff9302eb5b16127
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/348f4457e3b94afcf1dca1b7a0672fb4cdc29792
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/693c96fc07f8bc0d95f80e32ac73414f24051a05
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f45a9588090c296c9c5ece2cbc71f8bb64bebf73
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/180075399932ad78c7cb7e840a8b0d0a4f8f32e4
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/cefd6767bfe2e232dd0e117635fca9ac42fcfb8b
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9bc641640edfeff6e6d581aa3bd249a7715b1829
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9cb669ab6760420421e3c907462b69fe36c46601
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a84d2e8aa9d9263f362ff0d9e2a4677d6d725a25
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f8d06e399d5151f2a3107247d352a50dbfb9f352
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/c5a79d83426ca332a7c347bdea4f4e536ad6e482
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7c5f0fd9f1049ab7dc395f3570aa18d27be8489b
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/349fac4d63fa49776e4730a9bf20e8a436eb7cb6
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0adcd18f7f66065f8df87f27b69ac64de7e4550a
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7c775b1faf7be90fb4acd3653600f7b6b48aa86f
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/e8a02d4278fe3a926cd0f319928325c6848c2d1e
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/1178527ec7a650ff143b7ca03a691170f7dc1b03
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/ef684f0e026b4a9389d80fa8af030ac1d770b636
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/4e6a017069266f06c721ba3c798533d48dac86d1
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/7a4d181f8ce2c843f05acac79a2ab9692573e5ff

-- 
http://autobuild.buildroot.net
