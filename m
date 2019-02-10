From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 07:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-09
Message-ID: <20190210070045.F0FE422836@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  48 |   2 |   0 |  50 |
   2018.11.x |  32 |   3 |   0 |  35 |
      master | 312 |  66 |   3 | 381 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 
neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/20910e89e2c2f26a75872b52b475926af2ee56a2 |     
         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/f54fe550a5bbae34184f81131381e4fa54d9cf99 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libsquish-1.15 | 1 
              swupdate-2018.11 | 1 
                        zip-30 | 1 


Detail of failures
------------------

        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/6396f087e39704e7f891824837d401b54f3f28ea |     
microblazeel |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/64b9e73e0e7e3f9c30fc9ab0c60443fb7b334889 |     
         arm |                         zip-30 | NOK | http://autobuild.buildroot.net/results/7fd27f9d91566af9811a592527023b90824ba68a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 11
             gst1-shark-v0.5.5 | 10
 brcm-patchram-plus-legal-info | 9 
                  brotli-1.0.7 | 3 
                     efivar-35 | 3 
           host-sg3_utils-1.44 | 3 
                 ibrdtnd-1.0.1 | 3 
package/brcm-patchram-plus/... | 3 
              sqlcipher-v3.2.0 | 3 
                        glibmm | 2 
       gst-plugins-bad-0.10.23 | 2 
           host-cryptopp-8.0.0 | 2 
                   luvi-v2.7.6 | 2 
                upmpdcli-1.4.0 | 2 
                clamav-0.101.1 | 1 
                  linuxptp-2.0 | 1 
              lua-curl-0.3.9-1 | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.46 | 1 
                          opus | 1 
                    qemu-3.1.0 | 1 
               skalibs-2.6.4.0 | 1 
             stress-ng-0.09.47 | 1 
              webkitgtk-2.22.5 | 1 
zbar-57d601e82089f2f31de9e1... | 1 


