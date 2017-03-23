From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 08:28:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-22
Message-ID: <20170323072835.30CE220F42@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-22
================================

      successes : 119
       failures : 29 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

                    qemu-2.8.0 | 7 
   pru-software-support-v5.1.0 | 6 
                 uclibc-1.0.22 | 5 
              leptonica-1.74.1 | 2 
                poppler-0.53.0 | 2 
           uboot-tools-2017.03 | 2 
                    git-2.12.1 | 1 
             lttng-tools-2.9.4 | 1 
                 mplayer-1.3.0 | 1 
                     php-7.1.3 | 1 
               wireshark-2.2.5 | 1 


Detail of failures
===================

         arm |                     git-2.12.1 | NOK | http://autobuild.buildroot.net/results/82d154d197080fb4f79950b2d1eb5c5842e0b1d5 |     
        m68k |               leptonica-1.74.1 | NOK | http://autobuild.buildroot.net/results/8dd2bcc41e861bdd324dd081e39925964d1ac428 |     
         arm |               leptonica-1.74.1 | NOK | http://autobuild.buildroot.net/results/ec7366d69b00625b652915fa58e3143f1bdcaf62 |     
         arm |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/f07c030cf5b3ba1d4e4a8f48a32630fa0f38d47d |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3a31d61baa83c7882cccdbc1294c863578eb478e |     
         arm |                      php-7.1.3 | NOK | http://autobuild.buildroot.net/results/616eacf5cd5a570ea2b8bba60dc42b109eaf8ed9 | ORPH
       nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/51204c125e3e14df7958d4eb4178c372a90d158a |     
       nios2 |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/e24a4227661019802a24d17acc49f7c3f8ae3d97 |     
         arm |    pru-software-support-v5.1.0 | NOK | http://autobuild.buildroot.net/results/76a1475f4cdedb80426fb022ef2e644aa5625660 |     
         arm |    pru-software-support-v5.1.0 | NOK | http://autobuild.buildroot.net/results/a45cb07a3afee83eddad234ead057a45f11275f8 |     
         arm |    pru-software-support-v5.1.0 | NOK | http://autobuild.buildroot.net/results/99e4ed21116c721faf9f1d0349f312b357d333ee |     
         arm |    pru-software-support-v5.1.0 | NOK | http://autobuild.buildroot.net/results/fbbd8d069db1eec6c28fb13e8e95ca5309853ef9 |     
         arm |    pru-software-support-v5.1.0 | NOK | http://autobuild.buildroot.net/results/bdb357f2eb30bdbe4767eafcadd0425608cb6f34 |     
         arm |    pru-software-support-v5.1.0 | NOK | http://autobuild.buildroot.net/results/b2412c57045521bd188f719a703a5ce58b1c9f7b |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/93a708ca13d11986cdfdbb46ab1caa3d5ad6d336 |     
        i586 |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/19a718f1d507ecb7f61bfe2c7fa2fc1ba3e91ab2 |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/aa79c8ab93edfb1b20b627aa09686f488f1da16d |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/e927ca76cdcbc316e102c4b2e74421422cef9825 |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/5f36ba8974adb98e6a8e524199b77bea73c7c2f4 |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/4e27559827f3ed75a12f13bd595998bf661b2aaf |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/c8afd7daec81ffe7cd44a53d0179c1090082f9fd |     
        mips |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/d2b9a0948fa62863ee4bd11bd197e5faeeb72d3d | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a99d8c04934808461073f8699d88a0b26a91f3bc | ORPH
         arc |                  uclibc-1.0.22 | NOK | http://autobuild.buildroot.net/results/6d6f4c41404f7ea590fa8fd8c9a694c81b7bd0a4 |     
         arc |                  uclibc-1.0.22 | NOK | http://autobuild.buildroot.net/results/c7025c333d3ab73738f50e948c75441e85c7c9f9 |     
         arc |                  uclibc-1.0.22 | NOK | http://autobuild.buildroot.net/results/0a1957056e07cedc4839439c0ea8ebd1f646b904 |     
         arc |                  uclibc-1.0.22 | NOK | http://autobuild.buildroot.net/results/47fd5b350cf286b7d5d7b3837fde40816568bc27 |     
         arc |                  uclibc-1.0.22 | NOK | http://autobuild.buildroot.net/results/7f931485f2df0e4f54fd28c567fa4a31f5561fb5 |     
         arm |                wireshark-2.2.5 | NOK | http://autobuild.buildroot.net/results/8b8cdb727d770bbea5d1b7c74a85c7574331a5f5 |     

-- 
http://autobuild.buildroot.net
