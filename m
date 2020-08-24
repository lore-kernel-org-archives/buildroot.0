From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Aug 2020 08:00:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-23
Message-ID: <20200824080337.2C02A204B7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  4  |  0  | 14  |
  2020.05.x  | 16  |  3  |  0  | 19  |
    master   | 152 | 66  |  0  | 218 |
     next    | 45  | 15  |  0  | 60  |

Classification of failures by reason for master
-----------------------------------------------

              ibm-sw-tpm2-1563 | 13
                  boost-1.73.0 | 6 
                qt5base-5.15.0 | 6 
                       unknown | 5 
             kismet-2016-07-R1 | 3 
                 openal-1.20.1 | 3 
              bitcoin-0.19.0.1 | 2 
   gdb-arc-2020.03-release-gdb | 2 
            live555-2020.06.25 | 2 
                  luajit-2.1.2 | 2 
              netopeer2-1.1.34 | 2 
                  davfs2-1.5.6 | 1 
  gobject-introspection-1.64.1 | 1 
              host-grpc-1.30.2 | 1 
libcamera-96fab38e02792a109... | 1 
               libupnpp-0.19.2 | 1 
                   mimic-1.1.0 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                    owfs-3.2p3 | 1 
                     php-7.4.9 | 1 
               protobuf-3.12.4 | 1 
       python-matplotlib-3.0.3 | 1 
              python-pyqt5-5.7 | 1 
             qt5wayland-5.15.0 | 1 
                ramspeed-2.6.0 | 1 
                rocksdb-6.10.1 | 1 
                suricata-4.1.8 | 1 
                    vlc-3.0.11 | 1 
                  waffle-1.6.1 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/064ac753767078d040435fa444ac202e200c99a8 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/6ef46e930061516aaafbd8fa3984e3521b812585 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/8bff80bfb5b2208f4c697f02c42959997770d408 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/d61fd85313a24efcf83eb982aee86feab0394439 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a48bea1b93f82782ad603f723f9cd76669e85209 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a7f59b3f6a2749820f3971bbf3c94d05c5200b5c |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/124c10abebc81bb53ab26fb795d5986d0c73b7b7 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/50614b8da8961ffc2175ed37702a7ab6fffa143b |     
    arm      |          davfs2-1.5.6          | NOK | http://autobuild.buildroot.net/results/42beafade6fd31927c8db14bc52110c0fc5b17c2 |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/cd0638bbedc7ea7b533c810c752ebacefb35e51b | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/7e8e667739966d94484d08594a9c69bada7c0c28 | ORPH
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/127dbd01b14f9b311d482a470eeff15a24805bb8 |     
    arm      |        host-grpc-1.30.2        | NOK | http://autobuild.buildroot.net/results/a074227fee3721e88c4fa668acd4e4c82848042c |     
