From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jul 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-21
Message-ID: <20190722060119.99AA11FD21@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   0 |   0 |  20 |
   2019.05.x |  17 |   0 |   0 |  17 |
      master | 127 |  44 |   2 | 173 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 9 
           can-utils-2018.02.0 | 4 
                       unknown | 4 
        glib-networking-2.61.1 | 3 
                 libv4l-1.16.5 | 3 
              domoticz-4.10717 | 2 
                     host-llvm | 2 
               libupnpp-0.17.1 | 2 
            qt5serialbus-5.6.3 | 2 
                suricata-4.1.3 | 2 
    xserver_xorg-server-1.20.5 | 2 
/usr/lfs/v0/rc-buildroot-te... | 1 
                  flashrom-1.1 | 1 
                     gzip-1.10 | 1 
             host-cargo-0.26.0 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-10.15.3 | 1 
               libgtk2-2.24.32 | 1 
               log4cplus-2.0.4 | 1 
                 python3-3.7.4 | 1 
                qt5base-5.12.4 | 1 
tvheadend-8f1de1621d78c9143... | 1 


Detail of failures
------------------

         arc | /usr/lfs/v0/rc-buildroot-te... | NOK | http://autobuild.buildroot.net/results/f27c379a613c2616bfec3659b4648ea00043f45b |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/56c8b816954075367316a9f5b7ebf012b1c5b21f |     
     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/c6c67351b9fb87cfe1e2167ff6ca0838c1cb8f2b |     
         arm |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/c70d898ca3dc0c0d1b40aa6076887894c36d75cc |     
         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/c8c39863766e5059e424b3976606bd46b89618a6 |     
      x86_64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/779d93fb84afd9ac0d16ea70aa0d6f448368ebd6 |     
     riscv32 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/3e653c32018465d91e6f783a74d95669c9faca10 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/b16e41558241758c8c0dc862d9a2514bfddde390 |     
         arm |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/c7a85db9a15a4de5ccaee93f22dac18a2bc6a22f |     
      x86_64 |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/412466e0f33b519177a1aca10f42b7b346db58a7 |     
         arm |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/a933b9dd8e720d089a91a41159dab798e11ffa9b |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/ac9b27a0856cb262f9b9fc333beb83fab159045b | ORPH
 powerpc64le |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/afd81a3cf0611d84e5b739ab6aaf1a2743338fec |     
      x86_64 |                      host-llvm | TIM | http://autobuild.buildroot.net/results/054d42b66fba216c6061e4972389b9b07a246fbe |     
         arm |                      host-llvm | TIM | http://autobuild.buildroot.net/results/a9c8fa748a58e35d641922d88f4eff55d3242c94 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/441bc5a3686f007917cc2975be2da27971c4c8cc |     
      mipsel |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/919a97bdce1ab3209c2d6d20376db5e67d827fef |     
      xtensa |                libgtk2-2.24.32 | NOK | http://autobuild.buildroot.net/results/c16ddfc180e9c8853b153d2fa0d4d9e82329491c |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/f5007d15a07e39da79be2d22342da6851c17d0b1 |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/137571e72039008932d5d9648f592d63272e6b3e |     
        mips |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/6d921118158672c405ab0b210783ecce26e4f9bd |     
      x86_64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/e75a89f1a47b562b3bf77ee72d05b9af8cda7be3 |     
   powerpc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/a6df603bf6183bc037ea63fd83c2329dfdb8936d |     
         arc |                log4cplus-2.0.4 | NOK | http://autobuild.buildroot.net/results/03f41751bf66153ca8efcd6b4a871bab43838564 |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/14a822d487488d25ac340a01c8afd141b2f1b879 |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/91216360fd17f14ab9fe076e3f3baef6d7b3a54e |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/0232befacb0c2a5ed228cd1583722f567b3cd9e2 |     
      x86_64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/48e2e8a1f2cb0bd763a873d95dba0e74388f01ac |     
microblazeel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/07220bf16accee8d01d01603996a1f0743cb62d8 |     
         sh4 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/f817d38559070b03742434f5eba87adf99a516b0 |     
       nios2 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/dd2192ba58e673c4fb3f730ae4b8142172a45512 |     
     powerpc |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/fadbd68f80a64e5da3f5ebdb05a6bc62fd9ff7a4 |     
     aarch64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a8bde31b86993ed10bfdad8dd0a2e21c6feb85a1 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/e55bedd0eea7df83370a479814bdd90cb3846217 |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/ba06c6032efa3080f3a63d0afb92e7224866f28d |     
      xtensa |             qt5serialbus-5.6.3 | NOK | http://autobuild.buildroot.net/results/8de28a239695171bd81721e6160d10e578f51089 |     
      xtensa |             qt5serialbus-5.6.3 | NOK | http://autobuild.buildroot.net/results/a735d17af99bec33f9f20dcb5478683cbaec7888 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/a98aad6e71b731ef82ca959fbf694c6a448b2bd8 |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/933f2127a453c759762a10d1678d70a69df97d5c |     
     powerpc | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/77163472c71cbc28f2839314f14f9446e7f47f8c |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/8757a1a3ce4a31e1ab3ff43e568ee4b2c23d1f59 |     
     riscv64 |                        unknown | NOK | http://autobuild.buildroot.net/results/d06fb29b120753a21be845ee5218fdd8213e4336 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/e26c39abd5bfe125f6d1216d5ed3b2a4865907ee |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/9588e7c019e15aebaaf7b19bddaa68bd324003ad |     
         arc |     xserver_xorg-server-1.20.5 | NOK | http://autobuild.buildroot.net/results/41bbb16160f24180be4ad3c1ce626c6dea43611e |     
         arc |     xserver_xorg-server-1.20.5 | NOK | http://autobuild.buildroot.net/results/279a0c3a8140846abf59b2fe290daddf5a443599 |     


-- 
http://autobuild.buildroot.net
