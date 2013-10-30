From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 08:30:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-29
Message-ID: <20131030073004.EDD8A52C1BE@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-29
===============================

        success : 63 
       failures : 35 
       timeouts : 0  
          TOTAL : 98 

Classification of failures by reason
====================================

make: *** [uboot-tools-lega... | 7 
                 qt5base-5.1.1 | 5 
    trace-cmd-trace-cmd-v2.2.1 | 4 
                  tstools-1_11 | 3 
                 omniorb-4.1.6 | 2 
                      qt-4.8.5 | 2 
                 libffi-3.0.13 | 2 
                  zeromq-3.2.4 | 1 
          host-protobuf-c-0.15 | 1 
                     popt-1.16 | 1 
                 binutils-2.21 | 1 
             tinymembench-v0.2 | 1 
                  poco-1.4.6p1 | 1 
               libglib2-2.36.3 | 1 
             alsa-utils-1.0.26 | 1 
                  libv4l-0.8.9 | 1 
                     m4-1.4.17 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/777a7bb1d64b24d81933b333f3f2cb8be24252cc/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/c5a8051f265f2a9258894db3fc150c55d971aece/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/dd4545d0627c899673b8134670cc6ef3248c9343/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f7d3fd53089cb2430ec5110204aa2de6ed0444a3/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1aa148be5af49aa5a582a501d9f95055e5bb1f9b/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/141147ed45ffba83efd9f0f4dbe2677d1cccf3b8/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/40de273afeae4a0bf54177bd4c1f701133c09a8e/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/c41598be75bfeee262d3038cbc9a929045536d22/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/2d13a4191a086af4e0b0bf92d15a1550388f3eff/
      i686 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/495922a09a83b3d1bcbd24104896ce3ac2c66c92/
       sh4 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/8f0a9cba4baa46606c52883eeb1f861224f1fa7f/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/72773896862ad1d85b4a96a083b659a713a0b947/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/27b44651cf43cba382d57e82c1b05a16ed45665c/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/c5612c3cd53d8bf41aa3e2535df49e4f77c78dcb/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/c77346c06c6e46647ce2980a070f22248d583401/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/80520011d6bace180e9bbfcbd798178f65b9bb91/
   powerpc |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/40d67d6d3bce62491273bf547416b687943dd308/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/10238c17ada8294aac819e106b8d1acd08700910/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/aa573a4caf6bad7a693c34c308440cee5e3d5312/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/a528cfd606e9da3a1368f885a0a8f51dfc460351/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/135fe930f3da34ff814c1f0b97245f78653a3eb6/
    x86_64 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/7dafeb7c40d926f50c51758ef08898dde149324c/
      i686 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/90d0e209c5e3a13391776c1e5b932225f36434b2/
       sh4 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/1e87b4e54d2e034017c85bc4ce88793a0d73df39/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/18491ac13fddd6481fbbb0b9dc096c363bf14ec7/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/9d005c01109a836eb446774b108b1ea86a7554ea/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/6b228b1f51a08bdf3928986aae88fcff8047202d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/203d5f9e685bd3c1bab438557780016e90f14b01/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b064944536af4f5188d22c298f89fe121aa5a202/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b8401a3d072166d4d58d7cd272cbee89a3431bf7/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/760a52af6c6b0fc22c335b5ddd8a03b1ae03fe97/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/97a52e3bec9bdfc9a82f5192267b82a1568f9a11/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/164fe70ded2cf02789d7978b51aaf1bd1c12f0d5/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/fc51fe2c8bc5283d5f297babe8a04ac40da7c286/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5a3261109ea63ba17375003eabd8b5d88757865f/


-- 
http://autobuild.buildroot.net
