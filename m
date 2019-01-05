From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  5 Jan 2019 08:00:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-04
Message-ID: <20190105070021.E164A2075E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   3 |   0 |  27 |
   2018.11.x |  14 |   0 |   0 |  14 |
      master | 199 |  71 |   1 | 271 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
       host-libunistring-0.9.7 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/5768b68c57e602bc17e328f6cda2d230d31ae402 |     
         arm |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/1bf0cb45402c564b93c030f9e79ca9739211fb4f |     
      xtensa | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/1a23f3d4df8c4dc00149903ed53188c5eb44a922 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 19
        glib-networking-2.56.1 | 14
   libtorrent-rasterbar-1.1.11 | 5 
                    atk-2.30.0 | 4 
             host-grpc-v1.16.1 | 3 
                  libftdi1-1.4 | 3 
                  libssh-0.8.6 | 3 
odhcp6c-7533a6243dc3ac5a747... | 3 
                php-yaml-2.0.2 | 3 
           php-memcached-3.0.3 | 2 
             stress-ng-0.09.47 | 2 
                 dmalloc-5.5.2 | 1 
                  exempi-2.4.5 | 1 
                        glibmm | 1 
             keepalived-2.0.10 | 1 
         libcpprestsdk-v2.10.8 | 1 
                  linuxptp-2.0 | 1 
                   netsurf-3.8 | 1 
                 php-zmq-1.1.3 | 1 
                qt5base-5.11.3 | 1 
          shairport-sync-3.2.1 | 1 
               wireshark-2.6.5 | 1 


Detail of failures
------------------

         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/333adf039c43db93c5162326a5572be38490fe99 | ORPH
        i686 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/110e2fec9d3d2a02eafeac7d86a00e09003dd94d | ORPH
        i686 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/d8c0e7343818cb40f174c17c3f0aab4282cfb818 | ORPH
    mips64el |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/822c408b7bfe22204372a1224f9bd40bc7d9c03d | ORPH
  aarch64_be |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/b82cc772207cb5712896a0bddc13f98ebd685892 | ORPH
         arm |                   exempi-2.4.5 | NOK | http://autobuild.buildroot.net/results/bd978d707e6cdd98e326afdfdfbfc783f5e1170b |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/0af81e129b830fc97a5ee94f4528ec236f3b8313 |     
       nios2 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/b15d11144622d680df59e35daefae124c5649e09 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/bd4b4627ca4b6f810bfecc239184ccca9e2381b0 |     
  aarch64_be |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/7ef48b44a7251487f4a09a0e8ee4861acd4eb930 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/798cd3a659607cea3f1176252c99c70b67113199 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9cd1b9d5783aa7575dd8be1243b1e930ed525d1a |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/4ce84aa794e4c427e3da51c627eb3c9c27bca271 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/5b65f1c28936114199e08ddb4b9ee846f48bc3ed |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e5bf7f6e4e2e7c9d871da304966674c84cd95367 |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a1c9188ee09bdce2c6c9d3ca9ff7360ce79a6fb9 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/29f94c9783318396348693c3387e4594df8142b7 |     
         sh4 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/09681400efb71907f46150ada42c1789c0b1b580 |     
       nios2 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/81e8432891668b9e675ae30ed52232af9e30604e |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/79babbeec9f705c3184592ccdb9a84fb7ccbc89d |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/6565dd317523a91163fe1b1dee705bf52a4cc167 |     
        m68k |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/fd4e0067d8db1c9bfcd13c947fc0bf908425fea7 |     
       nios2 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/99489a4fa7113878b86025350dde9bad6e779d44 |     
        mips |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/28a111d955b0658688d1f2fe0d867acf3ea2b179 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/119ab41c5359c935ad1676d868f666ff19641b76 |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/fc6637f2b499712a0899824466a18fdc77f73fdd |     
      xtensa |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/ea805486daac719f319681f647dfaa333d748fb2 |     
    mips64el |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/2772e5d323e8c8df903d205f21b4a8b9adcdaa74 |     
         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/e969df6f3c093422c380cdad3c9717928be41230 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/26f888ded343105a0d2f06179b069392712db5aa |     
microblazeel |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/a913f7a0d41da242476f9132d2634303cff4806c |     
        or1k |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/5597a8322e34a4c7866e08b5717de602e1b7d3da |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/5029f02766d2107b0e3e22097174bd9b4b4ac3b1 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/ee6772129bef5d52b4617e43adf66e78d0e1a0b8 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/41d20a32d3d204263ee4a550daf58f338b437b2c |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/0e0d72e0e2470ace50aea88f87705b39f9f21efa |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/887ce279cd493805946792ff01276bd3f02f1613 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3e0b88cbfaf90540ccea74b70be1ec10817f6470 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/13ccecdd0ab0a6a1f47a8640f5f8c22d04f6889e |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/2a2ba880f24cc9567e36a3ff9a93a2458cdde428 |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/bbc123ac405f4358f204a92af4c1c4c8cd9825fb |     
         arc | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/b1a324f94c254115115c2810a5bd8f47c3bfdbb3 |     
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/08999cac1593fccb6ef539faa13a714c7d1d515b | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/398adde0decd81288708527e13f99f6f70942cad | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f8b3b812aedc0fab1d878c84e0cda471e4cab9f2 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6bdbd10325872627de83958e092ca2920a4a8d97 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cad1c91d378f8356192d29f2eaee76570895d364 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/45fa2fe3b614f702f8b4f35139e0c113f061019d | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/66334eade88de0d083a5fbbdba747fa4817610b9 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/2367a3ec60b2dd111280910dd46c6ff6995782b1 | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f0b045bd89e24c0341d36db833cc9598b9c5512f | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/71c45993221e6c682dbce5695d6768d82048793f | ORPH
     powerpc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/9a5c9ebda9a373ed8b9e6666f4a98269f07e5b49 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/e522f293a844414dff538c3b5bd78b2d9325060f | ORPH
       sparc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/d1de0d43600a9d492a39122d7848947fbd4f44f7 | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/742f00a9d09c0bc55539f2636e1e41ac84a8db55 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ee109b46522e0c138cd3063cd396093aa6c8d698 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/776a8f5bbabddec5b863c02059f99cf2abe0daf9 | ORPH
        m68k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/609f6090cc2ecb776e39d25245a1575381e9823d | ORPH
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/078392e41c5fc9ac5a86a1d2d7e7ddee0b8a2287 | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f86420289c1b8ec697b3587b6f064d1b3aa2d61f | ORPH
       nios2 |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/4775d37355b07efaaf16c491e719359592f2edce | ORPH
        m68k |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/43ff1f6e215d02def48c5cc121438a9eaad3aa67 | ORPH
         arm |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/81fb035be18479066355c5ea564e6da610a9c490 | ORPH
        i686 |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/c1506bb2b2104d067318946b7c4b1633478a5764 | ORPH
     sparc64 |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/2163d34aa4548f36846f63ad0e62d1865914b297 | ORPH
    mips64el |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/80f956f4144071396f339376fa5dd6839fe829c8 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/94a0f8cc482687940d5b10804ec972f9e5b2f977 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/633b84faf5e39741081cbcc2d10468dfeb1dc64c |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/2d298e10e25238a7a303ed2cec19982e699be044 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/9fed699b9a979e8428095a875e99b29f9ce1c7d7 |     
   powerpc64 |                wireshark-2.6.5 | NOK | http://autobuild.buildroot.net/results/e17323749c2ed77040625e893bbcb0d19d6d94bd | ORPH


-- 
http://autobuild.buildroot.net