microblazeel |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/19abdd9cf9f016985efa288daad0d6a10ae1a52a |     
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/121ded757a58d3c6e70ada3b3d7b7401bd46ccb2 |     
  powerpc    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fe82dd05ff215b44ae9a1a91727cfebabfaf76bd |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/c842b2b355cf9e475e039b174015db38300a1dc8 |     
    sh4      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6954d920e93c70bf9126b97d86307c242851dd3d |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e2503584ce8047f8fec2209dbaf406eef1c8c22e |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/d59aebe035b8cf8611ae756e803955c379170a4b |     
    arc      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/9da7b28699bd04a6852fb6742f5511c9f023bf31 |     
    i686     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6fd11f06039059d7bfe5eb7673263f5fe8adddbf |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/13e405b878cc0475a32d7e0deedfb0d3e9dbeab5 |     
   xtensa    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/fe09041d0d4d51a9bf3a7eabf709dde0fae1a5d9 |     
    m68k     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/02dc4541508f6a485dbcbcf17f59ad190459509c |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e20f9474fc0217036faa6561df33fa983466ddfe |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/43964be7d3ba0ab4fa814a80715e32c23dcf701f | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/054bb97192b78ec3b795c33373b8a103c22bd604 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/35f5d6476cdf6cdcf78cad9b61be5e400fc474ec | ORPH
    m68k     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/368c25403fa44b8f8f0ccfab2d3efd7d90a1d59a |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/475391808677dcdd7c5e33b5ad45c6f0f1149849 |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/d6cda21f2844dfd4eca78a2d21c85e80f90188dc | ORPH
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/5a4afde1e9a60ce64e56065efc97e0cf6269989c | ORPH
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/9d939e7378c3ab44367b98ba1ba8a36b000beca0 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/1549c617eb112c57cf39e443e0af599d6b27efcf |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/50d6ae4f484bd5895613a898abedfaadb815629f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/70f330e30a0646cb49c5673298cd6855275817e5 | ORPH
 aarch64_be  |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/bfd15e106ecfeb3e2b086aa5371ceacf3220dda9 |     
  aarch64    |        netopeer2-1.1.34        | NOK | http://autobuild.buildroot.net/results/f197ca1def9dc1292e1e784757f2da9d95484431 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c696bdc97884dc843155d30a810efd6f0a6dfc09 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/c4bb13d068d7246ff0fe0548af33e342f08ec290 |     
    arm      |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b7f6eea77449fb9efea1fd3b4e1f959da59c8eeb |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/e8150acc35bb174fece7d805d6de80732b5a1c2b | ORPH
    arm      |           owfs-3.2p3           | NOK | http://autobuild.buildroot.net/results/7e9c33d7a1613826f85716403a00dce03dd8daf2 |     
    arm      |           php-7.4.9            | NOK | http://autobuild.buildroot.net/results/3380b7b6777d1c5fcb53c855b003466fa3bf2079 |     
  riscv64    |        protobuf-3.12.4         | NOK | http://autobuild.buildroot.net/results/f4e3a653e7d8dbbcc451618a3db8dcea6002cafc |     
    mips     |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2a6a1879b3ad890338fbc303faf48e8a75225cad |     
powerpc64le  |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/ce2147ebbe1b2149047c153f9c7c7c5c36fc2eb4 |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/cc29754b53f9549c7525e82ac3d1735c13469a3e |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/948fef5c3e6918816ba6cf556975e00feb9d590d |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/7448a306f2ceb3af74164c9fa544c86dbd192612 |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/974086512cf9111540a154aa35caa6ab66631962 |     
microblazeel |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/c3ee971a72f268e72b69a647e8fd00a8cee7dc91 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/89c9a88b4e1195e952528574263201d4fbc27570 |     
  aarch64    |       qt5wayland-5.15.0        | NOK | http://autobuild.buildroot.net/results/6cc2cb3efafd0139d5e7f6ed35935ad91e71ced5 |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/c2c1a4afec268bc959eccbf6abe98e64206eb3ea | ORPH
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/e3609598577145afb18116f27ad1b82ee2b76ce5 |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/ceb5c7d55ad5c894f0280a3525068219a5203f4a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2f435471bfcf0f9cb25ab4dc628f3b60b7785341 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/60d994a9cd1e1c7f6f1bbe16e26ce8863c15457c |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3dc71b8736c4bc0eae5bee1c326c41edfb692ff4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c8f3d7072c654713ad8b66455438f3b44e9a747c |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/1f3a78372d0e37920ea941e8692f833086e7c32c |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/90f72fd9103bea83064d327e7a6309df99d4d26e |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/5a5b7f4473e3a6823e5c580c69c9259d926111ec |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c7973eeefe62f8361f250ccd092b90ea7a62166d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
              host-grpc-1.25.0 | 1 
              openjdk-13.0.2+8 | 1 
                  spdlog-1.5.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/e27b5bd4b9028f70cae365d1ec80c95674d1b7eb |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4cee788cfdbb9475ff60ffcdba6db62b7e684324 |     
 powerpc64   |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/68ec2a6203a4188e4eda778eefde74bc072d96cf |     
 aarch64_be  |          spdlog-1.5.0          | NOK | http://autobuild.buildroot.net/results/98937090b9b3d21015d1899c8958942170967171 |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

                  assimp-5.0.1 | 2 
               opencv-2.4.13.7 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/f3191d4d3b976ba1d48132b1af13ffe0e7c8e8a8 |     
    m68k     |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/807c2c1538766587bfdb3c9b85fe4db9e0f9e511 |     
   mipsel    |        opencv-2.4.13.7         | NOK | http://autobuild.buildroot.net/results/3c04e556fa264eace5de3407409b2a21b035dd27 |     


