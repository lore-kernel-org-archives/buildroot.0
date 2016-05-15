From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-05-14
Message-ID: <20160515063023.93BC4102E31@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-05-14
===============================

        success : 183
       failures : 49 
       timeouts : 2  
          TOTAL : 234

Classification of failures by reason
====================================

                    mpv-0.17.0 | 8 
android-tools-4.2.2+git2013... | 7 
                  ffmpeg-2.8.7 | 3 
                 lvm2-2.02.153 | 2 
             ipsec-tools-0.8.2 | 2 
                  boost-1.60.0 | 2 
                 jack2-v1.9.10 | 2 
                   taskd-1.1.0 | 2 
                       unknown | 2 
                oprofile-1.1.0 | 2 
make[2]: *** [code/CMakeFil... | 1 
                  apitrace-7.0 | 1 
                wayland-1.10.0 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
               valgrind-3.11.0 | 1 
            gst-ffmpeg-0.10.13 | 1 
                     rpm-5.2.0 | 1 
                   mplayer-1.2 | 1 
                grantlee-0.5.1 | 1 
                  psmisc-22.21 | 1 
                    ruby-2.3.1 | 1 
make[3]: *** [code/CMakeFil... | 1 
                 libdrm-2.4.68 | 1 
liquid-dsp-df5a459fa05dba41... | 1 
                  connman-1.32 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                libgpgme-1.5.5 | 1 
zbar-854a5d97059e395807091a... | 1 
                     vlc-2.2.3 | 1 

Detail of failures
===================

        mips | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/2dcd74e6b316e08066539ae4fdb67c671d52338a/
        mips | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/37bb9fe0b173243a94afbc89d13655b0f3646930/
         arm | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/bafadedc0ae91f8a1e26d14f30b37d6bb9486816/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/712a2e6f518f0b70aa1f9c008cbd415574555789/
       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/2bf267484b799676da7f5ea9963128fe058b5486/
     powerpc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/381ffd81e90ebf30cbf9f42b82341aaa4eed0d15/
        i686 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c3b95741a5f6622dc9542f9eaefe295a328e2e40/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/73d97843eccaa610e79087dc52f8b396691ce377/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f5dae31af47fe0187c89af66968f575e6caed65d/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e913f3ae9cf3cdc486cf0933b16148dac1f44825/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/cbc2d5a4c87ea8faf5256855e4ba4527293a8880/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/d7b0cacc5d99d8dc91fdeaf770bb5d2b1b1975b6/
       nios2 |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/aa55a2dfec284f2207aa4063aa856515bba4365d/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/822e84c16f7f3855b1daa4f566eee98ebb91b5cd/
    mips64el |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/99afe0f283cf8fa5fab9baa51bee30049afb1511/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/39223c042d59e484594a9792f4a333022b45546b/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/dd5e8c2657909431a0eb5d0ec3b09d94a1972fe4/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/e5157aba3bfbaa003450915256230655401bf5d2/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a4f1b379222ef2980a92ec60a4daad73f9eb0157/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/386f47a35eaf9d81405bb75d0eaaae65b974c277/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/cb716dc1dac4b68911e002b67f70dafcb8226fa1/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ad360e47825652739019f7b3fa0366382bef3816/
       sparc |                  libdrm-2.4.68 | NOK | http://autobuild.buildroot.net/results/3208f9812b4ba921644181f39c99cb102596c677/
      x86_64 |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/a7b92ad68ff6e13d20ff44e955dc5748b2efd6a4/
        mips | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/8b85c443cc8f181dbf08b81f788b742847f0bb1a/
      x86_64 |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/0602cd11a50401284f18595647c9c9f19659e06d/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/a659b775d34f3c62793f8a99674e1091aefa5836/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/084fc537ab81aed278126f173daf99f2699ef22c/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/dde34a7dfb7eb297476ec8b52c0795326d507847/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/266f1efc62964187431e7aeb00115e7687bd3ed4/
    mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/1f0ed55b81fd3df67ce7acb9885fcaf7d64e5190/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/951ab60d74e8e110608acfb53d6a23a7f6b6b144/
         arc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/7a4ab8969e9fef5aefa39c0f3ca1a2c3a3a75b47/
      x86_64 |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/46355c2c9d7a42f2e683fcee8d11c8ab32bd2636/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/caeef637d9febd9950e128c21ce9e28928952e87/
      xtensa |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/a59a52aac66ced76f3bd916f8fae9304025e08ff/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/be8733327a226f5c02080e85ae36a497069a8373/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/490fd78b7b6af6df1b2653e15a65dc154438a15f/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/4a0b8cb8ec888a67f99246ba57272263d5733f05/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/b39dcaf1b19b0649d18eddbcdfc4811a8f8a6580/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/5e64fb3f13a2dbe99f7322b9e70f8ea34ef2eaef/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/e0cc28680781454e1750f315d1ce72f30c9dec10/
        bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/81c0746d87e1d11d56c830c7e06ec3b08bc5086a/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/e105fd2f160bdd1cee88448c0be9082ad922ff3f/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/0f975b69782af335e0900371d306f6b560ac78be/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/4e9b6baa07296e8abc16440587cf7e3abf4e2fd6/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a7d42e157b97eb3552d3521542236b05b4af6e70/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/4dfc81473fcd745a74a723922ed3862d50360ad1/
    mips64el |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/3420ad6aa8e1e8151bf11b43be2c97cbe1dbb400/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/435d780fd5432e669b7241cc5982f624b3cce2ce/
       sparc | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/3bef0a94e818d836e5dff2a00fbb7fe72c240883/


-- 
http://autobuild.buildroot.net
