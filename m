From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  5 Sep 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-04
Message-ID: <20180905060018.C403220741@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |   7 |   0 |   0 |   7 |
   2018.05.x |   6 |   0 |   0 |   6 |
      master |  78 |   3 |   4 |  85 |
        next |  18 |  24 |   1 |  43 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libreplaygain | 3 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                moarvm-2017.05 | 1 
            qt5location-5.11.1 | 1 


Detail of failures
------------------

         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1ce7fc6b0329567a2cda7b5d560a5a80f1bdb7df |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/02c5ef81ef64d589ac533f30751536e298870405 | ORPH
 powerpc64le |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/8d3801ee9d8b659c76c08d9ce0da1548edd32313 |     
    mips64el |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/0af8f55c6ba92a3675a464ccea03af0a85c8c879 |     
         sh4 |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/d37697f036eedafa359a7aae4618dcbc0401f4e1 |     
   powerpc64 |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/97b53a74d9847c07f26178daeb1daff3b6c24813 |     
     sparc64 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/1e12a819750c677c9ef204a324c8bf06212e5135 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

         host-e2fsprogs-1.44.2 | 4 
                rtorrent-0.9.6 | 4 
              ptpd2-ptpd-2.3.1 | 3 
               target-finalize | 3 
                   botan-2.7.0 | 2 
           python-numpy-1.13.3 | 2 
               aircrack-ng-1.3 | 1 
                blktrace-1.1.0 | 1 
                  boost-1.68.0 | 1 
                 libreplaygain | 1 
                  libssh-0.8.1 | 1 
              python-pyqt5-5.7 | 1 
             qt5wayland-5.11.1 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/4c23bd803bb9331bb277735916c5bab0978f658c |     
         arc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/055f780dd326f8cf4dbbcef0e533550ce5c409d5 | ORPH
       nios2 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/801653324e43f709f6b779c39f880a3bb3ae3b72 |     
        m68k |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/2e7bf6213b983cc6791d0a31d51467896827128a |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/bf4a7bdb3e86ad33f0d55b2cba46ae217cda8ce8 |     
         arc |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/e017d10b497dec6a1570ddc9818e344e5109f2d6 | ORPH
    mips64el |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/b3042ecb7ba5ce66a1b72001b63f561e4c3a6429 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/1560e2534c2ce3635583e7acf24e3e5fad9baf08 | ORPH
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/a87f0ce7e0541f17f4ecbe5eb1a2f1a7d7ea407b | ORPH
  aarch64_be |                  libreplaygain | TIM | http://autobuild.buildroot.net/results/87fc4fd2f84cf985e86a2bcf18b2313dabbf9459 |     
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/4b4dbb600acdb2a2111ea39612492d4b4078c51c |     
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/66025749546aa004eb6ac87062e7c5fb3f434178 | ORPH
         arc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9efa482ca3cba088daa78cc68f67772460b339de | ORPH
      x86_64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fceadbbafc8bd64ce02f4d5128e76018da8a7645 | ORPH
      x86_64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/c69ac502ded970e40df8b3d73d70819585f9ca80 |     
      mipsel |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/538e1b631f4e0b7f9693212e62d8dfe90b8210a9 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e7b53a627d75e98fbfac40bd033f4950fc5efb4a |     
     aarch64 |              qt5wayland-5.11.1 | NOK | http://autobuild.buildroot.net/results/147168ddecc1d5154f20f136f988cbc2ddd8b87b |     
      xtensa |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/4721225e66095bbbd540c5b04fa29fea8c9d75f7 | ORPH
      x86_64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/107a69d7901dc8c08746e9256c20bb7a03e1730a | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/331a838dfac91f2ca4f93bbf59134f569074a9d6 | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/b8f15751e5a7bda00a606d179c0b9407a0547bc7 | ORPH
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/d1b88b6a22d0c349a039287195c07076504102e3 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/d1aff91083a7cde068da2cc22ae5b12c58368bc7 |     
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/71cf1d8aa48ec14738d575cc8c3466b3e3a7c5ff |     


-- 
http://autobuild.buildroot.net
