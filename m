From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-27
Message-ID: <20151228073020.E594210155E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-27
===============================

        success : 183
       failures : 140
       timeouts : 0  
          TOTAL : 323

Classification of failures by reason
====================================

                  boost-1.60.0 | 23
               tpm-tools-1.3.8 | 21
                  libffi-3.2.1 | 10
             host-boost-1.60.0 | 7 
host-vboot-utils-bbdd62f9b0... | 6 
canfestival-7740ac6fdedc23e... | 5 
                    ustr-1.0.4 | 5 
             host-nodejs-5.3.0 | 4 
              rabbitmq-c-0.7.1 | 4 
             lttng-tools-2.7.0 | 3 
                   mplayer-1.2 | 3 
                   libnss-3.21 | 3 
                   erlang-17.5 | 2 
                   attr-2.4.47 | 2 
                  connman-1.30 | 2 
               libcap-ng-0.7.4 | 2 
                 lvm2-2.02.138 | 2 
                 fio-fio-2.1.4 | 2 
                rtorrent-0.9.6 | 2 
               dvbsnoop-1.4.50 | 2 
              gst1-libav-1.6.2 | 2 
                pinentry-0.9.4 | 1 
                   nginx-1.8.0 | 1 
                      x265-1.8 | 1 
                   luvi-v2.5.1 | 1 
                 bind-9.9.8-P2 | 1 
                   kexec-2.0.9 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 openal-1.17.1 | 1 
zbar-854a5d97059e395807091a... | 1 
libubox-e88d816d6e462180f03... | 1 
              libsoil-20080707 | 1 
                  snmppp-3.3.5 | 1 
                   glog-v0.3.4 | 1 
                 gtkmm3-3.14.0 | 1 
                  prboom-2.5.0 | 1 
                 dropwatch-1.4 | 1 
  toolchain-external-undefined | 1 
freerdp-17834af7bb378f85a3b... | 1 
                harfbuzz-1.1.2 | 1 
kodi-pvr-mediaportal-tvserv... | 1 
                   mpd-0.19.12 | 1 
                      gzip-1.6 | 1 
       openpgm-release-5-2-122 | 1 
                  ffmpeg-2.8.4 | 1 
                   open2300-12 | 1 
                     apr-1.5.1 | 1 
                 igmpproxy-0.1 | 1 
                 libdrm-2.4.65 | 1 

