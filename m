From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 08:00:39 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-13
Message-ID: <20180714060039.4964A207E8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.05.x |  16 |   0 |   0 |  16 |
      master | 121 |  46 |   0 | 167 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              procps-ng-3.3.15 | 1 


Detail of failures
------------------

        i586 |               procps-ng-3.3.15 | NOK | http://autobuild.buildroot.net/results/b1b375a107259c34466d6334ef9e15cc1f3b9ebd | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 6 
             gnuradio-3.7.13.3 | 6 
                  squid-3.5.27 | 5 
                   wampcc-v1.6 | 5 
                    host-rustc | 3 
               mono-5.12.0.226 | 3 
                    brltty-5.5 | 2 
                busybox-1.29.0 | 2 
                 opencv3-3.3.0 | 2 
          openpowerlink-V2.7.0 | 2 
               aircrack-ng-1.2 | 1 
                libmpeg2-0.5.1 | 1 
             libxmlrpc-1.39.12 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  mender-1.4.0 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                  samba4-4.8.3 | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/1745bd10f7cfb0770c49ce9a6eafe7ab4ca0a2e7 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/52b44241c6955aaf0b8e1b759b31e81818133085 |     
      xtensa |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4a9897b0ea06a17942996078e8f9b25a58ef9220 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/66d3f28c2e751f96651db7058f7305d6a2d5bc9c |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4a9161fa7ea0f945cdf69622b9b192060c290369 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/57838f7cd84f37b66ab7007deaea847af8f54b72 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ace1f94d3504d89a2d88fef6d60da40c75f526ce |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/2c2915e117458b79f0301301fc2cfb028d2b87fb |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/852e0e8f1d07ef8fdf8b2fb7d7a06f3027823cd1 |     
        mips |                 busybox-1.29.0 | NOK | http://autobuild.buildroot.net/results/7c91b4299aa8e64fc977fdebe5379dbfb0eeb2c4 |     
      mipsel |                 busybox-1.29.0 | NOK | http://autobuild.buildroot.net/results/796107430db6545401d9926e84f19eaf2040b756 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/61c596ef3ed16f707b0a146047be610717504312 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7496cd099284d11ce9b9660c48ce0a3b29c60bb9 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/e6e9b900100112eeafba0da6cf14a6ef9fccc914 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f0be3af8427ee4acdd982377a757b5f574998495 |     
  aarch64_be |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4ad987e50d5969c33a83438d319e66713117e266 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/18a4b000c1922261f4a644258d8be01a42463322 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/0931a9c84c5173fac0667051a95619f9b5d6dc02 |     
        mips |                     host-rustc | NOK | http://autobuild.buildroot.net/results/71d4a8e93aef963b0d7bac9b9e9c514abca0d641 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/1460e0ab78b0d831e593dfb3fe8f40787df91376 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2871e543c4e82a8f8e2b9f66ef09739b66710303 | ORPH
    mips64el |              libxmlrpc-1.39.12 | NOK | http://autobuild.buildroot.net/results/71501363d781584c5f1856022c5c571b55ed7e14 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/e84e9de16bbc29e1d9e47d43481906f0cf63c1eb |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/855627161a28c986fff274ced1f5cc05ef1ba6e1 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/1f1dcc12f614af99481022c65bf7cfdf624f6a50 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/73fdb17eb0f321b41d32f58f0403a1c435abd13a |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/18dcf1b8a289eccedfef409abafd9f870ce51f48 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/696b52d8eee8b55a855faee3a565af49c6f67a4f |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/d41eb00b8ba28126cb05983efc3a4733decd01d2 |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/10bddadfa837e3e76e64ad1be1c9c5ed67116dfd |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/8bc3b737a52de0632a72a1d2cdb0c6362c855ff5 |     
        i686 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5ce787bf96f65283f4302fec92b9356ea986f85b | ORPH
      mipsel |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/f70b56cd8ea00a50eccc2683481e417ec9915ed5 |     
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/8ccf8d9ed6d73684cd8c18795aeb293651efed1f | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/319ce038db509d854edcc197b1d3c325e6a183d8 | ORPH
      xtensa |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/3f9dddf9dec8ac27eda01035f5a2cac7b6ba57d8 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/816c4a82facc7f47812911dcc1535b76b5f245e3 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/a4a677cec1fe03a736bf82c6030a9c79444f0bcc | ORPH
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/4045f7c20064ae5caf14f9797ba42f113d8c7e96 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/19af5dc70e4f266dc9ab746db92177373536011f |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/f213fb4254509ca4f3e2392e2527c9dd4809b246 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/42967f3708d544a0854864d96020870c1034933c |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/38fe96bf77a9af46e3d6771290c0077c763e7b24 |     
      xtensa |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/2be9407414963ebace94f51305109585f12e1055 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/e9ffcb6f497395869b482abd28c10ba76c8998d1 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/5b2404036e5e996f4d407dcea9f8fc918547521a |     


-- 
http://autobuild.buildroot.net
