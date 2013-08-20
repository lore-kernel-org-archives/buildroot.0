From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-19
Message-ID: <20130820063005.E5DF852C601@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-19
===============================

        success : 95 
       failures : 32 
       timeouts : 0  
          TOTAL : 127

Classification of failures by reason
====================================

               libglib2-2.36.3 | 4 
                  libbsd-0.4.2 | 3 
                pulseaudio-4.0 | 2 
                  ne10-88c18f0 | 2 
             gdk-pixbuf-2.28.1 | 2 
                openssl-1.0.1e | 1 
                gettext-0.18.3 | 1 
              libnfc-llcp-1103 | 1 
                      pv-1.4.6 | 1 
               qt5webkit-5.0.2 | 1 
     xlib_libpthread-stubs-0.3 | 1 
               ruby-1.9.3-p429 | 1 
               w_scan-20130331 | 1 
                 cairo-1.12.10 | 1 
                libroxml-2.2.2 | 1 
                 libnspr-4.9.6 | 1 
                 libunwind-1.1 | 1 
        ltp-testsuite-20130109 | 1 
                      qt-4.8.5 | 1 
                   dbus-1.4.26 | 1 
                  aespipe-2.4c | 1 
                  libv4l-0.8.9 | 1 
                    acl-2.2.52 | 1 
               wireshark-1.8.8 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/c4c2eb7ff5ac7c071af831b084b0e1bddf387c21/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/fdec2ad5b9ddc8f0d5d97c29790b7f1e2999300c/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/938187e564eb7e2ec53fcd57b7c4ab65183f13e3/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/e6ee139477c662317cbd08b807a9f4eb5b1d97f1/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/0502f86fd8237014b8ff1878f352cf3e3a5cb98a/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/2cc598f405ecb117ef474e14911ad5d54829870a/
       arm |                 gettext-0.18.3 | NOK | http://autobuild.buildroot.net/results/e2e9ac0f96ae769c89d1793d6e558d895f8b9912/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/b66f6382ff0e01810b8c7640ec79ab35d62f0f42/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/694919e6161e0893339515069831e121b45f1b6d/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/6dd96fc6c63ad7f435abab751966ee6b13f6c0fa/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/ab049b808b86c1ae5df6b3971a82ec482df8e67c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/abce960a3c1ba7fd5618745b41c3f1db31da9e19/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/1456d1eec90845e881be1876632acb492368d316/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/138349d5da3474bfe95d4d234bfb8adb05c08fb3/
    x86_64 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/25790782f19b71ce050b042a0ba795331840a816/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4664fd6e3ccd87828b481756b8118f307966d0be/
       arm |                 libroxml-2.2.2 | NOK | http://autobuild.buildroot.net/results/05e95a3ec15aeadb35d9147e2203827d4529ee8f/
       arm |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/c2f9f6125331409dd3f47ccd241bf98393f22246/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/e6552faee78fe77efb5dc7a747e395e6f8dd366c/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/5c1e3fa343091b0a56f62d154d87196f769b15ad/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/6ec8e1bcaff5f982d13e10477beb7bb660036867/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/f8f50759f2e354c0fa02942628fef6618d8864a2/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/a64db9b9161377dd5ceb7cf417c8715dbfd7e3b5/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/22fae2f82e342c7a66cc5330ae57e73d15212986/
       arm |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/bc81c6fa34b124cc9b83648c1cd9d13a5f1aab63/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/1bcea63fb0b590916a43c39732b2295a38076ce3/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/00eb3e4d17481e5d661feb822be0d9d169d74f48/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/9da270a8bbabe6ca1733760415161f26f05babba/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/6c913d9b89bdfe4e0094c29a3ff0148f74c51f56/
   powerpc |                wireshark-1.8.8 | NOK | http://autobuild.buildroot.net/results/53c2fe97e7028e6c69726c3a92c21671d387cbb8/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/3d61c2916bf44a044567b965fb4fa260ffc103cf/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/7a932121a0b9c3dbc07c5eef6d3fb52ef76479b9/


-- 
http://autobuild.buildroot.net
