From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Sep 2017 08:30:56 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-15
Message-ID: <20170916063056.B11732098E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-15
================================

      successes : 144
       failures : 32 
       timeouts : 1  
          TOTAL : 177

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 13
               librsync-v2.0.0 | 4 
                   luvi-v2.7.6 | 3 
                  boost-1.64.0 | 2 
             lttng-tools-2.9.5 | 2 
                  stella-5.0.2 | 2 
                    gdb-7.11.1 | 1 
       gst1-plugins-bad-1.12.2 | 1 
                   jamvm-2.0.0 | 1 
                 lcdproc-0.5.9 | 1 
make[1]: *** Waiting for un... | 1 
                 mesa3d-17.2.0 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/1b87e438af18d57784100789e4e55f421b3b30fa |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/a6f0ff19989a5a0c0c877c5da295e2332a8e1292 |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/1fb0c28a68df624efb1eb4f9019203334a178bbb | ORPH
      x86_64 |        gst1-plugins-bad-1.12.2 | NOK | http://autobuild.buildroot.net/results/223edc4da0fb42b0200128fccec3a2aa6796fab2 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/e4880d7fd5532dbcd62235cd8335feecbc987c02 | ORPH
         arm |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/464cab39d9acb0c7cc22655444cd8382720d705f |     
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/9d660640c03f0e8f827ffaa6abd72e5b00ea61c9 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/bf92074499407c322ddb2475c4501b174195ac88 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/7e270a00c7afd14cf34d2eaa641fb6d2d4f7398f | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/9e79efe0ac438dc66fb34f56c14ca946b69898b0 | ORPH
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/add97b4b3f45841249f239367452205c38d4e4df |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/18fbf00606afaef537dc89627420cd5d8b64f4ed |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/82d5f0f05d3be08e9e7398c28d271dbbabea1e18 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/86e6e7ef50d7cd92e364f1f355708c0c3ac38be5 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/28d479759cafcc04f247524e778e19bfd30db287 |     
     aarch64 | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/494e8f34e2c9ca25b60be8c5723715dac10d9b70 |     
      x86_64 |                  mesa3d-17.2.0 | NOK | http://autobuild.buildroot.net/results/328efcf87a957b21e01ce0a13e82b6018be95ca8 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b926b86cbd077b0b20e407a3476eaf08fadd0293 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/bc08d402d8f1b7956ab31f7adeb12cc254c5f996 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f5d3e1cbe19fe0602a6455fc3855b70616c8237c |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fa42b61d09cdb7e02a3c3a21d7d9c51e89ce06b8 |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c88c4f81ffe73fac8a24a2069ebc6fab639bfd3e |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/2e03f0bbc499e45f454c6ed47bb0a722feb53423 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0fc956ea915e48a2b0e436d3ea81f6d1e388c9d9 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/f6c8dda54da6fb9295af5bd0a6a4697419673fea |     
      x86_64 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/aa7e228b3794cce38ce65f5a9f5f2a6b5fa31530 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/807363baf13ff6d5277b83ab68ace5eeaf0fa010 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/041ff9dc42704e22c94f555a269101e98206d65d |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/6ddde463b6871cdec4fcce734667b5a29f06dbe4 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/cbb0dde633bbba34d7020142f66a58ded0cc864a |     
         sh4 |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/9ab5772f01236eaa7def66a2f443f13efca8c34c |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/5a4a194fe85e04ab31b146367c5a45e4f7688fca |     
        m68k |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/3925a07b32deff7741445721c81c147388ef0d16 |     

-- 
http://autobuild.buildroot.net
