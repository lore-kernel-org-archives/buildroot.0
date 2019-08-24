From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Aug 2019 06:16:09 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-23
Message-ID: <20190824061614.6975087767@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  2  |  0  | 14  |
  2019.05.x  | 11  |  0  |  0  | 11  |
    master   | 165 | 23  |  0  | 188 |
     next    | 23  |  5  |  0  | 28  |

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a06d275a48968e6880126685d397524d838fa29b |     
    arc      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/b3382cb10ec9eb4ceca81fe8da1f0ab358edaf01 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libdrm-2.4.99 | 5 
       python-matplotlib-3.0.3 | 3 
                    ffmpeg-4.2 | 2 
                      icu-64-2 | 2 
                 python3-3.7.4 | 2 
                  cmocka-1.1.5 | 1 
                  flashrom-1.1 | 1 
           host-harfbuzz-2.5.3 | 1 
              iputils-20190709 | 1 
               libupnpp-0.17.1 | 1 
           python-numpy-1.16.4 | 1 
                 qt5base-5.6.3 | 1 
           uboot-tools-2019.07 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/1c877901190c6bb4d952ced82d1f274a9ddc2a1b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/e605cfc3b302c68225d878a1ef925ad8b6e87c3d |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/7c8bd5f1017cc951c07b0ba641868ff4904806ed |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/4fe75b03215c9e05221e8edb7d80fd982660c692 |     
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/891fdc1a9b6628281111971b98a134373325d4d7 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/58c4d8e36db56965b76c9bcb105c4912da670e1a | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/bb82802b6f7412be4c7c6e5ef1ad20342fb141e4 | ORPH
    i586     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/c60ffd2ade3010ac14e3e28ac998b3b45b79e700 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/e09f5eccc5fc05a6cd9ed6ded7c808ca6ce8eb32 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/7157fc846c87786cbf182bca3395ad6c6d80d62d |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5aeeeb7050cf437e7ef268fa6ec3ac92146a3564 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/c95cce55da006af29f4621f5adc4fae2fddef280 |     
   xtensa    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/918c4b174dcb2859210570ee1403c77b4274b811 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/cbaf3c8ae8afabf0fe5c9b63003397ef39755834 |     
   mipsel    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/09c51a2503b77ee069438b4f43afbbc0ab6b7725 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/fe5c18578bb91f8eb7a9d5105f6603a05651f367 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/93a164e5faccd31c97f499a5404b8665a8613240 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/86457bc3cf56a634f76cdc55c0f567ba16940e07 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/7fe358e1962a6a6e75d6668aef0e68fadc5fd230 |     
   x86_64    |         python3-3.7.4          | NOK | http://autobuild.buildroot.net/results/e3b175f11744c10287f21b81713be424f8c997b3 |     
    arm      |         qt5base-5.6.3          | NOK | http://autobuild.buildroot.net/results/82e0fddcd454b518fa02a2ca81179d2f52a13835 |     
    arm      |      uboot-tools-2019.07       | NOK | http://autobuild.buildroot.net/results/a315072db66b352bc50e8639fa31616d9cd19124 |     
    mips     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/eae46d52522451e48eddea4c145ea1e4e7d461e2 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 2 
                    dhcp-4.4.1 | 1 
                qt5base-5.12.4 | 1 
                    strace-5.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           dhcp-4.4.1           | NOK | http://autobuild.buildroot.net/results/23c65ccc7e5780e60e6443e381df12723c8d2c6f | ORPH
  riscv32    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fac84315d06565a7f5da7bcd187b298642b2b376 |     
   mipsel    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/967d29f1a859fae6aab02ffdfdb372e5ab38a402 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/47e5ea0e0bf9051e8a4ffb9156d28cccd3cdb60d |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/a64fc23d9d5f6037ff2e75a1102d51effa573e74 |     



-- 
http://autobuild.buildroot.net
