From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 08:00:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-26
Message-ID: <20180727060021.9DBEA20756@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   1 |   1 |  14 |
   2018.05.x |  26 |   0 |   0 |  26 |
      master | 134 |  83 |   0 | 217 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    gst-ffmpeg | 1 
     qt5xmlpatterns-legal-info | 1 


Detail of failures
------------------

microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/cc89081bdc346cad013b5119c1803a799c0d2c31 |     
         arm |      qt5xmlpatterns-legal-info | NOK | http://autobuild.buildroot.net/results/f1e0cc947d83c9d136c7d503702c035f926af935 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-dtc-1.4.7 | 27
                     dtc-1.4.7 | 10
                  boost-1.67.0 | 7 
             gnuradio-3.7.13.3 | 7 
      host-uboot-tools-2018.05 | 6 
linuxptp-303b08cbf55096aba5... | 4 
                cgilua-5.2.1-1 | 3 
               aircrack-ng-1.3 | 2 
                  dado-1.8.3-1 | 2 
              libostree-2018.7 | 2 
                  lpeg-1.0.1-1 | 2 
                    ncmpc-0.30 | 2 
                 opencv3-3.3.0 | 2 
                 copas-2.0.2-1 | 1 
             coxpcall-1.16.0-1 | 1 
                cutelyst-2.5.1 | 1 
                libmpeg2-0.5.1 | 1 
               mono-5.12.0.226 | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.8.3 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/ad36dc4ab3a541da078b64c39ab3042e1e4feffd |     
     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/3b42f8b898637b3cfe0684ac35fa3c4fb8bc2f49 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a819764ff2252b3a757a2c8d0d9b4f1478e10e59 |     
        or1k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6e1eab8c150a436c79d7811bf02591415fbbf0e8 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1bfc8b682111b98540c72b1ae04ba3b71b08a1bc |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/135641cdf62198bd2b466f582268dfe2b08673a9 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bd0fab4e499725f294d0730f016a7bf5d1e6b1f8 |     
         sh4 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4b463107ebbc317b9b1532fbd24f534776a4c9b9 |     
    mips64el |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8a30a0f8cdebe06d79fdb33ca6ed41ef2f9105b1 |     
         arm |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/d54b60f209c9f0b8c578a948354a1b85e4dec743 | ORPH
        i686 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/676380e6e82b3cf395a449e5c323be566843bf9a | ORPH
         arm |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/529e4a23259edd5f89bd5e5ee505fbd95baccd1d | ORPH
         arm |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/5a11428977a3cd4f4fa000b680f8c7de555795a6 | ORPH
      x86_64 |              coxpcall-1.16.0-1 | NOK | http://autobuild.buildroot.net/results/3329e1076f2a8259091ca071fe257860c4a6ef07 | ORPH
     sparc64 |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/c4879cf646579340f2a8743758e4b908486cc8f6 |     
      x86_64 |                   dado-1.8.3-1 | NOK | http://autobuild.buildroot.net/results/347e5ed0798bad2c5ffb7ec5f721ec38d74d24c5 |     
      x86_64 |                   dado-1.8.3-1 | NOK | http://autobuild.buildroot.net/results/7ce4560cba5ae451ad9d13fa736eb4f2f628f237 |     
    mips64el |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/78234e50c34b7dda2c480dfcfa64597cb4b033ca |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/21dc086c597446a0e00152c19b8db161b8dfe025 |     
   powerpc64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/8d5a170bdcb928ebe7270ea39bce2cb1e7587513 |     
        mips |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/dae5f7f2c9f48fdccbe6113fb482c8eddbdccc38 |     
     aarch64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/17c4468cf5feedbd358ad486c86afe4eb0269654 |     
       nios2 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/78e41ac31c69af2a112dcb47936751e8809a025e |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/d40c8c73c437723dc4346aec0864e9346cc9fa9c |     
   powerpc64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5c23123016fa99fbe44bbabb9adb53c3f9327de5 |     
         arm |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/2b236419f78c242df715c51081a19a3d53a8594b |     
     aarch64 |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/0a683afe797b75a4db7df2beb15903f3a1307c67 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/611c22e5ad9a8a4f93ab0c9ba80fc265fba7327f |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/bc5b7f7748016552d1303b9cd907c25dc4bcb1dc |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fe60ce4e56633c9fc0987611681e0d3495f8abe7 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/dc56fe7f865bb705f1692014ac366f2807cd8fc9 |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a017ccc9fd74ae779f49aebb05740b4fd48171f8 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b7fd87582ca45d283f7ca56c144d8cf8e18d9ba7 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/2f80e6f79f243ac387e91db6ba21c79f80472c90 |     
  aarch64_be |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/016fa6bd6e1527d8bbe53e09ef2cdfb6f1f6a9da |     
     aarch64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/cc317f06836b485555f7056d767f7cdbb57f4d4b |     
        m68k |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/6d8940fe00f893a2044df748d44c2f0c89849528 |     
    mips64el |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/f575eebb24d46bba0f170e4130f89d49b53c6165 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/fae9e8c8ab3c05ad862bab12c0a4cb35b0a9f5ee |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5ef9bde066e43cf7c3656548f917835f6fe08a70 |     
         arc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/168d977921f151e9445c429cfb4e05f2ee3eb4b3 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/0841e611b136a663293d986b1a21bce072ddbbd2 |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/6db5c8d0a0c85ad0f2769696b3a5165ab8208b51 |     
      xtensa |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/037ef6fd58f670c76c70d15700b98c1415a203f3 |     
      x86_64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/2f472fd338b861ff68cd43b3353e2e16a3d1a97e |     
         arc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/d25ce500098f5e0bd0e1450c0129c8c9aa0fa02b |     
      x86_64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/66e0c23f112f566f15498c0dbfe77c7ebdfc7007 |     
