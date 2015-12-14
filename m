From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-13
Message-ID: <20151214073021.60ABE102E21@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-13
===============================

        success : 234
       failures : 104
       timeouts : 1  
          TOTAL : 339

Classification of failures by reason
====================================

             clamav-legal-info | 11
                  boost-1.59.0 | 9 
                 libass-0.13.0 | 8 
                 libeet-1.7.10 | 8 
               arptables-0.0.4 | 5 
                  gnutls-3.4.7 | 3 
                  ffmpeg-2.8.3 | 3 
               wireshark-2.0.0 | 3 
        ltp-testsuite-20150903 | 3 
                 opencv3-3.0.0 | 3 
                   libnss-3.21 | 2 
                  libnspr-4.11 | 2 
                 openal-1.17.0 | 2 
                harfbuzz-1.1.2 | 2 
                moarvm-2015.10 | 2 
f2fs-tools-fd32210229d4ad7d... | 2 
                   erlang-17.5 | 2 
                 mesa3d-11.0.6 | 2 
              xmlstarlet-1.5.0 | 1 
                libvips-7.42.2 | 1 
                  connman-1.30 | 1 
freerdp-17834af7bb378f85a3b... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                xfsprogs-4.3.0 | 1 
                    faifa-v0.1 | 1 
            netsniff-ng-v0.5.9 | 1 
                 liburcu-0.8.7 | 1 
             bluez5_utils-5.27 | 1 
                   systemd-228 | 1 
                  trinity-v1.6 | 1 
               libsodium-1.0.3 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   mpd-0.19.11 | 1 
                    ustr-1.0.4 | 1 
            shairport-sync-2.6 | 1 
               iptraf-ng-1.1.4 | 1 
                directfb-1.7.7 | 1 
               read-edid-3.0.2 | 1 
                  xl2tp-v1.3.6 | 1 
                   lite-0.8.10 | 1 
 toolchain-external-legal-info | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                collectd-5.5.0 | 1 
             stress-ng-0.04.16 | 1 
                   mplayer-1.2 | 1 
               dvbsnoop-1.4.50 | 1 
                   glog-v0.3.4 | 1 
                     vlc-2.2.1 | 1 
                rtorrent-0.9.6 | 1 
                elfutils-0.161 | 1 
            mesa3d-demos-8.3.0 | 1 

Detail of failures
===================

      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/ff5ec405e353027b4ecf0f2f22ca05bee399174d/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/b96419b793491303a44c23c967668a4b6b07b04f/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/10dac8b3571c24322381c070cd4d6bf3a1877817/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/41269ae31180f9477283065e7681f460b88b361b/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/9fced85213c84f6bbf88013dd476968fbd21dfe8/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/5941badb051b58c3717960c640dc032d89f9ef23/
        i686 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/431c498a83c8821977b7cad9d12821f0e64490dc/