Classification of failures by reason for next
---------------------------------------------

              keepalived-2.1.4 | 3 
     dovecot-pigeonhole-0.5.11 | 2 
                qt5base-5.15.0 | 2 
               capnproto-0.8.0 | 1 
                clamav-0.102.4 | 1 
              host-grpc-1.31.0 | 1 
              host-guile-3.0.4 | 1 
  host-python3-requests-2.23.0 | 1 
            live555-2020.06.25 | 1 
                 opencv3-3.4.9 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4016581368b5016ad11f9be355ec96590cd5b093 |     
  riscv64    |         clamav-0.102.4         | NOK | http://autobuild.buildroot.net/results/e41132a7e5ba0be09ac6a633b6cc8fc4dab71e90 |     
  mips64el   |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/be29ef74748d821ab8335be922cffcc3a0d61c6f |     
  mips64el   |   dovecot-pigeonhole-0.5.11    | NOK | http://autobuild.buildroot.net/results/7c1b5ff5391c2532abe5ea5a1c4a36a2b323e622 |     
    arm      |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/84992e5646a68c2f76474a43739d344b8e64f123 |     
    arm      |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/074652c57164b11f5a8ae233901e880f782c07b4 | ORPH
  aarch64    |  host-python3-requests-2.23.0  | NOK | http://autobuild.buildroot.net/results/157b642eef199d120bded3a1890d9d4b1f2bdebf |     
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/9d2c165ab191295c448fbfc69319d89b3a9314d9 |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d70ca3bbe47b79fee15be1133ac9daeebb71a2f2 |     
powerpc64le  |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/6d2b99a2772025116d7f8a4e5d6424103b71bcf8 |     
    or1k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/d2cf15249b55f945fc9d6001d1fc7d8a575093e7 | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/2d8c7a1b5e981c3e42fed5a4a21815d38800600d |     
   xtensa    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/cfc3b094c72d72ac8f440dbeb54eed1a437c483b |     
powerpc64le  |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a9fceb86e609b038ffdd0a6bd4b4e43542a0a42e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/d11b1a83d4495b54d46f0cbb2d8426602cb4a648 |     


