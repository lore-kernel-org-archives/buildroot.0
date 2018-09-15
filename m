From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Sep 2018 08:00:39 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-14
Message-ID: <20180915060039.6015C207A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   7 |   0 |  33 |
   2018.05.x |  26 |   4 |   0 |  30 |
      master | 183 |  99 |   2 | 284 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 
                   attr-2.4.48 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                     php-7.2.9 | 1 
              sdl2_image-2.0.3 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/1a6f8bc5b85e7893fa8b21ef5152f877a18295fe |     
      x86_64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/169d29118cc0bf134ba0d12db0531c8909c96cc3 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/a6687d60b5430f1cedd54315cb80e94e2721e449 | ORPH
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/dce839d624a08a2238898cddb7364fe8dbb7401a | ORPH
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/1281938c629a61328ecef1429409823ec42003cb |     
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/0ecb223aa595a7b34c7f86669bf1b38dc49dec13 | ORPH
      xtensa |               sdl2_image-2.0.3 | NOK | http://autobuild.buildroot.net/results/552817141d7eb0c5037114a4bc7d2d76de871285 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 
host-android-tools-4.2.2+gi... | 1 


Detail of failures
------------------

         arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/86bf5ebd246727abdaed164ebe055409fa69d248 |     
         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/8db8250cf91b9e0f7b8827b988d81daee8ac1aa6 | ORPH
     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/6076ce17aa8e0d9e65994104846bd75b0b477277 | ORPH
       sparc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/a0cc2c06c1a8e8c9f1e99668645c7db7386f43be | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 40
              ptpd2-ptpd-2.3.1 | 7 
 Makefile:708: target-finalize | 6 
                blktrace-1.2.0 | 4 
              e2fsprogs-1.44.4 | 4 
libssh2-8b870ad771cbd9cd29e... | 4 
          synergy-v2.0.12-beta | 4 
                  boost-1.68.0 | 3 
                   dante-1.4.1 | 2 
                host-libsodium | 2 
                  libssh-0.8.1 | 2 
                 lvm2-2.02.180 | 2 
                   netsnmp-5.8 | 2 
perl-crypt-openssl-random-0.15 | 2 
          perl-data-uuid-1.221 | 2 
                   botan-2.7.0 | 1 
                 gadgetfs-test | 1 
              glibc-legal-info | 1 
                   hdparm-9.52 | 1 
      host-xlib_libXfont-1.5.4 | 1 
                    owfs-3.2p1 | 1 
package/glibc/glibc.mk:134:... | 1 
 perl-io-socket-multicast-1.12 | 1 
                    php-7.2.10 | 1 
                rtorrent-0.9.7 | 1 
