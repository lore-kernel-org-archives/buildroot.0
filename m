From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  6 Sep 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-05
Message-ID: <20180906060014.747752072F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   0 |   0 |  16 |
   2018.05.x |  10 |   0 |   0 |  10 |
      master |  98 |   1 |   3 | 102 |
        next |  14 |  11 |   0 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-libsodium | 2 
                libmpeg2-0.5.1 | 1 
                 libreplaygain | 1 


Detail of failures
------------------

        i586 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/98aad6f70545ae50458810a13b006945b010f7d3 |     
       nios2 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1e856a4fe45b0841d265cc6792714b5c3c464c08 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/0b59d7324848c0dcac5aa767a09cec125451324c | ORPH
microblazeel |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/bd3439588fe5788832107d1b1e047843dc57ab23 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.68.0 | 2 
               target-finalize | 2 
                 flatcc-v0.5.2 | 1 
                 gadgetfs-test | 1 
         host-e2fsprogs-1.44.2 | 1 
                 lvm2-2.02.180 | 1 
              ptpd2-ptpd-2.3.1 | 1 
           python-numpy-1.13.3 | 1 
                rtorrent-0.9.6 | 1 


Detail of failures
------------------

       nios2 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/c24a02d66932cef887397ed1d3182824782da869 |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/d72f18080f60284b7fa464f531b2b18d88315fd0 |     
         arm |                  flatcc-v0.5.2 | NOK | http://autobuild.buildroot.net/results/8fb0447eed1d55b7687f657530e31695cf77ce5c |     
         arc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/5ebe6dd1ebc451a55d71dfbb23b9abc0c7d254de |     
  aarch64_be |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/b204fbb0df6fd927b4ff597639e260338f957f5f | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/0bdd9203edba73c00b3a9a560de32857a298ec95 | ORPH
   powerpc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/6be3f62acc08a20d8d67edcb3660f30fe13a2f6c | ORPH
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/5ada9cb57b745d4c306242f39c9495a0447c4a5b |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/019d24dab561b50b9f0bc5df4acfc2d534c29869 | ORPH
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e9aa29117865a09bed09d1deac03f38670465e58 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/46e90b611a0db218191379d090befaaaed90f4b4 |     


-- 
http://autobuild.buildroot.net
