From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-05-26
Message-ID: <20130527063005.70DA652C109@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-05-26
===============================

        success : 94 
       failures : 49 
       timeouts : 0  
          TOTAL : 143

Classification of failures by reason
====================================

   host-lttng-babeltrace-1.0.2 | 9 
media-ctl-ac40b79f002a2315f... | 4 
                  ne10-88c18f0 | 4 
                 pixman-0.28.2 | 2 
                    acl-2.2.51 | 2 
                libsigsegv-2.6 | 2 
                  iozone-3_414 | 2 
                 rt-tests-0.83 | 2 
                      gpsd-3.9 | 1 
                     pcre-8.32 | 1 
                  libv4l-0.8.9 | 1 
                 libnspr-4.9.2 | 1 
                  zeromq-3.2.3 | 1 
             bluez_utils-4.101 | 1 
         host-gutenprint-5.2.9 | 1 
                 libiconv-1.14 | 1 
               qt5webkit-5.0.2 | 1 
               audiofile-0.3.6 | 1 
                       kmod-13 | 1 
                 qt5base-5.0.2 | 1 
                libcurl-7.28.1 | 1 
                libosip2-3.6.0 | 1 
                     m4-1.4.16 | 1 
                 binutils-2.21 | 1 
                  lvm2-2.02.79 | 1 
                 libpfm4-4.3.0 | 1 
      gst-plugins-good-0.10.31 | 1 
               alsa-lib-1.0.26 | 1 
              gettext-0.18.2.1 | 1 
                   mplayer-1.1 | 1 

Detail of failures
===================

       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/8f2e87b23fafaa386b4d2839b5a043f1f1494d90/
       arm |                     acl-2.2.51 | NOK | http://autobuild.buildroot.net/results/d044498480b4f3d243a3fab3dd87552fd36a6723/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/481a27feaeef3d37bb163452c77b7981b16e876f/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f65538ff069c1aae489b6600944a38057fa1cf85/
   powerpc |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fe9b9c93a80c804bf2b4ed19f931226647f26dc2/
microblaze |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9fe5f5797fedce91639d21293f9e2abe530b2ae5/
    xtensa |               gettext-0.18.2.1 | NOK | http://autobuild.buildroot.net/results/a461952364fc2b92c775363681620424fd90c2da/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/15e642517394975577c27f94ae6aa62ba0670cc4/
       arm |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/e7c85ef99d744f32197fac4c2caee0309f330b57/
    x86_64 |          host-gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/0920893f6446423441a2e13dfd45789a00233933/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/9db87432b99999efcf4607194732c6cfc5f0eecf/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/0349958510a0cf7c66f688ecfb377bdd3c4881af/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/02801c8fed3b5147dd8a7b8467731c4a0f4100a6/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/16a6c7c75c19d84148685152704c8e2404c088e5/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/8ede71302609daf674c3f78d0cdea64873aec6df/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/400307d585e23ba1874acc5f01045389abc3ca3d/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/899e25a42bec4d3f53489516aef42001095e535b/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/6b43a692cd8e5094d98f3fbd9d7565e31d29abb9/
   powerpc |    host-lttng-babeltrace-1.0.2 | NOK | http://autobuild.buildroot.net/results/372ab7637515b58fe2f5e785e0b01419ff744a12/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/2d64110d4a9607cee4047d5cd7bf78ba799e16ae/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/6adf5191b4f5f0ce82aab61b0a5424cd45e08fba/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/82315e1487d4b2cb7ae8d84a4d7f9e343b2405a8/
      mips |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/72384ea7617c4ab7e64e936d567e640a74f9abae/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/52a762ab3dc349cdb41506738699dc187d87482f/
    xtensa |                  libnspr-4.9.2 | NOK | http://autobuild.buildroot.net/results/702fbbc63089c088cafae4df236756ae406c924b/
       arc |                 libosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/06335e363e7497709b6acb7f1e584e9bc6befb1a/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/6d5734fa4f7d6e3a22301d800f91b14740757865/
   aarch64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/c4e2125b85c520e3dee14f1b1c9a10d9729e5562/
   aarch64 |                 libsigsegv-2.6 | NOK | http://autobuild.buildroot.net/results/8774a615331d2956e1f4663a1c1bd1a2bc738a7f/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/5a072e58fce5cc9aa42834619ad8479c061f6571/
     avr32 |                   lvm2-2.02.79 | NOK | http://autobuild.buildroot.net/results/0ccb861bddd15df042984c952aeb0108fd8fe56c/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/d314f3ffa954084c7a6288bf4ad3c85d58439386/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/bd162678a3df0821512fd997ac87dd74cede65a9/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/16c4828ac4f0eb30ac6959dfb68849d1aceec1a4/
      sh4a | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/f0f0a55397d59ea3f8c6328de67121f5082e4e96/
       arm | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/70e92e9c6e94cc445ea6c087b15ce93df50a982b/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/99f18364a6bd91043617dd40ce6fdfc2506b2a6f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/5e75202bdc5b79455dcfce3067920e3d8c8afdfa/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/00754c42deeda8a64b5b90c61621c6f1546e0682/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/0022edf05fa1d183d0a85ee93eb1cbc3b3c27578/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/0992f29d4f9b76090af220a5239c103c7fc8fd52/
    x86_64 |                      pcre-8.32 | NOK | http://autobuild.buildroot.net/results/70d961a0085867a794a933eab297aec8d01a378a/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/839c62f74f00a497f979f53da9befb2cf2e1ffb1/
      mips |                  pixman-0.28.2 | NOK | http://autobuild.buildroot.net/results/9aba5eb7953b1a6a3a4c12b1bba0c65c25e64e2d/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/3abe2623174dbcd8949f2a97d6aecb0c5590748d/
   aarch64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0e39926decbcaa9f7990dee6d3486d1db8718f4c/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/f4f42267230940d420af283cec6332e2a73b1467/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/7aa2fb3192e5a6caed7f502d6d0a88988d92a5f9/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/f656cec81f02eddae4f2692060dcb95375f0c6cb/


-- 
http://autobuild.buildroot.net
