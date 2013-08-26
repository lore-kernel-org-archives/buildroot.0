From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Aug 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-25
Message-ID: <20130826063004.E01B252C605@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-25
===============================

        success : 0  
       failures : 165
       timeouts : 0  
          TOTAL : 165

Classification of failures by reason
====================================

make: *** [target-finalize]... | 115
               libglib2-2.36.3 | 4 
                     m4-1.4.16 | 4 
                 dropwatch-1.4 | 3 
              strongswan-5.0.4 | 3 
                  tstools-1_11 | 2 
                      icu-51.2 | 2 
                      qt-4.8.5 | 2 
                   cups-1.3.11 | 2 
                  libv4l-0.8.9 | 1 
                   mplayer-1.1 | 1 
                elfutils-0.155 | 1 
                   dbus-1.4.26 | 1 
                busybox-1.21.1 | 1 
                  libusb-1.0.9 | 1 
           imagemagick-6.8.6-2 | 1 
                oprofile-0.9.8 | 1 
                      bash-4.2 | 1 
                 ffmpeg-0.8.12 | 1 
             tvheadend-5956233 | 1 
                 qt5base-5.0.2 | 1 
                       kmod-14 | 1 
                libroxml-2.2.2 | 1 
                protobuf-2.4.1 | 1 
                libtirpc-0.2.2 | 1 
             uclibc-0.9.33-arc | 1 
               w_scan-20130331 | 1 
                 binutils-2.21 | 1 
                   ncftp-3.2.5 | 1 
                  dhcpcd-5.6.7 | 1 
                  bcusdk-0.0.5 | 1 
               alsa-lib-1.0.26 | 1 
                  poco-1.4.6p1 | 1 
                  ne10-88c18f0 | 1 
                 libebml-1.2.2 | 1 
                valgrind-3.8.1 | 1 
              vim-699f8d8f096d | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a354c620eb3acb5c42da46b8ea5dac8d9b3e2e85/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/258fb71b3fea6678178c5c5fc88ee55c031e8b3a/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/a68584ad0f9b5f16f81c548eb5492dd4e1ff163e/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/f4f3e126c5f7a5b0f2a935865b5d860108c65689/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/b309edb6cd6a41aecbf1263013a00e156e0261a9/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/f857edcd44296671bc334f8a7228cb2548a00436/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/3cb046b9e58fddb8211c3bce9029a478c91a9589/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/858c1e4f9cf296587ec25706e1549a094de96337/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/a069fa8737957ad05789ce975fc736cf3abc8967/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/e597dd1263602eb7aa4bce20a2409921486dcf22/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/231f72e0211f9cdde50d9a91cc3423c8d0d61001/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/5a09dbad65ec66d0955157bd48301af3bb0a1250/
