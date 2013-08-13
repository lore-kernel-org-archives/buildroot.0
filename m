From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-12
Message-ID: <20130813063005.42D1552C1CB@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-12
===============================

        success : 103
       failures : 67 
       timeouts : 0  
          TOTAL : 170

Classification of failures by reason
====================================

           imagemagick-6.8.6-2 | 6 
               alsa-lib-1.0.26 | 4 
               libglib2-2.36.3 | 4 
                 cairo-1.12.10 | 3 
                  ltrace-0.7.2 | 3 
                   dbus-1.4.26 | 2 
                  libv4l-0.8.9 | 2 
                  zeromq-3.2.3 | 2 
             gdk-pixbuf-2.28.1 | 2 
          host-protobuf-c-0.15 | 2 
               binutils-2.21.1 | 2 
        liblog4c-localtime-1.0 | 1 
                      icu-51.2 | 1 
                   expat-2.1.0 | 1 
                sdl_ttf-2.0.11 | 1 
                 fdk-aac-0.1.1 | 1 
               libevent-2.0.14 | 1 
                  weston-1.1.0 | 1 
media-ctl-ac40b79f002a2315f... | 1 
          qt5declarative-5.0.2 | 1 
                 dropwatch-1.4 | 1 
                libtirpc-0.2.2 | 1 
                    acl-2.2.52 | 1 
                  libusb-1.0.9 | 1 
               aircrack-ng-1.1 | 1 
                elfutils-0.155 | 1 
                  bcusdk-0.0.5 | 1 
                openssl-1.0.1e | 1 
               libgtk2-2.24.18 | 1 
               qt5webkit-5.0.2 | 1 
                  cppcms-1.0.3 | 1 
                  readline-6.2 | 1 
                    systemd-44 | 1 
               libsigsegv-2.10 | 1 
                  poco-1.4.6p1 | 1 
                  tstools-1_11 | 1 
                 libnspr-4.9.6 | 1 
                directfb-1.6.3 | 1 
           libcec-libcec-2.1.1 | 1 
                       kmod-14 | 1 
            libvncserver-0.9.9 | 1 
                    zlib-1.2.8 | 1 
            lttng-libust-2.2.0 | 1 
                      bash-4.2 | 1 
                 wayland-1.1.0 | 1 
             util-linux-2.22.2 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/468745f191c88fe62da2436f9014a780e42d5fb9/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/a74ced69052c1d0a91dbe32483fd0612d1bf24a5/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9bba377a3603d19bda2ceb3480bd06b21a67d973/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/1492dc5c3b8151c2578a39d07583b5b180186139/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5e59e428e4640b5a36539d8f3d567633c68a9e59/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ac9b9f32b358c55841e276cd8214b148aee7faff/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/7aa466a9be6284b9f1bfd50e5232373f914a3fb8/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/c7d02d5c4412e2174dd4d7944653d9e4f54d5394/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/23ed836c84fd17787adba25fdb3ff1ea96f1a305/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/1ffb82eceda60c8a270f05509c602f9daa78f616/
