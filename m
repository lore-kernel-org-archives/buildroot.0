From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 06 Jun 2021 05:46:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-05
Message-ID: <20210606054648.52F51833A7@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 23  |  7  |  0  | 30  |
    master   | 113 | 32  |  0  | 145 |
     next    |  1  | 19  |  0  | 20  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                    ffmpeg-4.4 | 5 
                 mesa3d-21.0.3 | 3 
                    mpd-0.22.6 | 2 
              netopeer2-1.1.70 | 2 
                 pixman-0.40.0 | 2 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                host-go-1.16.4 | 1 
                host-odb-2.4.0 | 1 
     intel-mediadriver-19.4.0r | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
         mono-gtksharp3-2.99.3 | 1 
                    mpv-0.33.1 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.15.2 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8130855bd38059c4785d73fc1d277683fcff9774 | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/bb345bc5059e0804f66f616230fdef9a35f9728f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a27844aeae30550851549ef5bc335f23a41d4270 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/862009b0a985eb5b04fac4f93284362253b844a1 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c7905a90952032a2c3c7aa308eb1c3d2bf510063 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/801941d20c2e1cf5fae81afe06acbbe220eef381 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/fd9a9667cc4db85289ca8da6826fa221ba68b3d3 |     
  mips64el   |         host-go-1.16.4         | NOK | http://autobuild.buildroot.net/results/36d4d7d9c31b5783477fde45d1f69b2b694b1acf |     
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/45bc22367ad3cbb89b80d2e8990d25d0bd37bfd0 | ORPH
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1a51507dc7d268bbf973ebb3252be09b1a2b08c9 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ca121d639bfd6ede81f871c237eabe3eb8a1c899 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7b13a7dbc2c1e84d632c188fbefa48acb87cbb01 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ea6a3f98eca9cd13b7dba53797b89d622bdc7c44 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aa703cd04fd9418068d7746c585c734dcb7807b2 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4ae33fbb3d5e7bd81d172dce920a727e5216768f |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/93a4196c1169b67992145af022d59eb39f5db20c |     
   x86_64    |   intel-mediadriver-19.4.0r    | NOK | http://autobuild.buildroot.net/results/52638d95312e464626d1c4047b3b26d4f57a1cd2 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/962327de4d8b08bf805b029157ece09d7e593088 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/8c350fcc5f16df2c1bc54b56c5aca58b853e69c6 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/9883bb8f9c1b932b75d5d26527c5d8557b76e5d9 |     
  mips64el   |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/ca75be83d6d23d0cea375ec174086cbc0890e276 |     
    i586     |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/ff3edfe406f00a29429d2fa4258af12c87e5fb96 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/a3031c8a65b8fdcbb080de6c10966aa29d4d6f91 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/8e606eb3f885e4feec1c35eddafb9cf27011d9a6 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/590d2a8b6746ef071dfb439e42b636f81dbdc35d |     
    arm      |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/0421a69063410975aec4fddd52a327d756fdfbe3 |     
  mips64el   |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/da993d3ad5af6eca8f665399bb0229c7a22486d4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8cc11089485571abe5780fe0ff2826f9caa18a48 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/24150cf184dd08cc4a56d690c3179b75ab446b68 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/ecf4ad42ece051bd4a18e2356d91b0b4a77a23e4 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e93cf8b7685d5927ff94e6b25baf53bba430faab |     
   nios2     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/b89a7a7e1b32af539906b9fcfe90143538e765fb |     


Classification of failures by reason for next
---------------------------------------------

           heirloom-mailx-12.5 | 3 
           host-libselinux-3.2 | 2 
                bitcoin-0.21.0 | 1 
casync-4ad9bcb94bc83ff36cfc... | 1 
                  daemon-0.7.1 | 1 
                 freerdp-2.3.1 | 1 
  gobject-introspection-1.68.0 | 1 
             libsndfile-1.0.31 | 1 
                 libssh2-1.9.0 | 1 
                  mender-2.6.0 | 1 
                   netsnmp-5.9 | 1 
                      pdbg-3.2 | 1 
   perl-crypt-openssl-rsa-0.31 | 1 
                   rhash-1.4.1 | 1 
                   tor-0.4.5.8 | 1 
                     znc-1.8.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         bitcoin-0.21.0         | NOK | http://autobuild.buildroot.net/results/e3f1c4ab6c0a4531e4fe78e702e0bb5f8da35701 |     
  sparc64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/8406527daac2c1254bbd033be63c2de56954c05b |     
microblazeel |          daemon-0.7.1          | NOK | http://autobuild.buildroot.net/results/17f96675dc4310d434e706ad7bb3ab499756620a |     
   mipsel    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/b21b21a66bef2bc09231e475037a8f9be5584fa4 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5f116d1225630605fd83ae34af92f4a93df44dc4 | ORPH
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/5553856bd24982ddc3aad8b1fea06894366bd37d |     
    arm      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/a0d87958936800b0e1a0ad1101c1c5e36736d1fd |     
microblazeel |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/d51db1713bf053af8894343c6e1a8cde49a5a853 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/343d6bb133a2d1de09bcc27a1018119770ac5229 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/e8368eaae631c14a9e986248e9ac7d5fd6e9001b |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/69548a5c20da94b41ad497781103213849e88c4e |     
 aarch64_be  |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/becef686431c30baf0f1f06d11394d9ffa31780e |     
    arm      |          mender-2.6.0          | NOK | http://autobuild.buildroot.net/results/237f1921b560ad756a0d72f44212f456f2984dbb |     
powerpc64le  |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/831b8346c285c353ea9c804399612d33841d2625 | ORPH
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/479a80988b9afd84b202bded450b327cbc69491d |     
  aarch64    |  perl-crypt-openssl-rsa-0.31   | NOK | http://autobuild.buildroot.net/results/2736f95323e74c8ec2f28397a0b7fd5ace9aeb0a |     
    arm      |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/a4e89532b4cc5797442270ccdcd4421a5d33f5f1 | ORPH
    arc      |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/adbf4571a254dbabb9a6e37028482d68d0b41ea6 |     
    arm      |           znc-1.8.2            | NOK | http://autobuild.buildroot.net/results/ff99a9e25cf7536b2517506ab90692dd1e54802b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                rocksdb-6.13.3 | 2 
               capnproto-0.8.0 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b4f95f56e0bc4a5907c900fbbb31a8c1052e7b64 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed3c5e2f4a6330c42dff4f0b8a8a576e255b784f |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1507deffe1def8b05a5b7c94d88b798a1965f1d0 |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/075aa3b238f7dda373ba31a576501f3e7ba296a6 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/dae503768de225e01a55399b48c26069f4679ac9 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c0c1a33794527c1fdd838172a21a36935c21f806 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/696c2e29e3e3ff93814e4ae0a24c5d7624114c53 |     



-- 
http://autobuild.buildroot.net
