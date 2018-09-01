From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Sep 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-31
Message-ID: <20180901060013.DD83B20877@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-31
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   0 |   0 |  18 |
   2018.05.x |  15 |   0 |   0 |  15 |
      master | 141 |   4 |   0 | 145 |
        next |   8 |  26 |   0 |  34 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 
                libmpeg2-0.5.1 | 1 
                  ntp-4.2.8p11 | 1 
        qt5virtualkeyboard-2.0 | 1 


Detail of failures
------------------

        mips |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d976549af56a4d77a20f627dbea093ea14b269f7 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2659d8cb7ad6bba0961c08af06e9f8c0205144e2 | ORPH
      x86_64 |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/173ade35e7918b1a75200c52f909bdf7226e7f96 | ORPH
         arm |         qt5virtualkeyboard-2.0 | NOK | http://autobuild.buildroot.net/results/ecfe70fb6a9abdc7578856453eba1acbc441ba17 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   expat-2.2.6 | 5 
         host-e2fsprogs-1.44.2 | 4 
                libsoup-2.62.3 | 4 
              host-expat-2.2.6 | 3 
               target-finalize | 3 
                   botan-2.7.0 | 1 
                  libssh-0.8.1 | 1 
                 lvm2-2.02.180 | 1 
              ptpd2-ptpd-2.3.1 | 1 
              python-pyqt5-5.7 | 1 
           python-pyzmq-16.0.2 | 1 
                rtorrent-0.9.6 | 1 


Detail of failures
------------------

     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/61ef50a0992b0d62b948730bc2105792f86249cb |     
     powerpc |                    expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/a3c033476bbc3b8ef9c4ad1f56ce3707be41d165 | ORPH
        or1k |                    expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/d9fef4f1a6f3775bb4c3892a9594f67e1649855a | ORPH
        i686 |                    expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/346c3e5527de5d73dfa903769c668c82cb1ab2f7 | ORPH
     sparc64 |                    expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/555d810dcba34d94e809814d8ae13d3f0c58d37e | ORPH
     powerpc |                    expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/27fc3ec8a136a483d6fef29b2e3a6a1caa5ff8b8 | ORPH
        i686 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/42a0678bd76b72829257ce0ae452d4e6637e2d24 | ORPH
   powerpc64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/73f5dc01c496c80065b696239230e74be6b6b070 | ORPH
      xtensa |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/9400a8845d033457b0b6dbf544a564f6875185f8 | ORPH
    mips64el |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/f0e30ae09e4e3afe5987e6dddf39ad5a17416225 | ORPH
        m68k |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/185fc2440a2de9aaae9b2dee85d6d33bf6f08f92 | ORPH
         sh4 |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/86a060e91fc0d4e38da5ff7adffc4e0cc17055dd | ORPH
     sparc64 |               host-expat-2.2.6 | NOK | http://autobuild.buildroot.net/results/ecb1eb1354d55fc30110d97c162e9fdfae7d8edb | ORPH
    mips64el |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/2ce76e4f7ac824519d8cd89dcf250ac4950d2696 |     
      mipsel |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/67dea81ada2efd4d07d43f8f6476deeb710e26d4 |     
      x86_64 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/207c48d49d2f207d5f2ed4351eeb270ff2f0e847 |     
     powerpc |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/cb05744dfb4286d44bafeb96ee6205375566c08d |     
      x86_64 |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/f27079067c2cdf97b1bba0e7b4e6500842d5805e |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/f89f564ece0704e5344b09e6a9dc6a512319bae9 | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9fb463194922420219c0c07045fead5f0c934d83 | ORPH
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/64946be5a10b6ee7528e84b726720a4c9b32a214 |     
         arm |            python-pyzmq-16.0.2 | NOK | http://autobuild.buildroot.net/results/c2d08c63119fb28426df7f4cb50f5768e632a7eb |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/a949c593d55f46f4d5a8a7a6dd763c95c8a167b9 | ORPH
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/46a3ecf127238fde3ad0a4d85b8fd529d1972a99 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a0995bccbc26710c3d4160561194b6d4c768cd48 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/51521067c3f6706f00fa3d98bb572fd548bd05d1 |     


-- 
http://autobuild.buildroot.net
