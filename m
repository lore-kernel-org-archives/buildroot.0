From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Oct 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-05
Message-ID: <20161006063022.4D76C102A18@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-05
================================

      successes : 158
       failures : 124
       timeouts : 7  
          TOTAL : 289

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 30
               libglib2-2.50.0 | 10
                 uclibc-1.0.18 | 9 
               wvstreams-4.6.1 | 9 
               linux-pam-1.2.1 | 6 
                    pppd-2.4.7 | 4 
                 opencv3-3.1.0 | 3 
                oprofile-1.1.0 | 3 
                    php-7.0.11 | 3 
                     vlc-2.2.4 | 3 
                alsa-lib-1.1.2 | 2 
                   assimp-v3.2 | 2 
                 jack2-v1.9.10 | 2 
                libsigc-2.10.0 | 2 
                 lvm2-2.02.166 | 2 
                    mpfr-3.1.5 | 2 
                    ola-0.10.2 | 2 
                  squid-3.5.21 | 2 
               wireshark-2.2.0 | 2 
                     xen-4.7.0 | 2 
                           all | 1 
               audiofile-0.3.6 | 1 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
             ctorrent-dnh3.3.2 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
filemq-e59951489045825d6fc5... | 1 
             fxload-2008_10_13 | 1 
                   glog-v0.3.4 | 1 
                   gperf-3.0.4 | 1 
                gptfdisk-1.0.0 | 1 
       host-erlang-rebar-2.6.4 | 1 
kvm-unit-tests-0b04ed061003... | 1 
              libarchive-3.2.1 | 1 
libasplib-f7219142e790a329b... | 1 
               libbluray-0.9.3 | 1 
           libmemcached-1.0.18 | 1 
                libmpeg2-0.5.1 | 1 
              lirc-tools-0.9.4 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** wait: No child... | 1 
make[2]: *** Waiting for un... | 1 
 make[2]: *** [all] Terminated | 1 
