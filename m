From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 04 Aug 2019 06:16:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-08-03
Message-ID: <20190804061705.0536D20107@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-08-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  49 |   1 |   0 |  50 |
   2019.05.x |  62 |   1 |   0 |  63 |
      master |  39 |  27 |   1 |  67 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

   host-xapp_mkfontscale-1.1.3 | 1 


Detail of failures
------------------

   powerpc64 |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/ab1c40274f28bf46a3c3215ce5279c03a3918e03 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

     toolchain-external-custom | 4 
                      icu-64-2 | 3 
                    mpv-0.29.1 | 3 
              domoticz-4.10717 | 2 
           host-elfutils-0.176 | 2 
                      host-gdb | 2 
                   mpd-0.21.11 | 2 
                  boost-1.70.0 | 1 
           host-harfbuzz-2.5.2 | 1 
            host-mfgtools-0.02 | 1 
      intel-mediadriver-18.4.0 | 1 
                       mongodb | 1 
                qt5base-5.12.4 | 1 
              qt5enginio-1.6.3 | 1 
                sshguard-2.4.0 | 1 
                suricata-4.1.3 | 1 
                       unknown | 1 


Detail of failures
------------------

     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/a40b600a7d0fdb6a8a1ded7883b4936f120811f5 |     
         arc |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/88df1f63ff1f8ba9c07aa32b8328ce802d01efd0 |     
         arm |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/676dc8012b6759398339c65e84cbc0f134a350ea |     
     sparc64 |            host-elfutils-0.176 | NOK | http://autobuild.buildroot.net/results/1053e2b4b51bc225c4a1a29c93946101a7a53be9 | ORPH
        m68k |            host-elfutils-0.176 | NOK | http://autobuild.buildroot.net/results/c7720af9a5f5eabbc11c6aa7470361595c72563f | ORPH
        i586 |                       host-gdb | NOK | http://autobuild.buildroot.net/results/879987f7074035a83e982433a07cd2fbdba2b7f7 |     
      mipsel |                       host-gdb | NOK | http://autobuild.buildroot.net/results/822a747a6717db57705d1ce198a61988aa1173b1 |     
         arm |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/9247b9773099d7995ad8fa1665dd768bb550f63c | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/18bdc07c0fe3430064ca5c4c6912714e789c731b |     
      xtensa |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/bd4968d023dcfffa08d3dbf66cb89d724a239916 | ORPH
       nios2 |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/7672c5ceea2c1bcd9cd66bd0a8de8f0572539b3e | ORPH
      xtensa |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/d5d17262e3154415cdab264d86b37a22e3fac58c | ORPH
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/82cc1d95fc9e937994bd45b667e048b5de7fcf30 |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/16088563624ed9994dbda20a8321a742501d63c0 |     
     aarch64 |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/d17ee34e8bdb62a71f65f7748f1bfec775e01a03 |     
         arm |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/3ae3a90c229ce5473797a28e5f714f3e60d93346 |     
    mips64el |                     mpv-0.29.1 | NOK | http://autobuild.buildroot.net/results/7969f304ed2177d95d00f7fe531fdfddb17d50c5 |     
         arm |                     mpv-0.29.1 | NOK | http://autobuild.buildroot.net/results/cef172fdaf4538a82935b4c1c65e4c226bb1b28c |     
     sparc64 |                     mpv-0.29.1 | NOK | http://autobuild.buildroot.net/results/00c0e5852d5941bb54eeeca0fc8f6bcc0ff51590 |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/75c8eb1b3790ef7b89d519e15e9a0c57b8bb8671 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f77962c2c92d626edf1acd8cd22e5497792c240e |     
         arm |                 sshguard-2.4.0 | NOK | http://autobuild.buildroot.net/results/01fb32fdb21c60ffece09ea5e7ba7b58d989ed76 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/f78ba5bfb17351e90ceccf062cdab14cc3d91258 |     
     riscv64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/43f5dd9003df80a73aed9ae2a0ee1f1191e8bdd1 |     
     riscv64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/b7931765afc93aab4f0e5cad545405cc2b348fa7 |     
     riscv64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/56f7ac9bfa698f8efcda866ebbc8cb3b63e728e8 |     
     riscv64 |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/cb8b997664355be37f6d475654d0d64862ea5ab6 |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/e09f4f3b573f7d65441f08862d52bf68b7f1296d |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/b306a280b3d0a29ae2f36c3cf0f8edf1e7c75b11 | ORPH


-- 
http://autobuild.buildroot.net
