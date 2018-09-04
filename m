From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 Sep 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-03
Message-ID: <20180904060019.53205207B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   4 |   0 |  14 |
   2018.05.x |  12 |   0 |   0 |  12 |
      master | 108 |   4 |   4 | 116 |
        next |  19 |  19 |   0 |  38 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
          mediastreamer-2.14.0 | 1 
                   qemu-2.10.2 | 1 
   qt5quickcontrols-legal-info | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/185ea2d2d005b5974b317760c36f14ea96607062 |     
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/3945e06ea0dd1e16013184fbab5b67b3561c87ce | ORPH
   powerpc64 |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/827864f987cb5e82786e0a74be831aaad4d26610 |     
         arm |    qt5quickcontrols-legal-info | NOK | http://autobuild.buildroot.net/results/9326cb85c8ce4f98aa9d0a1238ffdab3e9829637 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libreplaygain | 3 
            qt5location-5.11.1 | 2 
                  boost-1.67.0 | 1 
                host-libsodium | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bfc004ba10b50d4294be5ccd0abef7c00ed074d5 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/c456384c9573b3cb4feed92c4064b0514d1b5930 |     
         arm |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/086cfa940577fbd30e697f7423c6dd2f01ab6b98 |     
        i686 |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/21d4179e646ef3858e038120985aaa288bf60902 |     
      xtensa |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/a4c43d9ac642b9b81db54a2391eaed60c8f7ce1a |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/617728bc5c7dfb181c0531e9caeaf7bce79da02d |     
         arm |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/dc5c354f3aae54b77dad74ad44aca6d12425a457 |     
    mips64el |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/223ec6565beba1ca73d4ff488296feec53656b40 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               target-finalize | 6 
                blktrace-1.1.0 | 2 
         host-e2fsprogs-1.44.2 | 2 
                rtorrent-0.9.6 | 2 
                  acpid-2.0.30 | 1 
                  boost-1.68.0 | 1 
                   botan-2.7.0 | 1 
              glibc-glibc-2.28 | 1 
                    ncmpc-0.30 | 1 
           python-numpy-1.13.3 | 1 
                     squid-4.2 | 1 


Detail of failures
------------------

         arm |                   acpid-2.0.30 | NOK | http://autobuild.buildroot.net/results/fd6a82d9e57e26c368bda814001e89eadc03e99a | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a3ba2718084a6bd90c4617d5115400113a4eda5e | ORPH
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c50b98a501f0c86547868b5327c093959145e39d | ORPH
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/2c124d7a2ebd2573ffbcb902aee4d1bd8c90dd88 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/13bb2287311b761d524fbc6f178a70174cdbaf7b |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/f60f66a3b76c6e0e8ebb4b302c4c0935d1b931fb | ORPH
         sh4 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/668b36953187afab7d3565b8f5d7ec7ece074264 | ORPH
      mipsel |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/ef493227a783962ce22965a4291a1eae940e91b4 | ORPH
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/e508b0e29437adfa2cddc7246fb051063c479c6c |     
         arm |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/dfa3431a8905edecb3cbe59eab72348d2a765f10 |     
      mipsel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/557ec54dab8a724f5611b564178a0c951e76ebdd | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/d4453298fccd43931724bccec9226a5450786a1d | ORPH
         arm |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/6fc05e2bb90120f43b19aace436837aafd82d999 | ORPH
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/05d0baddbcd519bb998bb8cd198a4309e0329629 |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/0ae1b907235345fa8f84f5936108b2019e630429 |     
        or1k |                target-finalize | NOK | http://autobuild.buildroot.net/results/9c6a48fb0bd3ea18072f9163e9aecee28d6a905f |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/f099c1a0e77c0aa56a2ddcab849343be86711f42 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/057e8972ad6a1ab181c400a7fa2013866b12c142 |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/95b72a4cd77fae09e01ea5bd6077f00be3979480 |     


-- 
http://autobuild.buildroot.net