Gitlab CI results for 2020-08-23
================================

Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  DISTRO  | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.8_RC1      |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200528     | 20200717     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r41   |     
                      argparse |  DISTRO  | https://release-monitoring.org/project/07317 | 0.7.0-1      | 0.7.1        |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.10.0      | 17.6.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.37.90      |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.37.90      |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_02_20... | 1.0.0-pre... |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.2       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/21396 | 1.2.0        | 1.2.1        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.65         | 1.68         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.5.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.5.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.20      | 9.17.4       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.33.1       | 2.35         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.6.4        | 3.7.1        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.1       |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.73.0       | 1.74.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.0-alpha1 |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.14.0       | 2.15.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.7          | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.7.5        | 0.8.0        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.10       | 3.7.11       | ORPH
                        cgilua |  DISTRO  | https://release-monitoring.org/project/58440 | 5.2.1-1      | 6.0.2-0      |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.15.1       | 0.15.2       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.1          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.2.3        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 3.5          | 3.5.1        | ORPH
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.18.2       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11       | 0.5.11.1     | ORPH
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.6        | 1.6.0        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.18      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 4.11.1       | ORPH
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/00444 | 2.81         | 2.82         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.11     | 19.03.13-... |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.27.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.13       | 1.4.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.11     | 19.03.13-... |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.10.1     | 2.3.11.3     |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.8.19       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.13.1       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.1        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.180        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.4       |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 2.2.8        | 2.2.9        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0.3       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.17       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.5        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.8        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.25       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.10       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.37       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.22       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.37       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.8        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.20       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.43       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.9        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.7        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.8        |     
                       ethtool |  DISTRO  | https://release-monitoring.org/project/00763 | 5.7          | 5.8          |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.22         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.3        | 2.1.4        |     
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 7.0.2        | 7.0.3        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.14.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                    freeswitch |  DISTRO  | https://release-monitoring.org/project/21436 | 1.10.3       | 1.10.5       |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.07.04     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.8.1        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.12      | 2.40.0       | ORPH
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.6.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.28.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.64.3       | 2.65.90      | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.1.0      | 3.8.2.0      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.14      | 1.15         |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.20         | 3.21         |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.0        | 0.2.2        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 5.4.0        | 5.5.0        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.31.0       | 1.31.1       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 3.37.2       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.2       | 1.17.90      | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.2       | 1.17.90      | ORPH
              gst1-plugins-bad |  DISTRO  | https://release-monitoring.org/project/21849 | 1.16.2       | 1.17.90      |     
             gst1-plugins-base |  DISTRO  | https://release-monitoring.org/project/21850 | 1.16.2       | 1.17.90      |     
             gst1-plugins-good |  DISTRO  | https://release-monitoring.org/project/21852 | 1.16.2       | 1.17.90      |     
             gst1-plugins-ugly |  DISTRO  | https://release-monitoring.org/project/15187 | 1.16.2       | 1.17.90      |     
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.16.2       | 1.17.90      |     
              gst1-rtsp-server |  DISTRO  | https://release-monitoring.org/project/21853 | 1.16.2       | 1.17.90      | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.6.1       | 0.7.1        |     
                    gst1-vaapi |  DISTRO  | https://release-monitoring.org/project/21855 | 1.16.2       | 1.17.90      |     
                    gstreamer1 |  DISTRO  | https://release-monitoring.org/project/01263 | 1.16.2       | 1.17.90      |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.7.90       |     
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.2.3        | 1.2.4        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.45.90      | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.2.0        | 2.2.2        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.6.4        | 2.7.1        | ORPH
                      hiawatha |  DISTRO  | https://release-monitoring.org/project/13375 | 10.10        | 10.11        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                       hiredis |  DISTRO  | https://release-monitoring.org/project/01318 | 0.14.1       | 1.0.0        |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.6       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.335        | 0.338        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1637         |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.11         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                igd2-for-linux |  DISTRO  | https://release-monitoring.org/project/21356 | 1.2          | 2.0          |     
                 ima-evm-utils |  DISTRO  | https://release-monitoring.org/project/19247 | 1.3          | 1.3.1        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-28    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.7.0        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.2.4       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.2.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.2.1       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.490        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.8.1        | 3.9          |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.7.0        | 5.8.0        |     
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.4        | 1.8.5        | ORPH
                       iputils |  DISTRO  | https://release-monitoring.org/project/01395 | 20190709     | 20200821     |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.6.0        | 1.7.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.3       | 0.10.4       |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.3          | 1.4          |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.4        | 2.0.5        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.14         | 0.15         |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.8.0        | 3.9.1        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.3.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.1.5        |     
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.3        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.73         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-04-R3   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.8-Leia    | 19.0a1-Ma... |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 3.0.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 3.0.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 3.0.1-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 3.0.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.1.1-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a1-Ma... |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 6.0.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 7.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 6.0.6-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 5.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 6.0.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 7.1.1-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 6.3.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 6.0.1-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.19-Leia | 7.0.5-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.21-Leia  | 6.0.5-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 6.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 5.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 6.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 7.0.0-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 6.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 6.1.1-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 5.0.2-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.19-Leia | 19.4.1-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.2-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.2-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.2-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.2.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.3-Leia   | 2.4.2-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.2-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.2-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.2.3-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a1-Ma... |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.1-Leia   | 3.4.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.3.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.1.0-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.2.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.2.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 562          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                          lftp |  DISTRO  | https://release-monitoring.org/project/01555 | 4.9.1        | 4.9.2        |     
                       libaacs |  DISTRO  | https://release-monitoring.org/project/05562 | 0.10.0       | 0.11.0       |     
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20200225     | 20200225.2   |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.43         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.7        | 6.0.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libcurl |  DISTRO  | https://release-monitoring.org/project/00381 | 7.71.1       | 7.72.0       |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.1        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.9        | 1.0.10       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.4        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.37.0       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.64.4       | 2.65.2       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.38         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.13.1       | 1.14.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.25       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.35         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libidn |  DISTRO  | https://release-monitoring.org/project/01639 | 1.35         | 1.36         |     
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.21         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.16.0       | 1.16.1       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.41         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                   libmatroska |  DISTRO  | https://release-monitoring.org/project/01657 | 1.6.0        | 1.6.2        |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.4.2        | 1.4.3        |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.0.7        | 4.0.10       |     
                       libnspr |  DISTRO  | https://release-monitoring.org/project/07953 | 4.27         | 4.28         |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.55         | 3.56         |     
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2020.3       | 2020.5       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200718  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.1.0        | 2.2.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.1.2        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.14      | 1.26.4       |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.19.5       | 0.20.0       |     
                      libressl |  DISTRO  | https://release-monitoring.org/project/12102 | 3.1.3        | 3.1.4        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.49.4       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.5.0        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.1          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.1          | 20200710     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.71.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.7        | 1.2.9        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.14.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.14.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.38.0       | 1.38.1       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.10.0       |     
                        libvpx |  DISTRO  | https://release-monitoring.org/project/11083 | 1.8.2        | 1.9.0        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.20       | 4.1.0-rc2    |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.6.0        | 1.7.1        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.176      | 1.0.184      |     
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.20.2       | 2.21         | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.5.0-alpha  | ORPH
                      linuxptp |  DISTRO  | https://release-monitoring.org/project/21114 | 2.0          | 3.0          |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2020.06.25   | 2020.08.19   | ORPH
                       log4cxx |  DISTRO  | https://release-monitoring.org/project/15330 | 0.10.0       | 0.11.0       |     
                     logrotate |  DISTRO  | https://release-monitoring.org/project/10567 | 3.16.0       | 3.17.0       |     
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.1        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.2       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.1       | 2.12.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.0        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 4.0.3        | 4.0.4        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.23      | 10.5.5       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.24       | 4.8.25       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 168          | 170          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.6        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.5       | 20.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.5       | 20.2.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.2.0        | 5.3.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.2.0        | 5.3.0        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59b          | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.07      | 2020.08      |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.14.2       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.8        | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.27.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.10.0.104   |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 1.6.10       | 1.6.12       |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.1.0        | 1.2.0        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.24      | 0.21.25      |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.2        | 2.5.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.0.2        | 4.1.0        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.3       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.11       | 1.8.12       |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.14.4       | 1.14.6       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.9.3        | 5.1          | ORPH
                          nasm |  DISTRO  | https://release-monitoring.org/project/02048 | 2.14.02      | 2.15.04      | ORPH
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.38         | 0.39         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200822 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.0       | 1.24.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                     netopeer2 |  DISTRO  | https://release-monitoring.org/project/114978 | 1.1.34       | 1.1.39       |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.9          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.27.1-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.19.2       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.0       | 1.10.1       |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.18.0      | 14.8.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.138      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.12         |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.8       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.10       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.29       |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.50       | 2.4.51       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.5rc2     | ORPH
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.11.0       |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.5       |     
                    opkg-utils |  DISTRO  | https://release-monitoring.org/project/59396 | 0.4.2        | 0.4.3        |     
                      oprofile |  DISTRO  | https://release-monitoring.org/project/02570 | 1.3.0        | 1.4.0        |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.9.0        | 3.10.0       |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.9.0        | 3.10.0       |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.9.0        | 3.10.0       |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.9.0        | 3.10.0       |     
                      opusfile |  DISTRO  | https://release-monitoring.org/project/10353 | 0.11         | 0.12         | ORPH
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.21       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.5.0-alpha  | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.21      | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/21375 | 1.3.4        | 1.3.5        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.46.1       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.11         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202007       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.33.1       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
       perl-http-entity-parser |  DISTRO  | https://release-monitoring.org/project/13850 | 0.23         | 0.24         |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.46         | 6.47         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200708   | 1.20200824   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.57         | 8.58         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.25         | 1.26         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
  perl-posix-strftime-compiler |  DISTRO  | https://release-monitoring.org/project/11891 | 0.42         | 0.44         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010001     | 1.010004     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0205       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.2.0b1      | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 77           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.10       |     
                          pixz |  DISTRO  | https://release-monitoring.org/project/07490 | 1.0.6        | 1.0.7        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.1          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.116        | 0.117        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 20.08.0      |     
                          popt |  DISTRO  | https://release-monitoring.org/project/03689 | 1.16         | 1.18         | ORPH
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 12.3         | 12.4         |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.7        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.13         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7a       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.0.1        | 7.1.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.4       | 4.0.0-rc2    |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 2.2.4        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b3        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
              python-aiozipkin |  DISTRO  | https://release-monitoring.org/project/56569 | 0.6.0        | 0.7.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.16.0       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.10       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.3.0        | 1.4.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.3.0       | 20.1.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.7.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.7        | 3.2.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.1        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.3        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.6.20    |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.0.1        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.5b7      |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.4.4        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.1.0        | 4.2.1        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.8.1       |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.50.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.7        | 3.1b1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.3.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.2        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.3        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.2       |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.1.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.4        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.6.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 20.0.1       |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.9          | 2.10         |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.1        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.17.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.17.0       | 0.17.2       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.3.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.98         | 0.99         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.5.1        | 4.5.2        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.3.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a4      |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.4          | 2.5          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.19.1       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.7.0        | 0.8.0        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.6        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.4       | 4.0.0-rc2    |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.6.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev10  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.5          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.4.0rc1     |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 0.10.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.0       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.13       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.57.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.7.14    |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.8.6     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/04764 | 2.4.3        | 2.4.4rc2     |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.1       | 2.10.2       |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.14.4       | 0.16.5       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 49.6.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.12.14      | 1.13.1       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.0       | 3.17.2       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.3        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.19       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.3        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.1.3        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.48.2       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.3        | 5.0.0b1      |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.7.4.1      | 3.7.4.3      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 3.1.0        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.1        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.3       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.61         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.3.3        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20200430.1   | 20200711.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.28.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.5        | 3.9.0        |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.5b7      |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
             python3-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
            python3-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.7.14    |     
              python3-requests |  DISTRO  | https://release-monitoring.org/project/04004 | 2.23.0       | 2.24.0       |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 49.6.0       |     
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.3.2        | 8.0.0        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.32.0-rc1   |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9.1        |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.7        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 6.0.5        | 6.0.6        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20200229   | 2.20200818   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.1          | 20200710     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.4.0        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.10.1       | 6.11.4       |     
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-beta3 |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.1.3        | 3.2.3        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2004.0     | 8.2006.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.10       | 2.7.1        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc10   | 1.0.0-rc92   |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.39.2       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.4      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.10      | 4.13.0rc2    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.31       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.0.1        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16.1     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/20628 | 0.8.4        | 0.8.5        |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.12         | 5.0.4        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.0        | 2.4.1        |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 1.20         | 1.21c        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.5       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.7          | 5.8          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.11.17      | 0.11.18      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.9.0        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.13.0       | 1.14.0       | ORPH
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.31       | 1.9.2        | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.1        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 6.0.0-beta1  |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.0       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.4.66       | 1.4.70       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.4.0       | ORPH
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.96         | 2.97         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.8.0        | 1.8.1        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.3          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.2          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.2        | 2.3.3        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.2        | 4.3.0-rc1    | ORPH
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 3.0.0-rc1    | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.1        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2020.04      | 2020.07      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                       uhubctl |  DISTRO  | https://release-monitoring.org/project/17364 | 2.1.0        | 2.2.0        |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.3        | 5.9.4        | ORPH
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.35.2       | 2.36         | ORPH
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.49.91      | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.4.1        | 2.4.4        |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.1517     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.11       | 3.0.11.1     |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.61.90      | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 2.6.11       | 2.6.12       |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.28.4       | 2.29.91      |     
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 8.0.0        | 8.0.92       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20200623 | 1.0.20200729 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20200513 | 1.0.20200820 |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.5        | 3.2.6        | ORPH
                       wolfssl |  DISTRO  | https://release-monitoring.org/project/21631 | 4.4.0-stable | 4.5.0-stable |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.6.1        | 1.7.1        |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.28.4       | 2.29.90      |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.16       | 1.4.17       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/15059 | 1.0.3        | 1.0.4        |     
      xfont_font-misc-ethiopic |  DISTRO  | https://release-monitoring.org/project/17195 | 1.0.3        | 1.0.4        |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.7.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 358          | 359          | ORPH
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.4        | 0.8.0        | ORPH
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     
Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                          bind | CVE-2019-6470    | https://security-tracker.debian.org/tracker/CVE-2019-6470   
                           boa | CVE-2009-4496    | https://security-tracker.debian.org/tracker/CVE-2009-4496   
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                       dovecot | CVE-2020-12100   | https://security-tracker.debian.org/tracker/CVE-2020-12100  
                       dovecot | CVE-2020-12673   | https://security-tracker.debian.org/tracker/CVE-2020-12673  
                       dovecot | CVE-2020-12674   | https://security-tracker.debian.org/tracker/CVE-2020-12674  
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                   ghostscript | CVE-2020-15900   | https://security-tracker.debian.org/tracker/CVE-2020-15900  
                   ghostscript | CVE-2020-16287   | https://security-tracker.debian.org/tracker/CVE-2020-16287  
                   ghostscript | CVE-2020-16288   | https://security-tracker.debian.org/tracker/CVE-2020-16288  
                   ghostscript | CVE-2020-16289   | https://security-tracker.debian.org/tracker/CVE-2020-16289  
                   ghostscript | CVE-2020-16290   | https://security-tracker.debian.org/tracker/CVE-2020-16290  
                   ghostscript | CVE-2020-16291   | https://security-tracker.debian.org/tracker/CVE-2020-16291  
                   ghostscript | CVE-2020-16292   | https://security-tracker.debian.org/tracker/CVE-2020-16292  
                   ghostscript | CVE-2020-16293   | https://security-tracker.debian.org/tracker/CVE-2020-16293  
                   ghostscript | CVE-2020-16294   | https://security-tracker.debian.org/tracker/CVE-2020-16294  
                   ghostscript | CVE-2020-16295   | https://security-tracker.debian.org/tracker/CVE-2020-16295  
                   ghostscript | CVE-2020-16296   | https://security-tracker.debian.org/tracker/CVE-2020-16296  
                   ghostscript | CVE-2020-16297   | https://security-tracker.debian.org/tracker/CVE-2020-16297  
                   ghostscript | CVE-2020-16298   | https://security-tracker.debian.org/tracker/CVE-2020-16298  
                   ghostscript | CVE-2020-16299   | https://security-tracker.debian.org/tracker/CVE-2020-16299  
                   ghostscript | CVE-2020-16300   | https://security-tracker.debian.org/tracker/CVE-2020-16300  
                   ghostscript | CVE-2020-16301   | https://security-tracker.debian.org/tracker/CVE-2020-16301  
                   ghostscript | CVE-2020-16302   | https://security-tracker.debian.org/tracker/CVE-2020-16302  
                   ghostscript | CVE-2020-16303   | https://security-tracker.debian.org/tracker/CVE-2020-16303  
                   ghostscript | CVE-2020-16304   | https://security-tracker.debian.org/tracker/CVE-2020-16304  
                   ghostscript | CVE-2020-16305   | https://security-tracker.debian.org/tracker/CVE-2020-16305  
                   ghostscript | CVE-2020-16306   | https://security-tracker.debian.org/tracker/CVE-2020-16306  
                   ghostscript | CVE-2020-16307   | https://security-tracker.debian.org/tracker/CVE-2020-16307  
                   ghostscript | CVE-2020-16308   | https://security-tracker.debian.org/tracker/CVE-2020-16308  
                   ghostscript | CVE-2020-16309   | https://security-tracker.debian.org/tracker/CVE-2020-16309  
                   ghostscript | CVE-2020-16310   | https://security-tracker.debian.org/tracker/CVE-2020-16310  
                   ghostscript | CVE-2020-17538   | https://security-tracker.debian.org/tracker/CVE-2020-17538  
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                      ipmitool | CVE-2020-5208    | https://security-tracker.debian.org/tracker/CVE-2020-5208   
                        jquery | CVE-2015-9251    | https://security-tracker.debian.org/tracker/CVE-2015-9251   
                        jquery | CVE-2019-11358   | https://security-tracker.debian.org/tracker/CVE-2019-11358  
                        jquery | CVE-2020-11022   | https://security-tracker.debian.org/tracker/CVE-2020-11022  
                        jquery | CVE-2020-11023   | https://security-tracker.debian.org/tracker/CVE-2020-11023  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                       librsvg | CVE-2018-1000041 | https://security-tracker.debian.org/tracker/CVE-2018-1000041
                       librsvg | CVE-2019-20446   | https://security-tracker.debian.org/tracker/CVE-2019-20446  
                        libssh | CVE-2020-16135   | https://security-tracker.debian.org/tracker/CVE-2020-16135  
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                         matio | CVE-2019-20019   | https://security-tracker.debian.org/tracker/CVE-2019-20019  
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       ncurses | CVE-2018-19211   | https://security-tracker.debian.org/tracker/CVE-2018-19211  
                       ncurses | CVE-2018-19217   | https://security-tracker.debian.org/tracker/CVE-2018-19217  
                       ncurses | CVE-2019-17594   | https://security-tracker.debian.org/tracker/CVE-2019-17594  
                       ncurses | CVE-2019-17595   | https://security-tracker.debian.org/tracker/CVE-2019-17595  
                        opencv | CVE-2019-14491   | https://security-tracker.debian.org/tracker/CVE-2019-14491  
                        opencv | CVE-2019-14492   | https://security-tracker.debian.org/tracker/CVE-2019-14492  
                        opencv | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                        opencv | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       privoxy | CVE-2019-3699    | https://security-tracker.debian.org/tracker/CVE-2019-3699   
                     tinyhttpd | CVE-2002-1819    | https://security-tracker.debian.org/tracker/CVE-2002-1819   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                  vorbis-tools | CVE-2017-11331   | https://security-tracker.debian.org/tracker/CVE-2017-11331  
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

-- 
http://autobuild.buildroot.net
