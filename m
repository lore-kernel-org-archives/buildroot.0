From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Apr 2020 06:26:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-13
Message-ID: <20200414062638.2B4DD84426@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-13
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  1  |  0  | 20  |
  2019.11.x  | 16  |  3  |  0  | 19  |
  2020.02.x  | 23  |  5  |  0  | 28  |
    master   | 113 | 103 |  0  | 216 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 18
                libtirpc-1.2.5 | 7 
     python-argon2-cffi-19.2.0 | 6 
              lsqlite3-0.9.5-1 | 5 
                qt5base-5.14.2 | 5 
              luaexpat-1.3.3-1 | 4 
                 mesa3d-20.0.4 | 4 
              gnuradio-3.8.1.0 | 3 
             lua-curl-0.3.11-1 | 3 
            lua-flu-20181218-1 | 3 
              mbuffer-20191016 | 3 
                   mimic-1.1.0 | 3 
               belle-sip-4.3.1 | 2 
                coreutils-8.32 | 2 
                  dnsmasq-2.80 | 2 
              host-grpc-1.25.0 | 2 
             host-pango-1.44.6 | 2 
                       iwd-1.6 | 2 
                 lua-iconv-7-1 | 2 
            python-cbor2-5.0.1 | 2 
                  zeromq-4.3.2 | 2 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
                   cvs-1.12.13 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                 granite-0.4.1 | 1 
                grantlee-5.1.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
               libupnpp-0.17.2 | 1 
               log4cplus-2.0.5 | 1 
                  luasec-0.9-1 | 1 
        luasql-sqlite3-2.4.0-1 | 1 
               madplay-0.15.2b | 1 
               mongodb-r4.0.12 | 1 
                  monkey-1.6.9 | 1 
                openblas-0.3.8 | 1 
   openvmtools-10.3.5-10430147 | 1 
         python-markdown-3.2.1 | 1 
              python-pyqt5-5.7 | 1 
          qt5multimedia-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/63b68698c13b83d9809c2a2fcf71ce75144bac06 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d898e21d5db5331e2628918d5a0e1edca44a8511 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/ae0eed2f018a1dec9b1e23e23029f92913971650 |     
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/82876ed5acde631993217afc2beaa20b841015eb |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/8c2f958edf36dd75f482c8cef11cdb791ef22866 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/4fa6e525b3c7ab94e41fca79198212f5db41cd18 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c7c00db0acd01f23884f111acf77f7deeae5ddc7 | ORPH
    arm      |          dnsmasq-2.80          | NOK | http://autobuild.buildroot.net/results/bcba3cec633085aba79c9e235aff766ebb4cc160 |     
    arm      |          dnsmasq-2.80          | NOK | http://autobuild.buildroot.net/results/770475f293fcebbf74e94c348e0845545cf928c0 |     
   nios2     |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/9032335c5a26ec28aad8375ffbfa52528a575e90 |     
    arc      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/79a7dabc20016bcf11afe22e6a5691edbba2455b |     
  mips64el   |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/7342833ebcc8f399d98ba05e63fce6b60403371e |     
   x86_64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/1807c1b054623148f0a2e55dd998b0b428f48b47 |     
    or1k     |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/1f3dd5e14b4d69211ade1fb0bb531de64e104816 | ORPH
   x86_64    |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/4e1384aa5f8ff02ecbdc686e453391da3e2152ec |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/fb4d8f558854fc271ac869d23164a44ce98518c9 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d8b76a25bdf264d46e63ca57475fcba9c8042cf4 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/87541276642d3e6ba7cb6227d5e203ea6392088d |     
  aarch64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/f03d5c11c15feb46a3e7b0f7844b0144efd55797 | ORPH
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/04979f62854f59f74f9da399461e894e17a8b47c | ORPH
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/0f5819fc87f8d76b7d856f6d983e9ee5b6f8e1c9 |     
    mips     |            iwd-1.6             | NOK | http://autobuild.buildroot.net/results/4ef753eef1a3f5527fd5cf23cbdfd469342706e3 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/ece8c4bef4056c68116d1416bef553ebcb2e3496 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6d4dff71d1848d44508f688d8de93ded5db150e0 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/edf9569bea4d96729649e9ad40809ad2d328f269 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/68ab9596906f2f8021b3e34519c05cc75c6878b2 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/5207aeb9b0453a6d125dcc50cddde80083e0db73 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/bd6acc712360b7825f4ebd298af5911a0c5bf43f |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e9c6127052edf00b4e6f5177cb0348f06779ffdb |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/de5ebed54ecc172270f84c3e3e81fa0aab4ca7a5 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/8238cc7ce65357e2b8447f5efd6da2d1a795d00b |     
   x86_64    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/a6e2cadddf77b8d6cc944024d6c3db9117e13606 |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/b09fce51cbe620f6953ddccc52157cf6a80a6c0e |     
  riscv32    |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/db9ac3a1513087e1b1ea56751c49143bf1b14541 |     
    i586     |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/0f7c190ba8161bfb53c935fc4748a9256ea51dc7 |     
    arm      |        lsqlite3-0.9.5-1        | NOK | http://autobuild.buildroot.net/results/36d7f074c2de8d04c692210d90617876ed7c0b3d |     
   sparc     |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/9c581a8a96a097bc2b81eb89d0dcaef627b516d0 |     
  aarch64    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/e7bb473914c38942ce2abf44b2ba39ff56f7b920 |     
  powerpc    |       lua-curl-0.3.11-1        | NOK | http://autobuild.buildroot.net/results/08a3194de9f31bce6b6283ba20aa25310576e7d8 |     
    arc      |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/23d43e90e3152b340dca6e0970b2993e294334d8 |     
   x86_64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/ef1664346e2a8ea51d254b7e62845d8425287c7e |     
  aarch64    |       lua-flu-20181218-1       | NOK | http://autobuild.buildroot.net/results/66eab89dbd78f66da964889286b1ced92ee799db |     
   x86_64    |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/c550a2287c23927f11f55199f53275adb9a412ee |     
  mips64el   |         lua-iconv-7-1          | NOK | http://autobuild.buildroot.net/results/f93fa04e81ca95eb2e708335e382df0c3b5c640d |     
   sparc     |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/49848c7674c9f190747aeb127187ba04dff53903 |     
  mips64el   |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/4ce95cbb1951de5aa87df70f83255601ce32e45b |     
