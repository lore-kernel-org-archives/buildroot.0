From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Feb 2019 07:00:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-15
Message-ID: <20190216070053.F071487015@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
   2018.11.x |  25 |   1 |   0 |  26 |
      master | 213 |  34 |   5 | 252 |
        next |  42 |  20 |   0 |  62 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  stella-5.0.2 | 1 


Detail of failures
------------------

        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/56fa8b7f6e85e018d2297261d4d9d1f590dee465 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

           python-numpy-1.15.1 | 1 


Detail of failures
------------------

         arc |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/8d48ecb47fe494817eeaa3ddc3bd3c1e62ec1905 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 6 
                   botan-2.8.0 | 3 
                 ibrdtnd-1.0.1 | 3 
                qt5base-5.11.3 | 3 
               runc-v1.0.0-rc6 | 3 
                       netsurf | 2 
             stress-ng-0.09.47 | 2 
                clamav-0.101.1 | 1 
                gnuchess-6.2.5 | 1 
                host-libsodium | 1 
                   i2pd-2.22.0 | 1 
                        jasper | 1 
        libcpprestsdk-v2.10.10 | 1 
                  linuxptp-2.0 | 1 
                       lmbench | 1 
               madplay-0.15.2b | 1 
                  mender-1.7.0 | 1 
                mongodb-r4.0.6 | 1 
                   netsnmp-5.8 | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.46 | 1 
       poco-poco-1.8.1-release | 1 
                   systemd-240 | 1 
                   tor-0.3.5.7 | 1 


Detail of failures
------------------

       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/07d83a9d68a984b7fdff90031ac91172afcc9c0f |     
       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/a442734c570e4a02854014d831ba3aab9f592430 |     
       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/61a78269b3d19310fc033b74b46b4e4539ead157 |     
       sparc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/cae8da81adff3ba493154e0ba8b21d90367f82eb |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/c07ab591bc228ba1738ecf62daa17fd277e1d644 | ORPH
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/294485271b7a911a04dfaa02a3eb922751ee3ab8 |     
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/515160349b11f06a090f3e13992e30da9a402c17 |     
      x86_64 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/221ac3c511770a4f8717da27e48d03e096546812 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/b497b3c50e55a71c64b27747b9fefc0c22823569 | ORPH
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/96651671d57e314f7e61a379e8594adb83027709 | ORPH
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/613751ee38f3c0215b802b86e53dce325c0c1b8d |     
       sparc |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/983537ceb38add50ca0a2316f39a2964db1b83c5 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c98cb551b4c47380c0d948a3336d5a938ad0806c |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/07790dbd376dd27a6c46a55eaddc3d244658f20b |     
        m68k |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/5e4882ddacf205a92a3ff1e79649cf16e4b6c0ae | ORPH
         arm |                   mender-1.7.0 | NOK | http://autobuild.buildroot.net/results/d2237083a13ab7688dd2b6dc8dbcd4226ed5651a |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/26a7a6acb017235838b4a5bf4bc660d23bba62d1 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/37a20fe7200693a45e2f3f3cd486e6f9e8d7b120 | ORPH
     powerpc |                        netsurf | TIM | http://autobuild.buildroot.net/results/030889e703cc020fb42fe63285e3c5bd9eb71106 |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/1959933223a6168ab8039e4f31f3bc80eeff7da4 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/97fda05ea0ad1c923e63397e174382ae3975b6bb |     
     powerpc |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/f612e4dba92e1cba96429eca1b7d1bb4fcb2a34a |     
     riscv32 |        poco-poco-1.8.1-release | NOK | http://autobuild.buildroot.net/results/226b21b299c63a31967b0b6839a01e3e41c016d8 |     
         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/95723c200eab8de3a94af3b502dfa517f8fab153 |     
     riscv32 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/8bdb6a2b56f6ea96649184e5fef6ce2c56b9ec2b |     
     riscv64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/63ba267674b424786bb10c97c565f4306147f95a |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c31da1659f069ace5c35194efdba4075001e82db |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d0966e06073a4451187a70302f29acb55ac0b2b5 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/887faeef980843039cba2e89034ca462b3580f0d |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0e9c122172b0228a53ebe2d9ad8d40104cd978c7 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/b6a864f093023ca444d3ed8402d9dd3d677b8c32 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/314644f5af7eaa5e102cca40e616a23fb970b629 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c114620ec20df309c6a7107f74e47e4657985cca |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/9ab233c3d26a5a56bb005b0afaa865aac88a7f05 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/8df25284701e18c42a8a116dd3c8b37849474b2e |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/5bc20c6067c7ab3e11d9e2c0c6441005c8dc03cd |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/22b7a77534aa3f073b306e96de779fef8f1e790f |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/0a671b08d5e74ff0b04024e729c498c4444e3e92 |     
         arm |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/a5869b7d3577f818401b02034cd77bebb0e2ee34 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     efivar-35 | 3 
      host-uboot-tools-2019.01 | 2 
                ipmiutil-3.1.2 | 2 
                  linuxptp-2.0 | 2 
                 qt5base-5.6.3 | 2 
                gerbera-v1.3.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
                 ibrdtnd-1.0.1 | 1 
                mongodb-r4.0.6 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
                     pcre-8.42 | 1 
               runc-v1.0.0-rc6 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/50edd422e03950dd6b9843977b6a08d5f22739a2 |     
        i586 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/b6b2ee4cd6ec2ca1553ad3045b9c6d2eb5912eb4 |     
      x86_64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/083a6b3debaf205ad31940ab67d332253eff6304 |     
  aarch64_be |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/381a6093eb96faef7cba2fe3a07f5b67b67a42dd |     
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/7ef5924e0008cc5ed36f55e390f1358c665a0306 | ORPH
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/24c588907c50ed6dffeaa28ce379b69a71b704a8 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3fe2b500b718d7e7f29caa99c16230dd82383af6 |     
        i586 |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/55122342e3d6cbfc6ff26e7bb694f21d6152bd73 | ORPH
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/3a1811a25d9e0e7bb00a7d427867aac1132960fb |     
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/15ba09ee963d1647e68b777ae6b9513d69bb8dd0 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/783209626a3d4b13af7b1c85a2e14475b5d3aa4c |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/ea22ed0af2724568bb067d89094adddab4f556fd |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/78a61f1a6fcf26e15f2081ca0a10b62ce35d5603 |     
        or1k |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/654f2483bca56877c8fe02754f3523aaf9c95c50 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/f655b3fa2bb0062ba607e8cc049b826b4fdf4706 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/3fb223503e1ae4aa39062216940060a4baec4c2f | ORPH
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7a04a5f9407c055abcf6d70175401e7ea7b8c4c6 |     
        mips |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/dfdbe9bc5868bc562653107c56630cbea4103511 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ab53e08219198e6381cab8d8b8cf5514bbfd7348 |     
     aarch64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/c9e302a4be66d8dd8d2f26d4e8408abd1ed43f34 | ORPH


-- 
http://autobuild.buildroot.net