microblazeel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/a7bf85775abe3ab6fac11e3081ef483c38d49987/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/b7f3247116f789485ce9200a73913511a01bd778/
      xtensa |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/010d225147c750faee72c42292d82db14558f82b/
         arm |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/d487a1098d8b20f402fbb361ef50f8f91260a168/
     powerpc |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ea7e633d114ad309387e0cbefbbd27b0c05043bd/
         sh4 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/89141a2b5b09fdcee9f96c2acd727323637ad692/
      mipsel |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/6581756492596ad762997e85a5f323ef1be4952f/
      x86_64 |                   boost-1.59.0 | NOK | http://autobuild.buildroot.net/results/ddefa2440eecd1b318e5e4bddd438de4437308ae/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/f370f0c09e60293671727d7d30423da04daaf354/
      xtensa |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/84002ca506b4d5589f8dc4ae1c99834424060834/
     powerpc |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/22f4b4e918f82fba456bfee88ed4115a319be87d/
      x86_64 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/0798d63d8625ced9d4039248826bd74796bcd20d/
        sh4a |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/a1ea77b9f6124f0331900f19d5cfde9af8ba6a0b/
    mips64el |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/3a12aea6a7a3500883a6d0184da3bd8cebf50e7b/
      xtensa |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/4363c12a19e8473b540f54c59e3e5c73195659f2/
     aarch64 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/b43e4cc5143bf08417c96dcc21f915278f25b99b/
     powerpc |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/8beedcfdbab356a5ba113cd14d72feb9cfbd94e0/
        i686 |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/547983cc9ee0ab5f4583908489b675c83e461ee1/
    mips64el |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/15d4b7776a27a4227e1f7afb4cb38e23bc433328/
         arm |              clamav-legal-info | NOK | http://autobuild.buildroot.net/results/dd778afdc1d9509f7d1fb37bf5fa27ce50c53a84/
       nios2 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/70a3489cd249f680a802035348a7a986ad0bccb2/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/bc68b397176afcd77438f4c762ad9a45fccb9710/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/1cccf7c2885cd60872c1718b7b48c51f30014b98/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/f2083fc352f0c5be027c4a7d584f1678f97353dc/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/4f4513088074b3a163d9de7e671509571cfd4d96/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/04286e19bd42c18cf685076110d4f0dee971bb1c/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cc5a2260e48f854d7a679e65cd909de30623b5be/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/6b59bb2bb61bf0e2b81506876fe16078676b3e46/
         arm | f2fs-tools-fd32210229d4ad7d... | NOK | http://autobuild.buildroot.net/results/fcf36f7e8c8888af8da7696d15909f85380fd610/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/77ea10e76435238315db3c1bc34299294c28076e/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/3201cd65cb4d69235d41f9e2b852869cd7e54557/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/675ad9b8d2253142ddfbd67123eeb88152285c52/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/6d49fe19737936996349a0f3a9a0073cf86beaf1/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/293905b73f4cce9621d3e648efc47f9d395e0a80/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/66d19b70e7796270fa5f4df35e673fee1c98227f/
        bfin |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/e7d5b55444cdf76a4c7267a264b4870403e0cce0/
      xtensa |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/932d5b40fa1ce0a4574b17eccbc14fd06ad7d074/
     powerpc |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/d8604fe448bb11395e8443726d09b041eb34c6d5/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/41ba6e78076e3421547a4d479339d4bbce2bd8ec/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/417fb98238d5d359eb57a17c472db9a8adb0b413/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0603280d5c08870e7e5e53b66241b40e08ade499/
         arc |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/bf422c19ee81c7cddc877407b98da9993cdb01ae/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/9d3204bd70e5189c419bac51ceaee39c1fa583f4/
    mips64el |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/dcf4b73034d226871f32d1c898a91e45f5a73b36/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/d9fe7a2ce1a965088ff2f344a3600e922452d3a1/
        bfin |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/13ec9f1c7b93db2987e4fb5e52899c5c32002e45/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/923e8688ab6a294b51fa146cd2ed23db20fe7341/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/ae3be6cfc681a1d6ff4afa0ae47171c1b73d1263/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/51d1ec7a6c4aa187467df261dbe29956b572c8c6/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/f07279724c5aae38559ddb6ff8464a56ff669b3a/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/78b6f28c1541d8052a7623073eafa4e1b3ef9921/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/f95f67a8bd7e31ec885ef52a16586cdc3a90622c/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/8cf0a89c173f3f407ebb2ab1730a7a96aca73608/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/fda28fc7db46dcf80bfe0c7a6914e154ee33fe9d/
     powerpc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/8e40c979e300a6a0fe71e1062c28f61091f92684/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9c65822f0f12d907c5285e7659b0d53ee353e49c/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/84efd5bdcf2555d7340701b1bf0dcd6e421e7b58/
     sparc64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/13888d8d6677e61ab4c34e5badadea39a3a51645/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/6a99c8464efc405ce88e3a8bbad1db07bd62b7e0/
         arm |                   libnspr-4.11 | NOK | http://autobuild.buildroot.net/results/5505a5b6ae6bcde684a44eede1dc471b4b994b51/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/ce9ee6dc37769af734f0cfff4a2921a74ad7e3a6/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/defbd1ebf2d51edba06b5a92eb29571289e2d78e/
       sparc |                libsodium-1.0.3 | TIM | http://autobuild.buildroot.net/results/7db366ea518d4a78c90a57ad8ac434f46cb5fb24/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/0a90d7c8f523b90b8a4ca6312ab4835547590fb2/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/1569b8a51b2c57af8e4d28d1c18bee2d2208a76c/
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/660eb9290eabf6ed54a99c4f37c3d23f375f13a6/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/1b580a3f7b5a6a671f328ec242cd5e18b867fb89/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3a84f5814add02325706e221425086c0cb2bfd6f/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3e6feb1133d6bceff0b53352b808390b768d7f98/
       sparc |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/3bd6680c5ee6ee16fef55c5f42d015ac552747c6/
