From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  4 Jan 2019 08:00:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-03
Message-ID: <20190104070050.55A3720A21@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   2 |   0 |  20 |
   2018.11.x |  30 |   2 |   0 |  32 |
      master | 183 |  74 |   4 | 261 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 
                   systemd-237 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/be941ee96ddae3f28c10e43a1c1e86531df18110 | ORPH
     powerpc |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/599fcc9c6e33afe04257a25eeb1dbcac59b1ec70 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 
                qt5base-5.11.2 | 1 


Detail of failures
------------------

         sh4 |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/5cdb7e25184da089eb664ba59e0022b1be66ed49 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/2fb2b651da9ef14addfd76ca90445a359e5d18fc |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 21
glibc-glibc-2.28-50-gb8dd0f... | 10
        glib-networking-2.56.1 | 9 
                    atk-2.30.0 | 3 
                  ffmpeg-3.4.5 | 3 
             host-grpc-v1.16.1 | 3 
   libtorrent-rasterbar-1.1.11 | 3 
         libcpprestsdk-v2.10.8 | 2 
                   netsurf-3.8 | 2 
                     pcre-8.42 | 2 
                php-ssh2-1.1.2 | 2 
                 php-zmq-1.1.3 | 2 
             stress-ng-0.09.47 | 2 
                chocolate-doom | 1 
                 dmalloc-5.5.2 | 1 
                     efivar-34 | 1 
                  exempi-2.4.5 | 1 
                    host-clang | 1 
                        jasper | 1 
                  libftdi1-1.4 | 1 
                  libssh-0.8.6 | 1 
                 mesa3d-18.3.1 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                          opus | 1 
           php-memcached-3.0.3 | 1 
                   systemd-240 | 1 
             terminology-1.2.1 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/b83c9875ec207cf20aafbf6d75a1fdd84dbce2b8 | ORPH
         arc |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/977e6f21ce8774c94c1ee27d4e798d3f940150fd | ORPH
      x86_64 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/6abfcbd8da55f3c7b3cef3e7e9a1ee178fcf6c54 | ORPH
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/3fec5589fcff75a645b6f0bbf732fc2e9760a4e5 |     
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/9926d0fbbb577eacabb34cdf1ec474f00858bc8d | ORPH
     aarch64 |                      efivar-34 | NOK | http://autobuild.buildroot.net/results/545013d3977b3eddd27ca0fc21cc1248f3bb0dbb |     
         arm |                   exempi-2.4.5 | NOK | http://autobuild.buildroot.net/results/ce9db2fedb13c255a849d0576de1fed5a222aa35 |     
        or1k |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/9f76a9f3c3a607b3d1ae9ee42cfd833630aaff92 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2f98e5d085165fcf35b4a3219b7013869c3954e3 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0a4c0852c59742818ce24d38f8594b8674504077 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/7c7637b04c1f444a773368f0f3b8f5f8174e1529 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/bdaac6b20f130a98b2c30adb49218d923b207ff0 |     
      x86_64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/97a80c91f5cd854f48b676eaefaf3ee9c6037e8b |     
     sparc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/77821e9aafa245fc9a47e7a9d99936c2f914908c |     
     sparc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a627e9fad6689918442e1e2c3980c44b6c3eb630 |     
         arc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/173586d6c90cd46f005c3e8face462afbc2ce070 |     
        m68k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/565280f48a3b512729ab3186d2f4f4849b64bfbd |     
   powerpc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/4cb577bc9ee1d5e09810fad846b0c203f9c20f4a |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9e3ed9e979e310f264fa532cbe2a50c92954fb57 |     
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/d14efc36a9aaaf9861e972ad2bbdf56236b3086d | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/7699c2dbd9b0961c72093a5d17a04863d7ac09fd | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/79dd6a6bcaabbda00028771cc2ffbaa5cc22bba8 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/e4c36b655d33b288128c78c77ccf1b1d1dcc4066 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/d76f32d4520e436eb3ca43e5349afe6cf286b613 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/3a50654f3b550a0fb51ef97575637606a6dc359b | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/e7dccc1baf422cc0098ee3e10574df4a93bd47d2 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/4f9257b1b62c155880be3a8d35f940a33bdbab95 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/2a13bc09341055016f0962e1a6b97b20245051f4 | ORPH
     riscv64 | glibc-glibc-2.28-50-gb8dd0f... | NOK | http://autobuild.buildroot.net/results/973575dd0c77a88980c9c3c84068e9494f5196b7 | ORPH
        i686 |                     host-clang | TIM | http://autobuild.buildroot.net/results/3d3604ab3d343a2013a9b83fe27ef7292a6625f4 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ab2e439b14ee3ea5fcd74251a484a683625ee87a |     
        mips |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/332c4ed07b687bfd5ea0454eebce32edb588fbd5 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1a7283a7fcb9c0e1becc61db3770aaafb4898ca0 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/5efeec0d34ae0c22b459e0633f43f3f11c7f89d8 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/7a40b00fb6ee83fa4b880683fd4ba9031203e16d |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/5e1bd58c4192c6cc065caf12db1481ac1645c605 |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/7880426d8681441d32c8f027ce83bb7b94941d54 |     
      mipsel |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/c5541cb1fa6d6f7c821c171394ac59ddeb85a194 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/61b7a917715bd64351b91a7c54c86411e49f2f34 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/9aa903cc6fa48c8ea0538af1dd5fec0a11789bd0 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/09e5cf3ab7142ca5a1e76ba91704ca5b9c5f5708 |     
         sh4 |                  mesa3d-18.3.1 | NOK | http://autobuild.buildroot.net/results/4d2b638130c4386925fe41fb1ef130f7818edcf1 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/70af385d53a81d13e11d8e84e30daf50854b0bff |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4b9cb7c3d0a7a6a5401ecbdc0181aaea272d26c3 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/07edd7ecd8861ef8db977fe670b897ae9273a9c8 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/4ff42c9dbcbd013488cab2539696270ddff25981 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/8bbf552c89e50c68ad29603ff87a4c1b0c7c2e90 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/debdbf206581ccbf6b6d2a67ad0f8e22b8eff9ba | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2590d9bd65f6df9178c6dc170442371111731771 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/98d1cc67337df6d7eb037e18c3e5e8925acd26ce | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d642e480d2acdf54c34188216100c22e97aa621d | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/10b2298a5ecea2172b7865a59de54981ee9f320e | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2bdba8a908fb6be83b7d5cae704fb1a9441b47d6 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/286847bdabe7ded8bca2d52664711b2f4cc19e48 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/87086d0327724a58f6a06cf96fd395e62be31cb7 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/32aa070be2d62261fcd330a68aef7d06ceaad1d1 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c4c5f05afc9ef1dae72b6bafd6b1d69315c8799a | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6147a67fe2ec176033eaa0f9cb68c3c53f5e6229 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/4d46ca607bf5bfdc9467599485f49b08c2ba8019 | ORPH
   powerpc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/938cf4898740a7b7dffdcabe35f432d52ea7243b | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c85a6ef4a229c897cad4ce21f917042776b80ebc | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/992f0b5b785c401286a872d2040c73e9733d2bd2 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f93bf6c0a8369f493ace55f63aa10dbc49647f63 | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1d269354f1ed9a60290713b4c5667aa08d28256f | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3b406545bfc7c7ad9e11893123c98ff539891b42 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1dc20eec3fe42616d85d745f6f5e3ae1c5f81537 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a1aa4afd08befe421ff01f319918da7eebfdbebd | ORPH
        i686 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/fdf120e70aa84c9b1b1a965b1368a3acecf97522 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/b95110b194da94d4524be7d4b773e0d8e8781fa4 | ORPH
        mips |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/170301016e21fa9e811eb54c5674f0099efeb11d | ORPH
 powerpc64le |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/5397e90fc8dbf0fe682ebe9b1992e7480758e571 | ORPH
    mips64el |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/6678513c86c0b6cab647db47651bb9d74d87db0d | ORPH
 powerpc64le |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/8d07612e34fd778ce6674e788d40139e2daaa1b9 | ORPH
         arm |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/6ed4d287474e4589df8117a70c4c0f0d4228c431 | ORPH
         sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/812db1f8977eaecef2d06da57baf2046542e201b |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/a8712c7d0e68dcdf9306501ce95feb32c9b2dcaa |     
        mips |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/6ec7ae951982cb0a5f6e68b25e61cf78ae2f73b9 |     
         arm |              terminology-1.2.1 | NOK | http://autobuild.buildroot.net/results/992f8b8a576d998a54b1cdd057d0d0061d3463d2 |     


-- 
http://autobuild.buildroot.net
