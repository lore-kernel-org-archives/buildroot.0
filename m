From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Apr 2018 08:00:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-12
Message-ID: <20180413060041.3FB7420DC1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   1 |   1 |  33 |
      master | 154 |  95 |   4 | 253 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/6d00804f7148fc42edb4c959fa5fcec3a3dbffde |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/82a0e0729e1d219d4b0539ed4a1d39939bcaa289 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  zeromq-4.2.5 | 18
dtv-scan-tables-07b18ecef17... | 16
x264-7d0ff22e8c96de126be9d3... | 13
                     lxc-3.0.0 | 10
                  host-go-1.10 | 7 
                   flann-1.9.1 | 6 
               libglib2-2.56.1 | 6 
                  cc-tool-0.26 | 2 
             expect-2014-05-02 | 2 
                  flare-engine | 2 
               libcap-ng-0.7.9 | 2 
          usb_modeswitch-2.5.2 | 2 
             bluez5_utils-5.49 | 1 
                    host-guile | 1 
                host-libsodium | 1 
           libfreeimage-3.17.0 | 1 
linux-firmware-65b1c68c63f9... | 1 
          modem-manager-1.6.12 | 1 
                mono-5.4.0.201 | 1 
              openblas-v0.2.20 | 1 
                   picocom-3.1 | 1 
                  qt5cinex-1.0 | 1 
                snort-2.9.11.1 | 1 
                   wmctrl-1.07 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/9984c5c5ef70d6e9976ec8aed2363e8f6eb56c08 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b517ec5874445d2a588a34d7b6af4d0b661979ab |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/516040c0bf1cdcd1ff0b42850f432a972c4a1a50 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/7d1a85d339c092dd88894eaa574ce18ed3e52781 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/0e93a79051c8f3d77c5d986a25c22320d0c19040 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/a9903fd9a7666440f950f8c4916f2cafd79dbbaa |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/9e66b1a3f88f88f88e0ecb6ab0b2f6a38715f331 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ad585f8919c9e91e90b8281bca3ef048bff320f1 |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/130ca922026007e0daa4d897e93f806a8e7e1775 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e5729c61d535b969dfe4b34bf4173e55c228e742 |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/034e9b87426cfbc41ce1c370e0ceafe1300b55b7 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/94e3faa346d9c51c1a744736384b2dbef24b867e |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/163905c54a1e912f5795593014178a911569c73c |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/941fd5de4a31fa81f898a6b01c223ee5901e6d46 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/058564aaa423ab07244d317b4ffb9d67635d4236 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/df2a8a052174b0098df57c735176bb3a7e6d78d8 |     
