From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-07
Message-ID: <20140408063009.EA284100CF4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-07
===============================

        success : 51 
       failures : 34 
       timeouts : 1  
          TOTAL : 86 

Classification of failures by reason
====================================

  toolchain-external-undefined | 4 
             lttng-tools-2.4.0 | 4 
                    gpm-1.20.7 | 2 
             util-linux-2.24.1 | 2 
                 cairo-1.12.10 | 2 
czmq-b5730c5f8290a611fd3b92... | 2 
                    fltk-1.3.2 | 1 
          libpthread-stubs-0.3 | 1 
                latencytop-0.5 | 1 
                libsoup-2.43.1 | 1 
        gst1-plugins-bad-1.2.3 | 1 
make: *** [core-dependencie... | 1 
              fetchmail-6.3.26 | 1 
                     exim-4.82 | 1 
                    fbgrab-1.2 | 1 
    xserver_xorg-server-1.15.0 | 1 
                  luajit-2.0.3 | 1 
                    php-5.5.11 | 1 
                   duma-2.5.15 | 1 
      compiling ../../corelib/ | 1 
                  taglib-1.9.1 | 1 
            lttng-libust-2.4.0 | 1 
                  ffmpeg-1.2.5 | 1 
               qt5script-5.2.1 | 1 
libubox-bbd846ec2d72b262975... | 1 

Detail of failures
===================

    xtensa |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/26991c8736853ee55989ac647eccd653b7bf234b/
    x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/6e78bb4bc501bda36ee6842637ab2a1098f17c2e/
    x86_64 |       compiling ../../corelib/ | TIM | http://autobuild.buildroot.net/results/a25b95e378514628de09f6aa595499f1d0f70c56/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/dc61e328929fed951249c7638ed1e914877a43ce/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/c51bc4db85b3558ac720637dd0c599839157c51f/
      bfin |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/22a49ba5a5019d0f67844ec26b44f784d9abaa66/
      bfin |                      exim-4.82 | NOK | http://autobuild.buildroot.net/results/95ddd8e9be96f3808612db02642d72cfe77b3c26/
      bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/f94ad329426b12dedf2b351040d132e7caf2dab8/
      i686 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/cd386bd441ae5f16c99b2750d2fba0a8e34f7cac/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/e5ec894a18806671133360a1bb0b88a8a9654a34/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/53cfd61c9d04b693adb9c7ba2171ef061a7944d1/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5c92df5ef01c461fd7ed0ab1c02c8674c7e8a5f9/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/cfc539adda2b836e5b38d852381d21f2a3e77f37/
       arm |         gst1-plugins-bad-1.2.3 | NOK | http://autobuild.buildroot.net/results/080ce592260728baef1cf9d1d08952f6faf29d17/
   powerpc |                 latencytop-0.5 | NOK | http://autobuild.buildroot.net/results/e62d35bcf7d6c98d0a0348532c2b159affb20e83/
       arm |           libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/adde6ae82b9e66ee0bb206c2f334ea7a856cb0f5/
       arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/d22edc19001037f9593f45444ed953f74ee6b806/
      bfin | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/1a5c50f8ca0ae70c1e0d3733765f521790b97a30/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/a94c9f0c03bd968b5db3fde198e7ed033a709219/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/6b49c71fa183194bebde88398cb336d6e4f92a25/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/c17bdffb7c65312e8dc03acbc24b1f9b3171b00f/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/b96d30d896d087eda7b0e0d3b87b6f8ebcf1f689/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/8cd431f0f4f34683006648b3b2f8e8f3c4ef4358/
    mipsel |                   luajit-2.0.3 | NOK | http://autobuild.buildroot.net/results/d5232a215e9e9aeb40b2e4e353329a27603c79ab/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/f4d26e7e91f3ad134d6215ef0d969eda4deac240/
    xtensa |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/959b77fa2c1f13b1958b234803437e09734e882e/
       arm |                qt5script-5.2.1 | NOK | http://autobuild.buildroot.net/results/4daee63d6e538f8dc77ed196487be1342ccac122/
   powerpc |                   taglib-1.9.1 | NOK | http://autobuild.buildroot.net/results/e92241a3f8cb6c25de2071eea90bbc38d4229dda/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/996927e6fda49a09c9bb83b134a798ff908aca5a/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a5797c025bec50c10efdcff74945aab4021d05e4/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c5f4a68ac2789296c057010c7647ef7b694799ac/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f331a6eff0b0b93c73af52db3a6b43e4e598577e/
       sh4 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/b22131fee532bae01cdb896f0347aebd5505fdc6/
       sh4 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/a379afb8e09c78895a1876b8f1f99e9c4fccb5b5/
    x86_64 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/f21c63cf5530e51586806ecce845e85d3e0a25c1/


-- 
http://autobuild.buildroot.net
