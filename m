From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-10
Message-ID: <20150711063017.1FC6C100F99@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-10
===============================

        success : 261
       failures : 93 
       timeouts : 0  
          TOTAL : 354

Classification of failures by reason
====================================

                  ffmpeg-2.6.2 | 8 
               upmpdcli-0.11.0 | 6 
               libglib2-2.42.2 | 6 
                libtirpc-0.3.1 | 4 
               openswan-2.6.43 | 4 
                  zeromq-4.0.5 | 4 
                 empty-0.6.19b | 3 
                 libepoxy-v1.2 | 3 
               btrfs-progs-4.1 | 3 
                busybox-1.23.2 | 3 
               libsigsegv-2.10 | 3 
                  boost-1.58.0 | 2 
                 setools-3.3.8 | 2 
libsigrok-fe473123ba836445d... | 2 
                  acpid-2.0.22 | 2 
                 libpfm4-4.3.0 | 2 
                  opencv-3.0.0 | 2 
                  libnl-3.2.26 | 2 
                   audit-2.4.1 | 2 
                  aespipe-2.4c | 2 
                  c-icap-0.3.5 | 2 
                 gnuplot-4.6.6 | 1 
                   eudev-3.1.2 | 1 
                  libv4l-1.6.3 | 1 
                  bcusdk-0.0.5 | 1 
                     vlc-2.2.1 | 1 
                      atf-0.21 | 1 
                 mpg123-1.22.2 | 1 
                    ustr-1.0.4 | 1 
                    qemu-2.3.0 | 1 
                   bdwgc-7.4.2 | 1 
      binutils-arc-2015.06-rc1 | 1 
           host-heimdal-1.6rc2 | 1 
                     apr-1.5.1 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                libgsasl-1.8.0 | 1 
             lttng-tools-2.6.0 | 1 
               arptables-0.0.4 | 1 
                 netsnmp-5.7.3 | 1 
                 cdrkit-1.1.11 | 1 
             util-linux-2.26.2 | 1 
                  cppcms-1.0.4 | 1 
            host-nodejs-0.12.6 | 1 
             libxmlrpc-1.25.30 | 1 
               libupnpp-0.11.0 | 1 
