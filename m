From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 09 Mar 2019 07:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-08
Message-ID: <20190309070050.9222785A0E@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   1 |   0 |  29 |
   2018.11.x |  31 |   1 |   0 |  32 |
      master | 203 |  58 |   2 | 263 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

     sparc64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/02d720eff3cfd6dfbbe3d6356e166529726fde8b |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/1d4b8ef36276c4ce91c2d3d5fbee5e90611896c0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 16
            optee-client-3.4.0 | 11
      host-uboot-tools-2019.01 | 8 
                qt5base-5.12.1 | 4 
                    stella-6.0 | 3 
           uboot-tools-2019.01 | 3 
                gerbera-v1.3.0 | 2 
                   glm-0.9.8.4 | 2 
                   netsnmp-5.8 | 2 
                       netsurf | 2 
           intel-gmmlib-18.4.1 | 1 
                 libpcap-1.9.0 | 1 
                    ncmpc-0.33 | 1 
          qt5multimedia-5.12.1 | 1 
             qt5wayland-5.12.1 | 1 
               wireshark-2.6.6 | 1 
                    xen-4.11.1 | 1 


Detail of failures
------------------

        m68k |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/be5893b507d22a23951efeea20c18642742cef5a |     
       sparc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/cead61bf258d7bcb75567935faf7adfb540200fb |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/1ca73eba5301b2e163e508d35a72099c7fb9a706 | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/e7d0e92664f1da91f5ec9c1f174c6d292e5083d6 | ORPH
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1dc6fd56353bbf782265d95454dd27b2772dbc80 |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0081ad43ac350d638b40387acbdfe2057c9fb51a |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/708d9cd32687b8b80e344f87ff8bb61d098cd7c4 |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5ae125a940ed60f5a398b40223bbcac162d419f0 |     
     aarch64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d2cdc6a75d350dc5481ada4600972c5d4626ae96 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/32b457d7547985d4c5b114dc6228f5099e08feef |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/35523c5635900d305d0ab9fc90408a68a70452fa |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d9acaccd8d127aaca780db41f2edfee971556744 |     
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/51615ae2751c85eea216e5db945e2d90752b7641 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/cc4a5bcd15e4d324a8ec1f5d2163732ebfd40f86 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/8a785def09edaaa09bb6ce64102d9b919ed76346 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/920016d74286b290d851d60a72bef154d8922fe3 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1fd6df457cc00fcff7b664880d883206b5fb39a1 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/58023e9020bd2968a6e67ac967a8aff749cc5507 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/eb9f0b56a36cca7e34e46b04b73b4649f4f1f97b | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0a2409f97009b185333fbcf8eb1d2e0c8a10fe11 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/dd1db6c5ef5cdd3cff293d6af38eba3f02a56a73 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/56859f2720103fc17e73b985b22811bffa78fe52 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/cc1c94c7edd641496fcb5aab10dc65d4f9796e3a | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/045e5ed3068a2a06fd6090b1c58c3f012df5b630 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/36be47a7a32f12ed0a0999284bc3a23a0c2c17fc | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/20ca7b658f0d428d4b07633b4bb5342be8f337a2 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/3a0a149af4060d1001bb0614c1d8e36005c770fd | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/35448afcf7f9bdf29f8a091dde19231ecc0ebfcf | ORPH
      x86_64 |            intel-gmmlib-18.4.1 | NOK | http://autobuild.buildroot.net/results/495bb17ecbed641c5de36ade5c96d0b525156f1c |     
      x86_64 |                  libpcap-1.9.0 | NOK | http://autobuild.buildroot.net/results/0b5d18bff816cbcee11e8645449701722d956de5 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/655eb4905c6e308d34293658acee4fc4e1fe0bbc |     
        or1k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/c0d96563315290eed0d23c0b2c1f335d82777d22 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/dcbf541aac68f688853a999ebf9564d827a6ae8a | ORPH
     aarch64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/8d81bab13feda19f9fd66cacaa83eebbab23762e |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/2a427f7392a55db5ba6a279a481cd77acc3f20d4 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/bfd34521ad3308e73eb33a76437a8185c904b388 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7fb961114d6cded3a30b546ef53a181375060d1a |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/33a79bf89bc3abbfb2bfe8331e0ffc83a7ab41f6 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/13864f238caa846c24cd6993b31946a2321fd9a3 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/0cfe361bfc6fb2731f6d93fae025b9d5d42f6e84 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/bca3bb09189f72270a4dff5c337ced579d81deef |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/0817991b1988efd7787a5ee5c0c97666503f1eab |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ab44d1d6a458bfe75e30d8d58637a558298abddd |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/701c70a58f07235ff542ae549defa5aec32ef7dd |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ec898260c4ce9e9f8e0e4d8f5ec9bd9ddccbe62c |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/bea3929bdcc3d2a9051d85b9e737b37fe6953a6b |     
microblazeel |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/254ca23a33dfa519ca5db52458333deed220aaeb |     
     aarch64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/99d460791de9f179b7a987397dc0e9354067ac22 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/c1038fd0c9cca40c76863bc437a2eaf0b55d2e1f |     
      x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/103fa31121b565507523084c9b51d32b253a3322 |     
     aarch64 |           qt5multimedia-5.12.1 | NOK | http://autobuild.buildroot.net/results/0736b0d17dc2b03af9269cfcfcc3779af1653cd6 |     
     riscv64 |              qt5wayland-5.12.1 | NOK | http://autobuild.buildroot.net/results/e1f83e18be12e210b7beee8972abd609da36ca01 |     
        i586 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/a67171336c945c6acd50f3f817d0052ee259a665 |     
      x86_64 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/332cd49d69fd4710d5511fec02d24cdfd603ea08 |     
      x86_64 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/22a9b009749af2a0862750a1fb2b2dc7167cd589 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f49a48303fd12e121a85158b69d20d647dd8d4ab |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5cba51dd46494f2a87df9cac035aaae5e8885c0e |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1c2a98582e6050c2646ef255a44829d5d7f8ac04 |     
         arm |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/7a41360c325cf1a9bd67d58d753d72b87778cb35 | ORPH
         arm |                     xen-4.11.1 | NOK | http://autobuild.buildroot.net/results/df5abe6ca8b4c8935f3d5c257aef816190771200 |     


-- 
http://autobuild.buildroot.net
