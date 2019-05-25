From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 May 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-24
Message-ID: <20190525060042.60C8D88B66@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   1 |   0 |  17 |
      master | 150 |  15 |   0 | 165 |
        next |  45 |  13 |   0 |  58 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 3 
             iputils-s20190515 | 2 
          wpebackend-fdo-1.0.1 | 2 
                   bullet-2.88 | 1 
                cracklib-2.9.7 | 1 
              domoticz-4.10717 | 1 
libubootenv-8a7d4030bcb106d... | 1 
                  monkey-1.6.9 | 1 
       python-matplotlib-3.0.3 | 1 


Detail of failures
------------------

        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/0993bfdf06b41247a485964b1165fae33fdf2bd3 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/1c3089de7c6a864b02bad1fd26d1402704f369d9 |     
        mips |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f8e2c8a952b20eb7314b89f1eb5006d65df98830 | ORPH
      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/b307f3ec1b554111c995344daa725be9a6c8d3f7 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8e7759f6aeccd454717fdabe386350cd87909390 | ORPH
      xtensa |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/3dbb6612205020cc156d245a75c76a7886f7d529 |     
     powerpc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/d1661935177cf20b6ed021e4b8f840d3c7edc988 |     
     aarch64 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/a153bfe193256099dac0020fc7c1116263ece229 |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/328fe2ace0034bb577694e358ae103fc4dda870e |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/7abfcc3ddcf69e3024c984831f1ab1bf5ba311c1 |     
      xtensa |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/04dec54be9ff031cd8a7988aab6533b8d19191ce |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/92885aa7e0ef51ecf2f345c2213dfb8c28cdeac0 |     
       nios2 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/586af974dc3fd0645e941b1c87c86689a3c46ff1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 3 
                  linuxptp-2.0 | 2 
              spandsp-20180108 | 2 
                suricata-4.1.3 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                    dhcp-4.4.1 | 1 
               host-gdb-7.12.1 | 1 
             keepalived-2.0.15 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

 powerpc64le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ed9dd1b3b7c7a2df547f49c6a7de539d225fff6e | ORPH
     nds32le |                host-gdb-7.12.1 | NOK | http://autobuild.buildroot.net/results/1a40b1ac5f06c856c2e30dbbb4e485022c438c72 | ORPH
     aarch64 |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/955aef1c25b977d6697fdf8cd1e710f40c7e60a3 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/4c570cb0d96acd012b8f12c25a35a17002b833cd |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/412d6af05f8e6d9636cf09b5ba057aadfd28d449 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/38902eb83d2af0d34383c9b0be0626ca383a9220 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2daa4d0798149fa07877ab4292f1005c7a5c9dbd |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e80de43d766391baf25fd160ec2d8efaf3b2f60e |     
    mips64el |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a62f5d6c5f1c17d5c3a05803ec33366cbbed9d41 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/9baa0b9fb4403d1db4d8a6405f3c0358517266be |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/40780c9f67294a1ceddb820e8c58e41a1e2622ae |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/53f943b2aeeaf868ee47cc0c177a56c25f4ae951 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/3e012b38839dce38746781c0768ad75618dd79ba |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d642b4c329145f1ab4fbc067bdeb91c73c7fd019 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/18bd0419efe62eaece804826970d9ee8512e91e7 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 


Detail of failures
------------------

      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f446d980524468893a683e43600381ceea1da63f |     


-- 
http://autobuild.buildroot.net