microblazeel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/99fcfe94e975aeb036a2bd34c05c99b51fc5eede |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/cf9969766cbf007a9e37808d43e5ebfe5bfe1180 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/e78d35f46f90281aa2c798c000c5be0da7cad425 |     
         arc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b6b9c93eb911340f6a041908f587ac4ae30e7cd2 | ORPH
     sparc64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/5ab680594f62f6a184f88813a3b692275746efec | ORPH
     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/34a4686ecdb93e4c295629c2988d1c1ddc4a5ba9 |     
     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/4f20146c886ef12acba2ef525c3005fdad3a5fc7 |     
 powerpc64le |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/74480ddd8234f31f8527f6e6bcd5687345f21b47 |     
       sparc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0a05296d1a0860d6983029ebbf85a8c2af0afe78 |     
        i686 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/8393c9edd8fcd65ce8dbfe989832c0303050b4a2 |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b4b483eb1cb89e06987604ef1172ab5cd94454d8 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/472a6778dcb5abe914624d0cc0a26807ce963968 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/83a5789a474aff25525de7b61dde2705897f3fb8 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ccc8f82728c5a968f4527818523eadf1582bab4d | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/325ffc0df650ed477f211ffc3f690eea3da85310 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8062046619ee2a1e72e0592c15daa1017e1717a6 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8f8bc687fcc3b0f6e7f25bbbf3e6c09e2312a449 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/efc379c4635ac0cb1f230a47cb8b65a4e758db3b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b505c0f4faa582fdcd0d5568e19bed8fcf778ed1 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d726d55de1e394b915024600932bcc58de57673b | ORPH
     powerpc |                     host-guile | TIM | http://autobuild.buildroot.net/results/58f062935bfc97ee07154a19446f113fbdbf151e |     
     powerpc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/0fc4e78098001b0e89f94ac32497b9a22267e026 |     
         arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/0f68d7da3d105899eb8efca29f988a478b3a2f07 |     
         arm |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/5b636824d7e1a17dcb5e8dcf6d89ba7124d23155 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c5d4c605a818793e34c5706808949174e6e6fd98 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/879249d0ef8a2e15ad314d97d269dc27ef831640 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/c2d01fff08afe464ff65372d8d5375d9418734f6 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/85a7f721bfadb915786585909451b9483bb91a89 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/8be31ca10c149f57c48ae8818fe732c6e5a2eed0 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/52bba5590430da716ea190462179f2fd92bca3f5 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/21cef377b421289cca4289bf54b63a49453c3cd9 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/0d0d7510b282708759cf566ffad83a70becbd7bd |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6018d03d130aeeb14fd22ed22f10a128a5c5880b |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/42cea83194aae684d0526fefbbeeb8bf98299f10 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/63ac68b1f26cc4f86c72fb6af0c6d738c5e34877 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d7a50629f16b1dc657351d6133d33d7e011cd969 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a61ab096fdef6aea5cf6ff7eaef63be49c319963 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e1aa6a6f9fefa8d9051eb552b975499bff210bd7 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c910da949c5c41ec39b20e052e9c948b26d21b1e |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/0945c290f636fa9f3e21c414b3c39f921b10423b |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/99e40ac5a612a54d31bacba050fe7062ce5f4f55 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f6ead5d34e588628e5ce094a354af22f8e899690 |     
    mips64el |           modem-manager-1.6.12 | NOK | http://autobuild.buildroot.net/results/5d9e299ff12726d07e8a584a213c1d2a2e419594 |     
         arm |                 mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/09cc7bad983bfe6efede6f8de3af6e350bc4bf59 |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/13fbb39a9114913a9e6ce31cfda05caac6fe91d2 |     
      x86_64 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/62d5354b43399f1c2efe8ca665d53ad272142169 |     
         arm |                   qt5cinex-1.0 | NOK | http://autobuild.buildroot.net/results/c70deddb9ea62b679baf90305e3ab8a0c0f4a798 | ORPH
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/6696aa267d6106df58f203ae9d211cf06b90e744 |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/2529d28e1415189eff9c1fc79715f6eabb3dfa4a | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/0f182c1c671e36019f76054edcfcea49da4a0c6c | ORPH
     powerpc |                    wmctrl-1.07 | NOK | http://autobuild.buildroot.net/results/8d1fbb5d2f389705980dc687f7cbdcfa291048d0 |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/421b81a7fb1cb63f2b4b8a92b9a5de3010652664 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/ba1a662b9289ad5664c3bfafbc3be075250b64cd |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/86869e1671781db62aa315901d55c546435687f7 |     
         sh4 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/b180256bfd7e65c09b7a8fcd99c54cf5d7a84a02 |     
        mips | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/95f4d8dab9e43e4a3ee8fa6e94fc695e31ce164c |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/8681bc01d6bd4ac625b4b252dcbe8888260cddc8 |     
     aarch64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/592f4f496e7044b854e9ab56380a0de4e493e57d |     
       nios2 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/3f0a6c10e1aec02dc3a19c5e9b60e42d3ed0bd27 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/8007d89808545ca16845db04e31115413ff5922a |     
       nios2 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/09bf652b961b090398042b2767e1d0c3763e5134 |     
         arc | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/c7f309ccbaa0803d8854057ef1c62f47b396bf57 |     
      mipsel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/4530d5c93ab2fa3d00d26dc170ccbaec53f27e07 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/ea749afab40322e069ba88a5237d0d4eebefbe58 |     
   powerpc64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/caed0b109140fd240a486562c3eb14a336537c23 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2b1aaf7e35651f04a9e9d0269e49c1b0bd87ae29 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6470593f464ee3f075b711442d59f9746ff6856c | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5c93c9e381a471b8aec7e3b13d21edb7c08681a9 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ad248fa4dea134ca984de3d96ad3b7d34133dace | ORPH
        bfin |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/f2435f3ff864f6dd3839c07ed0ce574e74b1092c | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/66a3aa73d1277a77acaa36470f01193e6a350237 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ef2a669179c6266089576e3d9d949fcde71e5e2c | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4fd19e94ec001be075b2c369b7a8b239b8601ba9 | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/706798941eec6842d13a9be9c894dc2b21f60e21 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/61e599a004e151a2e708bb18180a68270dc34795 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/dd05a963dc65357e2b5b927d0a88061148945c6d | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6543f833619655f96ef386d0314cf46f53e1a496 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7dc509b0cec7ccab7a09c61a6a139da01a950ea7 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/56c62afd238688ff04ad92c1b6e4ecd5ccd7daf4 | ORPH
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/7d015f495ad916f400c07083ab1514534e7626ab | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e9d16f610f1aa1dbef2d3efeb3d957b5eb1e3017 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/03e881ee287e495d63ef127f9d254bcd2b42bb6c | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b7d9a4c862d62c68d58703709b933457c6a52e6c | ORPH


-- 
http://autobuild.buildroot.net
