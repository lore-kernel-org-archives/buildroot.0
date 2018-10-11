From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 08:00:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-10
Message-ID: <20181011060050.BC961207F3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
   2018.08.x |  25 |   0 |   0 |  25 |
      master | 162 |  57 |   0 | 219 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 16
              ptpd2-ptpd-2.3.1 | 10
 Makefile:709: target-finalize | 4 
          synergy-v2.0.12-beta | 4 
     docker-engine-v17.05.0-ce | 2 
              traceroute-2.1.0 | 2 
             util-linux-2.32.1 | 2 
                     vlc-3.0.4 | 2 
                  boost-1.68.0 | 1 
                   botan-2.8.0 | 1 
               domoticz-4.9700 | 1 
                flannel-v0.5.5 | 1 
                libmpeg2-0.5.1 | 1 
                   luvi-v2.8.0 | 1 
mjpg-streamer-f387bb44e6c08... | 1 
          motion-release-4.1.1 | 1 
package/glibc/glibc.mk:143:... | 1 
    perl-class-std-fast-v0.0.8 | 1 
                    pigpio-V67 | 1 
                qt5base-5.11.2 | 1 
                sedutil-1.15.1 | 1 
              spandsp-20180108 | 1 
          usb_modeswitch-2.5.2 | 1 


Detail of failures
------------------

         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a2a13c394d686057ff9501df23572027d43612db |     
        mips |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/79aa7dab26df77e7b53dff047ac0be59482d7df9 |     
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/1926cc0b9129b9cc08924fd4fbea481ce9b071cc |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/1b56a8cd6d2a261ccc292e901e304bd8e508acad |     
         arc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/0bbf25bce1fe366f8d4256e78d22b1695c1610fa |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/edb0331464461f18111737ab6a64962b610ff2ea |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d9900608852de9b497f89265ef202ecae863fdf2 | ORPH
      x86_64 |                    luvi-v2.8.0 | NOK | http://autobuild.buildroot.net/results/35e1100fb9b81c0bf6919544c0bbebc5ae7cd735 |     
         arm |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/cf677203e4ddaac21feda82e94cb07781df7a017 |     
         arc |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/58dda35ca2411bf380b9c51197dca26dac076c54 |     
 powerpc64le |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/03e8c438c187bec3af5b30faceb29190fa6b6799 |     
     sparc64 |  Makefile:709: target-finalize | NOK | http://autobuild.buildroot.net/results/ec07b42e6e91aefd38cfdb15e2823eade0eeccd2 |     
microblazeel | mjpg-streamer-f387bb44e6c08... | NOK | http://autobuild.buildroot.net/results/4d7e722cf85a54d2813715e6b4ca1dd793e6d237 |     
         arm |           motion-release-4.1.1 | NOK | http://autobuild.buildroot.net/results/041e29dfddb2da3309ac7d34a576c60c5a75fe4d |     
         arc | package/glibc/glibc.mk:143:... | NOK | http://autobuild.buildroot.net/results/5a98a801dccaaeb4b5cbc26d9a017726d0953157 |     
         arm |     perl-class-std-fast-v0.0.8 | NOK | http://autobuild.buildroot.net/results/6ca5d163cbf98dff7569aeecdd8a5b5095a2ccd5 |     
         arm |                     pigpio-V67 | NOK | http://autobuild.buildroot.net/results/e01f553bf35d4ad1ff171792c6960d159c5a8acd |     
        i586 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5eb96726cee9dcfe2b2acc37dea333da8974eb5a | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/17ae97ae53e3de2764cf7382997f6b02b0b1f5bf | ORPH
      mipsel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/871ba270aacdc13bc79d4046f64e8129758538f4 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c2c569e8015c7b1dbacdcdd6b53f74517b70fa6d | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/24d9cc2f223f0c30e8078b23d35b9e82d3973d12 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f29749446df51a4736ae79eabcf973ae0ae7cd92 | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e866071712c0a4f2c2aee5d4969055d9cc1bf1a6 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1ea04e00a3193f01f26059561cd572fbf47cb2b0 | ORPH
microblazeel |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/77457a9572a0bf0165f5685699fea7536666c470 | ORPH
      x86_64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d6ee16bc927b86b95905af5c7f6f39851049e9aa | ORPH
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/31e968c6a8f984ca8d0d1dae4bc72b31c28dbcd5 |     
    mips64el |                 sedutil-1.15.1 | NOK | http://autobuild.buildroot.net/results/00588d7cd37ba9620f01e970bf328540527558fc |     
         arm |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/48527e144bc4ad3eaab807f302888380bd9e78bb |     
        or1k |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/6b9f9269945860ff028c397ae492cf44e1478f0f |     
 powerpc64le |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/56ef8faef96c11e89974c34ffc1b619cd2f52b88 |     
     aarch64 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/39298ffe7387d5c94fd9dab936c89806e9d05bd6 |     
      mipsel |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/d707d78c7629a9cd3e88c83109f43e0dfc7f8f64 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/1fd3e5b2f3ac73f3502d0459c06a9bfaf9100300 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f8e1494f26fd4a1b626db78c6f863052750ae73e |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/8b60796c43a0f3475655f9dd4990771adbc84485 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/988f4a6dacb824e332518e235cdaa59df1c01d65 |     
  aarch64_be |                target-finalize | NOK | http://autobuild.buildroot.net/results/c3d2f656f46bbd91fcc2da9c5648b90662f6abf4 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/ee7b53612d135a8d60f9c6183088606fd200f7d4 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/279fbfe00e2ebca60ea23e58083d3bcb13bc7779 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/41ebfb9f1ecb2799797299a3524cc4e8af10315e |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/9c5836212ccb5d60b736a42fb25ecdf25f09a89e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/035a64357d5bcadbdc21cd37e0949bd3ffb49a58 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/a69ff3ffcaa95c38f9c4fb3e545f764b8ec98962 |     
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/fb12eb0d9d40f098ab59277d5e65db4fc066299e |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/5f26dba894aee52e2797d820abcc6e79f95912fd |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/76c0c514eb9ce58670d5550f62e83638cc5ac87d |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/e22ea58c9b192b0ec40ce3a2dde5583e97d4efcf |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/21f8a4a739ed55f80f3af0a14e8daebbbb3b2994 |     
         arm |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/4efb67e6a29c3dd784676d30a1051f9f0c2a6c80 |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/ce16e416998dbb259c5ce40862b5014afaf5a366 |     
   powerpc64 |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/f17713fd5098a85c0f6b465d2b9b3dd5b6d4117d | ORPH
    mips64el |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/16a024ac7a32b6cb9132cb9d8d05a113df9263fd |     
         arm |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/fd30a91eedbb1e3fd7c441ac78c4c5d603a69396 |     
     aarch64 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/26ceebd3a603636bd87452177dbad6f1ff11a51e |     
         arm |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/6652dd7c7c7b7248ef51df854826ce190c26fe3c |     


-- 
http://autobuild.buildroot.net
