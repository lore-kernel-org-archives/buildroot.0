From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  9 Jun 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-08
Message-ID: <20180609060011.F389C207CA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   2 |   0 |  33 |
   2018.05.x |  28 |   1 |   0 |  29 |
      master | 207 |  19 |   0 | 226 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

         arc |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/0c6ab4d145c99d45f4580e9fdbaefc095dc86b2c |     
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/4e4bbb484cda541fe35c8337faab2c517880b65d |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/d00b3c8d798adccfb8c866930cea96f2ff68ae49 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            host-flatcc-v0.5.1 | 7 
               mono-5.12.0.226 | 3 
                qt5base-5.10.1 | 2 
       shadowsocks-libev-3.2.0 | 2 
                   libnss-3.37 | 1 
                  mender-1.4.0 | 1 
                   trinity-1.8 | 1 
           uboot-tools-2018.05 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

    mips64el |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/121d08351b0e3feda4028d39bb672aafb5b9ffcf |     
      x86_64 |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/f64bcf6b9046375200cc35429bd3d90f948a696d |     
    mips64el |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/f40ba7011be13f1e0668da7689b111abc23f0636 |     
     powerpc |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/6ea30eb4e76cc0f2c7a92156475234a57b4ae4f5 |     
         arm |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/da005cc2e99fc00bfa327a2e103d213f2c1437f9 |     
    mips64el |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/6e89f33bf3edb419611c8659bc9dc1102d600635 |     
         arm |             host-flatcc-v0.5.1 | NOK | http://autobuild.buildroot.net/results/5bc351c27d8ecba6eb3d5b04135e9c0b06c91f5d |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/698500a92688c50e9cc71cf82c0848cb4adb81ad |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/bf43b393e10815bfe207f5bb35ad03d134095c52 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/1ad659039e1c390062fcc239b9ef8ebe136f012c |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/07a5432698c4dd607be7952aa7d63f4c89ae9fee |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/5ce7016d1891692a5cc1e75d0a849c6c14d7b6f3 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/19101924df7b661653a62f020ad17d127d22bc37 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/1804f89362ad328b4cbca15ba0ffa6b6d15cbca4 |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/4810526381e15a194767753d324875bfbf5e3dde |     
       sparc |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/9cb76805c2f2952aa434d143831ee03c7d43aa52 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/ee1d66836621898bc5e0474e7be19fe1a1922ddc |     
         arm |            uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/18b3d76f7d2a78b17569ce43fc69dbef13dedf77 |     
       nios2 |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/cc1f1aae8d12493b34f4f691a15f0a687bcad8e8 | ORPH


-- 
http://autobuild.buildroot.net
