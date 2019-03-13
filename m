From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Mar 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-12
Message-ID: <20190313070048.2E7CB871F0@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   1 |  27 |
   2018.11.x |  23 |   1 |   1 |  25 |
      master | 203 |  44 |   1 | 248 |
   2019.02.x |   1 |   0 |   0 |   1 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 
                       unknown | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

microblazeel |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/513b42eb462163c1f12e8f9b0a209744a9a0c2dc |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/fc7be567c6ae4b7fa83711fc81484c31bac829be |     
      x86_64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/bb2d35730e354c4e2b28aba5e695822605dd0e57 | ORPH

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                gst1-interpipe | 1 
               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

     aarch64 |                 gst1-interpipe | TIM | http://autobuild.buildroot.net/results/572b03b2b9c3ffdbb4fbce4f5c7780cb30ca42da |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/e4acbfec812cef6faac1b3c4421039cdccd546d8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 16
            optee-client-3.4.0 | 9 
      host-uboot-tools-2019.01 | 5 
                   glm-0.9.8.4 | 2 
                    stella-6.0 | 2 
           uboot-tools-2019.01 | 2 
                  brotli-1.0.7 | 1 
                   dvblast-3.4 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                qt5base-5.12.1 | 1 
              qt5enginio-1.6.3 | 1 
              swupdate-2018.11 | 1 
    xserver_xorg-server-1.20.3 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/d031274f7ef14eae282a7e54bb45f3d48bd6ec74 |     
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/3dfc527bf37b5f5bb20e3a573319a23bd5c9a1f8 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/49ca4b50e11fb0a7e90423649c3c7df4e7f52fdb | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/52c59a8ff87c289eb4a872e1a52cd1a3a766efb6 | ORPH
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/935b387867763bde5f7f17ea84866add55fb7541 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3d166d3c43cf8ec8e5bc5d536842c69d560e4216 |     
        i686 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ef1805ab038f77883876cd3383fbc8f84da11af6 |     
microblazeel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ed6b0443142ac930b6fcbdac4f7b15c9786aa3b5 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/b4161f3a1cd784750c5602f0541c3855929d98ee |     
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0226e0994f29f390a9c737a200760555405d1d58 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c2d60558011a7a1fb56b33d4ea0cf457b39c235c | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5cc1b99e7e1a0e065706e53e04f2bf7b2a8895da | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d04fb78361b8012873bd630a1da254cb8b86b5f3 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/abb7f062e0a599b9666d4fbb48543eca40c9b1eb | ORPH
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/f16ee3e0ce9e052c5ce5684ab91626ff5fcf2ab7 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e3c47b73d16602de11521cfa3d3d0f333a80696a | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/282652638b11797caa23e929877743971c4bdcec | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/2d7759688734815af785995dbab6ff6bf6e69448 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/1808d912651e4e23da0d9ea9e49024690a88cebf | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d8f8ef19999a1df1f12736989141a572817c64da | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/352c039f8babe93d8d5945aa611d24b7e82686e3 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4c19dd53a7cec9f05f2d9487a4d4f348532d3585 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7e5bdfc25babf0f43d1bbf9049e9462720807388 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5bc46ef702043f21542b1ea2d504fab7fc34c9ea | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/721e61328f303dd8f5af8867d968e709ae1639ea | ORPH
      x86_64 |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/d773979a02f03b0dbc2cbb9ae824f45861f37a28 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/393ee0c94522d287ac7a4db8ab418c363558bc02 | ORPH
 powerpc64le |                        netsurf | TIM | http://autobuild.buildroot.net/results/e3384aa2040b40c63b72571896b554bd1260e61a |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/cab3b6498f9b00a31129efab91478d3fc6108eab |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ca274d11dabde900e26219dca7762a297db44e6a |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a75533ec4d41391a2920db5ede41185401c5fd21 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9b461b492295a3d8ac3c35b28078017c20c82500 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/61c7d63e7c200cfea051133d47202de9ec58fb8e |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/92c6cf483abdf7bef486c6fba2e36e60e92207dc |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4f7a9032885d7ff6eba59699ca5b98cb2828e4b6 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/83bec80bbb2c2a5f69b7ec33454ff74bfee3a198 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b5a7fbe504422625bbd8167aeb7a43abc7983914 |     
         arm |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/a102fd5f6db43c6fcafa5bd3e6bb26b16b77f485 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/96d75f3b0694c16c18300e6b722154eb6d108ddf |     
      x86_64 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/cd2c6de0b62be0c608e1ee93ea09270a2b149715 |     
      x86_64 |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/6cdfb5d5227446e67e98284909ea872980a5ae41 |     
        or1k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/ea7969e45e6c5e99ca99fff4e2ed2b48c1c254e5 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d205a7a58b19491d72624de06d0e3cf04618515c |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/15fdc0c0439bdf6a3eb0d9ad6f2ee7c4dbd7361a |     
     aarch64 |     xserver_xorg-server-1.20.3 | NOK | http://autobuild.buildroot.net/results/68c668faeffa1f2c4aa9e784f5387d5020d89428 |     


-- 
http://autobuild.buildroot.net
