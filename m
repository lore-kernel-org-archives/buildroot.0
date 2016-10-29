From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 08:30:35 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-28
Message-ID: <20161029063035.F08A610323B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-28
================================

      successes : 175
       failures : 94 
       timeouts : 3  
          TOTAL : 272

Classification of failures by reason
====================================

                bellagio-0.9.3 | 29
                    owfs-3.1p1 | 8 
kvm-unit-tests-5731572b2ac2... | 6 
net-tools-3f170bff115303e92... | 5 
                     vdr-2.3.1 | 5 
                  guile-2.0.13 | 4 
host-mfgtools-b219fc219a35c... | 3 
                   assimp-v3.2 | 2 
                 libnss-3.27.1 | 2 
             rabbitmq-c-v0.8.0 | 2 
                   taskd-1.1.0 | 2 
                  boost-1.61.0 | 1 
              bridge-utils-1.6 | 1 
                    cups-2.1.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                  lcdapi-v0.10 | 1 
                libmpeg2-0.5.1 | 1 
                  libsoc-0.8.2 | 1 
make: ]: *** [libavfilter/s... | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** [libavfilter/a... | 1 
                   mpd-0.19.19 | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
                 openssh-7.3p1 | 1 
                    php-7.0.12 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                    quota-4.01 | 1 
                   ser2net-3.0 | 1 
                   strace-4.14 | 1 
                  stunnel-5.36 | 1 
               tinycbor-v0.3.2 | 1 
               trousers-0.3.13 | 1 
                 xenomai-2.6.4 | 1 
                  xl2tp-v1.3.6 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ee02b9dcf80219b3cd33b698a617fdffc070e240
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/72d2c49e4fc973e0bcb6ada5719b73e9a793b494
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b779c9eb4258722d3fe6855981a2a4483f374f89
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/a8c826ecf9cd945329c51ec7e659f6cb20cb9760
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/1310ce85c13306127d4ce2be49ad2abde0dd26dc
      mipsel |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/07e927de575e4848d9160fab8af3059c18d95cd2
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/ea6fe478afea69badbf06cc96d8b227828a6e43c
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/60fead029afc982eab9a4213c7f79c1bfab13108
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/e728af3e5a5fd541b685529150562e43815c04fa
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/06310e80010f190f457cb9266ab29ca2dec8c409
     powerpc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/69508ff6f34cb5becdf6cbedf563d5fda3f29c19
      x86_64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/8003f0cbc879f6444e52abaab95c14e9afdc2eb7
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/4b3fd5b7e45415166abe7780850c2c94c1fdb29b
       sparc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b139540d85ca72574f777022b3863700f4eed41b
     powerpc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/3a1c5b33fa3da3d99c6e9e53dc8de5ba1c83573c
        mips |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/ece1770f8039420a49c2197feb8424848b071333
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/2b1e10fd35b9fb37932e4d5f0c21ad769a0586ea
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/09d57c62dcf47d3d107330682c89a3f8b4db680b
         arm |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/00b775aaddd27921598b69ed9940a55b9e644dd4
      xtensa |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/800a5f176d8f5f077c84e9d32fa35aba1e7fc838
      x86_64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/c5e4ee59080018187f4f1d1569a332d5aa301163
        m68k |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/08223abd6e123a0bede23bdc8a05e32eb4f753fe
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/1c87a5012915d11f653f0f7d98bd78104e0f2f46
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/4981b932fa9834e1b4999fab0a4a3563b9a20bae
       nios2 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/a79f0b338d9f2ec645f3e80ffbaa783547779162
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/79eefb5153f216503dee44583ed8bcd856437235
     sparc64 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/5f8914a39b9d39f74f089537491d9114b844e7d9
     powerpc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/276f0da0d0c89dcfb784d3613ad313cdea25da24
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/4e63aec15d126a525671e31ed72c2c8cbd5a3606
    mips64el |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/1901fb4e0d1f4866163ff287ef88d7fb019f0c45
     powerpc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/368bcc8753e35547f8ff1feefea10a4f1c03d9df
       nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/620b1cc2165a6d55c180b890fdb652f3a03e1ded
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/de9b410c464c7de14621eaa88545af189f52cdf6
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/81b31ff14f747b7cdb4a755e3bc5cddd4e131d7e
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/1fe3b351c6f07cd3a8d0b09da0329bd3da1a4d1f
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/44a93c3d499ec70fe6d4e56ea420a05615057180
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/504f42b321d4c7f3c71f3602a5203e7d5bf3cd28
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/2a82adfe8fc086f6e1156d4f007ee9875c691962
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/fff2017eb975c430fce12afc3fde3f7b9c28c549
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/3c67dbda8caa5f54cc68e9911950d96c0cf1fee2
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/f66a1af8617bb306271df830a0f3c55e45aa9c30
         arm | host-mfgtools-b219fc219a35c... | NOK | http://autobuild.buildroot.net/results/a69708ea6726a17c0473fc085055c44c61795b44
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/36f11450cf3196fe8e5ebd8096d99be81a1403d2
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/181ce86f2f2d21b48ae4e64362b166fbeecb81cc
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/32d3774c8ae51f14570abf7aaa331a24bab67434
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/8e02578f6841a403452975e1b550048b3611a557
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a3c01f3bae29be332b01125b17ccec04344d013a
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c4cf3d457ad7e1397a0346f918c99f5b69589bea
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/4e371796f6c27be964abd72466896227beef797c
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c8b0a2a9941dc2fbe8b7a5ce64f43b4612f1c41e
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/142b595a572c0c36da59b2aa3694e29dcf3ec122
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1100be55f6efd7666011d90165d695d87ad18c44
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/4e934004fbd0279cabfa37dd92b39d8633b4bd6a
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/7084fb0130b7f20e06c59f238b071ec9109fc03f
        bfin |                   libsoc-0.8.2 | NOK | http://autobuild.buildroot.net/results/c866f0611c6829ba014dc9b913e351a6961e5236
microblazeel | make: ]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/282855cea9cd039e2cc3faa783811a448262edd2
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/ca957a2dbbccbec9402f8666c849379a588a6973
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/fe32c0696024a0493eec98aa0f37efeae828294c
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/29b3ccedbc460a31dcd372de9ca8fbcb392b62cb
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/a5abb16098699321702425d9fe5f2413583f90ec
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/79f1e197ba7a138d4c2ca076dc3ee906b35e9cfc
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/8f43a217ab7adcda4090c41466b7dc8b61d60d98
        m68k | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2d3801a75f103a7c575c577e5110cd329e8cfcc3
         sh4 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2e4ef7ab68d3418d49839b559927a9a7551ac990
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/8141ffcbba665d5dd81d4f00c63c635dd655146a
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/5acf18f3c65394acfaadcb8af9389fedb5aa2fb4
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/cb487a4bf426e7087544b2e14bcce0557a38068c
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/358c9b76be67b41ecd57960752585ff080fae130
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/40cf20780ba48b6d1dcb0f640079de2ab36acf38
     aarch64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/80ca1ca1874a51eb3e3d6575b9b1369190b399d4
      x86_64 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/7a34dca2737a8911c03c7d4256779f9aeade89c5
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/630dcfa2bbbef7f1b44e3789f2bf0ce0d400e8ed
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/403a70e13c077f765117c025f3edf6035a193c4c
      xtensa |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/fbf0bf26b0f3d6bd91a5a5d88215367fb4406217
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2bb1a810c7034c938d49664c4ec2525bbb998faf
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/9dcbf9192f65297eb5926ce1d82797aa39a41dc4
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/7c8fcdcecdafc3ff1319415f92df53a6a2a5ae6b
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/93ef002e022b5301f23954624ba09aae74574088
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/dca366cfe5bcb1a449257bcedf3fda7eb0702d1e
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/f937e07447dca848c24a8e8b8b8655b9e5516386
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0a34577af93d94f3e905e3d8bae76e08888102a9
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/98674d577be6bbf0cc1c49bedb776730213398d3
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/abc8cf3b99858f7897aa57844f3846c26c5b8e42
        sh4a |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/1865dbcf1ce789f69a66ae582b87e402d730d366
      x86_64 |                    strace-4.14 | NOK | http://autobuild.buildroot.net/results/88a4c99d2f7b234a458c50324a4fa27eb07d5440
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/4eb9dba0927f72758ac9bac89036330b00a8a894
    mips64el |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/39492fc13aabac8c0aa386c6e1d7bdb4018cdf65
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/5d158b0c3289ca572b36006f4b546d67b9a29106
    mips64el |                tinycbor-v0.3.2 | NOK | http://autobuild.buildroot.net/results/3050b28f6cb7319cd7d34a86cc16770bc7e9896b
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3383c7051e28efa965f9828bc407e9ba63389eec
       nios2 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/c27a6e00ebdf06e461bbc193aefa125dccca732a
      x86_64 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/2652a42f7f488c928a9d6b8a88c3bbb86c9497f9
      x86_64 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/4e149e7421b333b9e07853acca38a86e05dfcd11
    mips64el |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/7252decffe29e19051eed0554786651aee216573
      xtensa |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/e527d4640443d912f5087f40cb9b2e9f67c0b8ce
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/f497841aaceeeb8e49ec1b619ac4740eeb7c8621
         arm |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/11f1a9f333d1d4bd7f3ddaee034b8f85d84e6c6f

-- 
http://autobuild.buildroot.net