Detail of failures
------------------

    mips64el |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/1962c4b7cf981f20a0930002cd33fbdb6c98fe6f |     
       sparc |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/3e6c88c8b396c778a4c6d108216403bf2e1d8913 |     
      xtensa |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/15c8b2f23e73448102eea55db76ca068e9a769e4 |     
     riscv64 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/955dbfdff620933b55aeac233b2705d555b68f31 |     
        or1k |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/712c2496c0512583ab946bce11fd375ce0bbe8ec |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/260a9f08ae9e28f38244efbbd9aef4a6d3d7f6c5 |     
       nios2 |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/872322aeae6426bf7daf1562e50484f855345eb2 |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/5a49e085d24451fe462dd85d57550e1bc96ef792 |     
         arm |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/167b618db37d2a3923697a64369a1eeace7da549 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/f25989525495684e9a9b89aac7d76e3fcdd40d2c |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/173c75c508c82b75462e8fe2c8cbedcf41d6887b |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/b26a3a5a46fed02d98fd4f9e59f8cfe2d810c421 |     
     powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/77cd536a0fab78eabe27e055d28db2da354008d7 |     
     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/69f9b883e47935f055897128686da3ae8f1686da |     
      x86_64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/a0a73068b5355a2454b654817f77488767070718 |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/7af5624834be736fa6abbd8c6830fb63df378295 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/8b1fa46be7ab30a12481b7c121e980929aba4b45 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/e94e9d363d0cdf67cc64547ebaff40812f8fa8af |     
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/480f43300c9bb34c564e27231201ec929040a91d | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/71463977607c042918a0f614dbbfa50067a20561 | ORPH
         arc |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d54a80e881f62a41fe15cfdb03075e2af340858e |     
       sparc |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a3ea84875d591152f83a1c66c34a71010f20e309 |     
    mips64el |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a148929bd1f43b266c41645b9c8a4f7204760df2 |     
         arm |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/443f054d0b4adda59c5e67d761a716ef49e93ea1 |     
      xtensa |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6bf8ee7d710361cad65e3bcd3cd92ea8c59e4ac8 |     
         arc |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/0e0a2a0c38e7517b79ec394b80c614c5635ba4ee |     
     powerpc |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b5ee4b37bff6ce69bfd8ccc7efd5f8bb388d8c0e |     
      x86_64 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/a0d72e70254550804d135dab45a775581eb91759 |     
    mips64el |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5cfb640cd6de41222c582f48e29d3c66ba180e7e |     
     aarch64 |              gst1-shark-v0.5.5 | NOK | http://autobuild.buildroot.net/results/7238139d505e3917518aea24e38fadb5e2e7dba5 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/195e40b34344f773da51a3fbff9d8e76c517eed1 |     
         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/c8a219ff04972bf81659f6f8f2f4e36c8cb0ccfd |     
       nios2 |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/c083bac4a59bae5407240e31fdfc02af64efbcc7 |     
     powerpc |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/7b3dced6f8d8decab3b061a7c351632d7c28d475 |     
         arc |            host-sg3_utils-1.44 | NOK | http://autobuild.buildroot.net/results/087aacaee2ab6cdad1293cfdcf99bd9de2512c94 |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/2a0bd0f7c01deff797a04592894e44e9c0be6698 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/ee720c22d73e746a4fe8309524d761eda71cd2ff | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/81f02d0ab904e7ac43df42dcdede982e206fba16 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/73c221f703f3e8743aae6476a54af68d6617f554 |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/4151bdcd870274573ff028e9b5bbd19bdeeaa353 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/145fed7439b90b314fe59f825f8bc42bebcc1bc9 |     
        i586 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/d0edae443e563fb80f4575fa1282e8e37fa0916a |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/65d2c6746965798e8eac0d6ed27ca3aa48ae49f8 |     
         arm |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/343d37f61d72f6b060cabe8e0f21ad5e725a35a7 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/ac70741f74c611f6dc51060fdaf5446711cf5192 |     
     riscv64 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/03e2a5c6b0e417cdc08f0651b9f6944032a597b1 |     
     riscv32 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/4ad6d07b11f6b9e202e5a1cc9412773b6f74281c |     
     riscv32 | package/brcm-patchram-plus/... | NOK | http://autobuild.buildroot.net/results/0f3b88825bfd2e0599642919aa6ef693e75c1816 |     
        i686 |                     qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/089ae075cb45e935e4aef06ceaf03b9bcbcee0d5 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/f7b86cecaaedb317b850cb5a1c02fba11f48ba72 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/5b95119b9e8ce998297322fd1ecc4c2c7d15dc9e |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/872f40278e99afcaebff5e27c9a7fdbfe851b8da |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/368177d92f80f5ad2509a0bac898ffbc45c83201 |     
      x86_64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/d5973824b170ac81a399263ccc5c06402b804c9b |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/432c053066b67a6e508808d7b42da7b81828faca |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/56917875306eb468cbdc032f9fe6acec1be464dc |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8cb3067211c22b35e952d4d797a3e55d7d6975cc |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fdfa7038b16db069321188fd1dcf0612bc22952f |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/75f7ddc6defcd1f91a42c1f24714250746f30bc7 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e4f7221952a93ba198f525a557f90741e6762566 |     
       sparc |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/7ba3ce471f26e7ff2bfffc1c65f823437c23733c |     
     aarch64 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/c2561f990932351f5b93354a7f92f1ca84469b9c |     
        m68k |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/1ea5c3e6421843267b3020d0015426dfbdb93bef |     
     aarch64 |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/fe965ce84a00b797aec935567246b2bd92f0d473 |     
         sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/6d45397456aeb34ed3aadb0ab80f2bb73663c6cd |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/197615ad077b0a719954024c3ba182dac43a0555 |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/25603b396dd4195eb561454cec9f2638c5b3a41d |     
      x86_64 |               webkitgtk-2.22.5 | NOK | http://autobuild.buildroot.net/results/f1c7e3a66ffa5a54ea787f33ce12090da07f5ecb |     
         arm | zbar-57d601e82089f2f31de9e1... | NOK | http://autobuild.buildroot.net/results/07ab5723a9ff4b8dee9d9eaad259a2dd2f837bb1 |     


-- 
http://autobuild.buildroot.net
