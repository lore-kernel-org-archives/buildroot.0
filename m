From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 07:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-14
Message-ID: <20190215070057.E29FA87D41@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  14 |   3 |   0 |  17 |
   2018.11.x |  36 |   0 |   0 |  36 |
      master | 190 |  44 |   1 | 235 |
        next |  58 |  15 |   1 |  74 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
                  libftdi1-1.4 | 1 
                mono-5.4.0.201 | 1 


Detail of failures
------------------

        i586 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/296064e1bce8594bc0f1c25500ab2ba68d1d762b |     
microblazeel |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/3d203d680e85fecbfae178a21285d6ce6345dbc4 |     
         arm |                 mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/007fc9e253b2635af820c19b8ee45bbf7ab19421 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 10
                     efivar-35 | 4 
                 ibrdtnd-1.0.1 | 4 
               runc-v1.0.0-rc6 | 4 
       gst-plugins-bad-0.10.23 | 3 
                   luvi-v2.7.6 | 3 
               host-qemu-3.1.0 | 2 
                 cdrkit-1.1.11 | 1 
                     gdb-8.1.1 | 1 
                host-libsodium | 1 
                ipmiutil-3.1.2 | 1 
              lua-curl-0.3.9-1 | 1 
                      lzo-2.10 | 1 
               madplay-0.15.2b | 1 
                mongodb-r4.0.6 | 1 
               mono-5.14.0.177 | 1 
                   netsurf-3.8 | 1 
                 python3-3.7.2 | 1 
                qt5base-5.11.3 | 1 
             stress-ng-0.09.47 | 1 
                   tor-0.3.5.7 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/8a79fbc0c6018f9661802fdfe7442322ca4dc202 |     
      x86_64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/b6d46005f0693a3efd026242c7616b3f181f58eb |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/0c2b4c08f5ed9c48176a0ba31d8ed540dff9ba0a |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/24bfa60d54348d1b697d20bae34d29f4283df021 |     
 powerpc64le |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/ab572a858abb243a9412251587ab1fec9ca22944 |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/d5af38ea4528f102dc047fcc2e4093ef476f8ed1 | ORPH
     riscv64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ef6c3920a3a454c9f467e89090297eadba728c80 | ORPH
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/0a2dd2e6f274815d08eff7fa1c931853e1b7c3f6 | ORPH
      mipsel |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/c28e6920f7611a2632ff8a2a2ef7771817198f83 | ORPH
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/6193005558bdcf0094a4da3175b435df73f5d2f6 |     
       sparc |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/4fd86348fa3fd2c1a171a79685587b0d1b894240 |     
     powerpc |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/ceccf52ad770e17ab24e3c06b917b1d1137e0310 |     
     powerpc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/d066647fb3bf56cbc167831988c7c7248ed1fbec | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/711c2f664c5f1a895bd2caefd803201267e47c36 | ORPH
         arc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/d30f8e3dd8cea8e7efd97c5d030ee8b971240dbd | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/26b08b8c1399a9dbab330a84f7f320ff0977384f | ORPH
        i686 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/8cc277d0bbb82a65622173f2a192f76a144325f8 |     
    mips64el |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/e3d6d7c15879f77bcfad2eb07817926e1e9e9719 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/97e3a2f6e05ee428f5c05fca4f81114fef26458c |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/69e34a3eb4801760904d7a39f9b8e72b42bdad3d |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/cf57d38bd6a9aa53e33f1ab606bdf6fce9c86725 |     
      mipsel |                       lzo-2.10 | NOK | http://autobuild.buildroot.net/results/fa2db36a9490818ccda4d7187300b6e2eee0da6c | ORPH
     riscv32 |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/fc927de0e9a42095789fb0a631d5facf14076f6e | ORPH
     aarch64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/693bdba2c01a1b69f56d6ee75094a6a0fc3f40b4 |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/993846af13b741226bd8d9eaba127730bfe6f198 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/43bc5a540914cbd6cd9bffcb4d39018dfbf896a3 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/5342214d7c4c88ade2604ffd71a7d1fcece4dd56 |     
   powerpc64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/c771c2d5aac3e21f908e5a118f3755dbc9301a47 |     
       sparc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2ab0120115b194ab236e2ee133f24153af529fbc |     
         sh4 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d840d641aff40eda58850d39a60d7bc59ce6689b |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3c756312fc6fd4d9f2aaa3818cc3686237bed363 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/2459b010d603dcdb28cf29a3977fa8cfa424ef01 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/09aea1ef23a451bd2a1929c75c5f35b0b7862cb5 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/860525ff6a4f5388c4587e7f147622e2173723a3 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7dc8a67bdae139bea0f23f93624308f53cb7fbd8 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/a25e45dfe952c04832a9743479585db1c4f9c799 |     
     sparc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bde7bd957200034070b7b3a89cc47e032cddb6dc |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6a3cb63c1302b0520c2751d5b9c828bfc80b2f1d |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/f71ddcd17f4991a3caeaac42c81ed97bdf847718 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/64ecdb1e007106fdb05979b10b42b90591255504 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c359954d671e338997615d3a2f3aca168a53cb91 |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f1e9623d4c515da6312fd2539640915e5903c7f2 |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/b40a7fa5d3cd81adba348e6abe02d5f415c5326a |     
         sh4 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/434e6fb52d96249c037e3167a2ef1af66729f4ca | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.0 | 2 
      host-uboot-tools-2019.01 | 2 
               runc-v1.0.0-rc6 | 2 
                host-libsodium | 1 
                ipmiutil-3.1.2 | 1 
                  mender-1.7.0 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
                 python3-3.7.2 | 1 
                qt5base-5.11.3 | 1 
                 qt5base-5.6.3 | 1 
                   strace-4.26 | 1 
                 xenomai-3.0.6 | 1 


Detail of failures
------------------

    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/209123ba1a30df1f7d962e9d196c0bca93bc0226 |     
     powerpc |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/7bcacd25b599bc0072e8767339b53f7e3b8c7119 |     
        i686 |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/c4154c9ee0de84f88c4be2dc046d6ec24399fcd2 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a821c69c6c7e31dea0b06e9451c4ce00adaa6136 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/54c1fa51ca8e602dfff66b65958e2f53103602dd |     
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/6490d1e4c6f8f61528c433e6f5b9cf84f50d9197 |     
     aarch64 |                   mender-1.7.0 | NOK | http://autobuild.buildroot.net/results/02fde80f6b4bc57d5f2833bd979bf166252eab16 |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/6212f25e9b933690df0fa1591cbd492c84a47e35 |     
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/033b2d0204b680c95b88b8ef12a1ba3811d695e8 | ORPH
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/bf646e1665b1ce3938e9be119a9e086e37fac5a9 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/4b7869b024f94208b5451527ef09d247a35dc163 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/84fea342b234ddc42329289cb81bded8575f587c |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/318e3c15c874b1afa006198b74866f22d3f70a8d |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d52295bc14e2dfb891646383835586c9ca8203ab |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/35b4852b6f62977ff99990deabf32488c379479c |     
         arc |                  xenomai-3.0.6 | NOK | http://autobuild.buildroot.net/results/99a3881fc4260e95ca57401f4ce19e4568606440 |     


-- 
http://autobuild.buildroot.net
