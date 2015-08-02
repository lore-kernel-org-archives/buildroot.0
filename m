From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  2 Aug 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-01
Message-ID: <20150802063015.659D71024E9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-01
===============================

        success : 211
       failures : 70 
       timeouts : 3  
          TOTAL : 284

Classification of failures by reason
====================================

tvheadend-d9cf931f9f7242f07... | 11
libsigrok-fe473123ba836445d... | 5 
                 cdrkit-1.1.11 | 4 
                busybox-1.23.2 | 3 
               linux-pam-1.1.8 | 3 
             expect-2014-05-02 | 3 
               libsigsegv-2.10 | 3 
                 mesa3d-10.6.3 | 3 
             libselinux-2.1.13 | 3 
                  boost-1.58.0 | 2 
                 libepoxy-v1.2 | 2 
    xserver_xorg-server-1.17.2 | 2 
 make[1]: *** [all] Terminated | 2 
libatomic_ops-libatomic_ops... | 2 
                 clapack-3.2.1 | 2 
            gst-ffmpeg-0.10.13 | 2 
           libcec-libcec-3.0.1 | 2 
            c-periphery-v1.0.3 | 1 
                 empty-0.6.19b | 1 
kodi-pvr-stalker-5f6eb1992f... | 1 
                  mono-4.0.2.5 | 1 
       host-erlang-rebar-2.5.1 | 1 
                   systemd-221 | 1 
               arptables-0.0.4 | 1 
                nodejs-0.10.40 | 1 
              lbreakout2-2.6.4 | 1 
                   tinc-1.0.24 | 1 
                  ffmpeg-2.7.2 | 1 
                  connman-1.29 | 1 
                harfbuzz-1.0.1 | 1 
                   dhrystone-2 | 1 
                 qt5base-5.5.0 | 1 
               protobuf-v2.5.0 | 1 
             webkitgtk24-2.4.9 | 1 
