From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Jan 2019 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-14
Message-ID: <20190115070029.2538D20898@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   0 |   0 |  29 |
   2018.11.x |  22 |   0 |   0 |  22 |
      master | 208 |  63 |   1 | 272 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.56.1 | 13
                     php-7.3.0 | 11
             host-grpc-v1.16.1 | 5 
                  daemon-0.6.4 | 3 
       gst1-plugins-bad-1.14.4 | 3 
                   netsurf-3.8 | 3 
               skalibs-2.6.4.0 | 3 
             stress-ng-0.09.47 | 3 
                  ffmpeg-3.4.5 | 2 
                 gnu-efi-3.0.9 | 2 
                  libssh-0.8.6 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                     pcre-8.42 | 2 
              swupdate-2018.11 | 2 
                 dmalloc-5.5.2 | 1 
       gst-plugins-bad-0.10.23 | 1 
          host-libgtk3-3.22.30 | 1 
                host-libsodium | 1 
          libcdaudio-0.99.12p2 | 1 
                  libnfc-1.7.1 | 1 
                qt5base-5.11.3 | 1 
                   systemd-240 | 1 


Detail of failures
------------------

     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/f641a07c4139cb44d69527ed00c1c66226b37a7d |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/90e1b0db898533ea666516cd53683de7950f43b0 |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/1c6f5789e4f108c861029075db35fa52b3b9b491 |     
    mips64el |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/239ff5d9946f85870fec9c943b16ed08fdb5ae2b | ORPH
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2b76c1de63219da0d300fe62e454c24684890eeb |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0be4195f119383775c1808a2469e4890dc5d2ec7 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/54a9d1642c7e1d1ec305db928c80e85776fe85b6 |     
        i686 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/2f64da787ae3c6ffa6b8850bada780427722a5fb |     
       sparc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/d0ae162330c37eeb6ea248e6a99391fae789ea69 |     
       sparc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/6dcfd276dc35694e8d62adb0b26ac691de828389 |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/8f83be0c21c21c07d5a7330f3626b739b1970625 |     
  aarch64_be |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/4d1af7b43baa1ed611a57fbdbeb58a5cdc868110 |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/96b287a6de9f8bae48d75ff6652f3c909e0181b0 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/30804d03374be9382dab540bb2c1cfb5ebb3f2a1 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/59a89cbe66155bcbeda1d287af26da5a39756b4c |     
        or1k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f24065c0c3641c087b3fc4301edbea2a13c446cc |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/ade1139881fb661726d0e6b3bdb8fb8c0f755701 |     
     powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/8b464a8259251597244285d0b51d39c1c6a09e67 |     
        or1k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/6a96b09e791fceb93971c2a3a226ca817f59f3c4 |     
        i686 |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/34dba582cd98c65875fc32668f7ccb1cd4054614 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/946deaaaea4ab9007daa92611aad07042eeff2ee |     
 powerpc64le |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/39fd5672518d294c9e2895ef69c1d4d94d2f0c83 | ORPH
         arm |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/57d3e033b8c7280558e549a9a70f4861e4bd80e4 |     
         arm |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/7570303ba6cfa692f55fd16c0ee4dd25e9f6fb9b |     
         arm |        gst1-plugins-bad-1.14.4 | NOK | http://autobuild.buildroot.net/results/4b32eefc4be052138721b6b4c09cc9a9251e85f6 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/fbbafc12d67f1765caef393f87d0374cd43c427e |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/88aeb9ae6b07f3c8fa36d6c22be313a58ed80b36 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b6319f9cc1df217e6b2fbf263ed5f0016fee3356 |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ac91955d8581aeb1e840c2fa436b917c0961e3ef |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9d7d7fd734670be059e8cd4372937706e23ddde6 |     
       nios2 |           host-libgtk3-3.22.30 | NOK | http://autobuild.buildroot.net/results/9175a150bd8c9be6699c1eaf7586fc2153a3295e |     
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/0fd69497dfb4337b8599e13cfd458d0d3a270c82 |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/fbebd4a7c9b4a3fdd308bed93c978e5cf50c7aa7 | ORPH
     riscv32 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/1df8dcc3ca204b2f53685a83e0134c428df8331f |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/8a83b8121babfb4e653036e696297760b88b7c90 |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/7d70dfd4764570d27e2061d925236ec185ab78e0 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/74797d5cf72ce69ba3fd62e156071a514976f453 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/388d10241b702b663e22bb1e233be540b9150b63 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fcd7bd8df1877796ffa06d585516abb5edc629ae |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1683d8215fd20d2f00b10d5ddf7dccd1af7b14c8 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0a3c210dcfbe7c97a7bcde1577f24047fee2466e |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/b0a12c0bae756d9a4fe054b33ec339559496e945 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/43e8e7accf8aeadf35b5865646abc011ec96e887 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/41d5dc9320782c91ba8bb088f8b5fbefd8197163 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f6740dfc294f6a9267ffc1cfbf86eb3cb51840ab | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/0698153d328fb03bc7852ab7d80d0abb088c17c3 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/950a129754aa9eed452a63869b71da3bb3663d49 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/741df82f8058b8b8423046d9e6deba8d57d44852 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ede76826ad29a7ecd14e5231b95e00a11934c075 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2e27094e42ca9dd0f4e3b7ca052ba04027213702 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/8585d864640d15de921863db235d43f62c3af1c6 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6c99ebb78f12931b3e7c9750439891da401d30af | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/470a25168adf5bc20f45dec64e5c855d1c11dbe3 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2586b96674344d51f9aa8c398a9a5abc8f31c348 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/8885445115e9f5debbd49a8bafd331851df3758e |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/58209f986211ca44e8b91eabb9b428a8cfc660f2 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/5a0acdee861043d69dfb09400d771111752a258d |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/3dd15f4fd184e33d8d47f19642ef48ef49e8c326 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/095cae65023a2c7850d2a3f362c24a508d8d0645 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/400495f08256e5aad6edff4de24843cd22fcd53c |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/5f4d2518ca3a4bdeb61622726afa859355359dce |     
         arc |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/4f452f1b44dcccb1221a9f808ddacea1605af96f |     
         arc |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/fefa97814d62621deeffc3167a1d45debca988be |     
      mipsel |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/536d585f6c94850390a1faad131f0b4cf7811e7d |     


-- 
http://autobuild.buildroot.net
