From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Mar 2019 07:00:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-04
Message-ID: <20190305070105.249E386C03@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   2 |   0 |  24 |
   2018.11.x |  16 |   3 |   0 |  19 |
      master | 203 |  18 |   0 | 221 |
        next |  44 |  25 |   1 |  70 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

       host-libunistring-0.9.7 | 1 
                  libftdi1-1.4 | 1 


Detail of failures
------------------

      mipsel |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/67860005559eb2e267b357a9da356cd4ae55be94 |     
      x86_64 |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/67658d3d4f092bd1f12b590183cf9336ea642434 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 
                libsquish-1.15 | 1 
               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/6402a43b9e9868b64b5c6ebea88d7fd3b0b83296 |     
        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/21dbb92bc567c4d4f01283afa933e0ca74a5501c |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d1f0be8ab0b156f2bfc5db80175f3ed71a835169 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

       gst-plugins-bad-0.10.23 | 3 
                   netsnmp-5.8 | 3 
               openldap-2.4.46 | 2 
                gerbera-v1.3.0 | 1 
                   glm-0.9.8.4 | 1 
                  grpc-v1.16.1 | 1 
                 haproxy-1.9.1 | 1 
                   mpd-0.20.23 | 1 
                   netsurf-3.8 | 1 
              python-pyqt5-5.7 | 1 
                    qemu-3.1.0 | 1 
                qt5base-5.11.3 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/6b73b58bc14cd071935ec5260382b0ffd1387b8d |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/518f432260ee382a2f7a7e3ce3d6d37dd46929f4 | ORPH
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/b138f217dffebbfc16103046227c8787d4da4aa4 |     
     sparc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/842ca572b7810bca70846274262a6fcdb38df498 | ORPH
     sparc64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/a29e8a8509190fc4b3c419dae2301cf72a601f62 | ORPH
      mipsel |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/53586f935131a924a0014f144a4d628ba5018e33 | ORPH
microblazeel |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/e6f676d1bf333ce4f3f0879492e22ba9bd90ede7 |     
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/6a3ac44c6db8e9904d2d465126943249e652ffad |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/87f36dd6e7836dff80f773ab28af1900bde8798a | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/20869588d00fb23d2ca11b114b01bed86e7cf7cc | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2b197dc705a4a0d306d1427311bf09de353dbfee | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d4f78c92933aec7e007db17a02906069e34027d4 |     
      xtensa |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/4a763db093e3e9263f3a0665ba043f0d0994d707 |     
        or1k |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/8a8fddb4e91727b0961047ef97c3b620bedeecd5 |     
         arc |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/4c5400a72148b8a00671b961dca379a30339c019 |     
         arm |                     qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/4579590412c721e1e737e28a59c75b6105e54c90 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/2b48190d6e7d77c5882211c6e6ad58514087d5c4 |     
      x86_64 |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/c11c4d26983e0347d96f3dda62e6d72b031967bb |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 6 
      host-uboot-tools-2019.01 | 4 
            optee-client-3.4.0 | 3 
               runc-v1.0.0-rc6 | 2 
           uboot-tools-2019.01 | 2 
                gerbera-v1.3.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
   host-imx-mkimage-legal-info | 1 
                 ibrdtnd-1.0.1 | 1 
                mongodb-r4.0.6 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 
                 qt5base-5.6.3 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/cf0d56cd2f242ccfb6a60fac239dd2bad0bfe3b0 |     
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/156449fe3086e6d903707a4b3d24bc6979b42ada | ORPH
      x86_64 |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/f7c025b734d6f7acf6f9102a5ada1c30601b595e |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/460c1b075aa5d483aa738ccaee5f11c575cbfa45 |     
     aarch64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/326aefc34af7c691322935360c5e2bc3f0c2d035 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9b5934c017f8c382c95725eccae4bec4adde1a08 |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9fd96b16e42daf20aaea7a3098de37657e0f3d29 |     
     powerpc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/e66cc556ba7f3a815b87d662268451d845d16ce4 | ORPH
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e74d9fb91d271ac77bc87d403bae4d2ce7acaf2d | ORPH
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0b458588951e6275d458793ff3dccb1f7d3c7dc5 | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/4c959f0a03cf589cb1b08a1226832cf70513ebcc | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/81e85902d31ed9d59dfd072c9b68259243fae7ae | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/96ba6cec3212fd1b1d730ad9ce0e8d643f2d169f | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/207fdf754d0a54b80c421ec1866df93a76d64c45 | ORPH
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/cbc4b98942f0048c290a0777494a7e4a30623a52 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/bc44d885137740fbc380b866d9d68d95a88aa344 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5aa72e54afb4b4c83ca6bfc015efcc8aae137603 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e11cc75ef1df8a8af792835705339b04f14326b7 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/a1dc978ec650c151407f8b6c2a21c02abaedee06 |     
        i686 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ba7364f61dc7dbf889df11c20807e2c5d3d7165f |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c71fd7262baf116bed339b1f6bd817936140c32f |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/38764e97f6ec718d397211eb13f777181216b981 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/7e93f02334d8f14cc15fa8bfce838a78d7fff645 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4b30b1683720f46debdb1cd38a94be721e1b3dec |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/755cd6f2f4a4de4064dc308983a2fdaaf6a84d66 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/a0621e96885c9b3ef36f2eee63823c8181ace4e2 |     


-- 
http://autobuild.buildroot.net
