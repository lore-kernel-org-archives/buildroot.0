From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Jun 2018 08:00:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-19
Message-ID: <20180620060041.5790D20702@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   0 |   0 |  12 |
   2018.05.x |  15 |   2 |   0 |  17 |
      master | 148 |  20 |   0 | 168 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.10.1 | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/0d714a63d3fc8b6ead6dfd35824b6005de5cd03a |     
      xtensa |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/0e59d7bf8a223b3e6db7278861b4a9fb7a405e47 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    host-rustc | 2 
package/qt5/qt5base/qt5base... | 2 
                  samba4-4.8.2 | 2 
         host-cargo-bin-0.26.0 | 1 
                libmpeg2-0.5.1 | 1 
                 libnss-3.37.3 | 1 
                  mender-1.4.0 | 1 
              mjpegtools-2.1.0 | 1 
               mono-5.12.0.226 | 1 
                 mosquitto-1.5 | 1 
                 opencv3-3.3.0 | 1 
              python-pyqt5-5.7 | 1 
            qt5base-legal-info | 1 
              qt5charts-5.11.0 | 1 
          shairport-sync-3.1.6 | 1 
              wireshark-2.2.15 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

         arm |          host-cargo-bin-0.26.0 | NOK | http://autobuild.buildroot.net/results/1e790bd13745cc0b3f03e6182e700c07d3b8a21c |     
         sh4 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/ded2367388ccf380a25472ade619708c90b32cee |     
     powerpc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/87ad4d729e03818cd4876ba1d70ab7df27778566 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e84f4f96fbf1d7cb7755b7b72ee66cf962120705 | ORPH
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/c08519aa9b551e87413acdc8616291bf774051b0 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/a8887cc55dfbd5ff2005465d57712d9aef542082 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/9cf46c540c0cdd0bb0f1e722a7ca3a9107b192fb |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/2c00e72aae893b56fc6d383bc4a84f5cc06762ec |     
         arm |                  mosquitto-1.5 | NOK | http://autobuild.buildroot.net/results/4dcd5333e7cb50af3558585c2f9476dafbef67b2 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/6a74465302ec32c4999de42841312a6be30138f6 |     
   powerpc64 | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/9cffb89cac512277b323ecf67f892b60b44cc3c9 |     
         arm | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/5930ef7b5ace1b74d2f2ba341173a23bdd9caf81 |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/b071b617fc6b26bf2f938f88dc284c99745e97a0 |     
         arm |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/4272e993a3ff0c1f1f57c3c07d8763c92c041869 |     
    mips64el |               qt5charts-5.11.0 | NOK | http://autobuild.buildroot.net/results/08d189336f110214c8487fff851163f135721390 |     
     aarch64 |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/76d1d8edfb25d57036a43e255cc2739474049176 |     
      x86_64 |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/9be89644f3c10c07f9ccb8cb4d678e695da0a7ef |     
     powerpc |           shairport-sync-3.1.6 | NOK | http://autobuild.buildroot.net/results/ee9d91b7d1878f315052e29c62b568f5e52ca72b |     
         arc |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/cbd6e5a1052f24afec2a4f45480c72e90a4bbefa | ORPH
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/d052ea51885f54cf368fd89775c0c3fe1c70af13 |     


-- 
http://autobuild.buildroot.net
