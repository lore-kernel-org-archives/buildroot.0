From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Oct 2018 08:00:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-12
Message-ID: <20181013060028.3180B20898@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   1 |   0 |  24 |
   2018.08.x |  19 |   0 |   0 |  19 |
      master | 186 |  37 |   0 | 223 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/29eccf56c571b1cdba382801472e3e3d8756c937 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     vlc-3.0.4 | 7 
               target-finalize | 5 
                   luvi-v2.8.0 | 4 
                  ntp-4.2.8p12 | 4 
                  xerces-3.2.2 | 3 
                    pppd-2.4.7 | 2 
             util-linux-2.32.1 | 2 
                  cc-tool-0.26 | 1 
                 dc3dd-7.2.641 | 1 
     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
gstreamer1-editing-services... | 1 
                   gvfs-1.30.3 | 1 
 Makefile:709: target-finalize | 1 
          motion-release-4.1.1 | 1 
              spandsp-20180108 | 1 
                     squid-4.3 | 1 


Detail of failures
------------------

      x86_64 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fc8f8a64751c751b2b66301967cc008509bbaa70 |     
         arm |                  dc3dd-7.2.641 | NOK | http://autobuild.buildroot.net/results/8c45759552a87f6d262f8729100046ec42989e71 | ORPH
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/be86bfa7abcafa16747dca0614c88b10c94398e7 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/17c0ada8cbc45cbef47c2d0f53b3154fc7bd04e7 |     
         arc | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/92010fb84fb7eda3881fa54c6b55e27c8913bb2f |     
         arm |                    gvfs-1.30.3 | NOK | http://autobuild.buildroot.net/results/1c8dd427e589af0f9abc88eca5c7bac6d87c2623 | ORPH
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/11146b138d3d092c3a230d197528d5dbe293e3fc |     
         arm |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/93a68d3d65c6cd982b8e7faaee4b330cdf629a62 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/40e2382ce10ad396dfbb073e16e4b2184eda55f5 |     
        i686 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/93fdf3ac9a8136b4a05e052343528cf8aefefd13 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/66ff2a910c34f0dec1b3592bed30118167ca9be5 |     
         arc |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/766de487f394490df8c712652ac364ebb4a3ab14 |     
         arm |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/c5cf28bb969fec7c07864cdd094dedfa4d5439d2 | ORPH
         arm |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/85c89f5e9d36915567b8d14b9c99e3720c866577 | ORPH
        m68k |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/d0b20a6c0f37a8b06841afc2764c8aab6ffd27d2 | ORPH
         arm |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/9f4710b451df1a60f95ab6503cfb7788ad998a65 | ORPH
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/3cd50017108865f6e73db2437a2e4b32f7d24bb4 | ORPH
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/619d0894f616aa62f7435a38c367aaa83c3e21f7 | ORPH
         arm |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/243f1d1271a767556e0a4cd56a42fcc8c1a371ed |     
     powerpc |                      squid-4.3 | NOK | http://autobuild.buildroot.net/results/92117726e7b4ede08dcc0e4fd1a85171fd17aeb8 | ORPH
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/fcc4daa5a319883fdc991b5a504cc7528208696a |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/927474736669cb85e92b361366065341cb238be9 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ffeb2b6de862e72aa4e64df4f332af3872e5838c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/31c942a43064fc012286724e545773cba6e57cc3 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/43b8a8f616e422c72e9c6a585981797eb07d8bc3 |     
        mips |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/629eac0ad1c2b2697b8c36242bd35d7bd8e7a805 |     
        i686 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/c28dc1b53359524bef0e543b91fd2aed1ff85b09 |     
         arm |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/45587b712345e4e5634160930b1fc9f688977032 |     
         sh4 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/fd790273852c83b9fb7b048d7ee45fcab0f95098 |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7a877cf0d4e41de13f5761b5dbd7302f3245fbe8 |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/3557fd757a3e55c74f5f50e1bcf3215a84eeec1b |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/99e79898229a799f18a0a3b77ca1b512bb98e22a |     
         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/7f79d6173a65146e51d8fad5de7d72e0a651907c |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/b517651cac843693c96caa9c04433d2955134011 |     
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/fd57be164c7ff46b87f2c42d7190fe99740beacf | ORPH
microblazeel |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/2f333331a76ea79ba62fc89111dddd9b65235080 | ORPH
         arm |                   xerces-3.2.2 | NOK | http://autobuild.buildroot.net/results/7c8a74ba6c5363022745d90e1eb5f4792014b0c7 | ORPH


-- 
http://autobuild.buildroot.net