make: *** [core-dependencie... | 1 
           aircrack-ng-1.2-rc1 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/fa6b28c581015869b037471c85ab3b42583f0e01/
      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/64b15a79abcc741e09d62f3a79ef0ab2865e76b2/
    mips64el |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/47535cc6faf98c929beb2320a77b31b45240daaa/
    mips64el |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/71d64c896063f60014a63be44d6ecd2d3f9621fc/
         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/b82b639c1f3e6b6850080480b03399662fdf7377/
    mips64el |                      apr-1.5.1 | NOK | http://autobuild.buildroot.net/results/45f267d2ef5c32c4d2a64c9aaedd188bdd68ef0b/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/a68e1d4a3209ae3631000cf3956f7904bff9c782/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/36082c6c4ffa1157b6e07a8be48e92d1408b9201/
      x86_64 |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/9ac48fb1685e2b2a8c54d4a0ad690a02b91cc6e8/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/b759923ad7e00a63f19ff7a4f76d29ad725e60b7/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/a7720b9db0345a5388d67ab279d51f849cb25c7b/
      x86_64 |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/8403a6f4bf941a5e5af4b9ebd416e228d111f7a8/
         arc |       binutils-arc-2015.06-rc1 | NOK | http://autobuild.buildroot.net/results/b44215efbd8a5c4e39f38e3c2b42f6f1a9f64ec6/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/ed6edd29eca4b30bff540c88657d462e483eebe8/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/24f35688494af31291e1ad43d28718980c6f369d/
         arc |                btrfs-progs-4.1 | NOK | http://autobuild.buildroot.net/results/b33cd8fd8f65a17001e2b2d3e57f5eeed0c8b210/
         arc |                btrfs-progs-4.1 | NOK | http://autobuild.buildroot.net/results/405dffcc403ffd8921969e9d4ca74ca96e28bc4e/
         arc |                btrfs-progs-4.1 | NOK | http://autobuild.buildroot.net/results/f4a4ec71853f8837147f8fc1b496f179dac0f2bf/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/ee0c79de425b07e1d33761ae746b8741d70947b2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a93d66f8bbb332655d07d1c92edc7b1aa140e67f/
    mips64el |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e17d0782e4c69daf124ae0569c6a0e9583e03c7e/
        bfin |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/7f88550b1bcfe7229f2981ffb6475cf882df2c0c/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/3765ed49b568196ac93893890e4398a1c065d096/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/9aef64ebcf242ca7296a6d698cc6272bee0a2a9e/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/ee83534e97b2e1e91d0eebcc7ef8ec7db482b4ea/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/25900cd99a09ba26f981b1a2d2dffc9963881a35/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/7ed49aec44c163913abf207950c68754f50c3b1e/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/7a86abcaef2a303c372cc6f871fee3d4bfa632b4/
         arc |                    eudev-3.1.2 | NOK | http://autobuild.buildroot.net/results/afb3cf0e7530b11236c5d45f84ccf08b36013090/
       nios2 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/866ce86a9248ec9ecb8cdc47f2a26653e76e7ed2/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/23310d569932feb572d3635cf9b0c499a9b39768/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/e682d195677d8b828d3fca58143022a41bef8976/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/e62f11d0972f35b2a16429747d16c888d9b8d6b9/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/44e44eace93c278c1ee90ae7a86b79e1b815ca71/
       nios2 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/693b02c6f089737fd23e9f7c679cd7cfa0119175/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/6a132757303b1eefad6cd657b4b7b6e66adcd330/
         sh4 |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/7ac070ba6936b45088efe2296ba41c822f9d0d99/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/8ead5015a7f491a892f8b2840e21d1b1acb05feb/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/758fca844b173065dfa38ee4965d0c69a4a7c79a/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/337bb68ca205a3109b3cbf628d0526d5ae004307/
        i686 |             host-nodejs-0.12.6 | NOK | http://autobuild.buildroot.net/results/1ae9cce77e8ae161ed8bb4bb618cd294ba47008d/
        sh4a |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/1879814c84821b5b44c4dbd13547092101d19ab9/
        i686 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/cd24e4403466fa660cbba438b4def2e42a10c47e/
         arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/7c08ec7008a3cf9bcc9e86878c3b88d4ea38cb4a/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/3c3b19053a70a4f49cb7a421ab21fee0f8a85a85/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/2297a8257b6cd4fe3235396f23df6d9e328d9df4/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/5d25ac2344ba5d39cbbdace5dac4e4b2ea9e14f9/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/8262249bf3b6c395c636b9b66ec50fdd9b2bfb3f/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/46b8902eb9794efd0809ebf46c099c5dcdd3496f/
       sparc |                libglib2-2.42.2 | NOK | http://autobuild.buildroot.net/results/a7e207baaf2cae25beea848d0387984e722da9ab/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/9d21bd706892ef2c71dd76eb6544dcaf180db159/
    mips64el |                   libnl-3.2.26 | NOK | http://autobuild.buildroot.net/results/bc496928745fc0e6ed58486ca4da986f0e3a181d/
    mips64el |                   libnl-3.2.26 | NOK | http://autobuild.buildroot.net/results/1f5326e2dcf24e55df9e3052f0b404d2ea2376da/
         arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/38859bd4c9029757a7bd64d89fb0fc9ee718b7aa/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/85f77283db29bd9e2038c1fdc5330ace9d12323c/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/f4d0562bcd03137cd40a8e84e7072446c7afa442/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/ca19996cc771a535f377d1256a96bf0b6e3c3d60/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b00330d4c190a45d97a49478313a863583d7a3ec/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/74e78d9e9a870afef6a9a13647538ecfdb9972c6/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/8213aef106b5e423f9d287eda0b10a97cac4790d/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/c4e07092c8210a10201be16190ea16a5ac6641d0/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/6e7b244fb4a314e66a738af61a6ddfa9d02a940a/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/9479633cf19bd35f3e87acccb885258baba612d0/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/5cfa678edbe252b07f4e0ca2e9c5f083c1e15a8f/
      xtensa |                libupnpp-0.11.0 | NOK | http://autobuild.buildroot.net/results/5b379d1cbdf20729315cf64dbb08e23b5d4d85c1/
         arm |                   libv4l-1.6.3 | NOK | http://autobuild.buildroot.net/results/0423132222f8a8030f703bb8d755f3e9a4ee73d8/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/ef67aa1b7fba6c8f312000dbd29dcac43d065753/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/dfc3750b3ed096a854ccefe66985ac6aac3d4372/
     powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/0c32656d7b6547654b282cb29e3ce93602ab8403/
         sh4 |                  mpg123-1.22.2 | NOK | http://autobuild.buildroot.net/results/259995111dd0420c5c250c7dc41faabab8d19fee/
      xtensa |                  netsnmp-5.7.3 | NOK | http://autobuild.buildroot.net/results/4b7f3c15a4f4c4f4457e78767f5526c044d6dc1d/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/d48435234bf0825b2df1393b661f5e2b2cb8671c/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/de3353a6f35718d77ea0f2159d3ce2f72a28628a/
        sh4a |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/5eef4cd1ca9bea8fcf9b0a8f9f2f792193eb567d/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/921d1e67402ca6d47f0f548807b44407e7d0a458/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/22c1ae0bb06b6413f1c8bcbecba0d451027c603c/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/e08f30fe9779a782cb592826471cc6dd9b5454cd/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/4909dda563c554c9182d5a84c9347b885f3db43b/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/7258f55d44950ae3b8ca5402ef6876da4723f85c/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/052e04b2174e31c62865a1277a1d8045e6e0776f/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/9ff6cba46eed76f7064b5113ee7565829d3f9a44/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/b458a33ef13ffd40409718653ea51d019ccd8ce6/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/909d36be274abc6bc1d252624adb39f6762cbe20/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/721be23f6b759f929a54619805b822515fae4de8/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/8c4ee2271de9b770acf2e8766552b88f0ff1967b/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/4be0670f95681364e6aa8b2a6e3acf57af63bee6/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/72d19e17c4ece883d5542871642e970981488b71/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/fd2dee68eeb167130f46e8a66f09213737fb620d/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/286d9ad43895e1c2d1705766c01bd3567ff9ccc0/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/61275d63868dfddd506575a26d508b8d22562e15/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/b49c9af10ec99e415099b9d319deaa9ee3b8ea1c/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/3b620fb39075f53181d503baac94b3dbf10019ad/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/d9dd83887dba74655159d3fd048e98dadf52cccc/


-- 
http://autobuild.buildroot.net
