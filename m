From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-12
Message-ID: <20130913063005.87CBA4600A2@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-12
===============================

        success : 74 
       failures : 75 
       timeouts : 0  
          TOTAL : 149

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 8 
               nfs-utils-1.2.6 | 6 
                   squid-3.3.9 | 5 
                 qt5base-5.0.2 | 5 
          host-protobuf-c-0.15 | 4 
               libglib2-2.36.3 | 4 
                  tstools-1_11 | 2 
               qt5script-5.0.2 | 2 
                  prboom-2.5.0 | 2 
             alsa-utils-1.0.26 | 2 
                libtirpc-0.2.2 | 2 
               alsa-lib-1.0.26 | 2 
                    zlib-1.2.8 | 1 
               libsigsegv-2.10 | 1 
           argp-standalone-1.3 | 1 
                libecore-1.7.7 | 1 
                      pv-1.4.6 | 1 
                directfb-1.6.3 | 1 
                      gpsd-3.9 | 1 
                 ffmpeg-0.8.12 | 1 
                 cdrkit-1.1.11 | 1 
             dosfstools-3.0.22 | 1 
     xlib_libpthread-stubs-0.3 | 1 
               audiofile-0.3.6 | 1 
                    systemd-44 | 1 
                 libpfm4-4.3.0 | 1 
                      qt-4.8.5 | 1 
                 cairo-1.12.10 | 1 
                  weston-1.1.0 | 1 
                   attr-2.4.47 | 1 
               qt5webkit-5.0.2 | 1 
               w_scan-20130331 | 1 
                sqlite-3071700 | 1 
               uclibc-0.9.33.2 | 1 
                     apr-1.4.6 | 1 
                 dropwatch-1.4 | 1 
                openssl-1.0.1e | 1 
                protobuf-2.4.1 | 1 
               binutils-2.21.1 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                  ne10-88c18f0 | 1 
                  connman-1.12 | 1 
                 netsnmp-5.7.2 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7b2f8e3fd3a5f2a896c6b98c7de67cda65ce21d1/
       arc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4281138813963d7f389a9bdd188debc83a6bbc97/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/d68b2f72e6d37c79d069098f1313c2769feda0a4/
      i686 |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/f07b9b803bcdd72f01f00f9b2c00d17d27903037/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/fee052b3e7c3b7a1339d6d82c21e0b0430c033ae/
   aarch64 |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2f85dcb30f90a01c7b0fedc09490978b733de444/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d169e03e9df4d2108da4c23286aa48c426764727/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3afd5381015891d5c1d70ee4ae6d4a5e736ebe81/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/ce65106d0142d0ddbeaf9b1bd2b939f64d6af10d/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/9fe011e8612aaabe87872790d48e66e3ca30a449/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/15d4289dfc96ca547ba14cab098d9e2de84f6095/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/297a9f5e35568392be2a15e354f18d052899a2fa/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/d83d748217ed5df8fe552b7c393faf3d91f0d313/
       arm |              dosfstools-3.0.22 | NOK | http://autobuild.buildroot.net/results/86d40c347074ace9ade5c83da3bca291b76b1bbe/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/0495b1bedfe5fab9666c0d00e07dc1ee580ea508/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/3584bed4feb12b3b4534131888f5c2b079a7ca81/
       arc |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/bfa5abe350aa4d23d91d89edd90dd8adad2aa3ec/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/45d9ebea5744aea4dfba806f045cc20459727920/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/eeae3b2eab231d2af82d5ed3711359043b9dfd43/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/470d10a9043554c15a8d3cd65c805d8a585deec1/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/e906b20143d4d668f6d161e81225ccb29934414b/
      mips |                 libecore-1.7.7 | NOK | http://autobuild.buildroot.net/results/055e982cb89634d8603a46c934b1638f6251b8e0/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/bd53b641c644580811a40f3ab2b09cf95e5539df/
      mips |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/09d5e915c0aa946980c1293cd7db0977713624ef/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/a2e609ecc3175cfbec000055d2381db8da0e6137/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/54062479de20e047ca6b1e9924d0edf43ed8d627/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/34eea158bb70383c7c104e77c03ca5e8fe9dfae2/
     avr32 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/849161c785a917e2ce186c244705580c2b70b78d/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/39228f34ad6bb868f70c6c660f70aa78e26a0cc2/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/84098c48a11af7dd77348a00eaaafbee587f6045/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/a57dffc5bf1b728e9a49643c2254f7b62888f2de/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/6655ff38b1b299b0982534af15d28e55ece4904d/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/399fa09fccdbb1ee87c37423b103efa279227a53/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/b623d4e6d5ff4334664976a2f16e75d5e4e63dc8/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/5fc2caf187aa95377c888598879ffb8a0c60169f/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/8a392aed42bd059df5051cfa2c5a4f59bf6fdfcf/
       arc |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/d6f0f3f84b7a5a767c8cb78d70c46a664397f2f3/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/93ab8ab2d8de7b5222af6771eed49da9f00b4a1d/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/a7fabcf61d56bca4bb005a91f8f367ffc8474ea0/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/1f75659136b5ca6e3ff1bf42262098b3fac28e3a/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/6c7f54884c2a1aeeeb5125c9428f49dbe1299e39/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/1299b30d817bc90c5afb1052885f8a706b381769/
       arm |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/ec29d623c58a79a4cacf0e206af7d3531e4532d5/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/9ff50a0a58b897881378bd3546b7e610bc6a959e/
   aarch64 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/90605c531b8534e1b456680911e709e498a1d700/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/f49b2062fc0b9a580fef2d7df79716de7642ddbd/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/e840fa6dc060ba021fc46dcb59a38cc2bca9d955/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/7a1a9d5222a44035f3cab73c5854b122f9b560ed/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/718c190f58b9e705f048478d2a17413a7411b5e0/
    x86_64 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/898ce8db4ba0890e4edd4225ead30e9b20d73803/
  mips64el |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/976adf3e1293a0203ae7df7b570429dfee864810/
  mips64el |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/c77f8907dde7a55bd1c7d1b4868669591b63e8ea/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/b6b26568e4538a5117ddbedc79d4f1ca23c2dc65/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/add9f1a4cb5cd5a18cae9ad6ea53240572539e18/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/e8b3c4b91768579eca30ef588dbec0b159786109/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/9c0741c805d7c57c210cc8b8f7a2cb9c5b2504b7/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/9759e11380058314e5d760d342fb0adc581f8037/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/81a1c1ea85020b5903d59818177dde68e544ec92/
      sh4a |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/ed3d1b4ab4800faeccc027dfd0e926a813272997/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/ca0e4470557615ea2fb90a1410fe7d450a993614/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4fc1d30643b2421cd29c9cf074281ea10855c445/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f40bca711fe4c6679177ef39d9d413c027b9ec98/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5dc71230a98ed77b66e96a848a469d7db971f43d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d89aa27004ce1777739ac09d852b7dd8d1e14fa6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/12df40b271a5d65f6b17dee12626886147ffc280/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/17b768a0e0bedd436d14cf24800f26c07b154822/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9e7f1c4176244bac787facaaff2d67be8bd5921d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0732d9b1bdcbd7b53d653b759c7bda3063df8053/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/02e5b3a593bcb800dc497c81bbde4e7e3eb2b3a4/
  mips64el |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/e226a3aabd0bd9c9242f28d16f5ac79b6caa4733/
       arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/214ddcaa006ccb027f39ee14df49d6c5b8099ffc/
      i686 |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/a62281fc0189e54e52f22541da4b4d22f9bfca4d/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/3528fd66807ec4178836d7c68edd65619914c8ea/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/90f99790554cdd7dbd35e468ed3ac89caa2f3dde/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/d334e7f8a66cf23d6ce7c5d0a26ec8a6abd6025f/


-- 
http://autobuild.buildroot.net
