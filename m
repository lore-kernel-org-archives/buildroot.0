From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Sep 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-27
Message-ID: <20160928063030.37BAE1028F6@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-27
================================

      successes : 170
       failures : 134
       timeouts : 5  
          TOTAL : 309

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 28
               wvstreams-4.6.1 | 13
               libglib2-2.50.0 | 10
                     vlc-2.2.4 | 8 
kvmtool-372f583d359a5bdcbbe... | 4 
                     lzop-1.03 | 4 
                  libcdio-0.93 | 3 
                 opencv3-3.1.0 | 3 
                alsa-lib-1.1.2 | 2 
               audiofile-0.3.6 | 2 
             ctorrent-dnh3.3.2 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                 jack2-v1.9.10 | 2 
                libsigc-2.10.0 | 2 
                 lvm2-2.02.165 | 2 
make[1]: *** wait: No child... | 2 
                    mpfr-3.1.4 | 2 
                 mplayer-1.3.0 | 2 
                    ola-0.10.2 | 2 
                    php-7.0.11 | 2 
                    quota-4.01 | 2 
                acpitool-0.5.1 | 1 
                   assimp-v3.2 | 1 
                collectd-5.5.2 | 1 
                    cups-2.1.4 | 1 
filemq-e59951489045825d6fc5... | 1 
                    flac-1.3.1 | 1 
             freeswitch-1.6.10 | 1 
                   fwup-v0.8.2 | 1 
                gptfdisk-1.0.0 | 1 
       host-erlang-rebar-2.6.4 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                    lftp-4.7.3 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                  libffi-3.2.1 | 1 
           libmemcached-1.0.18 | 1 
                     lzip-1.15 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/a... | 1 
