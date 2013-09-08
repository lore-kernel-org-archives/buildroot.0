From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-07
Message-ID: <20130908063004.F093852C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-07
===============================

        success : 28 
       failures : 55 
       timeouts : 0  
          TOTAL : 83 

Classification of failures by reason
====================================

             util-linux-2.23.2 | 21
              e2fsprogs-1.42.8 | 9 
               libglib2-2.36.3 | 4 
    trace-cmd-trace-cmd-v2.2.1 | 3 
               nfs-utils-1.2.6 | 2 
                    zlib-1.2.8 | 2 
          host-protobuf-c-0.15 | 1 
                      qt-4.8.5 | 1 
                  sysklogd-1.5 | 1 
              gettext-0.18.3.1 | 1 
                 libunwind-1.1 | 1 
               alsa-lib-1.0.26 | 1 
                libtirpc-0.2.2 | 1 
                      icu-51.2 | 1 
               qt5webkit-5.0.2 | 1 
                 binutils-2.21 | 1 
                directfb-1.6.3 | 1 
             gdk-pixbuf-2.28.1 | 1 
        ltp-testsuite-20130109 | 1 
make: *** [/home/test/test/... | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/16d4da835c24bef1f0167292f997b34c7b0b5ada/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/02a39460cea17389631577ef7ec4be896d24df29/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/590c00a3680ad6caa1b5c0ea4f17672984d268ab/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/a7448b66595c8f866a6bb2b1240b0c677f83790c/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/279ea62a6da3290fb574de30afedb26da7d11b39/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/42942732ba64ef6ec6468882f927cbeff4ae079d/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/6090d2a3474b734178189e3eb3d5d1ce121e7b32/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/7ba65c2b115331ca27c19738159b27ab46017085/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/320611a319af6c3a4aa8aed92c5c2242cb6bd975/
    x86_64 |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/7784ac6fcec4df0d90b5d40ce07a38c0c35c7fd4/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/dd7ac66b851da9b772c9c189c64a007d6ebe4f8f/
   powerpc |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/c9552e2c079a00c263b6956debc14f13ecf955f5/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/c43f70257401b9c163876460bc7fe23da7b64898/
       arm |               gettext-0.18.3.1 | NOK | http://autobuild.buildroot.net/results/13899979149b905850faaec061c50c751b95505c/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f709d9ca0a519560cdc8e003fd5157ad941a6edc/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/8d76a2dc1bfbe2ad0dcdf101db0293f8a3c5c44a/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/30a950afbc38b8ee0d48d1017edad9f1ee716cd6/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2c168f10bddd7e22e9ba5d38798ea95b12158c08/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/24f2a6b54b3771ea64c091b0ab128698df45d6a7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/18bb95e30c2698b54aa4bfb8199a27de70d3c3bb/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/0bc3f4c10c2b83fb65db95ad535260dab6bbf8e0/
       arm |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/4f76d7032ac85ad8d3dff34eae017a66310e966c/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/4c7350189281da55fa2c93e190ad9a2c37ece45d/
   powerpc | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/d55320676e42297975189ec0c81c4888ad999f5b/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/3ec66db63fde8f69fac87dfc393aa243f74aaa00/
       arm |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/2b16576d8187712fe3bb33322749546a18e6ad23/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/fb84e8e2aec1d4c299c10f8b7d275c7f2ee17706/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/97016b32eae59186bd3a7dd200f914049e2e655a/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/38a8e9413518459f46f1159e07fd690e80d10736/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/eec59cc09951aaa128114f72befcd981aace7da5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/f0175564890b52e1a66082e8704661617e04ece5/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/7912167b62802e288d2d4d93cffa33ac31ef4a16/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4fa00d6772c3bd5a8ee3a0f22a4a85eb5e6dff93/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/15ad0d64a1954df5e991903e3578c0d29ef5f101/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bc4d7c1c26fc2d389e116a2189ea79c6ecef7a2e/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7d06229facad9be92bfc490588492623a7c26f2a/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4d785cdf33954ec11cdd92863295210a732a2216/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f086463d8a251f1a194035ef2421272f2895c634/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/669533bf09c37b7091d0e3bd9ebd83d3bbda33be/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/733786302bd158168bcf025456523e3286363a50/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/524b9dee66d1766f92b676811bfd30b633849e3c/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/04e185e23265de26ad3a66b850b9b862557e4903/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/6e222052ba40d4a1bba42d42b152730981fb883a/
       arm |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/2cbff3b7de8425ac1feb579fe65ef8106b1428fa/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7be50df76a4c89213e76acbf62fe6e975b928318/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/18b8c11fc70689b55ef47b2b7fb11bafa078967f/
    mipsel |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/07f85ae10d2797b6a9c7c95d93481f1738bd27b5/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ad2e72504af94467cdb7fd52e22e2d5b945d5799/
    mipsel |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/db091ae7b177d564fcd20fcb4ff5bb153fb1ed34/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f37a0dd175ff9e3a12df6012e314bc749bfbe02c/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/979db590a40d985f7994265f317a57d2d9019271/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/b27a8a02c95c6a8d19851717480ca9f09ec7cad6/
    x86_64 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0593cf8c0ccfa484a55e103d30da89b1a2da9893/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/e00554b8f3cdc8304c808602e619102418d3a62c/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/94b6187f4253f6e0857b2ef1bbebf7e1d969b110/


-- 
http://autobuild.buildroot.net
