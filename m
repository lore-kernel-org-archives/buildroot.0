From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-23
Message-ID: <20150724063019.850E2101B7D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-23
===============================

        success : 215
       failures : 142
       timeouts : 1  
          TOTAL : 358

Classification of failures by reason
====================================

                  fan-ctrl-1.3 | 27
               libpthsem-2.0.8 | 18
                  ffmpeg-2.7.1 | 10
        host-gcc-initial-4.9.3 | 7 
               libglib2-2.44.1 | 5 
                busybox-1.23.2 | 5 
          c-icap-modules-0.3.2 | 4 
                 qt5base-5.5.0 | 4 
                      icu-55.1 | 3 
                  zeromq-4.0.5 | 3 
             libselinux-2.1.13 | 3 
                  guile-2.0.11 | 3 
          usb_modeswitch-2.2.5 | 2 
               kodi-14.2-Helix | 2 
                libtirpc-0.3.1 | 2 
                   audit-2.4.3 | 2 
libatomic_ops-libatomic_ops... | 2 
                      atf-0.21 | 2 
               openipmi-2.0.21 | 2 
                  opencv-3.0.0 | 1 
                 libpfm4-4.3.0 | 1 
             btrfs-progs-4.1.2 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
                  snmppp-3.3.5 | 1 
           dmraid-1.0.0.rc16-3 | 1 
                 libebml-1.3.1 | 1 
                  mono-4.0.2.5 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                  bonnie-1.03e | 1 
         network-manager-1.0.4 | 1 
               audiofile-0.3.6 | 1 
                   bdwgc-7.4.2 | 1 
                    bwm-ng-0.6 | 1 
               libgtk3-3.14.13 | 1 
       host-erlang-rebar-2.5.1 | 1 
                 cdrkit-1.1.11 | 1 
                libmbim-1.12.2 | 1 
             armadillo-5.100.2 | 1 
             util-linux-2.26.2 | 1 
                  mysql-5.1.73 | 1 
               libsigsegv-2.10 | 1 
             bluez_utils-4.101 | 1 
               linux-pam-1.1.8 | 1 
                 libical-1.0.1 | 1 
                   ushare-1.1a | 1 
               dvdrw-tools-7.1 | 1 
                 lrzsz-0.12.20 | 1 
