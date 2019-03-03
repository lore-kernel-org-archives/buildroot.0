From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 03 Mar 2019 07:00:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-02
Message-ID: <20190303070050.0F01086519@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   1 |   0 |  27 |
   2018.11.x |  24 |   0 |   0 |  24 |
      master | 224 |  16 |   3 | 243 |
        next |  44 |  19 |   1 |  64 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                libsquish-1.15 | 1 


Detail of failures
------------------

        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/4505d25bda85940a960eb4b968745ccce6d84e0d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 3 
       gst-plugins-bad-0.10.23 | 2 
                        jasper | 2 
                   netsnmp-5.8 | 2 
                qt5base-5.11.3 | 2 
                   tor-0.3.5.8 | 2 
                    efl-1.21.1 | 1 
                   glm-0.9.8.4 | 1 
                  gqrx-v2.11.4 | 1 
                       lmbench | 1 
              qt5enginio-1.6.3 | 1 
             qt5wayland-5.11.3 | 1 


Detail of failures
------------------

     powerpc |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/a53c4d3bd0a4948b5710f2f0beaed757e3f33481 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/1f526ccaaf9e38c336b7dab2fc317dfa43e654b1 | ORPH
       sparc |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/db184ddf849199c0affefed53d0ec27d95f68d5e |     
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/798ade8b2e85facc9f49dcb6eead58618cbef357 | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/76c1c9e8cc24d1d66c7f2d17eece0169962abf31 | ORPH
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/1fbaada5ad69fbf8124827d64cd8811dd94e9977 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/648f4bbea1dce37d5805681a6d22680241bcc0f2 |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/dbd8ad05538a78181c4e71fbc493a5e65282ceba |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/cb2550992e1b7bb5dc8e647e90f2d7345fbf0d70 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/17b12ab22c984da5750a32e5794c66eb49b6a1d0 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/34f4a5e620927a61ae73fc34e4ab95c8d5520793 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/86bfb6682c45f0cb07e175661e93ee46ebb401c1 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/b16e4500937e66929995b2c421a1197da028b044 |     
         arm |              qt5wayland-5.11.3 | NOK | http://autobuild.buildroot.net/results/5f6c02f18d9c9fe60c682d0770157be447f55405 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/018e309caa0fc662aa2993e47b2037fb6c569011 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/fbfec05293a5724e35b5935e116af3e56c122aa1 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/16c9d5b5a22f3ef6ad1032a6bc6a7006962e2f97 |     
     powerpc |                    tor-0.3.5.8 | NOK | http://autobuild.buildroot.net/results/102796d74e63d0d203e6ac9e2094052588188e6d |     
         arm |                    tor-0.3.5.8 | NOK | http://autobuild.buildroot.net/results/7c7266d503e65ec6e3225f5432b237832a5de521 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 4 
host-imx-mkimage-rel_imx_4.... | 3 
   host-imx-mkimage-legal-info | 2 
                    ncmpc-0.33 | 2 
            optee-client-3.4.0 | 2 
                 qt5base-5.6.3 | 2 
           uboot-tools-2019.01 | 2 
                  linuxptp-2.0 | 1 
                       netsurf | 1 
package/imx-mkimage/imx-mki... | 1 


Detail of failures
------------------

         arm |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/1d5784307cb591f2cbc7668bf7756fd806f5ca57 |     
     aarch64 |    host-imx-mkimage-legal-info | NOK | http://autobuild.buildroot.net/results/25033c91188cf704d29994ae16247dac5f777e9e |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/cec185f20a7419067fda81426af3eff0b4b86047 |     
     sparc64 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/6a5cb0fed9f95ec51f1503f0241914234c7a0998 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/41c9e9c7d241898be595d36cf3babcf77021a39f |     
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/066506b17891b86792598ef435ca361929f5ba57 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7f51540d3ac49405410960503a6dedbef09471b1 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a88ac12f6e21ac79fc6828da952a349ac66529e2 | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7ccbfa19ab47a30408af9eaa193b95573ec4aaa0 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3ba63b00b3fe3cdd1ea62c8e98341a812065ddee |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/08ca32f1695e2f69846a8aceb91491114faa531c |     
         arm |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/ed31baa3a0ed5bd0fe3b11f346a7d38fddf46961 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/c73da17e4ff760e2d686d32d5a54c0a98905a605 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4c7eedf8e7ef54439d9314d964a2daa5b089e0ce |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/0363cfc119a21030a94336ac821a8d044bba53d1 |     
     powerpc | package/imx-mkimage/imx-mki... | NOK | http://autobuild.buildroot.net/results/65ed79af052227d9dd4fa82e295b9296d5de77f9 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ef97e29d4578a2e57a6f4221614db7a912aea0c0 |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/958307d8256f6aaa3550f399f96b71e4e6b8d4e3 |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f55c0397618d0aa283a82e629cf6e4fd79b868fe |     
      x86_64 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e73fef49d4117e9387da5a7c68c05716fad636ee |     


-- 
http://autobuild.buildroot.net
