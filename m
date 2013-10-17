From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-16
Message-ID: <20131017063005.EBE7852C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-16
===============================

        success : 89 
       failures : 60 
       timeouts : 2  
          TOTAL : 151

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 8 
              buildroot-config | 7 
                    php-5.3.27 | 4 
               libglib2-2.36.3 | 4 
                openssl-1.0.1e | 3 
             alsa-utils-1.0.26 | 2 
                 binutils-2.21 | 2 
                  boost-1.54.0 | 2 
                 dropwatch-1.4 | 2 
        gst1-plugins-bad-1.2.0 | 2 
                 fdk-aac-0.1.1 | 2 
                 binutils-2.22 | 2 
          host-protobuf-c-0.15 | 1 
              host-expat-2.1.0 | 1 
         host-gettext-0.18.3.1 | 1 
               alsa-lib-1.0.26 | 1 
                   dbus-1.4.26 | 1 
             CXX      DerivedS | 1 
                elfutils-0.155 | 1 
  CXX      Source/WebCore/d... | 1 
                    nano-2.3.2 | 1 
                  ne10-88c18f0 | 1 
                     apr-1.4.8 | 1 
                 libffi-3.0.13 | 1 
                  snmppp-3.3.0 | 1 
                libcgroup-0.38 | 1 
               qt5script-5.0.2 | 1 
                sqlite-3080002 | 1 
                      icu-51.2 | 1 
        liblog4c-localtime-1.0 | 1 
                 ffmpeg-0.8.15 | 1 
                  poco-1.4.6p1 | 1 
             gstreamer-0.10.36 | 1 
             make: write error | 1 

Detail of failures
===================

      i686 |              CXX      DerivedS | TIM | http://autobuild.buildroot.net/results/d209cb53d6c8280f81f88ac52347b1084bbb07ac/
       arm |   CXX      Source/WebCore/d... | TIM | http://autobuild.buildroot.net/results/8a1e0ff952b881441fc95719febb887d89ba179b/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c6ec06fed5f2497b76804b82a5e40cb077ad1ece/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/88a73092b15bfd31a8f6ad8bc79145ed42d80f25/
   powerpc |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/e05a5c94bac99973b81cc5e79cc2630e7e26e185/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/ad89aef0e337f5b4b9864490c54c011861a9b171/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/66d85058cb3751a76327bd82c59500fc7407afd3/
      sh4a |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/f23311e266b208c4ddaecc3dcfb16daa8a4ae8e2/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/52b30beeec9af53dcaee98c1e6ab430b8328f7a3/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/3af486e2291d5f18ce6c22404a1f7e1e6d8546a1/
      bfin |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/2d20d2a2589c88b9920d80d812924f6edaaf35f0/
   aarch64 |                   boost-1.54.0 | NOK | http://autobuild.buildroot.net/results/bef3fa54f3787683a317a070fa43aada5a18fd97/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/0864e95d9a8b82b09994662564dc2bc5b99a3cae/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/9a6b90e335003f1a1c0d8c2519f34f07f1d03796/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/b33e5b2baafbb0d5a1bffc5b493d8a5213a01d77/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/ff70bca4d1e3a5b8160fbd0e458312731f0caf3a/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/df879a84f91e528d5946a1af5f9bafb351a75c17/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/b962f4a349b36179f6cf98ba7de0cac9f9c5aaf8/
           |               buildroot-config | NOK | http://autobuild.buildroot.net/results/bdfb3b501d4ede4a0df421de0b305f6cacde9788/
   powerpc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/b0a6a9e5989cdff11a3db58b74a39fb16fc836f1/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7c6526cb7d4275b0e3ccaae58990525de5c3de9b/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1bc426bd88d6fba93f6afb72c3347d2656f2047d/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/b55d1821be8dc86a4b3ba208cc6116d4a5a7bf66/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/b696f40ee56a9a79796f9d1a548ea0ffca903b26/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/c107bff0448eb0fada7ce71b336e48109d34cddc/
      bfin |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/19e24e8ec9bbc5f3e0a4a96bdcb45858a3615307/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/4764d0e7d2c5b196d57aede76abe681097198011/
   powerpc |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/e77de9757973b93c21ee3741369cf3c3cf7c0f70/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/b9abc7e7fb37a0d419fb6a3045eb2c364d56df84/
   powerpc |               host-expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/12cec43de53d92f2296581ed38a6335d84834d34/
   powerpc |          host-gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/261136ba29714680182df268a2ee9443fe9d0e13/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/37b06c61e57d5d8f848e0ffe1a63b6830e880f50/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7bbd33f22e171e6cfca7f668f79cbf03721f2d77/
      i686 |                 libcgroup-0.38 | NOK | http://autobuild.buildroot.net/results/8192ae24510e6cfe849ff3bc0fedd562e6581626/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a62284124fb67592e1c5a1940dd2812bc9c84b2c/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ec9ca22e32a26a5e83a49f73f6c6413839c9a7c5/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/aab78140427d74b163e5d490938dc31b99f9a799/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e01c0b860b18587075c965e9de349de693edc8cb/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/64d5202672798e5789342dfb4aeea0bb9dd06793/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/aab77f87ea04fab74d47705664082efd1fdd1e1f/
   powerpc |              make: write error | NOK | http://autobuild.buildroot.net/results/ad6e92060052f5573f81cbeafb37e229847512a5/
       arm |                     nano-2.3.2 | NOK | http://autobuild.buildroot.net/results/178c4ef32867d84bc13c75883f36540aedd55fbb/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/730aebcd85f8e48b40e7bf08abed7f66f6067885/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/80ec3c4975eba418ac103348355da87610769d99/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/fa22027d7a9713784a9e8b0911f9d133a78d6f8b/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8acee3dda1df73c39f20f6cd4b69e436ac5d478e/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/5aaa910959e2d8ab508ff852c842e7535aa10270/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/37a46b27b5a86b348ff816f94792a4d28942fb72/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/595b842d721195b84574bcc2a4516cb39fc639d2/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/5b311b804c91829e025ac493459e0f7e8f8d8287/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/9a7b7e5b62bd4d3edc730117a46f5b159b4fdecf/
  mips64el |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/0059d8de5560782bdc69b54754f8e8987d246008/
       arm |                   snmppp-3.3.0 | NOK | http://autobuild.buildroot.net/results/c3db240af55dad97a7a8d827d8e9e402da6ca546/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/b3daf5327c64fde7c7553eefaa1c31caf21f9b52/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9d0f7b26dc28e4074bbd2b5793a117cfc414fb04/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/848860901fa2785a3e200d3a30dbb17920b2671f/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6c2546edc9e78d0fcc24735e3b86eb6d75886a8d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/c238efc56a2211b31386f5bde92412d6b4901191/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0f420981102e8ca2750ab71d24c8d1fef750123f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ae353ba5ebbb041ae1f41ba26bb278147f04cadf/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ceecd569b7f58aa17a008d9a9d34fc2dc29cfac3/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/eea7c0155794ea4be5221b7f3ecc295ba1b9972a/


-- 
http://autobuild.buildroot.net