runc-9c2d8d184e5da67c95d601... | 1 
                  screen-4.6.2 | 1 
                     squid-4.2 | 1 
              traceroute-2.1.0 | 1 
                     vlc-3.0.4 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/879bc1556bd9f1ceca572ded28cc2270f596d09e | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/35b2b6bfc58455d208b6d1b1a09b02424d2d75d4 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d3ea4952bd35685c037201d7e6569a9c4a818909 | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/9a2e556c53ad503418cc499c0d8a3c116d679211 | ORPH
      x86_64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/30fc87925ccd141a2cd44a83b8940504c0501b33 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/350fb1a52c72b7e92f18c7e659e73e304a7f3b20 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/2d2e7e84d5798132e39aa4c3de1a4e3889986dc3 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/b750a6d7b80f337228f307dd82e56b13b28c1226 |     
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/98b22c4f00a39a5e0228de43ab1999b3f4a05756 |     
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/9a06e840f84c7d37521d1db2bca6b086fbc20ba6 |     
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/848155c25c8a03e83feca131754e80f3b552df8b | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/d16ca135de41fde5109196ba0b83ac1f14324b1a | ORPH
         arm |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/d533da1bccbc088c62e846ca4642323831f9f737 | ORPH
      x86_64 |               e2fsprogs-1.44.4 | NOK | http://autobuild.buildroot.net/results/36a1ceb9c47aa9636213b1384e55375010eab4e3 | ORPH
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/923439d3e6bf61bdf65b26ada3efe932164f2c0c |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/4876db0a667f092dfcc0b76a854d0ef230f7af21 | ORPH
         arm |                    hdparm-9.52 | NOK | http://autobuild.buildroot.net/results/57a9b2c5e5bfb638b1c0b84711126fb7f48c80ce |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/b6471adf18088135a09096a595353d5cfbfeb88e |     
   powerpc64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/51e343769ecfd3d16462baf61108d6b529a106ae |     
      x86_64 |       host-xlib_libXfont-1.5.4 | NOK | http://autobuild.buildroot.net/results/30cf5cc139f9f6a9dc070953270f74e18b9310d4 |     
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/0c2d17316fd6bd2bf1359e23a2a1273fa349cf2a |     
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/936abac5362b33980fd1efe8b830409ee2f86f6b |     
        m68k | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/ad88d7ba0cdf3b80a969c6c094e40b98c60f6b49 |     
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/48bbb2357a9610c8402c464adc5d0d7af1f5fad2 |     
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/174cb9a1109fbad5bbb3afa7c048b4712fb95684 |     
         arm | libssh2-8b870ad771cbd9cd29e... | NOK | http://autobuild.buildroot.net/results/d65c8cb7cb97ae7bc3ad822a52df460f25f1b48b |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/c1eed6f1a7024c659f932490c60b947dcc335e80 | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/63983e25b2a84ad7d287a8ebfca8d2a5a7c8800f | ORPH
        i686 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/a478f8d54a810e1dd8c3a776a121d800aa869ba3 |     
        m68k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/bddb3622dfb0938c5a662cdd84f831f18629bea1 |     
        m68k |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4051cb3060b715323679aa1bbda16fe5b51f5eae |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/ca5bc3cfdc8aaa8bd80590f6740eac4e83601c57 |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/f4cf08a30e2c55ce54a7b0b641347a7a6292dd5d |     
         sh4 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/0aad0a2d526df509a2dee725d6ce83f5e4d4cb83 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/cf57686e7620cc0ec361631a9ff906aa0123fdb4 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/1043a958314529240627005d1bf21a76f4e6fcf5 | ORPH
         arm |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/53d8832b11f8d63000c2d09ec6fd97048b7883dc |     
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/179c451488006f4fe8ebe362edbfae7de4c22d06 |     
         arc | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/143f372c71cb389b3c3531f319ce63df47746910 |     
   powerpc64 | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/581ef93e90e64a9a48cbb74aea5194ad030b988c |     
         arc |           perl-data-uuid-1.221 | NOK | http://autobuild.buildroot.net/results/c5ba7b0727131220b60a4dc78fc7491dd4f7af9e |     
     aarch64 |           perl-data-uuid-1.221 | NOK | http://autobuild.buildroot.net/results/5dd93ef9f5146227b8233ada260d5945aa8632d0 |     
      x86_64 |  perl-io-socket-multicast-1.12 | NOK | http://autobuild.buildroot.net/results/824119c86a1ddcbad39d4d4e9fe61eba20a55f3f |     
         arm |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/3216a4eb779c059a3e0b4375793814fe38fab4a9 | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3b5c47c76ab2c76087e815a9e56cba0705eb4833 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e63ab8878946dfe4d4ac6b24cc1451846fd7188b | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9c099079a9f7f5304219826df7677bed16816fe7 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/280d8cd6b86cf437007ece85f87fb0a055425f4a | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1361cd55406c447a3b049403f98340dc6c49654c | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d75dd91f362073d7cc8084d63e5a4459bc10341e | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/50d310162f454a91a0227fb4033758c24b3c497e | ORPH
    mips64el |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/0d4f5ed06f7f2f7507163dcd54569748f2f48d11 | ORPH
      x86_64 | runc-9c2d8d184e5da67c95d601... | NOK | http://autobuild.buildroot.net/results/ece873c680e9002f161c75303f745f80dfe7bd95 |     
      xtensa |                   screen-4.6.2 | NOK | http://autobuild.buildroot.net/results/3367316df2c1be686852b741c21d5f72ee64869e | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/cfe137693f2b5e1c7149a0c289d613157cae4fc1 | ORPH
     powerpc |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/337b754df0f3454cc897efa84692f586cba1d225 |     
        mips |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/bb2dbd711c192e7273134a5aff5f778384526946 |     
        or1k |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/273258871d0966294422ab9c4aa990d3c8804987 |     
         arm |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/51ae7d9efd34613b12bb039dda1f637bc87f35bd |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/25abe547831f40bd3c041345bc7d41779fe137e6 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/db3d5073a8d7d6773d5c34017d76dc63c52140bd |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/ca0ddc44d77f7d03fa0cf271aecbeee3b700053b |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/55dc4bcb44e432dff748ce0fd8d899d6c35f1728 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fdc52c82973fc76e3c95640ccbe47e3b89255b91 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/00ae866925b9fc467982e0c8f84163564ded757e |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/ba51e9a7042ccbf4c5281d593d434ff3f3da67d2 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/51d7ecddcdb66c60e6f80c4dd9063a68b0ffc04e |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/377a698d2efbf8c83ad806061ed321b263e6717c |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/ca31dfd4783cde4988c9db545149dfcf7e0c5e93 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f0461bd0983e08a2aca604dd5a44b003ed3d3ebb |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4d3f315c99268686c7f6e3a5a1835e61159aee87 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/60fee65e9258c93abf5275fa5ff2262a0793a700 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e7bdfee65466f600dbcbfd5b9a920b78c7f8943d |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/2d97593910cab0a9ebfa3e7df5ae21db36602de5 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/e2acfe87deca56e6c9bca5045dc5296f023a602c |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/991c5768edfc4067910cda49741b7aa975ccdbf6 |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/f09cbb74123a1b3da30bc891a926b42921bba573 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/c289c2d1816bcdcf814dff7cb9a1a7009c84043b |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/f6be535e23eefc6de89cadf6ad476c38d0ca8ed4 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e9fc9db867354b4cd0f2cc5b4fc6d4e0a1594916 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/716cacbce238178b2dfae49e6bc8d311fadd9300 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5ac990c6284fbaf34f74e19135daf689e7e16e4d |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fbeefafa983d3e837416ca8a0b057673bf6ab9bc |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/dc649bfc2998a9187655acafbae278ddd0795d47 |     
   powerpc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2fee19a471a71bd359ae90f79e63e17a7b0bf6cf |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/e7d76c289c9aed4fd70a352d15bff18d5576b5e0 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/6cd0593c5b8aa646967dc73a80f91a98b25843c0 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/1c8df458dabe6268142b5f1eb2a5d82bb9c9d73b |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/05d9d40eeb938fc0ba394b9041fbfb11ab9858c3 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/3bb91bef1bb81ef1df94eace6e19d7460189305a |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/b1bbddcb3b8c53b0bf11270c7c46304aedb8f988 |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/f4fc907baa0f9951f2313f35b6fc2f9a14e1717f |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/4a7b3534158601127d69b9a3a1af40b37566d57a |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/0cc07a3413f1c234c146a2ec342494d55479eb6d |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/b6bd402e6ba5ba48d53a10414c63148c7fddbdc4 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/e0480d2ba6bb14e6fef2698ff398b2cead246196 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/5b7f4a08ea36b644e3fe9f90d625f8c221c51840 |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c229ef452991cf79d4d95d27f75097ca37714642 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/1f404af1619e60f71af0329b36b46c30e742cbb3 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/d496eefcf45c8d50bf4256c941df678387cf09bb |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/2e5dc746a59798a56d3127aadc88593fc584c010 |     


-- 
http://autobuild.buildroot.net
