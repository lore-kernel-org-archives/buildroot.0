From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 12:45:53 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-28
Message-ID: <20171029114553.3D460207B5@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-28
================================

      successes : 134
       failures : 56 
       timeouts : 1  
          TOTAL : 191

Classification of failures by reason
====================================

                  boost-1.65.1 | 15
           argp-standalone-1.3 | 10
                     nmap-7.60 | 4 
                  ffmpeg-3.3.4 | 3 
             gstreamer-0.10.36 | 2 
                   jimtcl-0.75 | 2 
                openobex-1.7.2 | 2 
             core-dependencies | 1 
                    cups-2.2.5 | 1 
                  ffmpeg-3.3.5 | 1 
                    gpm-1.20.7 | 1 
              host-erlang-19.3 | 1 
  host-gdb-arc-2017.09-rc1-gdb | 1 
       host-go-bootstrap-1.4.3 | 1 
             host-luajit-2.0.5 | 1 
host-vboot-utils-bbdd62f9b0... | 1 
                  libbsd-0.8.3 | 1 
                  libsepol-2.7 | 1 
             lttng-tools-2.9.5 | 1 
                 mesa3d-17.2.3 | 1 
                 openssh-7.6p1 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 
             stress-ng-0.06.15 | 1 
                  tremor-19427 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/13e74c85baf6dea89c8c87c7f6f0e589aadf6110 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b941159abd7e5ee5dc30e10357c87979ef5faa7b | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/55329007941b0445ad3bc886c926055748035258 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/06ae73c4396212dd4f46cad6fcf68b77f7efdd9b | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f8d0e10f05bef06e9224eaa38c4f78c438ae9286 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8aeddbd5b936f35106f39a426b10ba056c8545dd | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b85800b2be93090d7ce79af3ee2d157bb9be4dd0 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f306e1ea71658e34dec7af56239dac63cce2b39f | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/a6329b5b54f211d6b082007614d46d265f689a24 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/692dfc476a26acc65807d81dcfe85c5e5d976166 | ORPH
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/0ad1fb4b4f9c85d5303e385efb35f546b1065900 |     
      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/7b507309ec0fa3fb0845ffef16f0e8bb07e7f810 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/7bffa0bf7cccdf8264e6d1417b415e14a4309ef8 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/6ffea58a31606bd101955f6b60ed1757b91bc29c |     
        bfin |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/7b058f75ddd9442a5a262551a2379ff7bde3ecd6 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/ff6d0fc578a78a6d322980cd366c6c3125d68510 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/4797ad1cf7ced38321f8b6558102553367224dda |     
microblazeel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/94d9de741a947377daa19c517c450820d3c567a9 |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/00853411827d2cb400de994a05c4b08a2937d6a5 |     
microblazeel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/94d15f387c817e7065d40ae4be30dc4b2ad43b95 |     
microblazeel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/d7fc8687be83474e1060b84afcbcba71be625b0c |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f32a9d7d9ba4ed430d303194bf75465f7b74697d |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/26a0881745a1814b604425b12e3647673e8e842b |     
         arm |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/53bcac4e35c441c3be4f44450a10cb0a65aff5d4 |     
        m68k |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/8fa10cc9db38714b577c1a655e25e2cbbcdf6804 |     
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/bf5ff5c0ee9d0b86316cc5599ae38fa139bf2f1e |     
         arm |                     cups-2.2.5 | NOK | http://autobuild.buildroot.net/results/374537e8d84a97811d91b622b2498a9d40fae1d5 | ORPH
       nios2 |                   ffmpeg-3.3.4 | NOK | http://autobuild.buildroot.net/results/2b77b99478529f946dc2418e2012f46bc8f440a9 |     
         arc |                   ffmpeg-3.3.4 | NOK | http://autobuild.buildroot.net/results/5549cd590e5a6cecbd16aee92597ed8d603b7209 |     
         arc |                   ffmpeg-3.3.4 | NOK | http://autobuild.buildroot.net/results/2348c975af82c3dbd05d6d7ca729603d31e99702 |     
       nios2 |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/91a08e63690421a0c197e987af15e91e78afb96f |     
         arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/9b98536646972a548aa9bc8d4cde73bdb347a6ae |     
      xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/fecdda2fa106b8b78171f82a1bb7f1f22263341b | ORPH
        i586 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/8fd6b1cc0bd0f74d3b85f006ce3f372f57b45e45 | ORPH
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/9af3e2ddfb81455bb28ba64a7d5e8ad7b6e3b8a6 |     
         arc |   host-gdb-arc-2017.09-rc1-gdb | NOK | http://autobuild.buildroot.net/results/dd2c132c03fdd05acf8ff4d1b1f9031b0109f56f | ORPH
         arm |        host-go-bootstrap-1.4.3 | NOK | http://autobuild.buildroot.net/results/2288c382a159cadfa385bc10c42ccc49e05bd536 | ORPH
         arm |              host-luajit-2.0.5 | NOK | http://autobuild.buildroot.net/results/93577b972737338b57ee4f703caeff14a0243580 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/291ddd926601990344cabb252502b25844db081b |     
         arc |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/9c0e97a3ca84bc26477503f00ae4f6819b82668f |     
      xtensa |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/abd4b63fa8184653ed10653dfb55f3af24b708df |     
         arc |                   libbsd-0.8.3 | NOK | http://autobuild.buildroot.net/results/32581f7a79372b525e4ad21e029ff0ede743ba94 |     
         arm |                   libsepol-2.7 | NOK | http://autobuild.buildroot.net/results/990e16de527935d16b76b1dd33d229741eac22b8 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/ee62a7fb88079403e13486f0e4265f65678a41bc |     
     powerpc |                  mesa3d-17.2.3 | NOK | http://autobuild.buildroot.net/results/43d8bf9a1531f4b69e22bfb53b4536d76cf31cbb |     
        m68k |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/767e71cccc0996c07e98eefe5dced363f4a17c83 | ORPH
    mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/863f5499ed286bc822e62a11b5b2e962d7aa4f43 | ORPH
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/83ae670196179b16f8d406dbb8f415d5bd81b0d2 | ORPH
     powerpc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/4c0d8213d2db1cba05f4fa2cbfc00fcf9a944e54 | ORPH
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/117f62d98c97fbf820f18327358a0feefdd90bd2 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/05bf8182c4a7a8df9b14461e4d89835248b46a31 |     
         arm |                  openssh-7.6p1 | NOK | http://autobuild.buildroot.net/results/e83788a8b66a62bb03433057fca576b5fc26eb72 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/287af89b4f246e4ec6e665e330c59f8ee29eb6ab | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f9347cc6a6af2d7471f5ec1b4c01517f1e85c9d6 |     
         arc |              stress-ng-0.06.15 | NOK | http://autobuild.buildroot.net/results/b5b52ac0a70ff14f57ec62d904c97145d2ea074e |     
    mips64el |                   tremor-19427 | TIM | http://autobuild.buildroot.net/results/6b3e64e2e3a89971cbd3a4bb576f8ef1474a899c |     
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/4ea1d71fc6dbcd33805d592f1dc48bafff7bd0ec | ORPH

-- 
http://autobuild.buildroot.net