microblazeel |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/83479c23ec8704f3b2c90e736c2c7f444e243981 |     
    mips64el |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/fb564c8a8d459bed1913adca0706e7058b808733 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5020df303329deb55f33f1e75d5d3d2ba4292ef6 |     
      xtensa |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/d839638eba85e27472abd286cc6041cf61cb23fa |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/977636009ea3a3c6c9af7bcc78797e2e390a1b43 |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/70c4edf0fd4a38a3a79711a6c49f82f2cb3f0181 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/362d7ca26864742ae2cac3e7989ec8b055019218 |     
 powerpc64le |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5cdf4ff46cc8c7418c1cda99a550b5f0ea6738ff |     
      xtensa |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/c7925354f88e6b8f3223a029e17ecb72f4c37f73 |     
         sh4 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/db80ef1acd12acc985d28f08878a9c94b6c49d1c |     
      x86_64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/d60e19f57dec998acc61f2f7726e584c650296e1 |     
    mips64el |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5558fa275167a6e86ffa0725863d7e36245b5e29 |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/f4fcc8380f51ee2fc9654fdf5edb80773aac2467 |     
       nios2 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/a3ca0869594a7b4df2191c980131f8d89482aa1b |     
      x86_64 |       host-uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/b603dbb1cee0b98bf1d50c01c4e150e1698b0653 |     
        or1k |       host-uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/cdc98e4c0de959274a7dc1f73817c59fd923c14e |     
    mips64el |       host-uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/6540cf9d250907c249037b350eb58cf5a2cfbf3a |     
microblazeel |       host-uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/21ec3bf199b74b06b7dab2f30dfc7f0ba9e83455 |     
     aarch64 |       host-uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/c720224a8d343ef758b79b8cc41b32c445208654 |     
         arc |       host-uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/c5aae78db9393291c95b3e320c5f1f875cb50a86 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/942fce38f178f136818509d6fc03cf021f21930c | ORPH
 powerpc64le |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/acc45e914b4e726c994264f7486fc9559b27d544 |     
     sparc64 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/eab48d381a224144fe978a45cbb0490885ffb5e5 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/90ef2176c05518b5a7d2406972b792ee907dc395 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/4fc7b203ccdb4bcc3e046925f045dec72912c610 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/a481073819d4c692eebb69663b10247e89905349 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/0ad8ae52e1476bf7cbd620a1549334b5d76c6c9e |     
     powerpc |                   lpeg-1.0.1-1 | NOK | http://autobuild.buildroot.net/results/fa291a4b6ff74ef895a64f941cdf2e42bd5d9ea4 |     
      x86_64 |                   lpeg-1.0.1-1 | NOK | http://autobuild.buildroot.net/results/66de049c306d7aff66894d53e2f4fa755fd01594 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/4fcac146f0f55eb459dc6d03e1c04ae4d01ccd44 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/fa3a8c221fd1fac04d88febd38a340e1dcf200b6 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/77b1af810709e4b78bf041df39fddec4a507ac5b |     
  aarch64_be |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/69ba4251acfa8c1b38e7eca92d41887249c58db0 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/38ccc0b5ebb373c032f9b8821ef446ab118a8dd2 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/ea118f1657ddb9bcc9d40adb0538801f793be2df |     
         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/39821ea97c4950b790cb90fb17211ae17b3e19c3 |     


-- 
http://autobuild.buildroot.net
