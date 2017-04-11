From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Apr 2017 08:28:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-10
Message-ID: <20170411062859.E4B45207BB@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-10
================================

      successes : 198
       failures : 42 
       timeouts : 0  
          TOTAL : 240

Classification of failures by reason
====================================

                libselinux-2.6 | 13
                 xenomai-3.0.3 | 5 
           uboot-tools-2017.03 | 4 
                busybox-1.26.2 | 3 
               acpica-20161117 | 2 
                 mplayer-1.3.0 | 2 
                 binutils-2.27 | 1 
             bluez5_utils-5.44 | 1 
                  ffmpeg-3.2.4 | 1 
             fxload-2008_10_13 | 1 
                libepoxy-1.4.1 | 1 
                libmpeg2-0.5.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  readline-7.0 | 1 
                rsyslog-8.22.0 | 1 
toolchain-external-codesour... | 1 
               upmpdcli-1.2.12 | 1 
                     vlc-2.2.4 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/e5872fb121d1cc906fa9db026963c36b829a89da |     
         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/4418a93791ad2b0958574724c46bbb73166e65d3 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/ca17a137dad32131a9b245acfdd2e6dff676e783 | ORPH
       nios2 |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/5fced8cdfe743f6310ac7fd8ce5c9edc2093d8b5 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/388922f2312261dc4a24cc45660990cb38d04100 | ORPH
      x86_64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/31c6ab2f0046d5e49b46a42164170a87c60773b7 | ORPH
    mips64el |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/f726494d248960223d1a2b3ac4aa3305a7ea91d3 | ORPH
        bfin |                   ffmpeg-3.2.4 | NOK | http://autobuild.buildroot.net/results/2c524c6504e97c0b6514f9a25076e6693422ab65 |     
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/0783ff60ebf0c222a5ca05433bc481a3a239ffba |     
         arm |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/84cfd9430c25c4bc5e10ad2e9b7d640ebf091169 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/690b07b2de0b5f2d2d6e37bcfa7223ee7cc53fe2 | ORPH
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/f057a830c9c13c61eb407da08b0fa5505dd811cd |     
   powerpc64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/701e46400a605f7fc60c161995c8feab6a3dbd5e |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/3f7dca2b9c5d895304c39723ec0a62b6af3aa4c7 |     
   powerpc64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/eab01aebaca16047d83cdd55a492bf4744a29a86 |     
      mipsel |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/c22906bc6f1c35460d1e551e7d3c08a897199601 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/6993143a3ac530e97fa2f95891c6c6923269a066 |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/55a5dcb5f73b17e1b89cb149662106ab6d977854 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/2bb371fd96c02a1c626c4fa754e12d98257fa1b6 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/6a4ecff6c4a09bc63c790c910cb085b0136181b2 |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/5b44a2fd71785c22cc80fff310355d2c05ea0347 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/0aba1e75335f04775377c9543dfcaf78f835fee6 |     
      x86_64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/7a24bc74d188272c643e5e70cd8c3742dc2b9f22 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/f4000fc30653f7c4096f4183f579d05fc14bb9a9 |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c3cc427303fe03a40a044127dad56b51c9693627 |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6422adeef19ec547c7bc3f8ad3b0d51702015240 |     
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/63ea6f7c2f22a26a835d9bc7f3d045e874bc3189 |     
        i686 |                   readline-7.0 | NOK | http://autobuild.buildroot.net/results/db95385d983285597368c4b6bc9768eeed852c0f | ORPH
         arc |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/995acf477c30b0db52f76584a7875faa1a49d674 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6423c5ca9a14c2005b85c3a4783e463811c02529 | ORPH
      mipsel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/80bc95f537e47a0e66a17f59dbfc50608b1f721a | ORPH
     aarch64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/f5588f23cb8dde79bf180387fc3f1d2659e32429 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/cf315178f18fdd0b9c3fa59c233c8ef007e45059 | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4ca58f4be0e49168ec5f0235ea53047f28f154b8 | ORPH
         arm |                upmpdcli-1.2.12 | NOK | http://autobuild.buildroot.net/results/72c71f63e101939153ab2d49afa9d074ac2082c5 |     
        i686 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/03cbabacf3f2d665266b468c4ffcd1a1ea1b31af |     
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/77638bfaa53562943ae3119d8c53a1295afb1fa4 |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/aa98cede62d2362618366ad268a9d8f6a6bb009b |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/3cd20091fe9a2eaf0bb1b1c2ec6083450fbed651 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/dc3ecfac6bea9f34e096cbc4aa834fcdb0b01a77 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/4f5b78b7cb7f0778d9f7b2ee71e0e481333d3177 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/2e521f184c15c89a11a9968d74e86c1ec8c3d865 |     

-- 
http://autobuild.buildroot.net
