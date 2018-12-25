From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Dec 2018 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-24
Message-ID: <20181225070029.397E020A44@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   0 |  20 |
   2018.11.x |  18 |   1 |   0 |  19 |
      master |  89 |  38 |   3 | 130 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/5fccb9c543070a1ed1e587026e6c79e9ebaedd7c |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

              swupdate-2018.11 | 1 


Detail of failures
------------------

         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/d177a5737a464e176a3bd204d3cc1237ca937cd7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 23
                  linuxptp-2.0 | 2 
                   netsurf-3.8 | 2 
                     pcre-8.42 | 2 
               asterisk-16.0.0 | 1 
                beecrypt-4.2.1 | 1 
                chocolate-doom | 1 
                 dmalloc-5.5.2 | 1 
                     efivar-34 | 1 
                gnuchess-6.2.4 | 1 
             keepalived-2.0.10 | 1 
                  libssh-0.8.5 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                         mimic | 1 
                    php-7.2.13 | 1 
                    postgresql | 1 


Detail of failures
------------------

         arm |                asterisk-16.0.0 | NOK | http://autobuild.buildroot.net/results/bd84e93b0d1d29e6c098749a22cd5596beb181fa |     
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9659776ba36e22782276ffbeda1dc74ee761e778 | ORPH
microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/f8ec74923c26037694d78dcef52c82f45a3eb2cd |     
      x86_64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/5826e0fc78cf3c1cf5238a3d612c2bf5ff4e9ff3 | ORPH
     aarch64 |                      efivar-34 | NOK | http://autobuild.buildroot.net/results/822456070ee047911bf8fe919e8218b449311a9d |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4be72d472877fdfe385ab849ef5622c390d82dbf |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9906def4f708c34fb3d7d8786f3e4d45b2fcd2c1 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/12ad9381a1e0ad60bd6262b243bbc370a19a66de |     
microblazeel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0c4d510f60f3b151a67010cc0fdbb6444948e69f |     
       sparc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/86b19ed0813e30b66d0f7dca83c183ae0c26fd0d |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/42197afa2a44d3b45c83d916e3682f8fa1d24a8c |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ced6d9da2e694cf8d094a1bec169d6c179ca0d82 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d021c7f7874bcf4e2899f7649f91d98339013fc4 |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2fb1636c5f1765f6492cafd36560439ef771c17d |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0663d8c119cdf63a25ada248ea9155ff6ed1eafa |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/fee066a7769e14fd1e0eb75d771a9b61213d1065 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3906474d2ca69147c50b50ceeef3021636ca3f4d |     
        mips |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4e6e3949c0369be8c7e675c22e9d03f6582dff18 |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/2904369c1bca49a25b35cb0ba4347dc46c312cc3 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5a69cca07bdb3e7cd4dae7fc382139436ab4b13e |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/62755e5065c94351ff6a13ff94ffc0872a7a3f0d |     
        or1k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9036a47ce46a0a75ccd4676ad1d46d1db76ca2cb |     
         arc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/0c15ba648d2cf59643a724abe8c800d51b252465 |     
        i586 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/88df853913570b4a1cd2f17d0e27abff4ff23969 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e8b36d94f6f17e0cc30fa5f013c3ba91f5d9cb36 |     
        m68k |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/52bc0ae6f58722fcc085df3c0d8f75976d1416bc |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/24e44aaa55bd82a337746a925bce8b0301bae720 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9e3af43191e02786706c86dd419adc892b8dd15f |     
         arm |                 gnuchess-6.2.4 | NOK | http://autobuild.buildroot.net/results/5bb6af49d087755244edbc7ff0a7fbfeafcdc347 | ORPH
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/f78d4e3b8d3bb6b5d296b124975b7581dcdb2d17 |     
         arm |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/caf0207cb81fc29b0f16d26ca337d1a157ffe7fe |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/f826f1d65b0360af9a9d8148f5c36e91ace628cc |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/0b4f4e2c4e49e669ea2f5ec12dd49eda87a05e3e |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/7a1784359e163c81d324110f464086d2cdd02877 |     
        mips |                          mimic | TIM | http://autobuild.buildroot.net/results/ef52bb22bfc494d0d1e0f08afa477451b8033055 |     
   powerpc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f99a14864efb91764b8b1a4cdde717648b61abd2 |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e6f7e2a1f77d055645aae539634f3f27105f4a3c |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/85a0b16d5619ad20df59d05c28ac892414ed6dc7 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/897e06597cca2af3fe5f3c8fe8cfb53d33aca1a8 | ORPH
 powerpc64le |                     php-7.2.13 | NOK | http://autobuild.buildroot.net/results/77d3b1d3a4d51eeb95bbf44a6e22302d047fa8da | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/aa155c13fe09eba975c02fbf98c71fef7f73e398 |     


-- 
http://autobuild.buildroot.net