make[2]: *** Waiting for un... | 1 
make[2]: *** [libavfilter/a... | 1 
                    mpv-0.20.0 | 1 
                   nload-0.7.4 | 1 
                 openssh-7.3p1 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
               qt5base-5.6.1-1 | 1 
       qt5connectivity-5.6.1-1 | 1 
           qt5location-5.6.1-1 | 1 
                    sdl2-2.0.3 | 1 
snappy-1ff9be9b8fafc8528ca9... | 1 
                  squid-3.5.21 | 1 
                   tclap-1.2.1 | 1 
                tinyxml2-3.0.0 | 1 
                    urg-0.8.18 | 1 
                 weston-1.12.0 | 1 
               wireshark-2.2.0 | 1 
                     xen-4.7.0 | 1 
                xfsprogs-4.7.0 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/f1eb711123c2d8aea8399b8984a007afec4f65fb
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/4eb767f7afdefa27373d8faf5aa15f252fe4e20e
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/874438f1719012634fd40a9c141e02583b467fb3
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2179381ec154f62844ae0c67c57f976435249c4c
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ce9c3bb9c72349bd018fcd085d57c6c358f84256
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/9e7b5c654a56efbbac62222f350bd6e545ae6680
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/1b8626c22faa583d597a0f49e52c29c68d76e446
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/eb0627a5bb3f375bbe7640b3b8b0779fea0dc439
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/c4c78230ec8991fe13b5b2fa353657135d536e7f
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/2d0eaf276a17822a366cdcf902120bde987abe70
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/4a2c5db0dd7c3bad821e9848ddd2c30ada9d8d5e
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/94c67b06029c9d2a81c5c9fff0b9b30952ebbad4
      x86_64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/737280f1739b2cdf6421073e8633a060851b9274
       nios2 |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/fd5f1e5730c6ce667e20d9f389393e535b8a4820
       nios2 |              freeswitch-1.6.10 | NOK | http://autobuild.buildroot.net/results/465602bb581575d28cc0910e8bc619d95474ba56
      mipsel |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/d841ee0717bcb0f9b48223c5ce8e14a7abc1f518
         arm |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/2f7d5a7e8ddcee115d239a400e991a01e3968409
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/22bdd2dc42b7d29887cb7a46e93d8a78874a3dce
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/65a079839062637592b2e501ff5202c0b8d37918
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/44cda03b41298632f46485a953d5494fd5055925
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bbe31d8b35f0cb6fff22e90adb084845927e44f5
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/a9c57e6f5480d7f8e317aee8eb49ade070edc496
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/896b1bef7669a460b0f4f0cfcf7f2e2e6eb89cd1
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/4980683c503151309e7ca08de1e04b423317b2f4
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/2764b10342dad18e63455742e9c64bfd56f1ff13
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/224835a240bacee274ed9a4e31d3c246ea6355b8
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/8c06deba31280b6007b1b854cbe0a275092a3d05
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/5b07524a73be951b6faa6e3a83d44cf82aa7a916
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/eec62f4698148f6086472624b2a6827ade0588c7
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/4e08eee33d6072f866d7a7ea7ddc801d42759c73
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/800af76fb4fed2ecba982edb4d69ed8d1b9b9197
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6cb5a1123b75cfd318c308fb0b39257561ff587d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3df20d75aa5e990620ecab5b6cb94db83893dd64
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/56607c0ac62aa51be5d7acb053586d86fbb611b5
      mipsel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1f2c7a9245b4321b8d61c193e12481c698c4918e
      mipsel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c86275d742d81e8f8efd41f61d74b43819885329
        i586 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d08322d943aef96de5e413e4b45f14d46b1f1e52
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b95151aac4f97007d1da7db52f880fe7fa1bcf42
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ada72082fcff5a4c6db47b9a2be9167a11f07b63
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f604b0b8ff701f2f9551ad00f0d0a62fa3eeeefc
     powerpc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b4b95f0f87178c7a5015f641e782498dfae95e25
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/11c80524ed0cb9668adb4068147725c211adf451
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/058296f6762770d5b1154ee4566f25886fa8d54c
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/f933148595b1f0e093437d99fe748f4fb77ba9f8
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/0c18405f30be99841fbae6e48ecfc260180e41f0
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/db682a352a094c2f627ae8d545bc77a6904dc6f3
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/4db4ce859aaab9277a3b3d03a33e0168681b4214
         arm |                      lzip-1.15 | NOK | http://autobuild.buildroot.net/results/6052625a33324eb80e86b08f463d8c07cd1c7924
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/888ea1aea200a71d0887754e2afabdc6b260bf2f
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/846b0d64eda95176585d58586cc3d2c1ddd892db
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/219194d269d7f3cf4c3db120e6d8079085916bd3
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/5c5100a14005ea481a0a23ce54f669f1aacf6656
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/265f115ca44300d6c53674d02fea1d75781dfbba
      xtensa | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/2b68bce3ddcafc8f0a99eead361d2fddb3efe3d2
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/58ae8709dc73d5169e0ecd3829587912b1a92b2b
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/7f53a11fcd947245be04900b188326c3f4ff3e4f
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/67bb19a6d06f06f00e4ab4bc295911997956bad7
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/3e52de26ba037f919b8dafcc7b715cec6a983d4a
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/9982aa90fea3d788823f55da0a598e2c0a33bf35
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/04df886d1ca488755379abe161228e1d02fd76e0
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7d9d284b873c6ef1ed0b9e872a86b2617fc4bc47
     aarch64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e71b36b54443771cb8ac86f2d5ec8449ea979e8c
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/94cf4664949e28ee97b8bb5a60b8a29133cb933b
         arm |                    nload-0.7.4 | NOK | http://autobuild.buildroot.net/results/b2054da30c7fd5baa9ad0fc6dd3259297d348d31
         arc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/ec8c41edfa3fbe27e0b42aff3618268f774d1578
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/2e05a6540b9d91ca4258b71360d7b1434b0bad95
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/7f1c96abd8fbb5b358a07100ab623316e9bb9dcd
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/e0c93d0f6d1da0d62d4dbba211a275bfe75e9645
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/53e7e4b4b6a7b48b8012799d7507f7594dbf01b2
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/932f0eaf691d147ab5b86a0df8d08beb8af9a226
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/28cb95db4c7dff5620e825ba5db5e6d37fd3a279
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/e9f6caf43252f44dcdebd16e20da7c7a5dff3001
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/768f78419824176ab9f4431b6d882f5849a13771
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/e0cc554ddd2918b58a4010c293432a41a07a7a41
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/df816bd218968b4996634ffb0ce0b2d8310e0326
         arc |        qt5connectivity-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/6cd7d7e3a0a3381c8d6310350491b7f4e43813ab
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/d39e2c31f48b0a0e5b884e14632b14e2716197de
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/ace6bc2880e2f79d276243caee829b5bcd022799
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/06b00a9b82b277c3c7e6e9036b68399e8294473b
       nios2 |                     sdl2-2.0.3 | NOK | http://autobuild.buildroot.net/results/ef8e0b03bf24ec870b628a5effb1bf62d732637e
        m68k | snappy-1ff9be9b8fafc8528ca9... | NOK | http://autobuild.buildroot.net/results/15ecaa23f0116e8120b3d62e553c838f0303df35
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/22ef9589078017dc7c7a077051207ba771dc36e3
         arm |                    tclap-1.2.1 | NOK | http://autobuild.buildroot.net/results/2894cf8d4cbc7cbfc5bf7fd11a08a506a97df1e6
         arm |                 tinyxml2-3.0.0 | NOK | http://autobuild.buildroot.net/results/90eb5d2a223bb19bd288f3adfcc093f43a6ead41
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/daa8f240f56e2ca6b10fd8ea20a0473b6ca8afe1
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d343672c6c630ddba6734b877d161908edcb9e23
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fcf3d4a0112438af6c03d5ddc0994e0774d6456f
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1f57bf2e4913099d184dd916372149367409621a
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4857c1170783b8df4d4149ba1f6e6f18a1ecb24c
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/297b7a0cdac62e94206f069b5ce06e553880ca94
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d666a14b9ad011e5dbefd282e95a1bf2ca8de752
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/69f82c7477c2e5d44c0577876a1bb93d4e0cb64f
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9eb975919b4ce14ea13aff7f75868591af77eba3
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/dbad499653ce3f85abb4400e0e15421089ba3127
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a5dfdfe952123cece356406f279c85df98db8750
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/fe070090c55aa271b2a2a18f1e0ff410a2bf9386
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/83da185189ab712cd18cdad7c9d7b5d45d245d48
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/e248a40138832619707d513a2b918fcf8e36ecee
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d5b9d1d598fa3d8e9202f4a9525536e776a72884
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f77d03e56112c98de291e7aca2fd6fc026491cc5
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b60c13b8d4c3eb2d788077ab68a32f6331586433
      xtensa |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9225babfc1e005a78251d10464d3258ca906dac9
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cd3baba433ebd147d785df4525e988686ba4f5a8
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/0468017c794e342b0e3ee2380551e98975b10253
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3b1b8507df5efb835141c18c894f00711359dfa3
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f31fc99387f6cfd901f0cb961d463ccabfd1abdd
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/7eea186d616c2e0e9af12f93bf9266abe26a0b13
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3086c9d2ce00c04378c45b5afe0ac5ce291bf465
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3c2c0f944b7725e0567009f52ab0291b83313ac9
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/428d60f8479717bd773f1982b04e86fbfcf00649
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8a9ec7c62c1909a9f3a274da4e3beb99fd25bc7b
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1dfb0fbb2763d2e8492a5bee93669627a1c4f6ed
         arc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/dde934899d6c2f927d6d5a4abfe66d9072c4f884
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/874909987125392965f57cf9e65a3e60dce6d71e
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3e3e4e30ed06d1fb3768e3fc22fdeef0448cb003
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/31282151d261cf318f30cb10c41a380909c9ad10
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/516a60fcabd0276d57e7fa5fc111374700f60a2c
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f2dd3c097054436b0c147251c760c127dcc9f552
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/51de8e5ea5b86691bafb35e0ee4f46e212290be0
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d5c2a5a5197aab79faac1fc02a9e1e216bbaf961
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4e07a16e94297cfb1eb0baab6a6e729fe623910b
      mipsel |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/788004ee4659cd293afb157e80cc9c72e5c9d79d
     powerpc |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/84d68540a1fd81e83c71efb355d55a232de0d71a
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/9a411a74f36b85b8ff4c527b2d8ffc9bfa945a2e
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f57fcdaee098bbeb0f01d6a219a202df295bf6dc
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/4454a53fdc4015584b11935b1e4e47d71e6f18db
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2552257bf89671068b6faa9b25225d92f5ac0d55
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/00120e5b78a0ed8cb81cb48b85531ec0cc8faee5
        m68k |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/99b7c7e45cd9640d40aae9521dbe23d12b715759
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/390d266c098c300ed2be25ab19510232a4f2d1c3
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/fb5eee7e4d6e833e890eb8b30e0e4f2724eba3ab
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/292bcbe7b2193b27c096f1fc062588f8056c3ac9
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/01b7cf652bf5906c25007053a4e7d8c48876f63d
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/952b7e80c52dcc2291c10c51ea95d89e828a3527
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/c80e19c0b9ec02358ad39d1cc53be260c7dc3491
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/8fb95b49093c654349302cc0caa0f75f91901980
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/5213a2f82c5120834757fe02bdf3eb66dfdbfb85
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/56714632b3e1063464ea28abb960c4b4e3f29161
        mips | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/ba4c78bb3b4fb945272b79c60ec147c76e1b36b4

-- 
http://autobuild.buildroot.net
