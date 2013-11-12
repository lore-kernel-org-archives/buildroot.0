From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 08:30:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-11
Message-ID: <20131112073028.520FE52C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-11
===============================

        success : 70 
       failures : 43 
       timeouts : 0  
          TOTAL : 113

Classification of failures by reason
====================================

           imagemagick-6.8.7-3 | 5 
               libglib2-2.36.3 | 4 
                 qt5base-5.1.1 | 3 
          host-protobuf-c-0.15 | 2 
               alsa-lib-1.0.26 | 2 
                 webkit-1.11.5 | 2 
                  tstools-1_11 | 2 
                  sawman-1.6.3 | 2 
        gst1-plugins-bad-1.2.1 | 1 
       liblog4c-localtime-v1.0 | 1 
              bridge-utils-1.5 | 1 
             gstreamer-0.10.36 | 1 
                  libv4l-0.8.9 | 1 
                 libnspr-4.9.6 | 1 
               audiofile-0.3.6 | 1 
                     m4-1.4.17 | 1 
           argp-standalone-1.3 | 1 
                  samba-3.6.19 | 1 
                 cairo-1.12.10 | 1 
               libcap-ng-0.7.3 | 1 
                host-gdb-7.5.1 | 1 
                 libpfm4-4.3.0 | 1 
                aiccu-20070115 | 1 
              e2fsprogs-1.42.8 | 1 
                 fdk-aac-0.1.2 | 1 
                     apr-1.4.8 | 1 
                      bash-4.2 | 1 
                 binutils-2.21 | 1 
                  libqmi-1.4.0 | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a703a7db4ba65a9bc39a69cb81286eb030271b1f/
      mips |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1794b02cfe7f2c55b78844b7800e11c84dac1e6f/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/79b8b317af91bafdfb75d8b8b5b11895a108955e/
      mips |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/fb393233ce81c85b7feabcb4e4f384a71757bdc3/
      mips |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/5e31b923be28084db0b80f79a82925c817a4b08b/
     avr32 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/c002711ef82fb29f1765df251bd0006caeccc508/
       arm |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/c7feb22e48147f37d762000d4ebf06b8d3fc35c3/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/b221881b340f0ede805da674ce408c3b1fe1af11/
      mips |               bridge-utils-1.5 | NOK | http://autobuild.buildroot.net/results/1acb0658138c0984a09e9ceaef854cc86ca5287d/
    mipsel |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/25d9e445901eef8f3d5a767e7e3b3efcc5df37b8/
       arm |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/38ed4c961d3f32dba7734befc253a9530985eb58/
  mips64el |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/d18a1a079a14215884fa1fce6f15784256975200/
       arm |         gst1-plugins-bad-1.2.1 | NOK | http://autobuild.buildroot.net/results/f07e3377484ea2051b6d96e02ad9b42d885ba2da/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/c01cfa80d2c0a15dc26e8dfc6be3de30e34c5fe8/
     nios2 |                 host-gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/d3208bfcc0215ab6ea8096a5e0e36d4e82813322/
  mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/033f2333317e2850d97da50643776dd6cf2c657a/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/d63e02a0d0bcba5e9ed2d2995a0abe498c4d4a16/
   powerpc |            imagemagick-6.8.7-3 | NOK | http://autobuild.buildroot.net/results/4a163d3a8bfb53d78bb15380e7ca7cdb916e8a0a/
   powerpc |            imagemagick-6.8.7-3 | NOK | http://autobuild.buildroot.net/results/04b2a1cca8bbad221dfe3c71186c2a2c35681c65/
   powerpc |            imagemagick-6.8.7-3 | NOK | http://autobuild.buildroot.net/results/1131f66845064534ea49f31b681f96f300332479/
   powerpc |            imagemagick-6.8.7-3 | NOK | http://autobuild.buildroot.net/results/05f523595c8160991a59df14ec4582af11ca030e/
      i686 |            imagemagick-6.8.7-3 | NOK | http://autobuild.buildroot.net/results/dc0072385ec753ed6584e2813b853c22d8a33057/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/aa7381ef93742a5c0c88255a0cd3b35cf850cde5/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/af531471085007def2f8d1fbbb688029f5528a58/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/868afcb621e1af9a5c888e3a69e06d5957fe0591/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e4a8d5abd78a4bf4f80d2d2da08f69c1b71fba43/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/46c4225b459ca3564a67c00c5e7fa7d5892e3d92/
       arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/34f238cdb1b1b4be1a11143b5e4a17c78c2fc289/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/2538562700fb687e39fc84e55cd53c0f48d7bc9a/
       arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/407a5af3cf29f1d7a0622178641c90fd39c6119f/
     avr32 |                   libqmi-1.4.0 | NOK | http://autobuild.buildroot.net/results/070449299aa9025c4bc6769524a6e22d66c92a65/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/26a4de94e65682fa52dd67b9a856292982cfc4fd/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/675191c3dfaee5f5d41b1ed642a7e6dacbd25631/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/8b9bcbdcd61e422f3108d870cbc4084a151d477f/
  mips64el |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/c45a9d4781d686036da774d389f1883994d68b8c/
  mips64el |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/9ec9795a9468f3be9342f6c9d3da7e0d9f09244d/
     nios2 |                   samba-3.6.19 | NOK | http://autobuild.buildroot.net/results/bb95a65d8d09ba4bea3bade3d969a2481d7be0ce/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/9a1a5a23e8e6d458acc98c06923ebaeb74958266/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/04ee77aaee209d7a9ee23581d4a2669a344a6b43/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/1bbdc474dccd139ce2c75c6f499573e011e30a1b/
      sh4a |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/5cf70941df025c8ebc8437771d58ac5a9e2b9eb3/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/e184de2b57ff70333b44fa8ab71e711695d2ed4b/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/7a4874224f222a5b8757721cd4250cef262bf9e3/


-- 
http://autobuild.buildroot.net
