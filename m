From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Sep 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-13
Message-ID: <20160914063031.2385F102989@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-13
================================

      successes : 186
       failures : 162
       timeouts : 8  
          TOTAL : 356

Classification of failures by reason
====================================

                    urg-0.8.18 | 36
             core-dependencies | 27
                upmpdcli-1.2.2 | 27
               libupnpp-0.15.0 | 7 
                    mpv-0.20.0 | 6 
                 mono-4.4.2.11 | 4 
                     xen-4.7.0 | 4 
              e2fsprogs-1.43.3 | 3 
                  ffmpeg-3.1.3 | 3 
                   glog-v0.3.4 | 3 
              libarchive-3.2.1 | 3 
                 openal-1.17.2 | 3 
                    qemu-2.7.0 | 3 
                    cups-2.1.4 | 2 
filemq-e59951489045825d6fc5... | 2 
make[1]: *** [libavfilter/a... | 2 
                 mplayer-1.3.0 | 2 
          sane-backends-1.0.25 | 2 
                blktrace-1.1.0 | 1 
                coreutils-8.25 | 1 
                  cppcms-1.0.5 | 1 
                     gpsd-3.16 | 1 
       host-erlang-rebar-2.6.4 | 1 
               libepoxy-v1.3.1 | 1 
                  libffi-3.2.1 | 1 
                libmad-0.15.1b | 1 
          libwebsockets-v2.0.2 | 1 
                libxslt-1.1.29 | 1 
                 lvm2-2.02.165 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** Waiting for un... | 1 
 make[2]: *** [all] Terminated | 1 
make[2]: *** [libavfilter/a... | 1 
                 mesa3d-12.0.2 | 1 
                    mpfr-3.1.4 | 1 
                    ola-0.10.0 | 1 
                 opencv3-3.1.0 | 1 
           python-psutil-4.3.0 | 1 
               qt5base-5.6.1-1 | 1 
           quagga-1.0.20160315 | 1 
                  samba4-4.4.5 | 1 
                socat-2.0.0-b9 | 1 
                   taskd-1.1.0 | 1 
                  trinity-v1.6 | 1 
                   ushare-1.1a | 1 
               wireshark-2.2.0 | 1 
               wvstreams-4.6.1 | 1 
                 xenomai-2.6.4 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/060677b38bebdf02922bab6a5690793dab043c5a
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/01f32b79950bc7fad2e4e8251ef02706e357e8bd
      xtensa |              core-dependencies | NOK | http://autobuild.buildroot.net/results/ebc00c4c07f344fadc36438e7a9ee639c5c8bc04
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/d6716f786b373ab53bb00deb7c8117ea80829bc4
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/1092dec86e826b6de5f916b4f5fc16d3ea582396
        i586 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/12331214bff33c7ca8ed95fb7d314c8e264e7217
        bfin |              core-dependencies | NOK | http://autobuild.buildroot.net/results/cf89f727c543e2fea2db908713a578d328435bea
      x86_64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/6a7ddc433f0a0887dbbfb3abf844e38460c43e9c
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/bebf626d4d2c2984b7d182a458eeb02a9b8aa61d
     sparc64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/7a86ceb8df15fb2b74c00e50976b40873f1787b3
        m68k |              core-dependencies | NOK | http://autobuild.buildroot.net/results/b42e64e820232776ce9a1571e8f7a1f1622ebaa1
       nios2 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/b72f2fe5f832f981b76ab21a9e209ef79c42b398
     powerpc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/02b782fc1623fc6030efb2b0a6b991a82e2caba0
      x86_64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/7f8da8964b41f84f69af0c0db2ec0d072587d5e4
        i686 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/6c0bb132e790d1ab072ae1d2caf0e5e5da90aec8
        m68k |              core-dependencies | NOK | http://autobuild.buildroot.net/results/2334dda736e47242c41431707ff18925df8bb0b9
     aarch64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/18196f5fe2217c461ca2d704308866bacc7e9d9b
        i686 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/0e9127aa0f14f32e8fc0d2af3b38b354cc165d4b
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/71654082cf0eb863be560d64bd739c7aff0ad9ca
         arc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/a96bc1207d733ef5ee7b5986fc991862263109ff
      mipsel |              core-dependencies | NOK | http://autobuild.buildroot.net/results/cfeb836bceeeff5b85853673a1227420b9aebd20
       nios2 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/de2f3d048bd894f41951368448881084da4c184e
        sh4a |              core-dependencies | NOK | http://autobuild.buildroot.net/results/2b9f21efec0a871c252711244a4c170f873dd644
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/69d1a9d56711390d435c01beabd1b6474c222260
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/849041054aaa2fe7dc3ae7e82259681a873cda02
       nios2 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/9a1d3b5569dfc86cd781c04555306da2454efc36
     aarch64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/496f9b424bc915056fc591a2a9109ec8bd72aaf7
     powerpc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/e20db7e829514584f90c1928e06bc46837a9960c
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/7a35d1bf1e9a481c802c468509542697ff09b07f
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/490455366e046930148d39a8e4c3f9101bf46525
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4d542687434beb39f8410a803150a948f16f53c2
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/4a20076f9e91200b1167ef27a3a7db7b205d42b2
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/7b7f3089ee84e2abef7eb00533cf31cb3f5724d8
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/f2d7374185896471f0a95ff529c50eea4e1dae50
        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/80b7bef297b8bd82329bd3ab1a0c102cc2fd8ee6
microblazeel |                   ffmpeg-3.1.3 | TIM | http://autobuild.buildroot.net/results/2affd22457373afd8765a4532df657de9bdeaaed
         arc |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/4b64bc9885bd622b0ed580563bc4c88a8eacab3c
         arm |                   ffmpeg-3.1.3 | NOK | http://autobuild.buildroot.net/results/7657e01481995a4f0d725467e935a83928a59a04
        i586 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/87f0909fee7d913d971738110af4a86fa0fa7f86
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/b140494fcd42265033b676c37cd2e5e90a943a55
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a10ed48e6eb8411a3d8372f57c05fd11130da0e0
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/1fbf797dcf0867120955998c21d00df5eec10d8e
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/260af184d786c7cd1daf36abdb019a38c2cd7d83
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c9d6442589527ce15b372217f98e011b5d0765c9
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/f6c69e2f1d1a2074aae0512e35414fff50e8d243
      xtensa |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/29c547d9f31667dcb52b2c8ff78189c82cd7d4a0
         arc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/35a7d93bd7802e8ff8998083a20c2b1be6daed3b
        m68k |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/42b2f27bb697ee65e88f8fb57934423155b469a3
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/266e58ae284defdafe498ee7a7ccfd5987e9fd7b
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c51a1715188e3057e8e87c0a5246e8a37d6ef61e
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/75b8671ed7aeda03ed2b5843f982f81c0779f342
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/50b65741079f61da027d4e480115dd2e2c21c4b6
       sparc |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/77aa3dc84877ca2309e3879e498c44dc74d7a2ba
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/90d4e8c934de67a0eac5c4190c02be891083d637
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/23feee47c773c7faf19e6b74169820c60fcd3531
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/670d4a776ed62082f74c3a39838759d1a6fcdd21
         arm |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/b9515450dc687f410fc74c76061a15f23ccbc7aa
       sparc |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/49ceeb3a5fc74d3b8e07a668a97113ea91f02a8a
         arm |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/6e179dd848a5fdb1d901be68f82c038fef46a41f
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/a24c7751f0711008c13653083098ad370955e7da
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/86340d796d2709083e95887670d7f068dce26d96
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/c27efd0e46ac89ae546e1af7e5767abf63273b47
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/cd25cc9c23f5bbcbb56f56f1c339c3ba4ccb1c34
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/97cc44e6769f4c78b7bfb55c8fc62d843a9eb129
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/bb21128a07d738d0275a2787160bf3bf9641989e
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/3b84fdb608c6365946ca90ca305ecf6a4d9f60e2
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/083c6f05670c50b347a4414be85dc5e229c16eff
         arc |                  mesa3d-12.0.2 | NOK | http://autobuild.buildroot.net/results/63bd3e45be9c8f967787dc6e95c5ba13e34ada71
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/4f98f92f401f330609c79edd2d974dc45b1c68bb
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/39266e477e7dc7bdd86ee963d067e7d064e34ad8
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/87894613df9ae1df155874c063756b7bb6d35d01
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/2c1c219a1d0554b57e6dfaa1958b65bc8d8d82e2
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/d9cfb206a1075e92ee95c62463179914a3d71516
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fd05fb974db3e087e2fd4b0a004c432d6907f01d
      x86_64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a1e151517c877433e91ff0680d801016f409f478
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/dfc310ac411806e90c0ba9bdb202ee3b99ceec99
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ebb7a9317018c7ae5f33d58e679970bcd0f1ea27
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5bd8d6a2957df2660017dfa714dc19c0ba69592d
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/cef2318844a9242a5950daec847a56d69e3fe732
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/6b9456e2dbdfaf6cff84bf650be83cc7d466ae72
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ec6d505a426f580f65f5e81549f5880041624464
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/0c7d4dac65d3a4dedc257207dde5ee3edebea801
     aarch64 |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/c18be50ebc6152961760096ecfcdee4850060dae
     aarch64 |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/7b767f2e41df392c9141819cf90625becbe83da0
     aarch64 |                  openal-1.17.2 | NOK | http://autobuild.buildroot.net/results/f8c8a069d31d265763d43ec7ae2f46dff04f6ecf
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/bc4f693dbad0ac3b79c86da1c16670174ba65c88
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/a204ee1f6a32415186bb5ed4d0d3aaba2c86664b
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/1fbc2a857d8fad36760ef6e6268a4cf843733a0d
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/c50b4de7e0beda44d10a2119348c04b29ce2ebc7
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ebaa15205362339967ee0ce5379ae516d837b264
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/2707b8969d8d961c7e23166904acfe8a6a7d1483
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/f4d00a296fd3dbf7d644ad14eb73eaa5a233c056
    mips64el |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/93ae711cd1b15539d5e02c058fdaea661fef6601
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/14d7e204d91a8c4027b9e1a091e72186ce9d8cd7
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/b7e1c72668871286bec705eb703f34812f61d51b
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/238657f94829f74b88b522217a7940fde793d49c
    mips64el |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/8594022006fdee4b8cfce1d32e1360062e7978e8
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/19f60b45403a68e7ef96a49828bd0001012db6f2
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5bc6c558fccea0e1e1936894ce372f2b7b8ecac2
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9c2d3892f17c240c44f7255d821d66acbed361f0
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4d22729535ca4e6acbb48a25145611bb49c10149
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fda321774c3eb225f966dd9f83def5329b703a03
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f5eb306b0032e830f7f72ce80e318aa11774a5d1
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9dcde6ccc24c93b1221c36edb2a240a4e81747cc
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/295eb92c0400124dc939a9a6ffcd8bc47a746a36
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/57d3eaf228c4ab3626351cc5424d45a3f503917b
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0464f6d703de8003c53be1247351cbf23fedd669
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/85001a4e266b8a35fb74d4262d0c0da2229c1846
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7d1a6ec41145b5cca24e14e5b91db3ccfe35c956
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/37f10c2c5bc112830ab6451486ff6146ca9f548e
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ef3734d2bc071e951ac370a7d5a585afb92a7575
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/2aa883dafd1f5830d2bdd58b708aafeec5137195
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d192f043d8371a9ff658bdfaf4699787ec5008d9
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8ae1b6b2353d811d5148c101bd32379655294a9a
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6935970d849614f98b21010188a5cb16527d41e7
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/930af4e847df3f1569cc2d229cb1364a9007fd4f
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1e6bfc26187925f9a101464a74c238cfc680109d
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7b85e88a932aec4b579d9cafb574b8d26ff6a820
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7c0e57833e64af56af0229c4642029227e515cd9
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9c77cea6019c369dbf52ff03c2a99734ef6d85d3
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5fbcb3a7aec06135397f1ae5561a8e3c00695e94
        m68k |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d1e49e3f63790159f44ecff05dc0b55b3d38a2ca
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a0073bcf7bd896bcb3eff926fd466ebca0f35520
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cecbb90ee5d5972d0c522c76cc46493614d9af89
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ab13b1eea64a1e4f85573f07900944e51c9e7e06
microblazeel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/11a4a163b43633e55d45c03edb77521c791b9a66
        mips |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/88866c1e5944ab79ce0ce1453a0cf1ea9fab9ec9
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/ac2b71862b649db1d7c7df9d08cf078f64693eb5
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/fde56a9068abbfb6e796b4279f3e993a35414aca
microblazeel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/060105965c5d604d2c4946d2d459f746c04978fc
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/db5d4c1f76365000efcce34556e199fdb10feb17
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/52f47cbfcc3cfd7ce0f3453d023cfc095a92231e
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/7e122ca4b42e6d8eed95c875ed0b183ae14fd60f
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a93637c0e3144901ea83727994a4cab75ace6ccf
        m68k |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/8ae5abcbbb303edb87968f71cd6ad31c5432c84f
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/d2df8065f41daaee81d723db7133ec4687232c0c
        m68k |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/2bf17654ec66e22f696b18bbd028072a031de58a
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/675a72e59c33611483a95021e07903d98c6ee335
      mipsel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a186b214ef48c6599e68c889f5c4ea6c931c2274
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/2c7bbdc2a4976e5931557402fd4f98e30acf2f38
      mipsel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/ced7a8ec331b4ff56ebe1beb36250771f9f8d252
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/0100af3fb6f1fe41bfb4a703a47d87307680f4d7
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/755bded98b51e3d0bc36f09ad33ca6769d4b8dea
microblazeel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/b3c0b7145140cc3620a97375293438fd6dd20708
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/f30a5d5bb2040049e7bf468c939cca59fad70420
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/caf1b4806ccd08e3fd8e7d9d3c0aec36a51d3f43
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a8a83c2ad5a6dd9740afdb69ac37783d477d4510
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/fc62c31ba06cd94c84f7e4da2e9b1fb6365e5f2a
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/6ff74e732667329ebf45e769b5e706cb958d1f2f
      mipsel |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a747e052e1ca72796dbea6b8c0fb85670d83ac94
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/1e8969f29bb12dfd13dfd75fb793d5f0a31d7723
        i586 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/98dd8c58465f53cf448fdfa9fb5cec1aae14ab3d
        i686 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/6ddf57ad00c808e1bb4d81d7cfeda831648a0406
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/10f4439542d38d354b5ef1a4b2101533a4d4f2a5
        mips |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/3e577a01c4d83984b3783826bbb89885448b5de4
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/9d24bf3ddc46dbbd255314a39e6bcab87b3861b7
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/22607c90f58acce5cb27242d594fdfb5c00421b4
    mips64el |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/9593c50b20ae8033c98818d71644d3c8614ec33a
        bfin |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/d0cd043b742965e8a6c8f3eb44fbf232d3f98c39
        i686 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a29486985a22896d392476fb6dd2c0785e86dbf5
     aarch64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/f391c97ffb2d18179110146006e4b04da7da5d75
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/bd673e5793d467fe2b35eb2ff487d5aa5af19586
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/d77f0c8651f482295bd3709e16851de41cd8bb9c
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/bf8e617aae4a651435d9a80f1d6f5f90ad2606be
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/9f68d358ba5acac7a018bba9e8035413f7e1d479
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/bd4bb9e8730c3ac0d0a5fe4565c4dc1d65292389
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/013f37678becf0b3f7b69525a4ca97b4e6d6ddc5
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/436c1ef6bc11dbe1253a1634a3f26b80a0a02c7c
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/edfaee22ad71ccc03d713ac6ef827c42e1a34500
      mipsel | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/6b134abe4c5996e9ad672a08d2f06337b67e013f

-- 
http://autobuild.buildroot.net
