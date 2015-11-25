From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-24
Message-ID: <20151125073016.2AB38102454@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-24
===============================

        success : 111
       failures : 34 
       timeouts : 0  
          TOTAL : 145

Classification of failures by reason
====================================

                    gmp-6.0.0a | 6 
                      qt-4.8.7 | 2 
                busybox-1.24.1 | 2 
           libfreeimage-3.17.0 | 2 
                   bdwgc-7.4.2 | 2 
                    faifa-v0.1 | 1 
          sane-backends-1.0.25 | 1 
                  ffmpeg-2.8.1 | 1 
                harfbuzz-1.0.6 | 1 
              libethumb-1.7.10 | 1 
                   ympd-v1.2.3 | 1 
                      pv-1.5.7 | 1 
                    ofono-1.17 | 1 
             util-linux-2.27.1 | 1 
               arptables-0.0.4 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                   systemd-227 | 1 
             gstreamer-0.10.36 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
rpi-userland-8306b7c757f4b8... | 1 
                   mplayer-1.2 | 1 
                collectd-5.5.0 | 1 
                 mesa3d-11.0.4 | 1 
             lttng-tools-2.6.0 | 1 
libsigrok-fe473123ba836445d... | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/b3951f700ab1664e06e14d95964875fc8e3dd8f4/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/207f98c7d3997ac726d9c2c97fc35ff0980ba82b/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/af36ec77ce083b16129c8731ac740606692d4a95/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/140f508b884851d2690d6bb13cae600d2ece60bf/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/f59918e5aeb8733f969311cf922967338993652f/
      x86_64 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/09efd6ff37fb258e87c620b62fe8631bffd429b3/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/38a6901d28b9013c3b2ce358d1a81a5675b86af7/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/fd49b74f28f54b121330e5a83a6e2666370dbe77/
      mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/3488597208974691d407d509b2976e0a29017c9e/
      mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/3dbbeba52f8ac7dea2736e2d2eea740af8c45ad5/
      mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/34a8a894a1d23022576979b77a6678117d16ed24/
      mipsel |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/e9a645a4f2ce98b44c9478b90907598a8304dee6/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/284a11ed81c4a4037d5e1ad386da67577b471c88/
    mips64el |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/16c69a0c6bbe694e13d6153e64e5ab430552ba87/
       nios2 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/874c4da3ca7d27551f580994e016bcbd3597a107/
       sparc |                 harfbuzz-1.0.6 | NOK | http://autobuild.buildroot.net/results/fd5df6f0d17bdfb27455a6d9f90057518430647e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/126fafc4f61fe12648dc9efc67a56f7dbc9e5599/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/9976de5802c2ad097da178994237c2dc6201fee7/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/d0111a8524f74c6bc596d85289addbed0e77f8c6/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fe9c5ee9cdc52c48df5efe7560ccd5a0d3cde154/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3580d520da6f8d8f4ffeffcd2b969ebb0851ad37/
         arm | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/684742a65248515129b917025e809930f0b0f736/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d12a875ceb8414a1bf0422ac2c58d478b937bec0/
         arc |                  mesa3d-11.0.4 | NOK | http://autobuild.buildroot.net/results/43501dcabaa3cf312d41856c67a7f38971ce8f07/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8fbdcb499566c39461df88ec82cb2fec27a2cc5f/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/757043ca7e577743a0270c6be1e5d8b42a08152b/
     sparc64 |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/210c594b3abd9df2c7c3da25867301a0d19b1766/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bfb71450acfac086aeb29158abaaaefbcb14c923/
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a363a558fff509221e8eedf5c370d10654cb3947/
         arm | rpi-userland-8306b7c757f4b8... | NOK | http://autobuild.buildroot.net/results/48c8458f789407c2c0f67a382c3b48d630bd3704/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/a53a52e059d47992e89ff4e8ed015605dd45f2ac/
       sparc |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/119dac1c9797295818a869490696bc8eecd55288/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/1925e6797552c079c67652f97ec8c4222c00a6ce/
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/d862c769af68432f415d590986c1a10d69e9d5bb/


-- 
http://autobuild.buildroot.net