microblaze |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/daa0dacafdb59cb4228e01b516ac1a5bcca781c9/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f54fd406a11c0351aa19c197f8fa49401e7b229d/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/243c3919c468fa55cedbef34e6e8bcf0c9ab137b/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/f22c5d0fc7b194939a948dd797896afb635c9686/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/761d117b27f56f4e3eb11e821caa524c194e7a8a/
      i686 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/3d13e5bcb5978f661d66d63d7cedad6bc9988030/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5017c0c30aaa4a4e7c4202acd6b730df547d9a2e/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/32887e66de27f4e11ce7b0d191a25b5fd6c47682/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/a90e944eda99cd4224ed5fadc2fcd38cb5645498/
       arm |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/82799bb40b3a32d70c3bc9687266ce7962a5cfde/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/bb39ebcf6611b04a0593aa522ffd49d1ffbfb531/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/f8fe0f3f18f11edb8b455cda4a1e45aba82b7241/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/0fd6deb02fd29efa7e0ecd611ecf9e016ace870b/
      mips |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/8a3c14f9d91c51b5a991b730e3b45baa2ce0a8d4/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/c6b53be0270197c46fe30a1cde74e31554e87cae/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7f62ebb2e61116c1e0cac4e9c192b598ab361702/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/a40b7a6cdfdc8441fe9c8331a410fc4e8efcaebd/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/559609c47dbbc41eb73b08292061a08e5db2ce62/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/40f0d31d04a8ac142bfec36d38789a6d1d2c3068/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/3c7e7e705009386da67dc44234e3f52f2edb9909/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/95ce75cbc7ecf8a3d0f550b02ca111d19f19d5b7/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/33ac4b17866a64379b7bab3c0549f6e075c98dde/
     avr32 |                        kmod-14 | NOK | http://autobuild.buildroot.net/results/3017c73cbfa1fab0ccec91e50f10972eb1813042/
       arm |            libcec-libcec-2.1.1 | NOK | http://autobuild.buildroot.net/results/16ad8b64e68477dcd663d07c600fd1be3164df81/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/667f87e148d8ad6bb445361aa10939f1774fa42f/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/97a6f76dd5c2a971b6a73a19f8691ef7d58e8565/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e2dabb5a892f1ea3b08db154bcb8e753c52f0b29/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e470ec666475bdc95fbf3941a405b6b0ff04b471/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6fbea816d7ea0ea922c694539cadf8cd2b11c0bb/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/8173b7fd3d6af79a7f2c04bf36059a4429127516/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/1c02faaabb98926ed7c47112c3b650806f0fd9f0/
    x86_64 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/6a1e8a1038b0c97485acedd9954043423bc240f0/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/a68b58c63eae679397c4b99561aa319d35cf4d43/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/9e842761aec411270185b050f513a58268bceee8/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/d01cebc12edfcd190b582ed821d20b5376878e97/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/7783f5cdd4df495b118dc94fb63f9b87214c163c/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/83f01c16bfaaf0e95516ca25951367244bc6c7af/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/31895125e130ebce2fb8d69665c2ac5964895375/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/7dc0cc0bbee99cf3cd6a4db96e7f3439aaef036b/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/ee037a19590fb85c64f97f78f74bcfd4d7766706/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/67faafa06e2ef3e3a9a158b0f808caf698fbf8bf/
   powerpc |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/c6c26f97111931a94b650f047334a26b74f0c89b/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/fc99a01ccd7a12df41481b51d443ac41dafc44a1/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/5a0f70db215d923a9be618adcd1dc1ed60533ffe/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/d4323302caccec8d8e276684e21f3a0209ed0c10/
       arm |           qt5declarative-5.0.2 | NOK | http://autobuild.buildroot.net/results/ff7ead4789509534f3b6c127d666debfff48f32e/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/68815217e13b5dfb8898f6fa600081e2da990824/
    x86_64 |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/5a62c38ec621d49230d76981db6024035e88804a/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/d827ce8f8b7db2d2f191d5383f296152beb1b6fb/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e5e8a2f4ce0bc763acbc2c0855f5eb59c2786442/
   powerpc |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/8e7156255854c21345f75bced5acb746e0d8cb0e/
       arc |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/0e47607263475c134d91185ab736a4947ca28b27/
       arm |                  wayland-1.1.0 | NOK | http://autobuild.buildroot.net/results/383c6ac297250f87db9d03afa38d45b2c1adcb47/
       arm |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/f96a716c20e352f25cf962f001d1d9c205de884d/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/1e8814688263739484f7a76a922c05b45be74b9e/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/eedd5d83f93345527ed80e6ddb1752f68e69059c/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/68edbe284474f0372540a879a83b76f61924f04c/


-- 
http://autobuild.buildroot.net