microblazeel |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/8216f67bb57f79f17e565dd088ac5c309d3ba625 |     
    arm      |        luaexpat-1.3.3-1        | NOK | http://autobuild.buildroot.net/results/5157610fac2104f96e6b0d221849df11305facc5 |     
microblazeel |          luasec-0.9-1          | NOK | http://autobuild.buildroot.net/results/7861323e51c51838b4c034caa10eb1af6953536a |     
    arm      |     luasql-sqlite3-2.4.0-1     | NOK | http://autobuild.buildroot.net/results/ccbb3d3150d076b56c7e7af003a6bc7dedbbb973 |     
   xtensa    |        madplay-0.15.2b         | NOK | http://autobuild.buildroot.net/results/ba0d34a2c13ef0ad34da3600319d3b8eb7836e81 | ORPH
    mips     |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/598a3c22dfff7915db4ac2cb1fae0dec67cc0f7e |     
  powerpc    |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/3bf5e042939ed4313ebb00d85cebb35c2092019e |     
    arm      |        mbuffer-20191016        | NOK | http://autobuild.buildroot.net/results/c3c5ebc41f2e63535d13c3db3da04f62f5e1ef16 |     
powerpc64le  |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/57dee7f4f61014cba16d625e57ae55b740c17e76 |     
   mipsel    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/ed209a3f9e7fd2ed69c45ee306ea678cff633de7 |     
   x86_64    |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/770f6dbbb73f98e53351f95811a6e1d756eda0b6 |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/e874d262721cf6eaa3352e128b295c16e96d0ce2 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2d911747bc005ba01f9ac8844c42cb95535e3831 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/20a2dc08fe3236d0b2f48c9224f99e708cde2cdf |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/efab87090bd4f39ef5b9a0f37de468454d7c95d0 |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/521f37ff006eb42417d698f4f2ae30b775e6f78e |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/75df7e22f26b44aed40a36abd8fa77f6e0fd61cf | ORPH
 aarch64_be  |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/c82a640a90d430d70735965a4b0cbd57124e338a | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/5fe4450c06fde710220a0da8321f7c8149843766 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/8c8aee8c8a0062575f489042bb11cc8515cbe48c |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/de83afa45b5b3d735b84fd834bdb3f4eeb3b3e8b |     
  riscv64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/27d590d34b5dec1b931310e11a043f6510ba0ea3 |     
