From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-01
Message-ID: <20130702063005.2F3D352C121@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-01
===============================

        success : 58 
       failures : 63 
       timeouts : 0  
          TOTAL : 121

Classification of failures by reason
====================================

        ltp-testsuite-20130109 | 8 
                classpath-0.98 | 8 
               xfsprogs-3.1.11 | 4 
               libglib2-2.36.1 | 4 
                  opencv-2.4.2 | 2 
               aircrack-ng-1.1 | 2 
                 libffi-3.0.13 | 2 
               w_scan-20130331 | 2 
      gst-plugins-good-0.10.31 | 2 
          host-protobuf-c-0.15 | 2 
               libgtk2-2.24.18 | 2 
                   neon-0.29.6 | 1 
                     m4-1.4.16 | 1 
                  bcusdk-0.0.5 | 1 
          usb_modeswitch-1.2.6 | 1 
                 qt5base-5.0.2 | 1 
                      pv-1.4.6 | 1 
                    acl-2.2.52 | 1 
                   libcap-2.22 | 1 
                      icu-51.2 | 1 
                beecrypt-4.2.1 | 1 
                 ffmpeg-0.8.12 | 1 
                       kmod-13 | 1 
                      bash-4.2 | 1 
                 libpfm4-4.3.0 | 1 
                sdl_ttf-2.0.11 | 1 
               alsa-lib-1.0.26 | 1 
                openssl-1.0.1e | 1 
             lttng-tools-2.2.0 | 1 
                  libedit-2.11 | 1 
                 libevas-1.7.4 | 1 
                libtirpc-0.2.2 | 1 
             gdk-pixbuf-2.28.1 | 1 
           imagemagick-6.8.6-2 | 1 
                 binutils-2.21 | 1 
                 rt-tests-0.83 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/d7372abe06934626698fabd910a9cb4fe2f55547/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/c0178506e6cac0ca083d66ec8156370a9823eb1e/
    x86_64 |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/9f5a5354e2cbe715f365b990bd958679a0fc66bb/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/856a67f6493b732b6f114e155272961fe5feb4d1/
       arm |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/8512b384bc4e0614240f4fcf7bb1d4423c117994/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/56bd69e4f0348a595c40e3dbbaa46aa1e71de38b/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/bca5392d246e1a52c8ad0d4e487d7ba843ae38af/
    mipsel |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/5f8c2a7d93c7deed20058a891440f38d3541a9a9/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/3497d317666c5259f5ddbe6d810d745d5d4ef434/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/a764f1fce793d6eccb91cbafbdccc62db67f9cd8/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/f28bf556a810ae3b1e3e7de2b0da859b7c9b6502/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/86e3db0d9027507a81f926550bc6bff9b029914d/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/c62764cca8e3259cc5ba3254ad5143e365f860d6/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/1a910e2bbdc573221c4bcc16ffa79e3312314f61/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/46d4eeb591d517382638f0bd873692fe5aff8037/
   powerpc |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/026758cd882b874248675dfc5c8a5dba6c018d8c/
    xtensa |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/a56c4e4388d1e949727d5b015c5114eca3952b6e/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/1d76d29d4245712dfad2e481af6ce218ce6ce127/
    mipsel |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/55a49790078742f41a1ecc9d3c185e185f6dde6c/
   powerpc |       gst-plugins-good-0.10.31 | NOK | http://autobuild.buildroot.net/results/56d49b41546420ed1568860bd8793e874e73b728/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/04a0ed196f114f0a9cf386929b40f5985a8bcafa/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/ea1d7dc77baaa046c546307bbd072afa55d46a3f/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/a50a9aa6446a5b14a3da6596c044bf2a7e2bcd06/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/526b9c4b14eb97ad4afb6cd9b9575780a1dba7d0/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/3692a255e73efa6f641007effd61676f555b9d51/
    x86_64 |                    libcap-2.22 | NOK | http://autobuild.buildroot.net/results/933ce761c123c137a8d5e6244ad6b4029241ee7b/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/dc0244cb63618cfdaf548c40cb0fa1a81b407165/
     avr32 |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/42ac4416dca15029c72da384183734ed8b4806ee/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c812ef22027fdf0d1db0a1d17b2384944924b032/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8208e31d4101395e921325aab3d1293f384285d4/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/b66b0adab63b5524e4b232c03da1f8924aa00dde/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/6b198d48166d549ec90db3c81e5edc63338b0123/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/098d5ee3af39177b2b73b6666473a814ed412391/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/38b5f2317f9aba8efe0c35f5eb03ea7f36f1044a/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/514c52b7f5c1a02f0a3e481cfe2c2b925dbbde5a/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/b51024d111717d1cc562ba7ad4ad300b293e5bb8/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/6e53e7e601a935fdab7627930004459e3d6809ed/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/0a58f91f93ef77c6d9058df108227eb3c3cc531d/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/757e2530fe8d1dc534891e5c4364431dd2026a71/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/065683edab763fe30b6232df35f4fae474902b1e/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/25b242a9430376e610d0843f2ba1e9260ce8f7d4/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/94e1be4e6657db9d282b2cb734d7d1405c7d9de4/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/dc265ac2d8d765f3b9d5540113781af0995df9b0/
       arm |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/cb4f3fa4f41ad4b1dc7e07aef8a1c745c2f87701/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/3fe14e19b4be872b32d002cdb096f12292b303be/
   powerpc |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/2e095ded763cca12628c0c96e01d865260234817/
       arm |              lttng-tools-2.2.0 | NOK | http://autobuild.buildroot.net/results/52a8c94c74a3058fdf9403afc1de3a0eddbda31f/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/d680d38282717a22112c9dfc2d73833f4a519def/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/c8538fa016dd026ca73a6ad85422a46cf4a272d1/
      i686 |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/10c5f8cdbd0732900d3e76d00ca25d7704f5706e/
      i686 |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/71f2d8a267a0d159521407a9a2330e68d756c4b3/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/06d5518f2416d0ef3b9f6657ede8c430f9c7be65/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/9b37daeaeaa9605823e51ac4ad010fb22dbac16d/
      sh4a |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/8d72209c81f8f9c6cbedbf97aae3aa7924a1a448/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/4f21fc8560f166f9ce5302ad14f021b38ea3ecc1/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/615b3846319a75c6687517f2b9bd83cc47ccb559/
      i686 |           usb_modeswitch-1.2.6 | NOK | http://autobuild.buildroot.net/results/89e5b0a3fa8a851471599f2af578739f17863550/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/7c7e00424b3844ee921425f89e9ed0b27e43117b/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/e4db69340ef390b4b17ab8eac3fd2b3c75e71a24/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a4c4e0ea6c8ceea6194660ba6a12c7f6af49a06d/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a1c29edeaaaf74632b0498fa87d71ecf09eac37a/
       arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/cb18efbb39d1c64d86e6f8b81d0b68c797b43e70/
   powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/664ebcd4b11cb7e3b31f8e75685f9594ae6979cb/


-- 
http://autobuild.buildroot.net
