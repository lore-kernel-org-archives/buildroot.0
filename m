From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-29
Message-ID: <20130830063005.1E15952C0F8@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-29
===============================

        success : 98 
       failures : 38 
       timeouts : 0  
          TOTAL : 136

Classification of failures by reason
====================================

                  connman-1.12 | 4 
                     apr-1.4.6 | 3 
               alsa-lib-1.0.26 | 2 
               ruby-1.9.3-p429 | 2 
                libtirpc-0.2.2 | 2 
                 libnspr-4.9.6 | 2 
               libglib2-2.36.3 | 2 
                 qt5base-5.0.2 | 1 
                  webkit-1.9.6 | 1 
                      qt-4.8.5 | 1 
                      pv-1.4.6 | 1 
             tinymembench-v0.2 | 1 
                 ffmpeg-0.8.12 | 1 
             tvheadend-5956233 | 1 
                 libevas-1.7.7 | 1 
                    systemd-44 | 1 
                   attr-2.4.47 | 1 
        host-util-linux-2.22.2 | 1 
               w_scan-20130331 | 1 
                  udisks-1.0.4 | 1 
                  iozone-3_414 | 1 
                directfb-1.6.3 | 1 
                 rt-tests-0.83 | 1 
               binutils-2.21.1 | 1 
                     pcre-8.33 | 1 
                      icu-51.2 | 1 
                  libusb-1.0.9 | 1 
                 binutils-2.21 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f06d91faf2db277d805cfee8a39937fa01579a35/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/25ab84ef9bfd913022f13d31cf58964ffbd52ab9/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/167f2187a56d8f7abd1f4ba71f8b0fea22c2c67b/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/7a84091ab9bd656a11480bc44c0355e448131b56/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/8f4c162d2ed82d79c5ed377f18c498d69fadb475/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2b258ac42123b908dfe2ec291450831d5d972259/
       sh4 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/ce1965e5818b67c2dcebbdfb5f81c42ee7ee352f/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/6a2ee25753d803dcab69f548a665e8783aac0fde/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/f84c367d7f39a703c4ba13f4c406e9a6b61cede5/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/e4dfc447d8d82403057ed7a7b5b43ce5f9aaca30/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/9bccfd39c20d072c85b9d2cea1d1c9f57fbd1f5c/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/a03c4e9403f8aa7753ed858dc7168efa042cbe1a/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/1b160445e6fa9e5629b20189b144dd181612c86d/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/e2f964d662e66b429e6bb566b3aeff925cda2da7/
       arm |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/e6177ce386bf8e8510e78468956f8938ad201a04/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/349bfa00cc9effb50fb2f3508bc7bae6ac1f1da1/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/c50cf1e71c3952aaf7c5c7d3855bbeeec9e4b202/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/bfdb6137946b2a118e797e182bff5c71758b3b40/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c04717f724cd49b31af3ce424a28d977b562c481/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/cb017740eced633dbafec8b8d6845c6003fb691c/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/2973c157516a890aa627a1860eff7fb154a9a132/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/d8be7e59aee2a05f5bbb2c853c332223c48a6839/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/446d49bcf2b139ccc495d867d898673969823148/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/4d84dfd309d313c8d0248d33bdee43bc7bbfa187/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/0afe9a790ea19f560a3b89346e803b4b5bd3f60f/
       arm |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/4129d3b1bce18eda46fd7ff5b08853391e273cb1/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/6dea1d4ac3e4cd4965f8f04b3054e5089c5d7b86/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/9ea11ba004ba2b0ce8ec1a0a8cdc60ae78722bc3/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/d1ff5a3debb7b8fc94f065a1bbe25c384d96ebda/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/c9bd4026de4ac66589244d12f7e1fc9d9519a7d6/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/205a390d5f7d87d9d47369c4c845f5ce77b55e15/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/c1df12b9ec8aa99dd5feacf00dbca491d061e5db/
       arc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/6c080a7a7ff5c9efa6cb761a11c997d7d05d2c3e/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/eb643deadf58cdfdea1ae50255ad4ab873b37f9e/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/7ffe37dfcfe616c3d3ba7dfc96b0e68b59295483/
       sh4 |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/2d3dd813f2dd117426640a490dcfc257b5732696/
      mips |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/85011513223ae9633ece1421c6b8fb5d1562ea6a/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/091226e28cd8935166701cde3bb3330a6350575a/


-- 
http://autobuild.buildroot.net
