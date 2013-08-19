From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Aug 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-18
Message-ID: <20130819063006.6275F52C603@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-18
===============================

        success : 96 
       failures : 58 
       timeouts : 0  
          TOTAL : 154

Classification of failures by reason
====================================

                  libbsd-0.4.2 | 6 
               libglib2-2.36.3 | 4 
                    acl-2.2.52 | 3 
                      icu-51.2 | 3 
                     apr-1.4.6 | 2 
                  poco-1.4.6p1 | 2 
                 qt5base-5.0.2 | 2 
             gdk-pixbuf-2.28.1 | 2 
                 fdk-aac-0.1.1 | 2 
                directfb-1.6.3 | 1 
                elfutils-0.155 | 1 
                openssl-1.0.1e | 1 
        liblog4c-localtime-1.0 | 1 
                  libv4l-0.8.9 | 1 
                    systemd-44 | 1 
              strongswan-5.0.4 | 1 
             tvheadend-5956233 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                  libusb-1.0.9 | 1 
           argp-standalone-1.3 | 1 
                 libnspr-4.9.6 | 1 
                 libraw-0.13.4 | 1 
                libtirpc-0.2.2 | 1 
                 binutils-2.21 | 1 
                  iozone-3_414 | 1 
                  prboom-2.5.0 | 1 
               binutils-2.21.1 | 1 
     xlib_libpthread-stubs-0.3 | 1 
               pcsc-lite-1.8.6 | 1 
                  webkit-1.9.6 | 1 
                      gpsd-3.9 | 1 
            kismet-2013-03-R1b | 1 
                beecrypt-4.2.1 | 1 
                 dropwatch-1.4 | 1 
                lmbench-3.0-a9 | 1 
               alsa-lib-1.0.26 | 1 
               uclibc-0.9.33.2 | 1 
               libsigsegv-2.10 | 1 
          enlightenment-0.17.3 | 1 
               qt5webkit-5.0.2 | 1 
                  weston-1.1.0 | 1 

Detail of failures
===================

     avr32 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/5299633ba97615619defe42749a7164e0b0f18d9/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/a9caa36ea33dbc157ddf86abdde8105e56937ca8/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/72a178004224c38b2689107d52f3c675a4e5571a/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4bbf88700b78a1a8c0345d6ad85e80257da6bf16/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/f1cc296ec445858cb62f2ac8637fd46eb1dd832d/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/3366ec92152204446713f731f6c68e277e4ca686/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/533d8b9a6f44f99f00c436418ad750f171c6d116/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d29c9c32631dbdcd56aa3a2e06d0b8d6034ed590/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c07eaa5cc006de656b2e5d8bf518f73794fe1966/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/cfa02b0b53c109d7d5c02f756dfa0d6377bd1926/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/a0ad69b088798877c1c725b74b52150b3c0e6011/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/52273a58f54b511f58ff921921fa4b0c04c251a7/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/a5a23ddc8f0ceb5146a7fdb4f85b528de1f3173f/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/39c29f83cc8adc8d19cb5c7930a1593a3b619f6b/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/7b2f8219ed2ee075cffea4512be352c7a186b516/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/a81ba9e9f9a3be02f078385548802c39f8eb9c44/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/af88f8ba2c4e5dae9ae58effd8c7d089884af3da/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/6c89591b11044dcb9bbcf677ad59b03ddfbba66d/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/45462dfe6e9efa4ac7f560cd939a094fde399f4c/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/493f9182a56f0ad9f2c521cb21914b317df1b1ca/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/26b3b488c47440291ef5a4b5121fad740c3d1913/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/9fef6be888236786c2a71474a34535a39ad84769/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/692df4d1b8ce6922660c33bce1b5c4133a2d7e7a/
      bfin |             kismet-2013-03-R1b | NOK | http://autobuild.buildroot.net/results/fc3b8e03706f433c0aeb88c7fc064a97f0b7095e/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/5e8b594c7a63cae46585275880966bb740c24fab/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/4f2b9865d3a0ce4e931ab81e1e02d5c0ada1dcb8/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/b24ac083546ac211d917b57d334a292b33f14d66/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/806f17f94c2b59beec911a75d9fd569342b1e5e6/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/50aae16458a43575916c59fa5a9c995db7ab5bee/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/e5bf7387a63bcc2759066535dd24f47fe5369019/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/56cacb3182f9d7d456288ff0451f9d757ce0d9a6/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0db818401073097afdc8d20d1f929404a0ac5995/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1453a8856f63ec2a350eab0de8c55de692e52f60/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e056dc0b30bb42366bc73872f4fe79502a9234a7/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/9a440dd90aa473e6628916d8b9e1ff04dec92149/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/89771780a963de5fdf7312dde99af1a5a9e3b261/
      mips |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/bd86e7a9cb49e1aa87d4559552c293a665c9477f/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/485887f1a902fe37ad21a2f6d5757b7cbfc0b40e/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/a6ac34976ce6e1cff6d1cba6bd48f1682042ff87/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/07f4c29692568cc7ed09a2f027749881de872cc5/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/3c3e5be7e98daf6add049eee2d58effc983de784/
    xtensa |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/c99125595640c5c5e75cd22054cc4b38a1267e34/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/28fbc4fd87076d513efad11646830e628975d6d1/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/020891def84cf7a557eb6ba5e250795ac6da9195/
  mips64el |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/2088c0c9b6b8f6b66291a2262dcbf86aaa45a7df/
     avr32 |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/48751b5d9622ef152397415d450023c4a0327e0c/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/7cc3994936a3803e618c15b34ece731338f66e0d/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/54b110a9d2cbf6e2e84f2be7be368982ad9f8ba8/
      mips |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/5fe2289a90cf0279a895faa006888f153a018b4e/
       sh4 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/9218d0c632015fd97bde3c71e692f7061108229c/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0a699c43c04a4762b92648d6b88526105b795790/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/20884f67e12f1d0a0fed9ea50c22418ed0ce2baa/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/a00f15ad25073b98df4df839ca948448e6958d34/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/a9c5717c7affe843ff07b41891a74dcf74fa1e46/
   powerpc |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/da9cb6c0256eba8651d906a0887bd576a28cb9b4/
      mips |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/31f195164b8cc945254cdc78659b1fa930dfc3b3/
    x86_64 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/07adf9ab914d6b30260c3999d07c233a2933f7e5/
   powerpc |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/f3913db9936b3fcede63c8e59faa8a1080ee1c00/


-- 
http://autobuild.buildroot.net
