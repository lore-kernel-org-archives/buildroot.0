From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Oct 2017 08:30:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-15
Message-ID: <20171016063059.BEFBC20758@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-15
================================

      successes : 154
       failures : 36 
       timeouts : 0  
          TOTAL : 190

Classification of failures by reason
====================================

      host-uboot-tools-2017.07 | 6 
           argp-standalone-1.3 | 3 
             dbus-python-1.2.4 | 3 
                     nmap-7.60 | 3 
                openjpeg-2.2.0 | 3 
            libtomcrypt-1.18.0 | 2 
                 msgpack-2.1.5 | 2 
pdbg-77158819158d1d7053a737... | 2 
                    sdl2-2.0.6 | 2 
                  boost-1.64.0 | 1 
                  cc-tool-0.26 | 1 
             gstreamer1-1.12.3 | 1 
                libressl-2.5.5 | 1 
                   mp4v2-2.0.0 | 1 
                 orbit-2.2.4-1 | 1 
                pinentry-1.0.0 | 1 
                      qt-4.8.7 | 1 
         qt5connectivity-5.6.2 | 1 
           uboot-tools-2017.07 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5de93a9dae7731f7041be84ddf8ec5f68d507e12 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5f2b699fb8ed081de2b0eb06fbba295d73073810 |     
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/dc892b1c6342eee6b8d05ba482cc35bcf372a1ad |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/caf0650a2601662f1f8560ed9219c0dd439c02bf |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/09acac68c9eaeaa37ab76522cb17a6a2d89b3724 |     
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/f3239632e57bf7265b66a5a44fa756d1f5a4eb6f | ORPH
       nios2 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/2cc5460605e4e3f930f76b77030d0dbb6ba4b053 | ORPH
         arm |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/693632e33ea17ec665fea255cd57268eb124a924 | ORPH
        i686 |              gstreamer1-1.12.3 | NOK | http://autobuild.buildroot.net/results/147d87323a4ea9d6f968151334a1a5126cc4e185 |     
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/05194e9d0d520af81756d78736da632cf046d27e | ORPH
     powerpc |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/92861ce607304252c164d93fe83f5d7e6cbb6b13 | ORPH
        i686 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/635ab8dc72e50ce88ddfc0bbcbec948189bf462f | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/943d7defe24cc5f7112d1afc21dfa25d56056421 | ORPH
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/eff43227bda4322fd9a85fdb0ff77518a30cbecf | ORPH
     aarch64 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/84f0097f8f0d977950865db75e89f593c02ad1ed | ORPH
         arm |                 libressl-2.5.5 | NOK | http://autobuild.buildroot.net/results/9be6b42a06b70946394eb65576cd124d0977d74a |     
         arm |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/75624fe2c3e64dc273067a325c91d6703c4b6817 |     
         arm |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/8fea30e916863065287c3ad1568d8ab1f8b09dcb |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/364a2165018ac379d51abd2d437321d4be4beb11 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/0d13e0d37ca857cba7c47e8f8ee3d385ef1f3700 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/72f838c94f36c2576259e34370fbf7e6c491fae9 |     
     aarch64 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/46a53e6168206b47211489ab77dcd876cfa44058 |     
        i686 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/1d85244cb5836d05ddbaba0b84bb1e7429495c80 |     
     powerpc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c0329214284738c91462a0eefc89513ed56eeeb1 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/ec017577450ce798b162376d51c0a1f54c3f6070 |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c6a003d0369cb344d11cd435ad66d64f08a1203a |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/7410fa20171857cb8bae0bd4fac41829f37399b9 |     
      x86_64 |                  orbit-2.2.4-1 | NOK | http://autobuild.buildroot.net/results/020a50d1fb46fe90204df689877b00154001089a |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/9b35082d284c9ea6fe9d52193cbea9d065f42b35 |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/a22f2d13ea54c1c06e5ef42d3cd0d31f4eca0a2a |     
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/9b381699ce0f834382779504f6ee10a0f5fc0d5a |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9d6a9b4be442bcff264247d05bf7773ddf52b54c | ORPH
    mips64el |          qt5connectivity-5.6.2 | NOK | http://autobuild.buildroot.net/results/b7886eb7df5cfaeb0c75819ab69278159cde195f |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/288e9bca41da3f679fabd33e6936bd55ed1324ee |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/ef98865fccc6cf5f74ec65aaca429d25c8aa733b |     
         arm |            uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/d3b3400448110fb9269eb6d335672273288f0a23 | ORPH

-- 
http://autobuild.buildroot.net
