From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  6 Oct 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-05
Message-ID: <20181006060019.F38E92072B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  28 |   0 |   0 |  28 |
   2018.08.x |   4 |   0 |   0 |   4 |
   2018.05.x |  25 |   2 |   0 |  27 |
      master | 114 |  76 |   0 | 190 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.10.1 | 1 
              wireshark-2.2.16 | 1 


Detail of failures
------------------

        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/eea6c75ec6c2299b172e8eb1015f3fc0cc21594b |     
         arc |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/1bfc5388b74b5b04aa067d5e3c4c3cefd7045c58 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     linux-firmware-legal-info | 15
               target-finalize | 14
 Makefile:709: target-finalize | 6 
              ptpd2-ptpd-2.3.1 | 6 
                     vlc-3.0.4 | 4 
                blktrace-1.2.0 | 3 
                 lvm2-2.02.180 | 3 
                  boost-1.68.0 | 2 
                    brltty-5.6 | 2 
      docker-containerd-v1.1.3 | 2 
              glibc-legal-info | 2 
                haproxy-1.8.14 | 2 
package/linux-firmware/linu... | 2 
               boa-0.94.14rc21 | 1 
                flannel-v0.5.5 | 1 
                libmpeg2-0.5.1 | 1 
        ltp-testsuite-20180926 | 1 
                   luvi-v2.8.0 | 1 
                  mender-1.4.0 | 1 
                    ncmpc-0.31 | 1 
                   netsnmp-5.8 | 1 
                    php-7.2.10 | 1 
                qt5base-5.11.2 | 1 
                sedutil-1.15.1 | 1 
          synergy-v2.0.12-beta | 1 
              traceroute-2.1.0 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/d2a2b9d53c75d2ee2539800c9131cac2752d712f | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/a03edaf95a2429be233b8063645907cd745c77ad | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/6c8230218ab6bd6e011c28c2f72c3e2c81c3090b | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/9232c8869a71e50c3ad49292a3a65518cc451218 | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/30b6f2d57717cbefbc8e9f5fff6696e501d495f8 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/3107d780fa9d9b40c07b58ca1746a5f07c2c2d04 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/08805243e3c65ee6f77ff9d5341be3c0fac40323 |     
    mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/aeddfbfa13983ed90a807356c8beeb15130df7b5 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/b228913a69eca377c7ca368cd157508bc35ee509 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/e8cc8eb1d08fc66f58b63264822fe3bcfd4a8910 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2cfb196db6f33e71d2ab23516f617ab57037cdc7 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/e2480991542352abada01fa568117afafcf2bb2f | ORPH
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/0d40c4e33830dc9949169aacf039e06bc166a201 | ORPH
       sparc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/0b9b23e3d6ab93afd7be6a4990d80129774f61f3 |     
       sparc |                 haproxy-1.8.14 | NOK | http://autobuild.buildroot.net/results/52c88f2f27e1a3c42cf71554cf680da86d933ef6 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/62daf130467252e6b4f8396f170c2c92d165f74e | ORPH
