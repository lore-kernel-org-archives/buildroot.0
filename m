From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  6 Jan 2017 08:29:43 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-05
Message-ID: <20170106072943.5B92F2078A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-05
================================

      successes : 156
       failures : 92 
       timeouts : 1  
          TOTAL : 249

Classification of failures by reason
====================================

                collectd-5.7.0 | 31
                      mpd-0.20 | 11
               libglib2-2.50.2 | 9 
               sdl2_ttf-2.0.14 | 4 
                    cups-2.1.4 | 3 
               openswan-2.6.46 | 3 
                   slang-2.3.0 | 3 
                     vlc-2.2.4 | 3 
                  lcdapi-v0.10 | 2 
            lttng-libust-2.9.0 | 2 
        riemann-c-client-1.9.1 | 2 
              sdl_mixer-1.2.12 | 2 
             berkeleydb-5.3.28 | 1 
                  boost-1.61.0 | 1 
                cifs-utils-6.6 | 1 
                  cppcms-1.0.5 | 1 
         docker-engine-v1.12.5 | 1 
                    flac-1.3.2 | 1 
                 gnutls-3.4.17 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
             lttng-tools-2.9.0 | 1 
                    mpv-0.23.0 | 1 
                   open2300-12 | 1 
                 openssh-7.4p1 | 1 
                    ruby-2.3.3 | 1 
                  squid-3.5.23 | 1 
                  stunnel-5.36 | 1 
               syslog-ng-3.7.3 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/58e89ebc577aaed4f578a3bae019210742bcc2b6
       nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/36df9226f658aaf126ef16718c012279ddf87d25
      x86_64 |                 cifs-utils-6.6 | NOK | http://autobuild.buildroot.net/results/2ba502ea84eb914ecd2e0e8e1b857d28ba3336f5
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/66848d4dcec6d8193ed8393d36022e9b1ffa1a4f
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/259bff325d0edda93685e6a2480a79775e61a04c
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b14e011ba970fadacfe66a8ffce149532d3a1ea7
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5008372442c8f49f0585a769440d241c7b791534
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/386acdcfaf5531c8367005833639191de0363808
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d7d7e70f79b8c5462836b6a71e954b1085858a6d
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a8be4ea77c944d2c414fe116b50b2819ce30f666
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/00f946e123e8954f626b0eacc611b3a01b5d09d6
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d660e8873cdfe3410f89d6bc86072b09c821e3d8
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f596f29cc85324e24dddcb3b0e487282c3426d05
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4cc8db369c837bdb792bfe925261eca452a13f4e
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c8276efc067d7ec5e11c663aaa32a86775ebaaa1
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1c3057e93968df02dc9b35269acf64e63b6feb0f
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c81f7168fa89bd57566da7cab6a3604bf37c15b0
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ee061723af286d144ba06d5e8c7ea2672297e9ec
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b57688aba9dba98e7ce732ef85a07c1a6923f79a
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/022080d774f4733fa2d600c7b92049e80007e464
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1a4bddc27a32d5320daa19d61a2076d5ebdba6e2
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b74aca794ef2a3b797ef89fd5cd3e8fecc4ab131
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/73387b6973ed9d80715272c57722eec354ffc3aa
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e4e65720937be96ce006cc2df1c6eed9fddf9752
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/65295b8a01d56847d4afd105d9c45558ac9ce7e2
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4960ffc58d9b17d791041e1d80cb8f1b628dee31
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b88e545e5e3e387c6ed9819ab008880581a409c9
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1591f9eda9ee32e2143411ebc2885833af6a7a17
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1816a6d1853b3da64307b229178b052330e71255
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/aa9bd8d1316c87552f8c6a90060da687dcbad205
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/071be4e12f314548893a78ff7d158d15098926ba
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d4bd21fec02db9dff084212c58c694b533b708e4
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3c1ba4d08436d13cdcd5f9c5b283a60bcc49716a
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4c409969e74ce3cfc652d27c2793ffc90c93fd46
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f606aba2807bd6d2573eef0d356110a71b6c001a
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/0759cacb60fba80210308aa65fcffe5d114a335e
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/012e1dec27d1c58f16501119b59d14e740ce5e95
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/08d0d53a94a132e793aa64cd3b15988967134ccf
        i686 |          docker-engine-v1.12.5 | NOK | http://autobuild.buildroot.net/results/9ca92eba8d95643e0b17358b3f1f8e246e43c383
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/cea6afa48a7e3574ede9459275b9bc055c3475fa
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/a7a69e80b896bc631d4aa1948c0b585c1a353827
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/cc56cc421adfa71178d19af1476203acc2f811e0
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/3d474943ee949822f10297645406830fd8dbeef5
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/a6fc231a653825d2b79ac3bfe2c1852e0f98955c
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/3c36d5670905b4682a3447b69fcdba48b1578b3a
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8bd3657f9889f85c0a4c40512d413372a9f6256c
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5ca0ad1ed6b4f0cf53fa3c9a9c4412f69eb6c137
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/f6a4f85a011bab1371f55f0fbbc026d977b93345
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/e77be297e146eac4949b1259945d5722a15bf973
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/7e2c7b69b883e153de0179250426d2d98ec721fe
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/078521bb53ec690f09945e359dcb112ed3eb716b
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/43658a66f19508714b1e070aa1b2758999c3e8af
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/66b06e39af84da64ab7c8b5352140f3232271cc9
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/3497b726875ca40be374056b43443b500bcb874f
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/b06a11b154ef74c3afebebc94320f7b02c19be6f
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a407596cd81d265c109a48e3af19830e83a0b7b4
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/7e9b2630be7f5bcf8970276c8670e316283a10ef
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/037a0b6593fd0dd95492ed41e6cce496d7a73f51
   powerpc64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/850fce303189f304bfda0f15d1580df118275dad
      xtensa |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/0a3afc6fd3b45b4accf7c2a91121e619caf7dda0
    mips64el |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/d3309bea9411fca70d61d07c36f58718bc87e6d1
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/3fe440c0b9d05acb44553a8f02f688570e06bca9
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/7a2188e8a2778cf0361132ec7cbfecbce2fc6035
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/208bb987f52b8ba65e3c6fc9b6e917dbd44c0fbd
         sh4 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/92fb6f91409b489b866103eb0f5746a27b822f96
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/01dc11636cb3566e0f79657ec7084ec1462601bf
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/9b9659ba30afde49912276fe7f9c282953a352ab
    mips64el |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/df4f9df860046a9e62a465e96de870c1d21536ba
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/642e0cf779a6e8a1f22073d15d31de40482aea1d
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/cc4c2d936f3e1ba6c0a9782b2218de54a4ff75d2
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/880d9402d42dd19801c9260648bf449e70a44925
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/419bfa0764fe7f4b5fac065a0425c59cc608b51c
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/25074ee1ec0fbe008b83b919f34768bf297eeab9
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/552b47e8cca83d5262a5bfa06d08ced5d29a442a
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/5e52f62455f1234effaf7611a7d47d238253220f
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/9be4845eefc596c579dee614bbafe6e07bc0df07
        i586 |                     ruby-2.3.3 | NOK | http://autobuild.buildroot.net/results/033608f7016d08175675d2db6978d2d00a5bda46
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2203d770c9c3b6f1c4c717f8e4cceb9412c88397
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/45ec154766122f13e4536f14b9aea6adb4880897
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/accb20230879f32ec93ce9278f2cbd5ee812123c
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/1378759d1c218101b6ffee87bb4824c4957d5b54
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/5d66ab3d5db0201c62af4576852f2706531ff5d7
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/0dedf75ce60958042329165f0a05fbb52f1f2ac4
      x86_64 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/c64f088f843ca56bb32448589993050fa8ab674d
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/72ef86f9510b39a832de2ae8b7bbc7c6ac238d9e
        i686 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/c78c3d3de928b2779e65aaf53126b8e13b291afa
         arm |                   squid-3.5.23 | NOK | http://autobuild.buildroot.net/results/f2a2c747066a2db38e879385305c95a125e37d2c
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/61966ff0d1018892b07c4050ec452daeccaafcdb
      x86_64 |                syslog-ng-3.7.3 | TIM | http://autobuild.buildroot.net/results/24e30bbd8d37db75d5d6e41a8cdc180560b9b459
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/c32364bf7a8dc96187f040eb62f70bc985ee0e6b
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4885fb4d0d4ec30ea5c3af6d9f7e2a9e3b5a2381
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4634065a956c24a1a53ac356c67293c893514942
         arm |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/1aecb256e8b22098d6cfb5863ece84ab59fb255a

-- 
http://autobuild.buildroot.net
