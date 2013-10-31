From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Oct 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-30
Message-ID: <20131031073007.A509152C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-30
===============================

        success : 64 
       failures : 61 
       timeouts : 0  
          TOTAL : 125

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 10
                 qt5base-5.1.1 | 8 
make: *** [uboot-tools-lega... | 6 
               libglib2-2.36.3 | 2 
                  tstools-1_11 | 2 
          host-protobuf-c-0.15 | 2 
        gst1-plugins-bad-1.2.0 | 2 
                      qt-4.8.5 | 2 
                 libnspr-4.9.6 | 2 
              fontconfig-2.6.0 | 1 
                libcgroup-0.38 | 1 
              cryptsetup-1.6.2 | 1 
                openssl-1.0.1e | 1 
         matchbox-keyboard-0.1 | 1 
                 ffmpeg-0.8.15 | 1 
                     apr-1.4.8 | 1 
                libiscsi-1.6.0 | 1 
                   attr-2.4.47 | 1 
                 webkit-1.11.5 | 1 
                 binutils-2.22 | 1 
                 binutils-2.21 | 1 
                      icu-51.2 | 1 
                     m4-1.4.17 | 1 
                      cjson-58 | 1 
               uclibc-0.9.33.2 | 1 
                   radvd-1.9.5 | 1 
                 mplayer-1.1.1 | 1 
               qt5webkit-5.1.1 | 1 
                sdl_ttf-2.0.11 | 1 
               libargtable2-13 | 1 
               libcap-ng-0.7.3 | 1 
                 libssh2-1.4.3 | 1 
               alsa-lib-1.0.26 | 1 
                 dropwatch-1.4 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/289dc37d60ac1ce282c1d8f7a9c41a59502a2356/
       arm |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/5178aef64aa16c3423477ab455a14a769989f671/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/463659fded7ff5c3fb139efbf373cf198e63f172/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/72855d969a9676f7ea9334b3666c4732da40cdbf/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/39ac33c0e325d5e8009337f0cfc83dc364e9c463/
      bfin |                       cjson-58 | NOK | http://autobuild.buildroot.net/results/57fc124e14263ee2447e20a5b910ed3ae0a5b7db/
    xtensa |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/cc1a65b9554bc2ece1b3ea8b51cd805b9bda7e86/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/64aefc564adde57f96917bfac7aa8b566bc7f5e4/
       arm |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/bb8612baaba917740075ed303587f9b8c6bb675f/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/357272cec4222b0a4fd71ba3672c6441d567aaa5/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/20b3221fc3cc481f07f6a9eed134e0780b9b3934/
       arm |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/f2697ab2d94e289a9bf190d0344c8de285387bfa/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/22ebc53937aa7cd7555da596760b033ca46084d5/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/2f664027b795e14908045985ba1da08a2a9acf52/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/5fcf59e56fe7db1c71231dfe759eb21060ea61bb/
   powerpc |                libargtable2-13 | NOK | http://autobuild.buildroot.net/results/34752c3f38a5c5f917a132cd8f9d64251f802c41/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/e937316e40b4baaf4bef8c0dcffea38f2e8bd97e/
       arm |                 libcgroup-0.38 | NOK | http://autobuild.buildroot.net/results/b43ef442facd5aa136a77db99e57e02cc7e39a94/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a202c8e6d83c7ab89592b449539ec62497579eb7/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/4d71a609fe4857a9704cbae2a2f91fbfb5abcfa6/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/ec1ff9fca4f56a87801492b997f74fc4fdcb77c5/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/2c9611bff1dd08dfa5ff6803eda19aa67ca60097/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/f15a9a694aa69f396413fea09215e84ab9426b7a/
     nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/6b631a4a26f9162ab432bd05d1c3193707f48ac9/
       arc |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ffbff37e31e731e5355327c3a826030149e40d95/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/b37d771285f0bf96a41103986c6f953758ac25cc/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/3cdfaa9511aadb1372b90f71c30c267239d887b8/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/26d23d5c778272619d0f59320fc52688e90c689b/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/e5f336397b2b0ce53645a2fe2a82f92f1e23dae9/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/2109461c6e69b56e1e06c30b84b80f23d6eb23fb/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/34bc2743a5fb74f6bf1e8fc7aeb1d8d22c0f3c27/
       arm |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/5e449672b459e4446748169b579790329fbdf05b/
     nios2 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/aadb6ac1f0d2180d357bad688af8d44f9075ecde/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/057a8988c0cb6e223469213d5698569438b15540/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/7df253083e5dda975d2e9bf8492c0890f6d3a7f3/
       sh4 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/3aea2c129951ddc3def6b4571574da8a4d8e295a/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/59f9cc609b0aa89721c9df312632aa61afd4190c/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/cd7998e0d48cb90fcc13a506cd5120ba246aeb70/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/4e6224da44fa8f6a1bdb28db6e5245069aa1bc09/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/21ad0b9ba9499a1337fdce891bb8c8503f3c9e20/
       sh4 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/7e437c56f03e56743650063a4c8a5e23efa44ad4/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/c024d4179bffd96dd01ef01ccc3a3ad99290d77d/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/8889dfc485f386364c4d5f612171b658d505defc/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/baf2313d30a820bc2179d3ada96fe55bed724ba2/
      sh4a |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/4480fdb135576d0fc51e380ad7db46cac9510528/
       arc |                    radvd-1.9.5 | NOK | http://autobuild.buildroot.net/results/9bd70a497f68ef7610b3d98844cecab5fc568e5f/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/7d344e58341ffcf3a937205573aa665263684a8c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a389c9a1c6c3a142bd4521bd8ffad3f90c7e1f30/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/78f6e2265ebb1e9c7429e0c8fa64cb76c4456f68/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/99b9a5e55138b785e8369eda413a8911e8643362/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/fba868938656c0699da742f814abc3eec682d092/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/46a0baffd925337119ae7a602cbb9871155c12f6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/de7bc699058cf783a18b1711e95c88e5614e4109/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5835e74ef511b8d290d871e1c2563bf4ff2d080f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/18bb2eb870463b1cd25645221468c50684fb1202/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1f4500877449b813ec0892ea265e49347326dcac/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/607d6f9b4dc0066cc32ee06496b1948a198186c7/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/dbb09561b688d5a15831a808ca3d59525120cfcc/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/9288f7a92b5ac36fef8ecf4a10c39bfc13eb35bd/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/99663f8fd3b0dcdd2a14fa8be960741e07428fb9/
      i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/c6800fb19bfbc6cf130844c25bfb4c0e21e5d788/


-- 
http://autobuild.buildroot.net