microblazeel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/093cb0ba805c409918e50ea79f777f5f39b94692 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/76fb9fe5925a700d8720dee791db02fcbb60e481 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/91c1e69463b0f53423befdb22a91441213ce6b8b |     
        or1k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/9f2b2aaa9fa5356d000d4f5d63f15f2c3a710ce2 |     
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/801bf38bf9d15a90f0554ba4a9555a6caefc1b97 |     
      x86_64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/748308a3662b24bcea28a6b799c9b5d8d20c0e9f |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/5a71aa404d116564fed8d446a20d83fbdfb2f81f |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/627b7fb964d07c61d7e306d7fd4635387dc7499a |     
         arc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/6924d51ee39b2dc8a8f980dc7e7dd7e132f38b90 |     
       nios2 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/9303d50254b428a4c4543494a693b698b99f925e |     
        m68k |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/067008f9e1ce5b2c875a894a15a646eab5e10595 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/5d66b05dd911fe07bcdeda8e2f181f7cadcb03b1 |     
        mips |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/1ca1ef240eb7e6274b02c1791732ea4334bb3be8 |     
     aarch64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/ac39012e249d4017757e8ae6805f07f62fe27e5e |     
       sparc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/715f87183c7dafd4d57aca5e2d5ed4db67bf3b33 |     
         arm |         ltp-testsuite-20180926 | NOK | http://autobuild.buildroot.net/results/496a1b40d378eaca98e532c03afb47e5291427b3 |     
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/f13e06e50a7e7becdd059c2e58ab2ac66796f144 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/5808cb6aea2fd5e8aa8b513b3875ed7909e9260e | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/8ad160dab39e246c9bde261dbacce2125c93e55f | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/3f633d43b8c7c9e076fe1afa2c07861f56878c1e | ORPH
         sh4 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/f23173c05636941cecc384815b49f16e5eeb3031 |     
      x86_64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/af82eb7e023bd2feace842dd856059b0252157d1 |     
 powerpc64le |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/74851fd0bd43110d6982833974c1e826993f0831 |     
    mips64el |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/bdebe5fe2e446c07d0c3aee54095485d637278fc |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/e3c1e79952e0d28221795d1d701b26927de88440 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/6d4d5cfd8c5028042dbfbace4b33ed3cd47bb08a |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/202ddbde63d098357f44cdf4fbcf0bd8cec5ab95 |     
        m68k |                     ncmpc-0.31 | NOK | http://autobuild.buildroot.net/results/bd5f2d89f6de6d81089afc68e9b41b069dff46f4 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e9c8edc8ca359b2665729fd985b6a58525afff9c | ORPH
         arm | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/6626ec09396629aeb83a331e1ae4658b68dbf35d |     
microblazeel | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/fe97d4391031f2d56498ee2ee624cfedc2e2e896 |     
    mips64el |                     php-7.2.10 | NOK | http://autobuild.buildroot.net/results/8da8b56b8633b6a29ad26b5d6396a2ab1d15e563 | ORPH
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/83a3671a80ed712ea082224d8943cf8f6870eb68 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/dc3501fbb3e59265f9b7606ec6cf0f3360705533 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c3c6c75abd38cb7eff69720e8f8422f8cf45c40d | ORPH
       nios2 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5f8f99222e858f618496129a2f8b167b02c7647a | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ac8879f4dacb448178505bb1bbc171caa2004424 | ORPH
        or1k |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/40186566149e079f68e343e798556f9ec6706305 | ORPH
        i686 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/d81906642a933ce0f8e30036b1c433a64e31fc3f |     
    mips64el |                 sedutil-1.15.1 | NOK | http://autobuild.buildroot.net/results/d1f34942be19889da211e86cfd3b0fc2afd2fca6 |     
        or1k |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/94aa4659246236e64d3736c5686d4e9176e1e016 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/736f9957c612836ac967c16c5c784ee9e6cf0c4d |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/3d07e85591b4f06b654b57d2a981acfa59ac494f |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/ec44627b991450296fd502402fc6091be9b1957d |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/791953658b0eac97ac07a97ff12da14e89c6b8b8 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/aa6c8e99761eca4c2d7f2b9f411872da4dfc576a |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/f3eda683570adb1f3809c18c7198f20d09d001b8 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/e234ee5d0710cd3ffdfe0153813031853edaf9af |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/6a8de730cd8e484516a3d7d82dc6f661f6c93521 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/d2b224989a6a5cf4e74bcbd9d125609b62577808 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/c1567659950201e9f8d1b8ac75ab5e3b77d0bf2a |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8776a23cddaef38cf0fcb81e89d5997a37d4fc9f |     
     powerpc |                target-finalize | NOK | http://autobuild.buildroot.net/results/c14c6273f00432e3768dd9ea7425490cff6e84df |     
 powerpc64le |                target-finalize | NOK | http://autobuild.buildroot.net/results/37a7c2baf946045a6a26f7ed3253742739898959 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/c8afa70523a64e176278c21a6f6b96e0ad44bfcf |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/6eb4ed2652d0ebf6e6de8e3eb97ba9c216281a95 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/4bcc74f5c3e02cd5514b79a25ec4a5bea6c6c26c |     
      xtensa |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/0f5b8bcebc983bc011542faee1faa1b643786ed9 |     
       nios2 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/314c87542f65da87efa6272bffb4d81f85d513e6 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/223666c4e6f4bbcc03126ba0b03d7b9bfb95a1c8 |     


-- 
http://autobuild.buildroot.net
