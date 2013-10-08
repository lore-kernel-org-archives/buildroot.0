From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-07
Message-ID: <20131008063007.2CBEB52C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-07
===============================

        success : 74 
       failures : 59 
       timeouts : 0  
          TOTAL : 133

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 11
           mediastreamer-2.8.2 | 9 
        host-util-linux-2.23.2 | 4 
     xlib_libpthread-stubs-0.3 | 3 
                    php-5.3.27 | 2 
             dmraid-1.0.0.rc15 | 2 
                  tstools-1_11 | 1 
                      qt-4.8.5 | 1 
               lighttpd-1.4.33 | 1 
               madplay-0.15.2b | 1 
                 qt5base-5.0.2 | 1 
          rpi-userland-77d32cd | 1 
                      bash-4.2 | 1 
                openssl-1.0.1e | 1 
               minidlna-1.0.25 | 1 
              cryptsetup-1.6.2 | 1 
                 libffi-3.0.13 | 1 
            host-gdb-7.5.1-arc | 1 
                  zeromq-3.2.4 | 1 
                 binutils-2.22 | 1 
                  libv4l-0.8.9 | 1 
                 libevas-1.7.7 | 1 
               libsigsegv-2.10 | 1 
               libglib2-2.36.3 | 1 
        liblog4c-localtime-1.0 | 1 
         lockfile-progs-0.1.17 | 1 
                 cairo-1.12.10 | 1 
           imagemagick-6.8.6-2 | 1 
                socat-2.0.0-b6 | 1 
                  sawman-1.6.3 | 1 
                  weston-1.1.0 | 1 
                    ola-0.8.31 | 1 
        glib-networking-2.36.2 | 1 
               alsa-lib-1.0.26 | 1 

Detail of failures
===================

       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0393b9469f5b8b5f993403a3fb3fe56e00efb488/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/2de1cff30bdde7a685e3902e4ed9cfa18f1b8cf5/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/a6f8c67f60b13bab89c8bd2ca88d3407eead2b61/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/75bc25966d6a738db458d4e167bec9d567b571b8/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/78ae4f20915e474a34aaf0a29719902c313e13d2/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/a1b794fd1203e14a745f76d4dd210e3b1e2913e9/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/015328379d9f9dfe65a0e74afb40ec15cb63c72c/
       arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/2da84bb2c59ea03b1e26fcd2d72a4e93cb5fa3fa/
       arc |             host-gdb-7.5.1-arc | NOK | http://autobuild.buildroot.net/results/6a1a006eb9a752c92e95f0b23d86d96ffdbcd1dd/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/d13eeb409fd542f9dbe6362255513989749b20b9/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/32a5c5c04b471ab50cf38504182b768baac696cb/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/57171949f7fdef56991de2632424173987656177/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3c8c78a5c0421b9079190ddf97b366fc7f0c0859/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/e9359e1fc664950b025a8866dd5774845e718a98/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/41ce836acdfdf05284e502782d6096428a0ba538/
     nios2 |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/99dd6721a5471a1cba152f35c8e2da0bff5057ca/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e3a27a8553890937f43e95d96a5451a2d0f1fece/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/6da18efdcc4312d9beda921930600c5f1316887f/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b4d19e9989d639898ed898881dbfa26471840f5b/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/8cfdbef21198c9feff3101d4374577008748b7d3/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/f5826583b0e11763d5419bc0ff57fd7d7eb2314a/
       arm |          lockfile-progs-0.1.17 | NOK | http://autobuild.buildroot.net/results/288c921473b4607bbae4259b5a89b436a5ed525f/
    x86_64 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/06a45709585f87c5be824e08e7a2d052a2edac73/
      i686 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/3bbe53717e4a165b2d9c4a34d0464c89652e6dd0/
   powerpc |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/51360a91a247e0524023d3d8812e6072a971b8aa/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/e865936b6d9f0f67be06e9ca33375aaf3c1f38eb/
     avr32 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/a480eb7d59c88fde34b4944943670d8bc86b596f/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/ac69ff3332713e3a6681fd1d418f1cb9c1941098/
    x86_64 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/4f1f8bee92ac4933a46813a227ab867c229bb6d1/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/b2890761afed16ed6d9356978e3b91aaa6576caa/
   powerpc |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/3abd4c996b352e980ebc3302ab5d5d9c5d77a79d/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/736cd6111944494f7956ee42f341a0aa2ef7e63f/
       arm |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/d91b64c93097580e1da53b6ccfb4b492f382a5f3/
       arm |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/4a55572b3aaa3f1b82395562ec0f6e9beefbe709/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/084b50391a065976dfe923e1d8db1be1807991c9/
      i686 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/e75a1e8eb0d7e19d5735010501c46e474ea6f368/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/30d514cd9df4516d430f06ed413aebc26d2a1979/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/418e1c66717ebca54886f2401e7045e4d34bd250/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/bc285ab534d9574720576e64efaeb17e6f1c17c0/
       arm |           rpi-userland-77d32cd | NOK | http://autobuild.buildroot.net/results/c3b4c09edee2499e811808018be1858bdee70436/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/071d53a2a5b308c05a19481c2bed220ce6b5c46d/
       arm |                 socat-2.0.0-b6 | NOK | http://autobuild.buildroot.net/results/fbe0bf5f4d6b5de3f622d3519d449f704a6e99a9/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f81b0b2885d8d3386bc21a5b52b6b2d4b0d372f5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/389b113645e6aef44f63ea6a5eebf1f155f202d8/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a574dc96bbc2173e34c28a7526d2852e9944effc/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5ee9b321a08cfebf67adf0e1683f18a311378944/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ea7fc18e0fd041a687f185e2c62644f32f55e830/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/40188b5ecf548151b5b52ae99afec5a6f12bc10d/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1bf619fa20d257629fbc558b101580f42573d0e0/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d86c00305ea1984a3263ed050d39e57f33a2b549/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0a88971864f23be76b991320a9e0c1cb6c2e2e4f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/6e217babbc1918a5a33cea2f8bdffb4796d2a94c/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/d76c12531b82bbcf2233585eb09f6ade8c3f6ffe/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/57367c7f28a399901d14e9988cebb9162aa69977/
       arm |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/b08efd2835779936f2a568f9d5b732e42069bf2a/
      bfin |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/d779ce3438621a5a808435be8bc35465724360a1/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/102d0a5ee47f7598b5ff85df5b32a440bffb8ae5/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/6099baac4bb469ae18aab6512233db25183eaabd/
     avr32 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/466f5185de64d5b48c96b216fa41b7f2aed05477/


-- 
http://autobuild.buildroot.net