microblazeel |                  mesa3d-11.0.6 | NOK | http://autobuild.buildroot.net/results/e6c58e6f3fd75afb5115747ed3709620007fe03b/
     powerpc |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/b3ed3ee174a3ddce84bf64039eac39d4e6e75b71/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/784b315d37b30572dea503089bcb3924c07e28ad/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/d26afe0f99c7a4e38b8da27f38baa7e2a698b6dd/
       sparc |                    mpd-0.19.11 | NOK | http://autobuild.buildroot.net/results/c397710f023dfaff35af698b9071f9467311020c/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/fc02e01514965e13ee1de8f520a5b45f63a1103e/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/55d581c18ad6d67d2f6a2cbc6c83acd44719a3e6/
     powerpc |                  openal-1.17.0 | NOK | http://autobuild.buildroot.net/results/3b8dadb1fcb71dae3daf500df95e270c2f86ec3b/
      x86_64 |                  openal-1.17.0 | NOK | http://autobuild.buildroot.net/results/c1a06e08d70d467996e80e15699de353e583e092/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/4d92bec3026b93cd58a05d8aa8776ba7249206d4/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/5ecbbedf3005123d303c85d3f4471c499c4e15eb/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/c686dfec865aa0d9e5dd38985e08e1bd77037f8d/
         arm |                read-edid-3.0.2 | NOK | http://autobuild.buildroot.net/results/8c11e463b68121fe0331acf9f8a42a1d3fef40c7/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/7e7f2afb94df1fc1d8324299877a61c79d308832/
         arm |             shairport-sync-2.6 | NOK | http://autobuild.buildroot.net/results/0e7f7cdec4f20d0c85e39644ba2e702bf9dd2a81/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/f6d7eb26543ff44710ffbb439206a90b877433a5/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/ad580c00139897cf00dbdb2a7c98064bf295864e/
        mips |  toolchain-external-legal-info | NOK | http://autobuild.buildroot.net/results/28c76715c4fbb3df809f45551f5b8294e8a80ae4/
        mips |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/12f3144b5d99aa1872f6073f3aaac7f8a9c5cfdc/
        bfin |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/b4c1ca8f5e293bacaaf90bc24c2547153de07c81/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/6b79428041187e1183b3623a4eca81c6385af664/
     powerpc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/2ba198334c9d6b2b6d09df7aeb579007dd253c70/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/7e363d18866057df0db3d0d95fa8d9116728f6ce/
      xtensa |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/4744d1bbf95f09bde00fde3192bbbae8cb265c4e/
         arm |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/9f399bc57501b75bfb288ac8c07e5e09184b7cdf/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/c0ea1194c921eb4c846812b24985a86d09f25534/
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/78daf927aa43591401a072230b582591add1204c/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/df3f5fa770833c8c4344ee0bc67f45aa578ce542/


-- 
http://autobuild.buildroot.net