Detail of failures
===================

     powerpc |                      apr-1.5.1 | NOK | http://autobuild.buildroot.net/results/76039f63c02f0396e92a901ed13d60d3fcdcf43b/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d034964bc878512b9973e97c8a0bd3e2be9c8ca7/
     powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/7ac96e19504a1cb83c5e6fbe6050144bb87a8e1b/
         arm |                  bind-9.9.8-P2 | NOK | http://autobuild.buildroot.net/results/ca8d4473e3bce2d15d996b02248ff42a0e467ff4/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e470e029fe25f811b6896f33ffd3aea8e4abcdc1/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6aa8c296e211cd706380c1cd71104e3240d43b35/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/02e4988a45671c50208c6282585ba1f1c3fb2e1a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/976f682fedbed6626ccc70ad7e5653e77b7a89fd/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3bfe7f87784c8abda98e08552475244b85e7bbba/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/64bdca3560e9d360ee2c1c9042c3f07970629387/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/58e7eb0cf85e01ba71ea7893f040f840e7a23c87/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/003aeed10ce77375abef0fadfb9455b287b2fe9b/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c3fec772d1a91af47e35f409a4e6c8b22cc4066c/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/acfd1b3db1f644d0ecae186d80a752a29ef5c37d/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fc06307bda439bed5209fdaddb288b0327827a55/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/82457a33509104331a84054adcdde4a8c05de04b/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ac16e089671f29b4a1629a595a0e64c1ffa265be/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d6f4551dfed851832511a4586bfa29a1b9c4ea31/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5c0930d2973ed019fc2cad4692d71793287cac2f/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f66defd6484d79aa65d2844d86108090ae5f4d2a/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5933b261b49dee892296e04b27d782e824479431/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3c6bdb437c0801966044f046bd46a6376a514ec4/
        bfin |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/42ba609c11e6f0232e624b6580753d733f1c4311/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6dfb1ae77f0d56dcbd208c1afe92f7cadc9eadd8/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/31d4559aaf04a45476362de706c7310c9ca8f9f7/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/577a692a2797d1bc86f560011b025516fb60948d/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/197a993ecd6e6e3ed152ed9fc5a5643767e5eb6e/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9d6c8089ddf9dda70dd960c7748649aa93c063c4/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/277ca5f2cfa4a458d1a4203f7b7ec9cc933b7919/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d92bf3e3c9939a16a8d82ea871f78bde786c8a10/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/70dd005301fe28da94d79a98b45539c3008b638b/
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f5825f566f086fee37a106567a692e756fe64303/
     powerpc |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/cb55c60afdadecc44d56e018d02405b2af1ed18c/
         arm |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/8ffc2a116634236e9e1bb8c07c40f6f9d5681bbc/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/59770aa4f06227af2d5f4608b6a9295fcde7a204/
     powerpc |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/8b1330f1396c7feb53d3c8281975cfa67ebe56e3/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/0219a2219980c0bf4f88123553d1b9638908c972/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9c1129d05a02bce1611de58d7bccaf077e1c77c4/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/38a63baa04138a2589b106d69baff8559df6a058/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/008da0021545b89939de511396f0689db4ec0e1b/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/841a4b632a0ba52afaddc6f967cd93b5baf9ced9/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/7b0c78fccaad565b0dc6859b1e6cc72f1da06a58/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/1e7a5950a3b78760095d7024ffd9a25cea825a1a/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/ac4d3ad4ac7de4315999fcaff95d61d89fddce61/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/90f4d38761954273a95348b48c4886338944923b/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/507bc967b4a6db23e9b0b5314e8ef9b06dfc4bbb/
    mips64el |               gst1-libav-1.6.2 | NOK | http://autobuild.buildroot.net/results/f2f506aff7df37d11d9276a58d093c812d5e0761/
       nios2 |                  gtkmm3-3.14.0 | NOK | http://autobuild.buildroot.net/results/f4d71947ded9f8f6a4c642c23332041e0b61c284/
      x86_64 |                       gzip-1.6 | NOK | http://autobuild.buildroot.net/results/56d926fcf8ca53cddb9106617e3b852d9c9a4eeb/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/8c735b07557b0b35a313e5a6bfb969d5d4b9b562/
         arc |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8353a80ae937cbf20e27a85a5a5895522be79eaf/
        bfin |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/378e2c7b4cfa8092728ab10d3bf3144dfbde32cd/
        i686 |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1a43b3f2b60d098284565251516632fe632cc49a/
         arm |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2419b267a1521aede36c0841978a1a4aacaf10a1/
    mips64el |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ed86261fabbf5d75d0803c8557ecb9c6abf93e19/
      xtensa |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/938d76633f3c9b6f86df4a9ba7353ff850a94361/
        sh4a |              host-boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0bec5a47d9a4eee0a406cef556773c41ee3ecaa7/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/684872181597872d1ce60b3fb47d2fb2abf7b822/
      mipsel |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/31fe58e341580bcaf51302ee8d47d198518497ca/
        i686 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/94263cf4e5edab9756ec7a31f9aa1f95d0893c3e/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/9503d9f82485bc2915ce846da9e726aed420acff/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/3f2249e8f583b860f7eb22eab617d1f5ed4eed84/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/eb3889af5b37a2084efc544948b9b489566b053d/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/d0504db9413c782ad7fb577cc3a6f4397c7996bb/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ee18202cb6d7751178617e6a3d0bc97e65318aa9/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/85a5f72dc4e7af821240e081591abde88b94da0f/
        sh4a | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/08844f1f52373bb5673d379154362f91b2bb8b02/
     powerpc |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/552a9d3e71935e8db4eba2f036ddfada01b8e5ea/
     powerpc |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/05dadbe79437cff1963df51d97ec0a34b4c7f260/
         arm | kodi-pvr-mediaportal-tvserv... | NOK | http://autobuild.buildroot.net/results/63edc869b780e387a8e94334bbe52ffa1c2a5f85/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c4ea6bbcab17957ff8d53253c64483ebea24ca30/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ce897a064cf01794d844a7de4d8f22e50e3f1cc6/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/98c6c1fa138c1e12de5f3ad5c70aa8b391fcdceb/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/224e6cbcdf24f92251ec1cb2a70a1167c38095f2/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/95257f3b5f225563d95194d07a19bcc0bc542b33/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4a7fbc59564978cdd1b34b96085a4c8a16512b00/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b3e91594e09a06aa445b59af878d1117f92cc86f/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6d0fe875c9e06edc6f2438803cf29bf830399359/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c2e2e038c48fc972b6278748a2fe508c4fe4420b/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ac0f5bea3f5d27bb48e6ed5ae2bead9da097b068/
     powerpc |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/55a28836c86108030db38fdccd78100d36f48806/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3bb0bdca8b01c5454bac35b159bfc671339c8bd5/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/382fbd348c1e7dabab16812e7ac0f43d824e4a14/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/50c84e43efeb6030e1731baae0ca44b81956bccf/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/b4a0c0970ce4df16152e4f760b5fd863b3a7c815/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/d62ea7dbe68188d073b4f176e6a354e95a8bab97/
    mips64el |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/51de116fea94a812254afa41d8479bf10cb6ea03/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/f8be0d3e41c087ac66d4744b37dddd056cd84326/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5e42bd5734ff9313e1329d6ed89eb0d4b4a5479a/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/463bba4e802fd6304ebd0251492581b591725745/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/1b56644b4abee5c3e25553fd065d845ccf72acf1/
      mipsel |                    luvi-v2.5.1 | NOK | http://autobuild.buildroot.net/results/a644d0f1eb44028cec25537be47bf30766918119/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/cefdd5bbac7e9c65d10cb832d9bded49cdb9a6f4/
     powerpc |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/c8d3ed89e1f04f6251fda01ddf30f69fa33e573d/
       sparc |                    mpd-0.19.12 | NOK | http://autobuild.buildroot.net/results/22205e3aa9650dbcebb10110d8dba805859ed43f/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/75205b3486a7a8d461243a6a0cb2a62fc7a15d01/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/51093a815436e84538bedf790619cef994f0ebdc/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9a601876f53c8595df25985659cd2f182bb40e97/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/efd8ebd2601d7a1f32bbbb1bb0ec64111c945cfb/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/87db2aec467df411714ca3f824df5049e1d45fb6/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/08d3c3536b3becdd296d4e91dd4eb28434066bb1/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/9bafd7a35447d1f8e1606f4139dc95d37ba1ed68/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/c2c6185cfbd9a0c91266c9e8a5f4221afb14930f/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/5be752012ba10dd663c14dce8cba2d347f126fd8/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/bfd4abf50ff0844912ad9662663fa6be953eb867/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/d533ec1927dcd26ac92d99f0d02783fd0a27c293/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/b6da4203a227559df9ea9b61d649e82a303fc142/
        bfin |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/503557aff4bb798427de1f8b122d6ba185af359e/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/3146fac69414bb75d7643ed2715c6069cc7a2ec8/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/1ea73683c14fde960b3599f43e77ca64bc37aaa2/
     powerpc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/c382e4c14bc7ca20ac31a223f95f3d1d14ad0aea/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0ce8a98c24d2a15dc9f17bde4ca09af246fa9eba/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/0cacb24ada1d32d572d7518e324efe1948cd8a65/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/12de8235cd08526562e1b15283ad744552076c9c/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d9f6c1ac158bef7fb0ddf331e0f18b79f03b3966/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/56020558ec298ac4007bf7f6ce030b3f2fa1157d/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/13bc047a6a90362b398205d30f32fd5eb3225631/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/c8c7dd82d7c6d8aa66aa7a8c8042b94f91c19807/
         sh4 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/af1c953e401e3c7f5f9fa1156682dfa1255413ca/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/6be3dd14179bf3e6b552f218a5f23f359d3088df/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a94ee93a9b51ff55b9d57c4edff028b81300149d/
     aarch64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/dfe9436460f1628f4d2e201aacc8e2bbb86ef499/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ab7f0d47238ddd73e26ee1b83d6c16c483810afb/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/fcc269358e3c80006d685642185b8abe8c47edf8/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/7710f25cb3790366a16524f7567c4e86c883e589/
        i686 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/ee3c2acf67cfb524fc96c89b91d8db5eb816e3ff/
      x86_64 |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/543ad1cbed990b31e4098236fb4b3eeb51a18610/
      mipsel |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/a3ccb86f7005c10ab2ea15ab502e7b6e09402973/
      xtensa |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/48714240cb5dab8ea6a6236bf9460ab474f4d47f/
     powerpc |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/8d16dbb054efce20c6493da937385e62c2c00947/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/65edebf4dd28bebb2e5f9b4e2ab65f12875ff968/
    mips64el |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/d55e5ffd06f23271313eb86bd8b1bcafb3d1df3a/
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/20b00c62f11412f0f7cb0cab72cc68d471252e81/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/c8828fdc92f99206399cf1700e42ef3cef6b4985/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0ce24da4b1571698f22f9f671f4b619bad33d3b0/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/453da797fd0459d179bd8e358de3acfffbe9ee61/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/ab8500c1da1cffef6b155f149de1c8f691396772/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/734975f6ac041e8aece07205c0b8966fe51e7df1/
       sparc |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/ba080190031ca9ed3f83419dd63fba71d4135d56/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/5538c5b56b2740759253abace7b260e87695c7b4/


-- 
http://autobuild.buildroot.net
