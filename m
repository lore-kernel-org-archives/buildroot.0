From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-13
Message-ID: <20130914063005.CC66352C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-13
===============================

        success : 52 
       failures : 56 
       timeouts : 0  
          TOTAL : 108

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 7 
                   squid-3.3.9 | 7 
               alsa-lib-1.0.26 | 5 
               libglib2-2.36.3 | 3 
               ruby-1.9.3-p429 | 2 
                      icu-51.2 | 2 
          host-protobuf-c-0.15 | 2 
               w_scan-20130331 | 2 
                      qt-4.8.5 | 1 
                libsysfs-2.1.0 | 1 
               binutils-2.21.1 | 1 
               nfs-utils-1.2.6 | 1 
                 libssh2-1.4.3 | 1 
                libiscsi-1.6.0 | 1 
                 ffmpeg-0.8.12 | 1 
                sdl_ttf-2.0.11 | 1 
                 fdk-aac-0.1.1 | 1 
              vim-699f8d8f096d | 1 
               libevent-2.0.14 | 1 
     xlib_libpthread-stubs-0.3 | 1 
                  tcping-1.3.5 | 1 
                     apr-1.4.6 | 1 
        ltp-testsuite-20130109 | 1 
                 libnspr-4.9.6 | 1 
                   attr-2.4.47 | 1 
                   cups-1.3.11 | 1 
            host-gdb-7.5.1-arc | 1 
                 qt5base-5.0.2 | 1 
                     m4-1.4.16 | 1 
                openssl-1.0.1e | 1 
         host-elf2flt-20130904 | 1 
                  libqmi-1.4.0 | 1 
              e2fsprogs-1.42.8 | 1 
                 igmpproxy-0.1 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/7b8431293feca70553a9b3cf24de7b5ba9d62edd/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e55dfeb2638d81589e7c478bb5a0f381d82a7757/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/66710500aa118ab15e7ede92e9d305b06fd41482/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0ba9bffa83c5f81c4cd347332af834be371538f6/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/a2ff93217387a8e8b772ae65364dba76c33d328f/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/875fa7d0940f960fb660cba407904d950508b371/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/b11a23e68393345f01e7fa73aabe8a71c01afbf5/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/cb7998e19d4981a65704d0da1194329beee16997/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/eeec6449d522f6b7af7b118bdd196b59944ca3d9/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/ae826958432a9b2f95d4ba29fb7c489bc147bb9d/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/9b21d9fabe32f99f4b090e83383f0fffba945247/
microblaze |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/55eff43ac05b2809ce1429682de33a320917c4a3/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/c5867f1edcab958efe17323dec907f6bf2d89db1/
       arc |             host-gdb-7.5.1-arc | NOK | http://autobuild.buildroot.net/results/bac8a54da018835955dfd80765deef600494dcf6/
      mips |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/0aca02f3708c554a587a2d2d081ffe61eda4a8b8/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/4e289c75c022dd842872af590a589d1edf9bff77/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/cc0c25984217c3ba245255c1bdc189a590394381/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/719a9fdcf95ba17c23d1bba14931a6ceebcc5ff9/
       arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/b42be39363d0e557f56ecc10edf2863c6916a137/
       arc |                libevent-2.0.14 | NOK | http://autobuild.buildroot.net/results/30edfd3bfa2d051bd2720d56a9327926c0567389/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/15e6f29007c21c38438f6f932e5c2ae2fbf9fa5a/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/89aa80445e897958b06b939dfa4ea39665caa7bb/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b625a7c297a319711a701bbbbd03e9702f2eb139/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/dcf9750cb116bf8d2275b8443a483237927f2b5c/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/fd50e59ac8a95d9034b011010aff4b065247ce93/
     avr32 |                   libqmi-1.4.0 | NOK | http://autobuild.buildroot.net/results/768b51ab739f5377e6733aecf5fdfcad72df00dc/
       arm |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/e93e24d210dc7a2a51758536b7b3964b8a3251b4/
   powerpc |                 libsysfs-2.1.0 | NOK | http://autobuild.buildroot.net/results/11a901b3ec349e1fd4592d4d8a7e9f54115b2e8c/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/00e29d59111ef6e1c8df8f6a7d841fa0fdaf98ea/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/35bce7f4d6939f7204fa96915f025fcc1d35a626/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/31dcd1b19ef1ad212857c04190525cf2e600a1f0/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/90f9f8ed164de0f1d356b9188d872178c166876f/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/e7147803f48d86125470a125f6774556454cea30/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/29efd3d25436c4710a96eab9eeaa47ebcc18af30/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/188d31abb1c2ef8f7b01426aed03db473dcdab0c/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/b931ad72a5843760bff726ec30d19229b420deef/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/b7467278fcaba87803961a79d4ce1c91011fd432/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/16d2079a173743a517c84be50f0440e2d6190740/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/6f45af065772ef0bb2ff7ba18daf54379884c282/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/5ec83d0fac7b3182571d5c3b72da0071b026a417/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/78396de64f509ddf5d7f5ccf2d69f540cd735c1a/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/8fb5b5dec400b6fa6a22ac3b4c8c5ac46423348c/
  mips64el |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/f6a6dd1f3138406d1daa31e5e4ff5d5026b3c069/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/44136e10d91ae211d8f3e2492f4e8dbdda7bd8c6/
       arm |                   tcping-1.3.5 | NOK | http://autobuild.buildroot.net/results/8e2b2722fb036d8e0b3adee09c4a90106e6d04a1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/4e06196aebf68098b81e4748c4d0321b3978d104/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9e2acdd7e12fa2d8b9844f27e48d1c897d70a500/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b2babb221fb5efa2fbb9a4be61dbb4f4e1a91277/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a60cf84f3f548d37655a1acad0bf752561512e06/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/76d0bbd25533aa924015d7ba117ba8917c6dad85/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/28fd8be2381213e848d62b47d6e8e6779300676a/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0938b7710ffd89c29d23800070e823a8516aec26/
      i686 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/15220f53bfe676ec2d4bc6ddad9e5fb3e9974766/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/0511c1af47e1de8ae12921b4d0f9826c16f7895b/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/71c543cd70ba8602a385caded016165cd80a5c4f/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/0a3be43a46729f2817134759c16c7d0ce5d2ff43/


-- 
http://autobuild.buildroot.net