canfestival-7740ac6fdedc23e... | 1 
             bluez_utils-4.101 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/841129b8f49df205e1dabc2c2a5be70fa266768b/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7cc91e511653677bb555b827832776555ecf7699/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/5c98e570a8ac8a8a0034327118c39a84488db137/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2a374f70c20373fecc4385cf8d1e80b2b4021c50/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/20aa2436284d1218a409a57735e8fe1448110bf8/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c94e6be4a87d933ea3e1a82f6890bb9739ae2012/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6d6d4e79bda6c28028aa78775c1985604c7a7228/
         arm |             c-periphery-v1.0.3 | NOK | http://autobuild.buildroot.net/results/7c2c3a95e5b19961e093f2caf71cf7291767c9ad/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/cdf2b40963d54ee58991eecb0de6456a88e25081/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7549f9cc2f43726d453ef2931d2377ef3520fa4e/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/8f7847a5eccd2c2bf0a0dcce2494761fc7943210/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/1cd819514f729ce2b9c24048d8c132c6577830e9/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/f36429df2cc48da965ae8f404de42f59808b632e/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/8bb1a1b620aa8b6cbcc27e9afda6f0ab367ff281/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/076911c9027c521d705e1534c07a69981840f02b/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/a6ea8e7a772beb5e758dcc808ad9a493bdac7d98/
      x86_64 |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/27f283d297ae2d93a336397fa0f2f2d1fea77936/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/b6398bda0a295170f54ca654cc43054592178e03/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/d642a9e826a7214d459bb77328e92729bb4d8760/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/b8ddfd32b5891302fb6ef2b724a6f512d52848e8/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/a1f6f20d4f7eafd715585737ba1bcdec718f4995/
       nios2 |                   ffmpeg-2.7.2 | NOK | http://autobuild.buildroot.net/results/90598e971033219c43a4d23737de34e9e5fe0db7/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/86c22729a3d899e0a6fdab7fd9c59abc974f2ce9/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/bc4d26ac78e91a43f4bdbfdfa22a158e3072c392/
         sh4 |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/dca4d7f770427ad6b79001b3d9b7aa52f0eda9fe/
     aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/510d82b2907db6842cd78b7fccc702398b4977ab/
         arm | kodi-pvr-stalker-5f6eb1992f... | NOK | http://autobuild.buildroot.net/results/f982b437935cf1f921559f5388fd4146eb9241bd/
     powerpc |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/37a37055d42c732de06a711b819939e65376d530/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/e162bbe5bbd7db602ac753f99fe5be5f198b61b5/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/7af38943c8949abd106cef8ad03850b28c15ca15/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/020ab575268fbb0359bd84f16ccd23751996b9f7/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/d16f93db8bf5475d1222e7f975ea0d564dfdccef/
        i686 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/f7e6a42f53cb4ca523d2eeefde85c44770f6011e/
     aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/025a3d3b4d3dd4f496dcbf09f2dd279116250207/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2ebde79f74981333cfce8dc1bb3b3410ab6ba13f/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7964d105867c0fb47593485eac58e3bcb731eaed/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/358ba6ecfeb5b8ffa77f709162d62f5d8de6400a/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/178ecf60b80bdf3c1e2d31578f65c2d18594b61d/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/4962889c84157fca3487eb7d01b242b118b6a31a/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/aaacacd2675492a7362dc67c68eea5f2251e2bcc/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/fe55569162fadbc811755f9d0d9aee12c55e126a/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/f92019625e3305681f629e765967bf0d1317558d/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/469afb82e6822795304f4eb1991fee0a1855d6b2/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b73a04baea998b1bf70cf5ada4960799932e25d1/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/3a7eb3a5a5983adc06ae925447cba1d276657289/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/564f59a5c20010129da41f31728cdd37ec9274ae/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/590362b4a0dfe04c2270b41e1111296659437c01/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/043058730303ae71a2ab10f7e184cdbbb87a1407/
     powerpc |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/d989e48664c1892044c7a6d28ade3cdf44d17d4f/
        i686 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/6fd3f6a85df7155e03398d434ce76679e806207c/
    mips64el |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/cd717c9a3a1b0080192e7e765d990cce55513005/
         sh4 |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/c7ba08c8cf54b2e7cf28c5e3454e92a408e724db/
      xtensa |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/abd3e2850ee457fc456de3f1641b92405d995e16/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/68cab6775969ce69339f71abeec424e634466834/
         arm |                 nodejs-0.10.40 | NOK | http://autobuild.buildroot.net/results/be1010a3a31642d49ec3a118858c77fed2f762b8/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/c79fb9a1a2b15a60b6d423a250026f4aeef15415/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/55826eb1f1531008748ed2f1c4bb8a0c60c9741c/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/23f0fae03d72cbf977ab0f9e5778d2eeeecdf243/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/0d6982aa858c1faeb1d5deac9823bf4814441727/
     powerpc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/2cfc5f265e450bb4ab4c8a6d27dd9c5a8799e4ea/
      xtensa | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/b61d582c7362332e0ffad645c90d95d880dacedc/
microblazeel | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/42a25378cdb627e7444f5eb18eb55148509f3fd4/
    mips64el | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/6a871c20204f67f247eb79910b486380c5d4c038/
     powerpc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/5832e50078335fe5bf52cc85b09adc326bccaaaa/
     aarch64 | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/8a62e54332693e18b529250c892858c346e91d2c/
      x86_64 | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/d253c8c9d0773843c462fde0d5005bb14e4ce2c4/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/ddd196577643de5b4f58a0903b19a04513620693/
      xtensa | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/83396af9e0249d122087f5a716367abba7f35ba5/
        mips | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/1cd1da4222c6ebd475fc2133f3f9f84ce038ee14/
         arm | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/d2c85d66bf5759619fa48d915783b98fbfc27354/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/1b372dd04eaccd8a9d24390d509b0a49f692746c/
     powerpc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/f0527c7ed1b2882594d1c527bf7c626fa3dbb746/
         arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/8141ee282dd707fda6536d5511f89db8301bffc2/


-- 
http://autobuild.buildroot.net
