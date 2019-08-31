From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Aug 2019 06:17:25 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-30
Message-ID: <20190831061731.3A61D87E45@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  3  |  0  | 21  |
  2019.05.x  | 29  |  1  |  0  | 30  |
    master   | 163 | 34  |  0  | 197 |
     next    |  7  | 10  |  0  | 17  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-10.15.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/4fdfcc8e167e778c8a5539a10b6e209850809704 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           host-mfgtools-v0.02 | 1 
               host-qemu-3.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/1b8fce5067bc5f93fbe2490034c7e30960c40166 | ORPH
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/45cb2ec3ea7ac264ee8fc214c38ef3e3bbe157fc |     
   x86_64    |        host-qemu-3.1.0         | NOK | http://autobuild.buildroot.net/results/7f90a1ddf09070b4cf92e6a5d418a65dd88b967f | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.1 | 6 
                      icu-64-2 | 6 
           python-numpy-1.16.4 | 5 
                 libdrm-2.4.99 | 3 
                    ffmpeg-4.2 | 2 
                   dvblast-3.4 | 1 
                     gzip-1.10 | 1 
           host-harfbuzz-2.5.3 | 1 
           host-nodejs-10.15.3 | 1 
           libfreeimage-3.17.0 | 1 
             libgphoto2-2.5.17 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                   mpd-0.21.11 | 1 
   openvmtools-10.3.5-10430147 | 1 
             qt5wayland-5.12.4 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/3637b9d457ffcd4b11a219ab193dc1bb3ea830ba |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/bc77a9645df0449dee034b014194f3d1915fcc82 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/02b0628e907c4c102a88ae4ac6dcbefcbadec288 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/cce8e6d6b4c7bf62792e80bd1ac97caf5dfbe360 | ORPH
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/860a0aad7f9d77380e3886e61789f1e8972d551f | ORPH
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/9a5ffea4aac7f6a11159c0ac8c6794934f98c4d4 |     
   nios2     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/322525177e3d8aa02f7ddbb16c37ad9a1efdb631 | ORPH
microblazeel |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/96021ccd9df6b1d3aa17c22e31db6c76aa28a7fb | ORPH
   mipsel    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/d382f966359898d0f46c72d4b71f204610215812 | ORPH
   sparc     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/072a102ce83c3cc97f53f2df2088ca2378305709 | ORPH
   nios2     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/c82964cc39f56b637281907818d46c641af77765 | ORPH
microblazeel |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/92e3dd386fe4b526dc60b67ac65cc5f021b921b0 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/dc40d65ac3bcb03c353445d261b46f0d2969f474 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/96f3210f5eea562b6b24cbd38c1b67c128c9dfd7 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1c042c3cb7088603ad26a494945ff39c66435509 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/b263f0e1498a2e548d49f8532c9a375086c877a6 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/54014227a5a261b56fe9ee5b6fb8a26d8f5e880d | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/ac1283637dd44a4aa6bed399a6f89eb78d898df3 | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bdabd5b1737aa075ae6846bd092b153766a15473 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/908cdc19905e3cf84c0317a69336304840574733 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/093a7c3d9aaf15b9a8d70af4aa9aa9fe9ada207d |     
  riscv64    |      libfreeimage-3.17.0       | NOK | http://autobuild.buildroot.net/results/df5d875e993bac707552e408b89e1a922e501d24 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/a057a88dd90ef7bd83b71a7345011c8ec1d1f4e0 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/6bdacacd7b62a548adc7038b9f76defcb81f64a2 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/02c38eafb146d98270ea0b731a458039832f7e0d |     
    i586     |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/857b966a51b9931b869b6175ca89eb1a82bcd462 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b592d58a127b6910aebb61a6bc2b0b5ef5950ba3 |     
   x86_64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b666c8ec29e340b1fefbfbf40e082d1603430dbd |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/d010bb7008fd84512e260aced7fa0267de29dc88 |     
    arc      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b77673ee712d71b9efb1bc3593712895bc334905 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/b1a86afac2fb753693e90d3c434e1678a9c99e71 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/16cd735eed3f5abc18184452d58aa1275c14abb4 |     
  aarch64    |       qt5wayland-5.12.4        | NOK | http://autobuild.buildroot.net/results/72888df72ca6f48cf6f092acbfdd2e2285a4834b |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/c7243f14eb0714560f7eb2ca13eb6269bcae5c3f |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 2 
            wpa_supplicant-2.9 | 2 
                 apache-2.4.39 | 1 
                collectd-5.9.0 | 1 
                 haproxy-2.0.4 | 1 
                    mpv-0.29.1 | 1 
                 python3-3.7.4 | 1 
          shairport-sync-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apache-2.4.39          | NOK | http://autobuild.buildroot.net/results/9a27023e2d141b113cd38662df74a70a5f93098d |     
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/f7dd43006c1b331595d4e5187917d7646c164cb6 | ORPH
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/42bf291dffdce2ae5b2d25c6ce38ecb4baa3a43f |     
 aarch64_be  |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/918104e3d395c7823ae9de424a6ca49ba6ef0cae |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0d14db324d220bc8d4d61ef807bd831f8919ea66 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d8ec5f0c5fd0a5ffd4ae58b1622b57d4131b5af8 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/5d073cec976ad571ec401c0d1a3fbdb76a23794a |     
    arm      |      shairport-sync-3.2.2      | NOK | http://autobuild.buildroot.net/results/7edc8f8bafdc9982f8f35e171010227d6b00da46 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e159b8b743d75b38d4f006709461a97773623535 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/46da53acc203cb11e3bd8e2d4caf67c16a6ea477 |     



-- 
http://autobuild.buildroot.net