powerpc64le  |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/213defbf1c03c10b2ef8fe11f0249154e78613c6 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/e56c67645ac07e2e60605c28ad7dc32647746db5 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/4d4ed5346881414a2b98c5633cad7e34ab522116 |     
  aarch64    |       python-cbor2-5.0.1       | NOK | http://autobuild.buildroot.net/results/124e1e628c78449fbaa027d74ab871b36d782343 |     
  riscv64    |       python-cbor2-5.0.1       | NOK | http://autobuild.buildroot.net/results/eb778bc996b7a6fff33b3af28a2c83d025abfb74 |     
 aarch64_be  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/8f486d8a68070009f5f0f60c0d1303423473dbaa |     
 powerpc64   |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/827119cf11ae7b0e0a834bf2e6a04e748959ac4f |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/0e85cb7bf7a094fc7f133578e29981ff80318216 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/175dadaf1c0bbf2f5540af169fdb44305dd85c9e |     
    arm      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/605360136ae58ebbf2bc3091de628aa43ba59ec9 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/69091215bc2294ba91a4b097dce15258d401db82 |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/30c1ecfc89a738e26cbfe6ef26ace77eab83f6d4 |     
  aarch64    |      qt5multimedia-5.14.2      | NOK | http://autobuild.buildroot.net/results/e2290f02ec93addf069f32a3039a6031c0230457 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2dacf44584e0c9fe8703ff8fb49f21ecb8e37a7c |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c31e9dffe84fc26673bf9a2836dfec85d9c43215 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/98d8e39f297a54b9212d372d7cc3dc77cd816a78 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/92d1abbe82e7f06e1e5f788e0b58088eceac8b29 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f44d5d7c5af42595a38033d1394c1673af7ca682 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0154ad9a2318749cc8b527d15b5050a4b7cf6918 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1bcd7e9b83b515869e5cbf80fdc2e7d9de6f6080 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e0e583cf68c52b3ddff406a8a274d6c017ca1b2c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1150378c394779f364ea8ee4db8a5ea2a897928a |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/6f25b45dc7b7762310ea694733c17eabef8e0323 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ccd5e2c734bf2e1f82ed151762298a2109393932 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/93d61249f69513c33bba2fcef91a0f9ad58357e9 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/3c9eb8a0db26770e69d47eee70100a556dd130b3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/52fb92ae7dd55cba7d19862bb6cd89c80da9a4b6 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/ad9f5bed0fc4affb4f7f2045afc8542c178d04ba |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/accb20961244f1d5e9ab57c452171dbb0f2915cc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c3f98b6677414237b519d3a4e52149221e6a08e4 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/df5c47f645a21df4a2032a778bfde4cdf7fe72a0 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/e4fe88d4dd5006745911262a619165640a170c76 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/334bb6ad03723a5efba3dd1cc96e69ebe81de542 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/6a89f5722112be5e47f145aff3c692d3602da31d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c697f0f1bd9e1f4f238f82181d9aad8e71354ef8 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/05aa0f69c0d1893d0b1a9442619ecaaab4d799a3 | ORPH


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                nodejs-12.16.1 | 2 
           libwebsockets-3.2.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/53568485524a588e8786b4a9eed518d62274f31b |     
   x86_64    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/f875410c71cded7d52ba266c04cb5135038cf264 |     
   x86_64    |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/52a9336f46023755bc9df7527cdc25e49af1f7a8 |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                       unknown | 2 
                  boinc-7.16.3 | 1 
                  ndisc6-1.0.4 | 1 
              python-pyqt5-5.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/eb435ff9d0598acf2387739e0d337b5e3813451f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/bc89a90e96a72150f167e07c58bb6a26366dd458 | ORPH
powerpc64le  |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/be918d5047313e2a5db4de67db0633472575cd57 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a390d52ad62ad75896f3455e4fcf1ed78d528fa6 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/108e23f3fdb18a06318ed6acf10642644c73fbd5 |     



-- 
http://autobuild.buildroot.net
