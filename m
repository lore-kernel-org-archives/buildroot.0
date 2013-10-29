From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 08:30:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-28
Message-ID: <20131029073006.6F31952C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-28
===============================

        success : 67 
       failures : 39 
       timeouts : 0  
          TOTAL : 106

Classification of failures by reason
====================================

make: *** [uboot-tools-lega... | 7 
    trace-cmd-trace-cmd-v2.2.1 | 5 
                 qt5base-5.1.1 | 3 
                  tstools-1_11 | 2 
               alsa-lib-1.0.26 | 1 
                    fltk-1.1.7 | 1 
                 binutils-2.21 | 1 
     xlib_libpthread-stubs-0.3 | 1 
               libglib2-2.36.3 | 1 
           argp-standalone-1.3 | 1 
               libcap-ng-0.7.3 | 1 
                  poco-1.4.6p1 | 1 
        liblog4c-localtime-1.0 | 1 
               audiofile-0.3.6 | 1 
                 libpfm4-4.3.0 | 1 
             alsa-utils-1.0.26 | 1 
            host-gdb-7.5.1-arc | 1 
             uclibc-0.9.33-arc | 1 
                  libv4l-0.8.9 | 1 
                  connman-1.12 | 1 
                    zlib-1.2.8 | 1 
                openssl-1.0.1e | 1 
                rtorrent-0.9.3 | 1 
                      icu-51.2 | 1 
               w_scan-20130331 | 1 
             tvheadend-2b64995 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c2ea69d8ea05138c713bbed030d4fbb9daaa62b9/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/5785af46dfc0b84f5f5f88e80da33af327d1934d/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/7d0519d5882b468a3d41c46dc07817e418c832ca/
    mipsel |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/47f6712464730d12242c1d9df9ec77a7f5014700/
     nios2 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/b5737eb8d2cc2c9baeddae70d51150487cc6bdb8/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/761a3e2b09e9c7e942738b460491795a82a75888/
   powerpc |                     fltk-1.1.7 | NOK | http://autobuild.buildroot.net/results/1ff60ee5a6315384b99cc77455890cca1a24cf7e/
       arc |             host-gdb-7.5.1-arc | NOK | http://autobuild.buildroot.net/results/d049518576b61e2ca23fa17f3d42e6497b2c5384/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/47f0a114eba119a5e785795607cfc877cc7ccfbb/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/564365ce4f1c5f66007a9a481de1b3267d9073de/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6e1669bf5a33c3e651f90db10bc545843586895c/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/d6c9dd01287de26fdc6588fd238c1f6541a68c76/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/9bdceedfd6b9e98ad212255156cfcfba8803907e/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/5a2e44072f35852233bb3efab55cb268ed29fe49/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/98dcd4063c88523ac51a6fd0216de582118036e3/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/12eb58aa03a6e2df0d7ec22a86faeaf794c445e4/
   powerpc | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/a7fde11d8331684b4478dab2a522f62374e953d3/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/6cce109aa06b7f7bf4a992997ed258633257e7f9/
       arm | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/82a81f94f4cfaa08c40a06efb259868a4aaa8570/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/3f6a00dad104aae9ade171e4ed7e18c71363fe85/
    x86_64 | make: *** [uboot-tools-lega... | NOK | http://autobuild.buildroot.net/results/c6f45bff85557bb1f5d4acc5fbbeac0e7088a808/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/541c721666ed5d7319237881969af99897b34010/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/26093338c234f89a563c048939b52d4d68de8cf4/
   powerpc |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/7e38d3e60af81b1eb7d76017195fecbbe0f3767f/
    mipsel |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/77e81ea3570b564a5a0b2e835d61109921eeb052/
       arm |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/f2ce7657b4698bb7b162de39895cd3a19bfa9fc6/
       arc |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/e6fbfd4cb764f415c6295bc5a29ea8829709d939/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/536c3e3255ae6ea7883dd7089367089464ba2698/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/56e0174996b3dfe119801413725d0febcad152c0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f3a95c6ecc1e7576624e184ccd6f03a90e8c1854/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/38413e7911b50416874a636e89f7b92da4c3d45c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3a64bc6a79fa82537e6cd03d89f1a708941a44bd/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/ab5b53117e20140586832d11ca8d7c204ad42d43/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/bba5d929ee31d64e7ab9c4d57dfbba0e21dc53e4/
  mips64el |              tvheadend-2b64995 | NOK | http://autobuild.buildroot.net/results/9c2260c9b55b62e81baedb0dc917338f76c8e971/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/a4857294f82586e340c5dffbc7fa48a107f3b3c9/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/6ae3e7b9a913de3d046095e99ea209377f7bc821/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/72a83256fbc990ca21d3252566efb3ab8b37892a/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/98ff6bc59780c05e0b8e03083da18ed8a156a06c/


-- 
http://autobuild.buildroot.net
