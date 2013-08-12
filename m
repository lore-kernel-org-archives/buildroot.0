From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Aug 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-11
Message-ID: <20130812063006.AC13852C5F1@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-11
===============================

        success : 91 
       failures : 38 
       timeouts : 1  
          TOTAL : 130

Classification of failures by reason
====================================

                  ltrace-0.7.2 | 5 
media-ctl-ac40b79f002a2315f... | 2 
               libglib2-2.36.3 | 2 
                      bash-4.2 | 2 
                  cppcms-1.0.3 | 1 
                       unknown | 1 
               libgtk2-2.24.18 | 1 
                  zeromq-3.2.3 | 1 
             gdk-pixbuf-2.28.1 | 1 
                 ffmpeg-0.8.12 | 1 
                   dbus-1.4.26 | 1 
                 qt5base-5.0.2 | 1 
                directfb-1.6.3 | 1 
               aircrack-ng-1.1 | 1 
                 netsnmp-5.7.2 | 1 
                      icu-51.2 | 1 
                 rt-tests-0.83 | 1 
               libevent-2.0.14 | 1 
               libcap-ng-0.6.6 | 1 
        liblog4c-localtime-1.0 | 1 
                  tstools-1_11 | 1 
                    systemd-44 | 1 
               ruby-1.9.3-p429 | 1 
              strongswan-5.0.4 | 1 
           imagemagick-6.8.6-2 | 1 
                sdl_ttf-2.0.11 | 1 
                  libv4l-0.8.9 | 1 
                libtirpc-0.2.2 | 1 
                log4cxx-0.10.0 | 1 
                 libunwind-1.1 | 1 
               alsa-lib-1.0.26 | 1 
          sane-backends-1.0.22 | 1 

Detail of failures
===================

       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/728c71bd946a16e48a107dc7701d3fb5f96e31a7/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/14675749b981b2e1874d93e323e7cadbb5446e97/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/82e33a497f5fe651e72af7c4d1a415b216f06f74/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/8de3033db035f2301f3eb2c030a0fffa273ce8c5/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/22974c549593de6a5c9bbd8db0654777e43677e7/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/0259e8d644ea28ff0da01104a9013f14969d1244/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/0674c5e45938bae8fb429218b82535ce02feaa94/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/2442567fb21f5cc2183787518d45f0e9369029da/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/47389256f4fda90fcb027c0ed365b211a70cc94b/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/a4c25aba785cf03472bdbf1276f96931906f54f6/
microblaze |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/bd548e1981ce5786fafa60129b798b1264454de6/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/94a06b3c7648838e5acbe412194783dd7ece1670/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/84e0c4cdb2994e777d07cc1516efd02fadc31a88/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9d513481bee33ef75066fad253ba3485a4496521/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/92f83ab3f8b3fa1f133eeb901ede070c56c2e06b/
   powerpc |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/fc7d6a26e30e270f3a1e3e0e73ab3a972b3512e4/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/cbb5d20a871cfbdd9e79aae13ab052d77f27f3b1/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/87826a4ad1071e4d936affd4e1daf1abf7551175/
       arm |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/7ee1b01a12b40eecb39ac0bedcd61ab5d16f0b25/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/33708d1afd52e049298f2284a2883b5bdfe39dbb/
    xtensa |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/ed28e4153c03e8bca6fe19a276aa07a20d1dd64d/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/11439b83c4f3b776f92cdc5cc22a7c3fae42428b/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/061ff5ec3e27a5445a0782f754d6e9f578b04b4c/
      i686 |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/cd10ec88f4e1750862a81ce520c8a1d6573eba2f/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/e7067c8ea391ed6f4f92180e6d47f85343690c65/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/7406f8fb39f9a33d1fa3238489bdc6a21fd0507e/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/05e2614d7189a7441c2c95a171762755786bb8a0/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/4723c4328072f94dd94b0ff39144013b38c89236/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/fd2ebeb070438fbd054d87653aae124197869ea3/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/250ff766e660542688a54648746f7515ceb27731/
    xtensa |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/04f9c1b04179bf93bb5e0f7ee8d8e7ff9b0889f6/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/cd2024df62b48ce1e636c1f8684b1e4c76db0abb/
   aarch64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/6cdbd2a7cc8670f043232cb570cd4fdb667be4b9/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/9a0c74cef444310decb5c3507efc9ffd1cee5630/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/2c868de9e1ebcab5704029e55322ba76ba7cfcb2/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/ee07b3581f3d572704177944aa48c23ce43e577e/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e1f4a08d9069aba1ffc4a56400bfd068fa3281ef/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/01913b62669ebc061065cb66189eb9245c11d5e9/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/b745516bcd1c65e0251bd4c6a7868edb67e07938/


-- 
http://autobuild.buildroot.net
