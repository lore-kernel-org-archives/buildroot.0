From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  9 Jan 2019 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-08
Message-ID: <20190109070030.7F79520784@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  43 |   3 |   1 |  47 |
   2018.11.x |  36 |   0 |   1 |  37 |
      master | 200 |  67 |   0 | 267 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 2 
                host-libsodium | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c388984db2a71ca2c3ccba6af68a2a21372dd95a |     
 powerpc64le |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/76d7e92f8f5c6f6b178f5acd4dbb6d209e66e14f |     
      x86_64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/372acd782a5ccc8b4b350e43eb810f7eb0c2773a |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4a8e9edcafba45348314688e5e67ffe1174edf87 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 


Detail of failures
------------------

         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/13ad2e2fd73d45ea5377eef9d7356172e5a348c3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 18
        glib-networking-2.56.1 | 6 
         libcpprestsdk-v2.10.8 | 6 
                   strace-4.26 | 5 
               asterisk-16.1.0 | 2 
                    atk-2.30.0 | 2 
                 dmalloc-5.5.2 | 2 
             host-grpc-v1.16.1 | 2 
                  libssh-0.8.6 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                   netsurf-3.8 | 2 
                php-ssh2-1.1.2 | 2 
                   systemd-240 | 2 
               wireshark-2.6.5 | 2 
                    efl-1.21.1 | 1 
                  exempi-2.4.5 | 1 
          host-mono-5.14.0.177 | 1 
                  libftdi1-1.4 | 1 
              libgeotiff-1.4.2 | 1 
                  monkey-1.6.9 | 1 
                     pcre-8.42 | 1 
           php-memcached-3.0.3 | 1 
                php-yaml-2.0.2 | 1 
                qt5base-5.11.3 | 1 
             stress-ng-0.09.47 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

         arm |                asterisk-16.1.0 | NOK | http://autobuild.buildroot.net/results/93b904f26829fa57daea4debdb1d22078466f68c |     
         arm |                asterisk-16.1.0 | NOK | http://autobuild.buildroot.net/results/ad9c678d2f5f19eb30cf7bec8b0cd3c0c3e9e75a |     
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/81b59958ed09ba7586d6907dfea5cf38dfeb5572 | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/e12029822893fdf5db84f26df1a9e62f38a3d571 | ORPH
     aarch64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/e5e0aa2b4337f8e4710b666a93495fa5eed546c7 | ORPH
  aarch64_be |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/366e3f49150191901939d5b1148e399316595277 | ORPH
         arm |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/934c47e0b4359c54878642831196c421b3e7271f |     
     powerpc |                   exempi-2.4.5 | NOK | http://autobuild.buildroot.net/results/2fefd165b8b1edbe32f2bdc8bd30af56552cb7c5 |     
       nios2 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/5fd268791df75f07083fca41adeb6fee117e21dd |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/0da844464b6122133e4e66cd34a59666bc7df3c9 |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/205ec8866844657978828534ab11836d400ee926 |     
     riscv64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f0e34e70e34317e4b7c611c36e04d78441d364be |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/79334557e79b60164d99beafebd529d45cdbdce0 |     
      xtensa |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/7fe0d20e3bef0a7e9247ade8e82bbdc52118b00a |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9611be597961c856fec14999fa738b04fa659127 |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b0203ba41063b28375933924966a7e9f3f32a3e6 |     
        i686 |           host-mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/326a74b849eb3b6679c45c4d6515f58bbbbc55d8 |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/89fdb0b3237524dd312b26e19427e92e3bf96128 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/7513828c338b1742fbb7cc4886f7fb3302a0430f |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/0f5a462b57e9c83cc4db039ce096c7237426e7c0 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/3af6a6fe46b4af7d417c61bece0c4450c6d9f3c2 |     
        i686 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/da94bfa751ad97baa7afa5f8ede181e57bbc0b3f |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/8af3834d8dd71aa88c7b3f127891584191cd8b0a |     
      mipsel |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/58ed6129ba3b7974efd338eb4caa505a04c0940d |     
         arm |               libgeotiff-1.4.2 | NOK | http://autobuild.buildroot.net/results/72f1c5c1b8fc337a1cff4b280abe99afd65f945b |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/56984396792b4e33df01484b268ac08ee69a3088 |     
        i686 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/54e374713e90a809a2dc6606e8098ab0a5781652 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c26b64dfc0d5d17001501210948d0c93250dcfb9 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/488921ee7e9eb7e3fdbe2453ffe478ad03e410a0 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/624db37d3d68e46de981c9c1a917affe6730be07 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/64f580d6fd1bd196d562775aacd3fb9923121b29 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/04114eef61458cb35c9b25f0220e8c36ee0f1f7a |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/17c19e9ab0679c9b9894ecb0593fe4863374c8da | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/003bf265014aae25a576c58b206ab6bea5082802 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/30463fefd7eee476599c106775ef25a01679954a | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c1971dd4869fac1a07545ac625bea5b65fb35ce2 | ORPH
 powerpc64le |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f0d0e7942a86c1aa53702b09aeff37c888d196b9 | ORPH
 powerpc64le |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7e062847d53a26a2191648bca311c459d476e7be | ORPH
        i686 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f0990b163bec7a2fe952efe226a18f3ef82fae08 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2c18fdaca6c94dcd81d302546766082144dbf558 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/62a3efe0c7159624f234f9e3fbbd99eb4a4b47e2 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7680095d69f4c3f2545320a0d78806b0274dc59a | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/0ad42be3e46c7f072a186005b85b39d6f8f28fb5 | ORPH
     sparc64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/39ee41a3ba0eb6eb62e1493a884888961525c8ce | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/4e0c43c678c233bef7a7962f6ca9267feb74428f | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1dcda5ca1e7e95fa2d46f29633ac24f278c9a9bc | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/151a6cdb17e04aede845ef8d0593cad093bf3a87 | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/48d6adf8a24cb594295c98b8df38d5f8627f2515 | ORPH
         sh4 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/0a19a47d0c398e7c5c6eb770b948c98af6cf3885 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e3e1d56f67f81aea36f5de2673048aeb89885596 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7051bb91ec89eb626813ffc8f8f77674a43f13ba | ORPH
        i686 |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/dbbf40baaced0e500e14cd4ab3faf19afa5c2b2b | ORPH
         arm |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/25199f3d09b0465a7c95f6797ed72680b9c30493 | ORPH
    mips64el |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/661c4577ef04b07a8bc8663a5d60a6d3461d892f | ORPH
      x86_64 |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/51fc89344c964ac1bce51e04c023be41e37555c9 | ORPH
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/646be9143b65e5a3fdb026ed1c4f9ecdb40a4d2b |     
        mips |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/8876b6fb81902f2e920cf2378a6ed6c017cbfbab |     
        mips |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/8585e75df6462b6d07476a81982e88ec81655c8b |     
         arm |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/519ae644ecd094c278b5c9b9677c69b59facd3df |     
         arm |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/0ec023943cfbb56882fb1ae72a9f2344cea03cba |     
      mipsel |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/b2f24976ddda1adc9b9ba3d9bfb7167721814f78 |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/ce29c64a2a6548d766455734a3ac7cf316271b8a |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/e0e4d0e44ae1bc00a98a2f5e4a7eb38c25b41f88 |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/a6c66d9b6f4db02cd381d1ab3f6dcdd710ad9ced |     
         arm |                wireshark-2.6.5 | NOK | http://autobuild.buildroot.net/results/de51b1754c0dfdf3fa93092815a2cd12092e7c78 | ORPH
         sh4 |                wireshark-2.6.5 | NOK | http://autobuild.buildroot.net/results/8daadcac3a0d784064ae8a929cf98039b1807d84 | ORPH
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/fe58f14a37f0a18f164e8b4004afed5997a3f248 |     


-- 
http://autobuild.buildroot.net