make[2]: *** [libavfilter/s... | 1 
                 mesa3d-12.0.3 | 1 
                    qemu-2.7.0 | 1 
                      qt-4.8.7 | 1 
           qt5location-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                   redis-3.0.7 | 1 
               tcpreplay-4.1.1 | 1 


Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/24f376ece02b8ee5656c596f5bf0a6f1047d74bd
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/6932848d74615eb5a9b7eea1a14bff07c9e0b593
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/e001e7d1a5732f49da3a9072116e2766ff2c67c3
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/d7a09ca0c1aaaaa9a27f01b3f957c751680ed308
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2db82e2882c0fe0b03ef4deb532e968e7511d94b
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/9ec8e41b0838e8b4bc32f13833436fc646e6ce72
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/95535ccbae5651e2b32de47ff613ebc4ec32c946
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f0b44496da20a3d5829238e513907a6d17abf5b8
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/4e4931ea276a0d75a006ec168220f193a684d621
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/3fe48feca5c0fdb8c5cc34272afa51775b4e184d
        sh4a | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/bfd1b1b7d17d0872a79baf6b4c984e8fba6d67bf
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/bb2040ab18e40e58a6456bd5d62bb75368a547e2
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/25ca97237ecfec03a7a5da0df88a8916093b263a
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/a3841937020b12a01c280211b308217944a6eeef
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/973d68d24e31d971fa5bd405da518ff09a780253
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/faf45c73729476314d3925350fbf376d6413db1e
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/09bcb361c70167c18a3daf449b4df70c062f46b1
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/96166ae5031b9e8db90ca6e38562e646d40298bd
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/5ae250935b39681abcc153ec196229264d276fbe
        m68k |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/e53e94092ce14e9f517f2c4c324a8f0c2d05231f
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/3d59695956e1a7d97552f0633fb104e010f2fd54
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/508f9c7058c86ce5483dd44b535a72cd9001a144
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5ca6e2ebfc7906406929747efe5b7b4f1cdd548d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/296d7e0450f0e945e108f463665a86d01c48884a
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2582deff227b13cb32aa88fb966fe643cf4bcc39
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bacdd64823c6ddb1ded23eee1b75c05b602c5e0c
       sparc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/354d7650c446026f91039ff8ee3e3cab2ce28142
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d614543b8bb08b4fc3eb6111896db6928dbcbabf
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/eba03a302095bcccb2aed425acb9834e00ab66e9
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e617fbc9ccc0e8222cf5c9692ffb70aff1c87e96
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d2042732f2d5452c7b5181d87d3fbf460d8869e3
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4c5d8af0ebd4b492dac502c0c677b08e83e84f41
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/53c680bf9fcb1888eecfe2b04e878cf4f4806897
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/ad3cf3d4a934ed86add09470288418a1673de979
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/6aeecd60f796f637af93aae57e4f068e913bac45
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/d7b9f78ed23c359b700193e32c2e27a29bc81613
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/94705241e5d361b00548ca642f3e838459783865
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/6abbf510b1863e264e4426a9a104b1f23dc6aabd
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/05c63db37be620c2b3f538976df7200a45e891cb
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/6c2d09b6c6cf80f2514fcbd786f58c10ad55854e
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/f6ab679b6e4d7b1bbe9e2672aecbe8cbd3f3a71c
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/4ae48ca4eaf6a7ad434894ed50012b4b8af88df2
         arc |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/19647a8129bea5c0942539e70dd1f615a028ffed
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/11231f88c0655ae0d0a7b6b60ef1f75b415ddd26
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/764a914a8a42e72bcc4f836359cd200f0d8d07c1
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/746dec1e80bdc60e764a8325520d289464a36877
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/0c3da748f6be920b028d427ecb4bf0731fd17f30
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/84b2b953f90f42ea2f05196557f68eff727123d1
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/aa2d93c928b226323feba8c8fc1e17ba88d1c724
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/7c97242716312fb266cadc1da14e7d01969dd262
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/6e0f7950963a27a38d061225fa59d1dd9a10fd2d
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/5df4d7ad501479e951b4e202ad32895f54655f8e
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/0aab38c5066ce2b05175ba21df34acb6bdd184c8
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/99440148b793b5281540c8ddc983f0ec38e2941b
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/17671845aafce45ab6b43d5b12a0a3fbaef0de8f
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/65ec1eb05eb7ed66101c187eb5052bcc018bf6e5
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/076a3c5a351aa414a72062ab55591e33141f17f3
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/802229ab240c2e75a62bd9cee20a3e3231bd6fa6
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/36e04e2438121a3c627a860998f9b277e9025344
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/21c554b11ad94cea091edf1aae0d47ec08202b3e
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f0a997aa6f8840dc689c16e3a74b68e480a95ec9
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/128d5c71598fd86d1532a81b4998dc419bece4db
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/ac3a84f19d8b2c2fd621059b3c9daefeda583b95
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/1f14ef54fed21e0ad47c51e35420d5db9844e406
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/23275b1facbda1a82c3cfc16644dcfaf066c9015
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/68d0d5a7be96c525f3f0964940b81cebac86e991
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/3b441e75ce9a729c53ee3d4265eb157148478baf
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c6e700a5bef86289c230a105036dc774b9587a0a
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/d16191b748c769758f3d1baea6bb18f1a09279b2
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5662cb568f987b35a859951366014a6bf35a8d2d
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/994ff9c873db18305a6b2613aafe1803a173a49b
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/f853dcc3504c81c6f43a748e9572035f3de48631
microblazeel |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/0cd473517dec85dd8ab1f029eb60a6ca402cca5a
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/7c1e8293375f7c091e7dc2c850d284a9939bfe0f
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/c301c4e43d6c60a2a4c2d0092d20fd7838ae2043
        i586 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/87b5cbb91d27dac1500e0961bac450250fc9f869
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/45ab4a3a8391f8c8ee77d581b6f1a02f6cb702fc
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/56c2421b616ea9c9142a438f893e5b0eba0b05d7
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d845aeb0381df18501f41a81e12404cc39c926c1
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/c3772e7fbc030ea3e32601920ce677d6645c4102
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/3b16e6860cab1407839d772a59dbc69cb8f30f17
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/325e248eeaa2355510f2c0facd78d6d3a7801290
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/dcae5cf3f0eb08c65b9a1e4fb8fe8c183d890f50
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/7ff4c45227dc0c434124abf6525e027ff13638c1
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d709aff7da26d1dcc641ec08088ef9fc67fc0dd8
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c64e46205d703dd65604d1600e2537acfe2b0e70
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/013828265bbd1232696c25511b8f87bafedc3fd2
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/967b3674cc980406d821a44ad6d8073c49de25af
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/dd64aa60bb96cba44ab7876c00e842189e478ca2
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8061a38dc1affa688c71fcf243c228c21e777056
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7f364400a279700a353e2874d09ce76d74140c4d
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c3e220b11520a743ff7e3ffaf9109119fe530c6e
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bd51757fc134c4eb7785aff184a26654b27473d0
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/56dfc091f05f51af2ac7332606a27128d6bd2653
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/22685bfb303ca6546310198a9f61242e9c6ceaff
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/ee6d7b0fa03bfd2c38bda65ec0cc2813ad56b4b7
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/47f8e196c32be192cc90a32358155a4478bfaa78
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/967fb43db54ecde8664da90f7e52b9ecc2a76486
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/685b0eab2eb4cd2f256c73039cfb5d3f462db369
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/231f74dba98c547005ec5a647fced041f29f7b1e
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/369c8b063a4cf8b40348b1599d8df0a18f8a3038
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9cf12afd2b63445282babb8875257d32d424d07f
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8845fe2bad546c58b7073e27f12f5b75393afdea
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fea4204a097611a9b5d6d27e3ed89599ce4774dc
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/05c552e5ab3ad5c7979d7c146a9d58ff840bce73
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/33757ee5f7d89824fa806945776c2c21ee8e6c56
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b896c2f1e3069c58e42d58b0d20fed6591d4cf21
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f226039b58dc1987775719e2e68663adeca87c5e
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f6ee9f3c35007a456269650a5be535f4aa19a8ac
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4ae52865f262692402937ac12183a82572ccf5e3
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/620b25d94635d6effddffadee11a2bd0908f6486
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1951ce30787b3dd168d42be08e5be0ae6707c88d
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cd3c014dff6f2db7996514ccf4785d845da0e07c
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e35d1e50736b75e40f9c95833df14acf265d3ead
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d4316aea52939d9d450b92dcc39669c896113d85
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7d09bab5600cda71128d9d5900201fe3c1c34be5
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d93675176546df22d4ce37603121075e21d979a3
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/44248f14c534bc756ff51bd5d64adc81d88dada2
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/dd384afb875f9b6aaf20a0c8cff44f613c91489a
    mips64el |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/c795742ed68d4689e6be1164eb4c32a7cade65fe
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/48a2313e2b83723680c8cb444fb92ebcfc345106
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/aee332bb7848f8e2c06b7b3ce48d9434db4d872e
microblazeel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/98fe13d7ee8950123671bc8bf4bb761ed740cead
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/a1f20b9e91326cb6c056a9291507f7101948ecc6
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/bdca5895a4d7fcdb6035941fa9dac5b4209783e0
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/946f95aff88ee6a234eb683861c55fd2d7a90d49
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/98078f85cb06ea861aa5cfe1669d5e75470190b5
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6c1cb9a9d93951955a12ebecb5935a5b28417631
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f30be48c0394ce9e96fef1505e3a17eef8b72036
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6a91911b4459a115f55213837c1111cf1a4f4f9f
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/bf0db64ac8aa77f601953fffc0ff7c179751b1e9

-- 
http://autobuild.buildroot.net
