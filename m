From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 04 Jul 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-03
Message-ID: <20190704060051.23BDF8559F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   0 |   0 |  18 |
   2019.05.x |  17 |   3 |   0 |  20 |
      master | 134 |  35 |   0 | 169 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/a793506c5673b817ac119aa1f1bd441f663c8bd4 |     
  aarch64_be |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/076f2598a4864d66727397c6ef39ee97e97365e7 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/5775899d689ac982d3b7f4f475c208ff17a588e6 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 8 
                 hiawatha-10.9 | 6 
               libcap-ng-0.7.9 | 4 
                   gvfs-1.31.4 | 3 
                    atk-2.30.0 | 2 
                harfbuzz-2.5.2 | 2 
              iputils-20190515 | 2 
               json-glib-1.4.2 | 2 
                qt5base-5.12.2 | 2 
            host-mfgtools-0.02 | 1 
              libsodium-1.0.17 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
             xlib_libX11-1.6.8 | 1 


Detail of failures
------------------

     powerpc |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/1e25e3eb1141aad1684fe4c369707b4dc1cd1b15 | ORPH
microblazeel |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/d99dac7f3edef74cb3e0a6722c5682feff73d53b | ORPH
      xtensa |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/28c2a3457228efa927cf2fbc349e7d63c6928e26 | ORPH
    mips64el |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/2d1a136dd4c980d265efeda3ae5c37914dcdbb41 | ORPH
         arc |                    gvfs-1.31.4 | NOK | http://autobuild.buildroot.net/results/8b061756ae6081d21d6ede8b27844f8fc3131953 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/f647c92e13d7469eda435feab42f1b3f45f66f5e | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/5d2cbc0fcb9ce0524dc9bfc796b09173fdd72219 | ORPH
        or1k |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/c71070e12b3199d520a9d9c669f0c4864fca1795 |     
       sparc |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/452935e8ba09a159bda3e501cd8346dba0833ea0 |     
     riscv32 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/e486330fa7bfdbf17daaa6f3923b69d5a99c510d |     
     riscv64 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/f3aa305e4f439c39a99dc71f3f25d285a5bb4b34 |     
        or1k |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/55979dd451bdc740f8abdbd9335de8c08e01bc43 |     
       nios2 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/affe93efc6b9586e6eca443d52e2c077dfda6a18 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/88e31f39d929e4d1ec8176752e3f5fc5254e34c4 |     
         arc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/56ace506f2d8e98ab7768ecbc9a31bec6a43174c |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/80cbfea199d2e1c55c4bcb157056147e9be5a5d1 |     
      x86_64 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/ce9ab35d6e90effbff3bb83a6cb43b32c31c05f3 |     
         arm |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/98c51aecbc8f541cc3229c2ece85c039cf389e8d |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/9e384ee5b2f978564e608ad89b8a32e4c55e46a9 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/1cb1ee16278d8db4365833ac52bffbc7d91c02e0 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/3def68dbb540c64525b8a708febe6d49eb32751c |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/308238ceb893c6062b045e057af12582bbca690c |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/f0d19a18362f1cf2079a15b1fa62a2dcd8a0e9f6 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/753b0f9cabe447a72879d1cf684368b59d2a70ce |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5a7713ab32b9d5455cf3a24a273c968f7ea83516 |     
     riscv32 |                        unknown | NOK | http://autobuild.buildroot.net/results/f45da5794d733c2274592130cf69252e5328ada0 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/bb051532aa3727dabecc0f66c4251de48d87ac87 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a690619f4cc0e075aeefd468d6abb3cd64516e25 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/fff4bf35293e47f9abd3da1fbc551ff21445a326 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/e09c0a0a34acc012f874f244fe973669adf1fb93 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/b023b33a3593083a25745721c1049cd810285580 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/0ededbf276988a5b9cda104dd1f510b48ceebe31 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/12d902c443c1ff75aaf823abf6dd1704412b9703 |     
     riscv64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/00eb1c170681792237e9e21376ab6da00b1e3bd0 |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/6c0545730ee740bd7a413b58d9e9ec3dd7cf0ba5 |     


-- 
http://autobuild.buildroot.net
