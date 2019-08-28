From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Aug 2019 06:15:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-27
Message-ID: <20190828061559.B2CC886CB3@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-27
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 25  |  0  |  0  | 25  |
  2019.05.x  | 23  |  2  |  1  | 26  |
    master   | 210 | 28  |  0  | 238 |
     next    |  8  |  9  |  1  | 18  |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

              qt5enginio-1.6.3 | 1 
                         snort | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/5f4d6f25e30cff4c7a88ed6bdfb28f19f129a725 |     
microblazeel |             snort              | TIM | http://autobuild.buildroot.net/results/a9b8f74a8658e9415076ff76f4c1c7a55281dc4b |     
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/8b4d64f1df9c9d4e0265d2d53281f42286596955 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           python-numpy-1.16.4 | 5 
              host-ninja-1.9.0 | 2 
           host-nodejs-10.15.3 | 2 
                      icu-64-2 | 2 
                 libdrm-2.4.99 | 2 
               libupnpp-0.17.1 | 2 
                    xen-4.11.2 | 2 
                    ffmpeg-4.2 | 1 
                  flashrom-1.1 | 1 
                     gzip-1.10 | 1 
                 host-icu-64-2 | 1 
              iputils-20190709 | 1 
               libsigsegv-2.12 | 1 
                 mesa3d-19.0.8 | 1 
                   mimic-1.1.0 | 1 
                mono-6.0.0.313 | 1 
   openvmtools-10.3.5-10430147 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/934225c64466880a724c0a26155eb2ba47d282d5 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f1b6b26762ea79b3347e9e36f54b481b42854163 |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/7d2c41d00d48bd8da3407f668559e9cf5a9d571f | ORPH
    m68k     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/c089d699d9353f2c8cb2bb6026414fc9afe5abdd | ORPH
   x86_64    |        host-ninja-1.9.0        | NOK | http://autobuild.buildroot.net/results/05d14db516c4efe358a1b07780d2050fa561a33d |     
    m68k     |        host-ninja-1.9.0        | NOK | http://autobuild.buildroot.net/results/76d7c1ebac9f3b76bc748e3d32721527358b2364 |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/9567c924a9c3c127d1871da739440ddb380c2728 |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/d78f8cdd85df61379644ef4d8583367a0380f2be |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/6105634c061d2295070acba9120e682dd2d3a004 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/3263c7441c3e53d275daa6685a64e33aa741edca | ORPH
    m68k     |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/4ea9c98101d8877c8e78d71b02b50e8dc0d3db0c |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/b4de839d3dde0458e1ba590007112f1519ee85b0 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/d1a050d8cf40b29d70fd0d10e56dd0c13d0816bd |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/10bb49b86920b2e0d9430eadebc7632e9be69f6f |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/552d59b8d70ed662c5ddb3fae67d3697ae2a2e36 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/d69131d4bb0c4efe0bf4f8979abac492fa05617c |     
    sh4      |         mesa3d-19.0.8          | NOK | http://autobuild.buildroot.net/results/4871a8582b76ccc9af1a2c32208d01e05c9d7222 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/f5c92ca0dbcbd75d3f03ac39a9bd0ca7f429e316 |     
    arm      |         mono-6.0.0.313         | NOK | http://autobuild.buildroot.net/results/63154cb09d6b86f48d1754e64a6e23ec6660e0cc |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4fb69a0e53338e3145a170f634ce52283bf0ee4f |     
   x86_64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/5f2d398183410cbebc73cc3252babfbe4cf32c38 |     
   mipsel    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/1093dcefcc743705c8d28b408dace417665a039c |     
   x86_64    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/3e806c0a9fbdf40e61df005219c62264202bbc97 |     
    arm      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/e3a1eff37626317ca24d621e97d1281c38387b76 |     
    sh4      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/f5a2d3d878c0e99953af0367ea2ffaeeab8765e2 |     
    arm      |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/747acfca349112d4544748fe5b3757d8fa8fde89 | ORPH
    arm      |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/7d26b0bc41d0f1546eab08f89d177e37dbb0f2e9 |     
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/b2375e1ca85f2e10f2643222c82c655172437bef |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 2 
                collectd-5.9.0 | 1 
                  exempi-2.5.1 | 1 
                harfbuzz-2.5.3 | 1 
           host-nodejs-10.15.3 | 1 
                      icu-64-2 | 1 
                    mpv-0.29.1 | 1 
                        samba4 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         collectd-5.9.0         | NOK | http://autobuild.buildroot.net/results/7fc083f1d1a5b40c1ea075665b5638302ee3332d | ORPH
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/f991774a2b3bd756b20c712643d8a7ae17a9a0f4 |     
    m68k     |         harfbuzz-2.5.3         | NOK | http://autobuild.buildroot.net/results/bc27d3d116c0c10bd833b4338ccabd0ed9ce1893 | ORPH
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/ee32a371359be31c16ece33d99dd7ab70d890ed0 |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/ab626b9f82f4778706204004245a43ce3805366b |     
    arm      |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/eb89a91652dfa4e1fe6f8a37abc38baf4b9ac0f6 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/1ea9ae82d3d0b43b9dacc06b28cf517215979f3f | ORPH
  mips64el   |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/971b7a87045ff4ee5b1c7f418c6ce6c3cc778582 |     
    arc      |             samba4             | TIM | http://autobuild.buildroot.net/results/0750c95272fd93e0609a81de8a8c0cf8e8a4c3ca |     
  riscv64    |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/8db0015e0823c30f4153a3ff26bd98cd2dec2069 |     



-- 
http://autobuild.buildroot.net
