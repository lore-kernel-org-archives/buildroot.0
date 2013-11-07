From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Nov 2013 08:30:25 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-06
Message-ID: <20131107073025.7487552C613@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-06
===============================

        success : 78 
       failures : 29 
       timeouts : 1  
          TOTAL : 108

Classification of failures by reason
====================================

                 qt5base-5.1.1 | 4 
                      qt-4.8.5 | 3 
     xlib_libpthread-stubs-0.3 | 2 
zmqpp-31220ca4a0fb43a0848d7... | 2 
                directfb-1.6.3 | 1 
                  iozone-3_414 | 1 
                 webkit-1.11.5 | 1 
                  python-2.7.3 | 1 
                busybox-1.21.1 | 1 
               audiofile-0.3.6 | 1 
                      icu-51.2 | 1 
              e2fsprogs-1.42.8 | 1 
              fontconfig-2.6.0 | 1 
                  connman-1.12 | 1 
               libglib2-2.36.3 | 1 
                  libv4l-0.8.9 | 1 
                   attr-2.4.47 | 1 
                  bcusdk-0.0.5 | 1 
                      gpsd-3.9 | 1 
  CXX      Source/WebCore/M... | 1 
                  aespipe-2.4c | 1 
                 fdk-aac-0.1.2 | 1 
                     gdb-7.5.1 | 1 

Detail of failures
===================

    x86_64 |   CXX      Source/WebCore/M... | TIM | http://autobuild.buildroot.net/results/a4ddc32bf7f3ab3baeccb0430efed0e63f7b5ec2/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/28195b647960fb5e6455f4fd68857dde32c5b072/
      mips |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/1f35c5c00e932aa65e37b6f2c5d27e6deb6ac550/
    xtensa |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7ba72323decbe091f35c8f85f590ff66b8fd506d/
    xtensa |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/dc4b79f8043e703d65885f46b65afa6c2e4e13de/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/2fa064c26c4880cd89f849c99fc9232ce8cddcea/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/73348a3c0872c9086a32e2b6591f35ae7b05a009/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/9ccdd3d991eebdd4728d44316d39f28d040d9fcd/
     nios2 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/b81d33f8162c0c858782346ed6acb3337bd8aa65/
    mipsel |                  fdk-aac-0.1.2 | NOK | http://autobuild.buildroot.net/results/b27fcfb0e538eeb41e0b8cac402f988e54b5deba/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/2164e12461a81f51cdeb4c0f47ec00b9aeb7adcb/
     nios2 |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/82bb2bfd7b1722854677b7832c0040b6494047f0/
       arc |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/438771c4b24f324706089077d4684efbf03c232d/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/b166b76dcbf9667ed9df81301ecbf9d0ce6a35f1/
       arc |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ffb84270c617002aff6e188148932f26614f7534/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d9c0d287fd2fe0e9e00cc7018bd3f7a25481624c/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/870124165442611d73e6f7b36bdc1841d124a233/
       sh4 |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/7b1777b7c73a52dc079ce8bd3f3c58b6190cd157/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/342657387b471d04bb67089123df7cb8ca3e7751/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/541963f0eae63ed90c9f36531b22f4e8184292f8/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/977adec07bec91075fb0bc0419c43efb54cc01d9/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/eb41beefa8358924b87a62cf6b09e10b768ad807/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/a43e67838853f408e82bda88bdb16c8923bca280/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/1b483f26820f2c72faa83b6f778dbfc85538e6b6/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/d2b106f76ea5c35dcc1a988c5f435565773abf01/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/8ce7297fa78ecc9e6efdffcfca879ac44f6b487d/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/f9426ca0f329e56b9498a7dec2b8a19777e79edd/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/82a6bf25c71bcaca21d450a600e20a0ac63d3354/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/bae6878133844c7f2faaeb899626c0418b2c1cd3/
       arm | zmqpp-31220ca4a0fb43a0848d7... | NOK | http://autobuild.buildroot.net/results/fd3eb8dcf8e73cf7d575ef506892cb7a48bdda74/


-- 
http://autobuild.buildroot.net
