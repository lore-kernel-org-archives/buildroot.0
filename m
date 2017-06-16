From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jun 2017 08:29:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-15
Message-ID: <20170616062923.D412321DEA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-15
================================

      successes : 100
       failures : 58 
       timeouts : 0  
          TOTAL : 158

Classification of failures by reason
====================================

            libnpth-legal-info | 15
                 mesa3d-17.1.2 | 9 
knock-258a27e5a47809f97c2b9... | 5 
linuxptp-97c351cafd7327fd28... | 4 
           argp-standalone-1.3 | 2 
                beecrypt-4.2.1 | 2 
                dbus-cpp-0.9.0 | 2 
               qt5webkit-5.8.0 | 2 
              alsa-lib-1.1.4.1 | 1 
                  boost-1.63.0 | 1 
                  cc-tool-0.26 | 1 
                     gpsd-3.16 | 1 
           host-doxygen-1.8.13 | 1 
                   libcap-2.25 | 1 
                 libnss-3.30.2 | 1 
            libpwquality-1.3.0 | 1 
         libspatialindex-1.8.5 | 1 
                    mpd-0.20.7 | 1 
         qt5connectivity-5.8.0 | 1 
                 sngrep-v1.4.3 | 1 
              swupdate-2017.04 | 1 
                    vde2-2.3.2 | 1 
                      x265-2.4 | 1 
                xcb-util-0.3.9 | 1 
                   zlib-1.2.11 | 1 


Detail of failures
===================

         arc |               alsa-lib-1.1.4.1 | NOK | http://autobuild.buildroot.net/results/6d3d98ee1137481e7801516d8e842b8f5e7355c7 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/292e1d9a6ad548d16304fee72b3325f91b410fce |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/c24bc3a59519af68f85c0aedfbd738f2b2b5e370 |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/595beddbc0580ff24c1521ab6ed10f34ce835230 | ORPH
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8542b9bf31ef0a8270d5203727b632bf2a4f6b7d | ORPH
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/80b24577c5f6b37eb8b915ccb09348986dcde915 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0e20528fb48d20f61e01b1fcdc973fb5429337b8 |     
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/5b7f2975b4ba99902d8ed11af9cbddb7fba6859d |     
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/f7be1b8906ca3f195cef3258e71bce7bd6e48598 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/28d2c5fb5e53119202ff0c9b90df03b6bbb7b06b |     
    mips64el |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/080cb7cbf92c9a805be57bd27b325bbc6790610c |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/948bf9f585462e0ba15e821df5c3cfc8ad81fdb6 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6fda9141445e777cc744d995ee6f30ee95025efe |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/06a5ba34fdcf42bcc3fd2e61f6808143614ad36b |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/993d9070009ea29eefa554575bd6483743335ed2 |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/98f80fd7bfc3cfe7618b2f8a491c133327ad8eea |     
         arc |                    libcap-2.25 | NOK | http://autobuild.buildroot.net/results/b49b3a3b95fe1b3d2d86411356717f6e5fc309bb |     
        sh4a |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/2d59b8e6d69b70c621ff2031a9c4fd9e67ef13cf |     
     sparc64 |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/467b8d3716ca2be26210199631abe089842b1a47 |     
        m68k |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/946bdb769409a2950b477702b8a0a34a6c4518bb |     
    mips64el |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/5b8addb9f326d37276170fae6237da83635cb1e9 |     
        i686 |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/a2290839792379523e05fc331cce15cda61f9a21 |     
    mips64el |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/78d1d830cc0753cbe787291ba6a66a48405c8117 |     
        i686 |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/46385f255b353ac016b31e0c9ce8a737bfc811de |     
       nios2 |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/de092488afb47ade40b0b1a11f1ef2dfb612dd8c |     
      xtensa |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/4af75091eb05fad40ff5c42741f96bdbd64186fe |     
         arm |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/3e7d672e5a8ee1a09bc24c884aec39cbd4398803 |     
        sh4a |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/e1d0ce5eb4e9c2bdd6c7e29892f276ff1da2dc54 |     
       sparc |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/92e3019704311d2995350d4ffc7a2cf7e6dd0949 |     
        i686 |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/9b057f83de9400cc909c0777810c157c6b0990d0 |     
       nios2 |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/6318505c8e293e6c00b20eec39d851d0d15f6fec |     
microblazeel |             libnpth-legal-info | NOK | http://autobuild.buildroot.net/results/bef969ede5fc792b0a03f5669071600a0f746a7a |     
         arm |                  libnss-3.30.2 | NOK | http://autobuild.buildroot.net/results/b71e4e003ec5753708a07cfd04e3025c93f80e67 | ORPH
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/d162b7ea46d35588ef7db2b577592016458afd8c |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/82e686694adbb11e82478509e62482a3e34b845a |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/45e4749ff36ab8194ff3e1a09a07576ae73958a2 |     
        i686 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/194316b9138b16f2553d4fac3c842d5fa971a9de |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/ab8a0c65a0fe55c9f904aacb041d0de54811ed1c |     
        m68k | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d464fdd1604c5811134b6940c3683729277159d9 |     
         arm |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/3efe156b6494e4392b6c31de447ee2c72acc1a53 |     
    mips64el |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/8181d29f7538183a5e100b69b39957064e65eff3 |     
    mips64el |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/a48543f28c8aee93f182fbdaf096878fd696c2b9 |     
         arm |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/c197368e55d00608df606f3b4e6a11207f6be494 |     
         arm |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/c01e1e9c9b77ec66cc8c3c6a128ddc438bc2743a |     
      mipsel |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/8124a91cae1a444e2c8621a57a05d84c2085c3fb |     
        mips |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/e8894fad55b9c3c95aec9ba5fcb79bd2b5e91079 |     
   powerpc64 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/b2a1b6be29198ee8ba7bb0059c27c8f8368c104b |     
    mips64el |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/3e146881c747e314a7330652500f330d64f56f24 |     
    mips64el |                     mpd-0.20.7 | NOK | http://autobuild.buildroot.net/results/27d0611038e748e28fb06f0cd3ef3ee6c5614203 |     
        mips |          qt5connectivity-5.8.0 | NOK | http://autobuild.buildroot.net/results/5875e07a288b11c8167382ad22a9d55e55138836 |     
      x86_64 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/8e4821ac382b7ff36571d603e6de943a9b26872d |     
      x86_64 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/f9321b16e20cd549f56126ad1a91f2c2bc62c5e8 |     
   powerpc64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/0e938b6c1e6ab2fc11910b556a784e3449a8dae5 |     
         arm |               swupdate-2017.04 | NOK | http://autobuild.buildroot.net/results/12c288b71016329a7e7536bd0a53796401e11cca |     
         arm |                     vde2-2.3.2 | NOK | http://autobuild.buildroot.net/results/da38d396347456716db45480862e6e71ec06f019 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/48cdf4af7e3b95247525e641167a36d5e003e705 |     
      mipsel |                 xcb-util-0.3.9 | NOK | http://autobuild.buildroot.net/results/690127350f20db7a33e283076b73432cab40ba8c |     
         arc |                    zlib-1.2.11 | NOK | http://autobuild.buildroot.net/results/5ac938dc9ba20700247898839b786c0a2e0a92e0 | ORPH

-- 
http://autobuild.buildroot.net
