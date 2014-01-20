From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-19
Message-ID: <20140120073009.9260E101682@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-19
===============================

        success : 69 
       failures : 47 
       timeouts : 1  
          TOTAL : 117

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 10
                  thrift-0.9.1 | 2 
                  pango-1.28.4 | 2 
            libvncserver-0.9.9 | 2 
                     vlc-2.1.2 | 2 
                 cairo-1.12.10 | 2 
            live555-2014.01.11 | 2 
                 pixman-0.30.0 | 2 
make: *** No rule to make t... | 2 
           imagemagick-6.8.8-2 | 2 
                    fltk-1.3.2 | 1 
                poppler-0.24.4 | 1 
                 libevas-1.7.7 | 1 
checking whether byte order... | 1 
                 qt5base-5.2.0 | 1 
                     php-5.5.7 | 1 
                  opencv-2.4.2 | 1 
             alsa-utils-1.0.26 | 1 
               libevent-2.0.21 | 1 
              e2fsprogs-1.42.9 | 1 
                    systemd-44 | 1 
            xlib_libXpm-3.5.11 | 1 
        ltp-testsuite-20130904 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
                 rt-tests-0.83 | 1 
                      qt-4.8.5 | 1 
                sdl_ttf-2.0.11 | 1 
             iputils-s20121011 | 1 
                     gdb-7.5.1 | 1 
          enlightenment-0.17.3 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/046a06b2ab9908c4917b3ce8efb368d428a31edd/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ddd2521ba49cfc7085853a6befdc92a285c41025/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0115199e68705f5b453aa9c13a0e3933d9e73cf1/
      i686 | checking whether byte order... | TIM | http://autobuild.buildroot.net/results/f2b7b48214ad6b87d7b8ca33839c5ddfa01cd763/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/3c26a9a5aea3000a96ddbf6368d1dbd4fb81ec87/
     nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/0857d25da800176ba23eda88a7f6e5706b2545c0/
    xtensa |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/0c7b01286d765842f707a19250043d9f0fc412fc/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/9f8b58c471443c49ae4cb0c929369d7c6ef400c4/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/ef1a20c293451973ace81bd9e56b8107d95d0344/
      bfin |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/0c5e31b6b358fac39a9176b75f2356bec95d06be/
      i686 |            imagemagick-6.8.8-2 | NOK | http://autobuild.buildroot.net/results/829fd520badce83e1d3cc130fc06a8ae0ebe6308/
     avr32 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/b457ab3227d403a6c8dfb77fb002907a3b29b55a/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/d4f071a5609830c6343679b2e469ba2e43f0d767/
   powerpc |                libevent-2.0.21 | NOK | http://autobuild.buildroot.net/results/da89aaf92e85c494c1a12de01efd8d0069e34fc6/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/8f90cd044b9013f1ace16ff72c0bbaeeac4648cf/
   powerpc |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/53726ffebd93d0f45646cb25982d0f49a3dc4003/
      i686 |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/2c9cfa547aaf5e12f808d39d48ddef15b83b7c52/
   powerpc |             live555-2014.01.11 | NOK | http://autobuild.buildroot.net/results/c00835074917e14adc759df1b6bdbe3f6221e84e/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/601d3a9705964b1e9cb104ca6126af394e08a9f0/
  mips64el | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/1dc763bbe056e4d7d28de578543337f3e169a67a/
       arm | make: *** No rule to make t... | NOK | http://autobuild.buildroot.net/results/a5ef9315e805bd45b7708b9c49748fb6ff4281f1/
      bfin |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/0a408fa874b9a6bda8fc37efd6de7015075676ac/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/801624fec3b24bf76e7898891975cf386af31111/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/c2e94736a28a4ddb049b4aaf0f8c62666423d6d7/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/8a6283a4b579433eb1aaf31c9eca164cc54a22e0/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/aaa4bb5185ec848504660fbfc763fe4eff2a755d/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/94e9e3c4a3cf10339bc2b3dff4527ed3a41522c9/
       arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/8d3c52129b40aa8ac4d2d9e59570502df66f90e9/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/2efd3f41e10e4d98ee7a7f4d8cf186f66d77985c/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/a4bc7010a1b34c00fec8229ced6dc196cc749d89/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/68b727c0d4c29dd607941c927bb97a1b87cce108/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/1ab800b2c6dbb5cc1755b0ee9886004f83e9a281/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/92e4c40c69a3feb4046b2fe5a0d8c69d5a44a157/
       sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c5791912f3d05c9c93e54e85989b25002aa9085f/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/4387ea6ddcda0ec72a3c1b1345a74f604ca9cc9c/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/abaa014eb74a140afb1ef48922f27d2aacd47885/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/918834dc396e5898ed902cd194546cd15801882b/
       sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/624a11f8c5916336c3ee2a5d618344b80e61d3f8/
      mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/103e7a17f815f77a51172c20f0862d32521b246b/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/e78cb0c352a954c10af90a5d55a59957508a9a85/
      mips |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/059018fccfc5d05fee575143eeb488fead672fcb/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/ca87135e3aa0b192b313b6782f379c0b622e39ef/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/c59b8f9d93d77c8b75c02172ff6e6072e8f62228/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/61c9f1232862fbedfa0d086ff94cf222dc313478/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e54633729bb045e52bbe47826f4f983eac78f648/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/0ce2299a0ca9a88b933de7def286115b5304df1f/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/b405dcb4dba58c391c3a77f39df729870fb049ff/
      bfin |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/24a06ce1ed5a6c1fe7919d594725edf343c88037/


-- 
http://autobuild.buildroot.net
