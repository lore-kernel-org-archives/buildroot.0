From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-11
Message-ID: <20130912063006.64093620070@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-11
===============================

        success : 60 
       failures : 58 
       timeouts : 0  
          TOTAL : 118

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
               nfs-utils-1.2.6 | 4 
                openssl-1.0.1e | 3 
             gdk-pixbuf-2.28.1 | 3 
                  tstools-1_11 | 3 
                 cairo-1.12.10 | 2 
               libglib2-2.36.3 | 2 
                 dropwatch-1.4 | 2 
                      icu-51.2 | 2 
         host-gettext-0.18.3.1 | 2 
                 ffmpeg-0.8.12 | 1 
             alsa-utils-1.0.26 | 1 
media-ctl-ac40b79f002a2315f... | 1 
     xlib_libpthread-stubs-0.3 | 1 
                 zmqpp-31220ca | 1 
                  lvm2-2.02.79 | 1 
                 libssh2-1.4.3 | 1 
               libsigsegv-2.10 | 1 
                valgrind-3.8.1 | 1 
                libiscsi-1.6.0 | 1 
               alsa-lib-1.0.26 | 1 
                 qt5base-5.0.2 | 1 
                   evtest-1.30 | 1 
              opus-tools-0.1.7 | 1 
               audiofile-0.3.6 | 1 
                log4cxx-0.10.0 | 1 
                  ne10-88c18f0 | 1 
              cryptsetup-1.6.2 | 1 
                   dbus-1.4.26 | 1 
          host-protobuf-c-0.15 | 1 
        host-util-linux-2.23.2 | 1 
               uclibc-0.9.33.2 | 1 
               libevent-2.0.14 | 1 
                      make[4]: | 1 
                  iozone-3_414 | 1 
               ruby-1.9.3-p429 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/922b73898aa52ae970da1af893d2521e63727782/
      sh4a |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/09fd90beca1915d250f4fbb0ecb80d5dd0a44041/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7379037930c27b3e8f7decc2b2e46d78f99ef8e3/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8ac4b80c48d49741432590f134a7ff066c9828dc/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b282f738a0c3894fd8401df53748ef48c1991193/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/c5b7d0e9805fcf2ba043e39c60de5f7d49924279/
   aarch64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/1e2dbbc55842f775a3dff2b9d2d8c028f2c1f097/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/6145b4e908bfd404aaeeec2314c668fe6ff0dd7c/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0dc14d9f5245c781b96029f5b87af6beb098a686/
   powerpc |                    evtest-1.30 | NOK | http://autobuild.buildroot.net/results/b8db4b665a620053c4cde4a2c9af98b4c22b959c/
microblaze |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/d42201287aa661cffe9187bde90eb5b27e117883/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/9bb06006afc2e6befa64a3d879ea90abb5179595/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/272bf20da291dbba047c4003fa29b9295be6836b/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/23fda311ee834bc74b56723de20e27d2e03f9bf5/
   powerpc |          host-gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/aee10c819f20d67d323e8f108d9a55e26a228080/
   powerpc |          host-gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/669af8a3f5614dea8650327f0f103323b3963085/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0f79294a41c9166f07f55c55c08bea696f7974dc/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/97ee654a1a466e059968baf0790c7c9dcc3cd5e7/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/6e12869f030d857af4cfcb035757099d769ff03c/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/ae721db2dd4e764a2af3825c388a63cad9720ebe/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ee5093ef3b3bd285d258c8fd7126129c8c2c3e4e/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/1afce5544a1ac4978f3ca83fb385bcf6e7212465/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/40e80bdbc51d2f10137aed1cbce7578cfc66a217/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9106f5f417202f12fbd3e5c7e4828a8d37ae4f56/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/55c93fc15a50db7c25bc9f6c1d51e64f028062de/
       arc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d540220145c48675a2b60d15a2de774c44bfa0ee/
   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/1b705ef4a0ff7856d0e1b535790e6cb5a190cd99/
     avr32 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/36e266e12e649a09e43b7e57ff1a46a1d8144ecb/
     avr32 |                   lvm2-2.02.79 | NOK | http://autobuild.buildroot.net/results/c7908a31a00e248df32d28de6dab9be4ad3b14d1/
   powerpc |                       make[4]: | NOK | http://autobuild.buildroot.net/results/621bf3f26caa73dafd2f1a36c67ddda683dc23f0/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/945d197ad514d1240e4e1e7e0c4d9a909b0969c1/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/d0dd3cb474c04960c5392183b68de3022cb331a6/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/3deb5b5a9c3fc71db120841263cb057f864ea64f/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/c6a664aaa475d04b7ab4626e5157911758d261fe/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/64d735d76c124f9a4f26e882264fb1ee8f855adf/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/3a5b0c77b77f056ecc130746b25516f65a049e54/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d829f804bf55c6c4048a718f6bb4da5b37ae0c65/
   powerpc |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d348e3107884bf33d730a23e93c123d7f805ca64/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/26592bb4b39c8b9bcd906fb370528526849c0e90/
      mips |               opus-tools-0.1.7 | NOK | http://autobuild.buildroot.net/results/c490c6126e3f48784f7f876649419e2c7db26223/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6339dbb3dc31367307b6a1d4ee9cbe783abca414/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/769f41244a09a630150eb6349fe5cdcc1c57e0b8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/88ca8e9c2630255aafdad4e91f95be55b617c803/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ac6d7b47ee77748ee7a64675c879892fb28ba07e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/772514e101165d84a2ab9211c8c59480f0b8ac22/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3d3b86c475feac1389f7bff09e6625214693263d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ef8275686887828be5c1bda3f3525135003d04fb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/629f8f01ab40967449fab3fc982d2c20b452b4cb/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d95dc658b887496e317e6dcef376d459bca9eda5/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ef61797237bd3f5c900b53677e74c85e9777df77/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e37b511342592f3f065f994586c1d5e32b7f5f23/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/46ef85b56bd16cbf1ab7647f119cedade8feeb80/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/64a7a8adcbe786456ab587b592532c8a725b4f62/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/a742ea891d7e49eb4ef35e15a7ab1af15ddd860e/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/78a0b190da194e45228c7debf6bad0862958adb3/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/f1fc2a0e6ac313f4c4cb8cfaf66ae21cee26dcec/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/138f3e181d88d6385e3a771bfd4776be53fec20c/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/591bb2f04be80b1fbbd29c68fed37cdfe33dc801/


-- 
http://autobuild.buildroot.net