microblaze |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/019f5c6cc606357e3afcfdd24650dd4c5e65583f/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/d526b72bedfa345155361418aac81dff8234eb7b/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2e7db0c38571dc64bf854764fb3801581c8ed2b3/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d9b9cd1dc14945441a98a6835107df82706b7979/
      i686 |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/ca9d22c3b2a01dbf64b942b5376753db241a9c8c/
    xtensa |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/6d11bc8b83cc490e68f0e202b797ea23a2e1c217/
      bfin |                  libebml-1.2.2 | NOK | http://autobuild.buildroot.net/results/7402ae1f5c0b88a045d4f98427eee402d3c05bb6/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/16a357435c52e1fd420bc59eaf31630733b41672/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a13f07827e9b98cc664dcfa1079b0b2354c7ca44/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c31c05eadcb416703f9fe81adf005d551a20882e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2abc865b97748ec20b48120c65db0e1845483f3b/
       arm |                 libroxml-2.2.2 | NOK | http://autobuild.buildroot.net/results/f4731314381644d21cd262bfc6850ae8d516ab8b/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8a9230f3bf2b1c566c1d8f242d88011de4c7d857/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/b6795ff182d8c5b272c5d26f129d33dd383c873b/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/0ee90f52a7ade755886a36e49d007fa6d283a157/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/a3d992c957c086d7a2bb50d1711e3b15050c1c41/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/7782077b464956be09d20a876fbd94105b9c73bd/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/14b13b3a2b9f95420c9bdf1c88ea4352a2ce0566/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/addb2021778ac816db1d96221b93461541c8681a/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/966964b948cef0360823d4fa3b56cdf6691bdb3e/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/252ab370b146565183f906c700f0c1d31505aea9/
       arc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4d1988557dea90dbf1a67047b5119a21e8751f8a/
  mips64el | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/9c16fcae64574718b49f7f9a36f43b935f1003d6/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/3473d885fdb2d098ef43bf41b9356ac47fd4a3ce/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/c03a6ec283ae52e1f4637b6aa381f024c2a44118/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/6f5eb48f70f41f2f8bc660d076d378074e749f65/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/f8dd2c3a6ab8c2e810b6542639daeb18d24fdf23/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/d688fe7fd017f773d97260178dd9a90a97eec76d/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a186a065126cfd4b648d1a755f9761771845391f/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a1eb28c3a4e9af182c42d7fd08385336a27b834e/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4778227621d46e77456ee6478e03c122f1dcafe3/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/287af301514c5e71ac097709bcb4725a887bae35/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/bbea35cbe3fd5678d36359973446519a58ffac09/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/67f46ccba1e4dbb7368f9333482fc42753da18a3/
      sh4a | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/085fff95e560ca7a3ebcccc4c0f21ca175bb53e6/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/9c9a85c9af574bde7f345c0879a4f7e7667fbbf6/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/11f154145c1b43fd5676ac9b685c3c0dc9ef1274/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a6654ca59106787a8cd9c3c4f85cb0c1b6c2d4e3/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/b2c643e5c5e90268cc8557da70d36951a78193ad/
     avr32 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/b9d07d7db72e3f2b6989ed6699caa6407f5e916e/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/e24fd93c823129a8e06c44e420bc27a8b3d06004/
     avr32 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4424519e36b52f843cec56e50fedd498f5ba6a5c/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/3be8399c130f421c26cbdd66e1f60f415f0b17e7/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/5a392c0243f507795fe3f9a85d4d8a73b62bd29a/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a82246d22b5277c99edebd77de6f58be0777a30d/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/9319fb6d60f3e5f83025b7786501316205190019/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/91906abfe7012a55d542ff6fe4ce30dca629fe69/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/12af43f67148ab0374f2442c14fa86c313869d83/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/bea6b1c76c56ad179302764bca2e832dae09a1af/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/af27b4f44385fd4718b2f19e46a4a9abbb0f4a3d/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ab864be8fc2866af2e8ca78c54a62990ce9a2e85/
  mips64el | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/cb6f1dd3cb2bda36a1697669fdb69a816bfd540a/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/f4970d7cad2a635dd1e4413a8f4427e649765fa3/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4ef5e7f3848e2411741c9f3034f1c46cf51da664/
    mipsel | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/400f495e9a80760899e63994a784cc4c865f2ad7/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/c768b5ccfbce57e8ba66cfe5160f85bb92929ae9/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/2e948d8e4b6170ee650cc45dbec54d8c6501106e/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/32f9482fc20407bc948a8736b56a5dc364671aa0/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/f4c0e1121e1184bd0165588d395043527f4eb5c8/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/3e84f3a6e5a69fff725d301d4ceaae86e26c40ea/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/2973d629b070368bc7820324f47a6ecf1441d4b3/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/695a6f4a0de95e5434477ce5a8f40a9d413df4ef/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a10a355e35aa719b691d432b7f5eea308c7975df/
       sh4 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/30483605e86169fe15c6474c58ac93dd6f2220bc/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ec69284ef5950980ca32fce84105c7330b5a81f1/
      mips | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/427d924dfe0b2b45d9151eaa4c6deaa80922870f/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/fe876e85a4664c29eed6aa0894bd06e48cc717d1/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/e1b0d0c912cebeadf818c2e2c21939915e1efc8f/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/edef9b4ea3e4d169258b78991f413ad8bfb947c2/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/0ce41ff3556728e49eeeb7e038d383d14ed265be/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/8368185ceee1a729a9cd715281b53af0f469f599/
    mipsel | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ee196cbef13a2f991ba915981f50dc6d6655a220/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ee542fb5f50347b873b10a6f185cb22a1bb97076/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/80e7109a461478d5c4bc382054f6a37ccbcab64d/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/b1f534680e40cade3cd9d36f8d99b5f8ef7f88d3/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a7e30753a87dd30c08c8848a572172cef767be9c/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/8bb8f9c412759b818bea8c377acec4692c2eceb2/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/f9678b456172a33be2a9b64e7e73569a6c29768a/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/fdf8593d051fb32180bd25500663af7cc99c0ec8/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/36ca20723c7173f4283f22071c47e5166df0fe71/
      sh4a | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/5de0abd5a4cac4d9939bdbb52fdffff923ae0279/
    mipsel | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/b9019dc4b79a3eb876c47d3a6c5f3025c7544493/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/797598b5750a0d2cd9c9e69b28fdaba98e191bff/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/115f9b961a75d77208016c7d6df0163037cbdd30/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/bfd6de6e0cd47440396a2a2c3eaadbebbd5f65b0/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ac5ef38a466a78cac4af17a647ea6a397cbdce77/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/73ea1eef89825d0cdba14e41245d014662138012/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/3db56a0a53db2936ad81038e7ef5b7f95d522103/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/c959c5db70899abe8f108503364cecdf983a0706/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/32b89c1a2a3d6e9b57eb413c7003bfcb59abe558/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/f710768f01449dbda84a1575a3c9fb0141302546/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/96b57f01c443746008cec0a97e169923e2153f8f/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/50282675fac525ee969991519929a41f3279d08a/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/c7726a6855dd27e8bade499ee85807e20bcca749/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/da9bbbcf27d05817ceb35d1f72c3c1aa3cb47dad/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/df6b0704af2308fb0d056a2a588d92ee64dcbe0d/
      mips | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/87fcc77de413b0b79b18fdda71130b261c579bf4/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/fe3844d6117e7997aeeca8ab7f5d145f2198b683/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/330ceef82c905af11ce2257f8d78bf19757c3584/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/ca1fffc2e3fe0c67f17f52d468c1906c61b956b8/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/628eec59606933c42ff7e85332aec532e488737e/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/9e62860527fa3ba6529735afde84d41a1020e313/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/2ff40094d030f908dd407fd6c0db6d281b87e6c7/
  mips64el | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/d6bb41231f3feb96e7cde733199d14ff9e9247f5/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/6e638048fa12a25b359b3aaf8bf8ad4f0b752d08/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/789ff66c388bf7cc5277fce370d307333a52f735/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/a87d0bd7ea19ba9df29e37c890b2f4e2911a387c/
    xtensa | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4d37a0f4fca084a23803d72a33f8d98143e0b896/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/69ee918be0eb24c0e3949aa6a4f5f816e203c80d/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/e826ce5788e36c9917c1f75cfa8217d6db63f5a3/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/147951d8e8d8c2047d34b7f0dc4750e3d63d8e97/
    mipsel | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/0a969b4dcf48b6880a26df23e2ff217baa298644/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/7757e7b37b5c92eaeba689085920dd20894ad0a3/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/44fc6158bc0b278806daef227802edeff1020c80/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/7de7d395babbfa67273cbf48132aa528a4facd56/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/10f836a68401452eb763682ce173e344952d3de9/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/234f6dc7f2e2abfc168282fb6088db544d5b5b05/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/71a485e6f8f6105c307f520442d96a5fb923b541/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4c486b2dc7869831860950acaa23e1007e806e41/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/b4525cf12296ede08cfe9ed6027b63aee9105bca/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/35b6d0f767f129c7a0ac805102282731d4679f08/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/b738bf4c047df1c86c7558da672be49cebbe8074/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/0a0bee3418ea45841cbf236d0ba53861527d3d43/
    x86_64 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/0273b38175a89b7e7906bf0f4e7c464b749203c0/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/6575d7b501210456542eeac1179ba4d40eb66553/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/34264e364bb6090effaade6d3200e41a40b1208a/
       sh4 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/134f242ad5e3cceb270d0d21e3e0bbbcc5aa64b4/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/12571875c92c48d9d7180024ee28fa0c618141cd/
      i686 | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/464348b56cbe0edf07f85847583046627e58df71/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/4d3d5b5f9f0a107817c0ff09d10de43a6f85c9b8/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/02f31607ca894966902de2f09cfc54d70a02a66f/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/6ca9de01bdec26088264b674686b7567ff4b0577/
       arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/fd2ce86c5609f7d6c8be229b4b60e7f87c8cd9c4/
   powerpc | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/e30110adf125971c50e25f2ed30894ac7a8b0cb6/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/80b8054ecd41db5d342a0cedb39bc9e94cf82d94/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/9fd8918033ff9ea341a9c1aa16dab4a8085f53c2/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/8fc107535707d62e69ba205782c5914ce380e8ba/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/303d2de131e525f18e32b4838b9442b4c79ed437/
     avr32 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/8b438d960e69856a8c71861c9bcdd3cac6eb5afa/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/8a7ef31ceca0adaf9b6559d41ad0e6b2049e5558/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/313a27c8867f70cbb3239fe587137894946a608b/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ee8ce94643781a4e9a7b9846d09f699c97373df8/
      mips |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/ff182c61451f9aaf52941e81e4749183940ad271/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/3da2e50235018cc3b1b163424fed5fa84fd6e807/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/e92fb50ccef5ef78593385720ccd68e340032e32/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/856f68f49418264c8b973a5c0a56640be7ba4ce0/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/347c5dc18263312c6688fcbde5a09333a0f9db29/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/76c6911073a8bc73b948b1ea91e30dce6984180b/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/35154937dadd269868d7e0386a3ea1b7cdcb6510/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/7df86699fea20fb4d8f31e9180b34c649ad39893/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/89d75d326d7f7efb77d59f43fc12274332880f29/
       sh4 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/31e4860ce26e26776476e291b292123acd0982b7/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/8120d2ff358eb668f7c7b541dc2eaef72dbe39fc/


-- 
http://autobuild.buildroot.net
