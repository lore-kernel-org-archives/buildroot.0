From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 06:00:31 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-17
Message-ID: <20190518060039.2348F2286C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  32 |   4 |   0 |  36 |
      master | 187 |  22 |   0 | 209 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 6 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
               wireshark-3.0.1 | 3 
                   botan-2.8.0 | 1 
      intel-mediadriver-18.4.0 | 1 
             keepalived-2.0.15 | 1 
               libsigsegv-2.12 | 1 
                  linuxptp-2.0 | 1 
              pcsc-lite-1.8.23 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 


Detail of failures
------------------

       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/d453fca67c8391fbc0175c47964b30526c79042f |     
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/e546602c3cf30921a8289cfa542d8df857e916d8 |     
     nds32le |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/e0c0ba97542ce42e65d9f4427c12eefad3fd9b72 |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/e93c61a28f87b95f4b3ae5ac852942735f709c1a |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/52511a41daa353f6e845a45d2210b5f83b786d2e |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/668b57cbb56da6d709e083c8686019011599bb6b |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a2fa23ed82b3876a8d7457c3ea02dfb170be7be9 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2dbab6323abc48ba844702677dbe4943ba894ca5 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/db46a218043f3fdb3e80428e5aaa47dbe0407027 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c144750a3c1bcd80a61348eb1899eee7de0ffaa7 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c22a120056a8a8837864af5b3fdd96dc178918d2 |     
microblazeel |               pcsc-lite-1.8.23 | NOK | http://autobuild.buildroot.net/results/a6cd53b060c00e916b40d7bd6c99bd8232d0f978 | ORPH
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/86fb4a445eb0be58286db05b5884b54fb4178da5 |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/6c41e435fffbf56dd5f756860e9c3e8b0adb4736 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/20ce81ba1fdeeff35b30b0723ef020a700397b5e |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/6b6100125ec8faa721acc09ac5dcaa2a7685d80c |     
      mipsel |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/7e14cc5f7ee0aa06e7399edcf9fdc83dc25ca1ce |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/93ec0c09317b86c4708359acdec738514fc798a0 |     
        mips |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/0d12509bf9e4b194cda9992fbe07117cb819eac4 |     
       sparc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/413195eb71ad6be68e7780aceab5dcdb0d8fa42c | ORPH
        m68k |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/04fd6528661f6beaf0a3375a759f0f033f020b40 | ORPH
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/2a26500ef2e24b78d928dc57ef783602169d3ff0 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 2 
                  linuxptp-2.0 | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e032d445c8c6207ba687a98775fa9252f65f5dc2 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/74e9e3d34dd0ca5d79d07f94856ec5d4cd10bcac |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/9594da0e01fac3d9f1278b98346a0f7e283401d8 |     
   powerpc64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/199c6ee5f88943dbb931a33f2562c03f7b13828b |     


-- 
http://autobuild.buildroot.net