make: *** [qt5websockets-le... | 1 
                    ustr-1.0.4 | 1 
                 webkit-1.11.5 | 1 
                   eudev-3.1.2 | 1 
                    libiio-0.5 | 1 
libsigrok-fe473123ba836445d... | 1 
               openldap-2.4.41 | 1 
            c-periphery-v1.0.3 | 1 
             expect-2014-05-02 | 1 

Detail of failures
===================

         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/527e4a3827b90fb83959b67b2828d959b907ef03/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/7ba976b0aea364b307b86142a04ff62d7932b915/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/9ed1a46f09667ae7c2d5cb634795a2390c53f57b/
         arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/cc191d946679b75b8d52d8c8779e61b98be83dd6/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/bb05704f93c178e0b4dc4e52135e8b4bb3df0f7f/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/36968a2b65a8cf8d2247b038eb02ea613814ab73/
      x86_64 |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/a64a74b7075cc0125797f608a9ae6413f2e06cab/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4d3c5fd1c303e522a4d0485bd48dbc3840dbac41/
         arc |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/02f67a699460f28f961d3cb91765c57dae0f7c4c/
         arc |              btrfs-progs-4.1.2 | NOK | http://autobuild.buildroot.net/results/d5ec89b1f3867813c5b685f851de5b60c1df197d/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/bbb3f55147ab1fd3e1b9d3df11c5beb79f5a0598/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7f7753187da2db6888b17a2b7832603c70b04c2f/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/02e9321b54d41b4b5c91d93c9942499a20d26919/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/de37774bc67486493755c020acbdccd80d5c8246/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a9bbb17f802ba2286bd83886618e53df8a466b96/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/59cd97cfb40bb58a5bc7c58375753e7c36d414f1/
microblazeel |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/da8e0b885d54763dee7a17a71a9ede9cef0435aa/
      x86_64 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/6cbf9a4cacdca56badf9e04eaa10da27f417934d/
     powerpc |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/69e1c9fcc18f73d9eca34d06444a2d7e40feb5d8/
         arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/b05141a6d450c94669c6a0a5a0f5b799c2c248f2/
      x86_64 |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/064cd8b7c71dace410366afa9af62fd5e9af164c/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/ea4db9a35b206149e73063de9cbb8804aa014171/
       nios2 |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/01ab35e6271fbce6210d1d34feacc128ad8b3055/
         arc |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/1002174a918c670bed1bb3de330ecc458f85de57/
         arc |                    eudev-3.1.2 | NOK | http://autobuild.buildroot.net/results/3556be55cdec1b68451efc547ff4225d5c3a423a/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/caf4288fa4affcf1b7bbc2ec782b3263f9d838ce/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/781b8e7834ef07a44fc48578d38a7df1943b2af8/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/7618507d974a1e1449739ed310869afdf632b042/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/756241dec65b209ae8913a98467e7ba6b4ecb194/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/239d7f9cd82480786da1af65f7d3f427e1ea87b4/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/734decb0559eb311f9f1338242f729bf7823319e/
         sh4 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/fecf34acf32eb5c5d4250b3ba30de5b9c690a18c/
         sh4 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/00d8508697120b0234dd1aec7129d18e6087fe7f/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/f79765c158dbecf5c0ef1c043065699f8fe9c9e1/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/874d9b525fa203878dfb5ce7ec9fc3c437b9ad62/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/c1c86e7d7a1140cedd55ef7ae5e4777e846959bc/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ab98429990d29263539276aaf0e5577959a3de3c/
         sh4 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/c8730dcb666e2bce0238580951aa4e78df7bb713/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/8ce7fac618578ec26105d9744cf9dc5ccb558e99/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5d8525a31272cb5dcf944fa40ff20d1ef30a2281/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0a20f7d51eb63a7cbc38d07b4b99731dfe80ba0b/
        sh4a |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ae0d3bd35d648dc964e530ee109adc20acd38cfd/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a1cd8fdc8cefec7a2cd9764cfa3f824366adf81b/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/61b57910bce870005b1226e89e7483ba402b45c7/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/946d41704a118d705f80f176bbda60e9d2cb19f9/
       nios2 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/220500dc5df446844512a1a4917933de253ae974/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a84132f4b74bb3fdabcc593a52ed18200361c84d/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d895070b8e4bd6fe401ce4226256ba360c113912/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/189d9451b97f093a7f3db0f0cedfad5ce15af500/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/b996d06023fff1aca41f079b2c346ac534fd35c4/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/c1efebb0fddf82d336b4d8d65cfa7f6fbfef16df/
      mipsel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ab7897456c8513d2d508fd5698551975dccf3f93/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/e8f2fc571cb1f2605e02feca454a02bf6970dc53/
         arm |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/17099f508d824028caf921eca9e178b9eec3796d/
      mipsel |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/861e6372de0e1ab16a2bf0a7f13ed7e541220eda/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/d8bee580d7ab01e2f4ae0fbd61217995e2711654/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/17db25bc19fcc9a4e1d192827862d0b9ff5ddfff/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/4346fa3b38fe7598e855a890db8bcbedfeefd11e/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/22aeb63a4aa3760fd8166269bd0236478a5ed8a6/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/c3f84e959e59a65e4811dede848d4ba4070eaf30/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/e3210071b3420a98f3f9f2b95657c0f2f5dce8f1/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/8755bd4aaa5ff4b5bb9e48dc26fd95d6173352c6/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/05056a96623439e5ef8c5870dc925b8f7074cbd2/
         arc | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/ce70ba2097038a0b8f085ad572a86e8ca807cd8b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a4dc6fa75f63a89606dbdcf4217db7129769c96d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ca8c3d7c3c5c535bd75872c3675766cb34e8befc/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d031529f10024c33f76354dbc28b72d18ebe547c/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/d8cd67455c6d6b1170706d40af474ac1544319ff/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/121cbeb7782b91d16df10db1060b3b5887836031/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/5d8d46bf2f7a367697fff01f3ba1588672f8cb48/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/54952f9ccb7085a8d23361d63f93e7b31e12371f/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/9ad95148b99144a417efd20cecfb6f4edb5eeaa1/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/8cd323b590ea99a9195f0aebfa75c1ddbafd3c38/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/3fc177945581f356286026e0699af56bdbd7515e/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/123bf0f920670fa4e32ac9c6aaf8798bf11b770a/
         arc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/0421d4292c90978e8c9a2138352b3484b96c087d/
         arc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/6cd07b5aa6a2e761fbae634116e37caf10d3eb8b/
         arc |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/c36345e80b588d79bfa3bbd629ea2b129e21ac1d/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/ee5e53ed9e2bbebab64122dd422d5da6abca3095/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/3d8314392c61d6d278fb900a028e3bfc4d1d4d2c/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/3a833f2f1c1c882277e102aad73c7cd5962a5e4c/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/fcd21e2c0fc5c5f254ed448d2c019a8d77b0d4b1/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/efa14bd45e6186826aa7ad1c1ea9a344bb454d0e/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/2cb4133109afd16e067b2bba4a70bc4cefd0facf/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/332dfc6e261aa246f49004c0612282b17d33ae45/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/fdc70d8e131ffa4eb0c7d3c2da8d809a9be11632/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/91e54a0e77f525a74212be40a120c33b493718ff/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/a5fb5c05362e5bb4215e9cdc4f2ea1e47e715877/
     powerpc |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/21e7434faf155109cc60c74cff55164fb3f26eb6/
         arc |                  libical-1.0.1 | NOK | http://autobuild.buildroot.net/results/2522fcb0032ddbe9b608e6b043492c232bdd177b/
         arm |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/86adb968659fec56684ba80e1c4230230fd7a1c8/
     aarch64 |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/dfb8d23d4f1baa744c0171916ef3d16387b6e31b/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/99d1117c6b9c5e9c281d567babc6d0fb636701d8/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/74fc23b281e809da4f5edabc9164f15fc5b6b9db/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/c6df5811c8f0c99dcafb66343014a6df7dd130c2/
      mipsel |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/52c0ae3b94b02a8f6f91a293cd17e4401e821368/
    mips64el |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/b334ddba489e9e07d5abe62143b9371556ed4aef/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/06be7419de9ecf645e94ecf5f02c08d60b305ce5/
        sh4a |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/6d7d49de63e345d4b1cbf722b2da83dfa61c5615/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/858d00867c491a5780a3c2f5b0530f358566dc4d/
         sh4 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/f9f98caa8574ca35d91ff2448e14ee96c06b49c4/
      mipsel |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/29a7939927cea3a884f6714f632f480ff40fad01/
      x86_64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/8bdbd55083aa92beb09e593336b243f66a3acf95/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/96a08ac223e4c9bc73b0e42041b35d34dca7cf15/
         sh4 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/30c8fd3723a6ccf0fff48b1b4fbd8f8db0973c2b/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/b097fc1fe807326a73d133900712ab38a9e211c5/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/f6ae4505ce8ecf5081f30faeb26458dee9bbdbf0/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/a1ceaee068e3c2aa3f39f804628931c5498ceaed/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/4d88577929da4144a836d4bd02879d0450e856d3/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/fd96abb93ccfda56e4d8727e5acdc2d2092d78fb/
        sh4a |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/3c6a671b4274a30d536c4424dc0c1b2762198cb8/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/ea394478c109b6b8365a25d92a41a2466025181d/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/ec2dfbf73b888a985e2007ca65083024f6aea135/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/758e211e2f73927b4f1385614abeefed9bfbee73/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/c5ea8b4cd2832d25678eaa2fca90dd0361e299d1/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9889f12fd2c2a3288b10c3be6dbcd2ff03e47e4c/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/158f31268cc04aa6df7c21c32e155aac44a3b7b8/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/7b96aaf4684ac04bb684a38b5623c8015f23a39c/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/4725d713ccdb0b6ea700f6298ce1e5ba8234a557/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/652cf6b47afbf553bab53c18cd3bc3b88dab5075/
         arm | make: *** [qt5websockets-le... | NOK | http://autobuild.buildroot.net/results/6c80ba0669a7fc8cc60baaa849044fd65a78ce87/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/1c3ab66cb50da3e800c8370bb9765c74bf62661a/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/49689659905dabc206437f6fe272263dc3eb4245/
     aarch64 |          network-manager-1.0.4 | NOK | http://autobuild.buildroot.net/results/b859161566bbbdc8cf9841c7f82b2720cddcd4b3/
         sh4 |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/45aac8ef6dd3fa32539c3895d0dfed9e48a60dbb/
     powerpc |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/0052251ce3e9074db47e2e5830005b43cb9bc33b/
      x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/2b0eb7149c7bdd8ebd72c1070aeefb210379a889/
         arm |                openldap-2.4.41 | NOK | http://autobuild.buildroot.net/results/cddb30d5c3264135ae33747846c69b2ea289e811/
     powerpc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/2577aa56f912e38c32756f67a40f7db8f8da9e8b/
        i686 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/16e4d44e6caec46456b6c4dd2dd33faa7bf3d572/
         arc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/9eae8846739a6cd25179974a0a6d3af1398228bd/
        i686 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/d6a3f35e9ddebae7af9bb6942d543487e0063518/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/dc359a92ca93999a3e07fe8ee590bba432a17939/
         arm | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/5bb90af1fd82390ae7b2710e7b363dc980d8a3f6/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/79af6379c9907d68e3d4707a3915c669dbdaf40d/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/2c3d0dabf9c7b29f48f589a6b0224d3c8ee23724/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/6d0498ab1f2e5b4694892fa98cdd0dfe7b594dda/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/d89f89f13e4631718e74a9f14eb03fc5ebc6bb1b/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/b7c35e5cb1acc56038a29c312cf475a103c64ccb/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/98787d0aa537dd7a8d17ff5481c873b6347b150e/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/883b772fd9b19d7788e14d7828ac217f1c895aa7/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/5bce4d902d3e37f811ef08014cd7bee460bc6c63/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ff1b7245b07296e4e8485ce91109bf1669e0b90c/


-- 
http://autobuild.buildroot.net
