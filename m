From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-30
Message-ID: <20181231070030.AFC86207A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   0 |  19 |
   2018.11.x |  11 |   1 |   0 |  12 |
      master | 147 |  44 |   2 | 193 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   attr-2.4.48 | 1 


Detail of failures
------------------

        bfin |                    attr-2.4.48 | NOK | http://autobuild.buildroot.net/results/904febe7ae35d8efb278ddd9290b55bb3fe651e8 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

             qt5wayland-5.11.2 | 1 


Detail of failures
------------------

     powerpc |              qt5wayland-5.11.2 | NOK | http://autobuild.buildroot.net/results/4da71c621ca0fd2d34a91972496f545a5cf17897 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         libcpprestsdk-v2.10.8 | 4 
                  linuxptp-2.0 | 4 
                     php-7.3.0 | 4 
                 sngrep-v1.4.6 | 4 
                  grpc-v1.16.1 | 3 
                   netsurf-3.8 | 3 
                collectd-5.7.1 | 2 
                  ffmpeg-3.4.5 | 2 
                host-libsodium | 2 
                  libssh-0.8.5 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                php-amqp-1.9.3 | 2 
                 php-zmq-1.1.3 | 2 
                supertux-0.6.0 | 2 
                     efivar-34 | 1 
                gnuchess-6.2.4 | 1 
    json-for-modern-cpp-v3.5.0 | 1 
                  monkey-1.6.9 | 1 
                php-yaml-2.0.2 | 1 
           python-numpy-1.15.1 | 1 
sunxi-cedarx-b8f52d913f7372... | 1 
                  udisks-1.0.5 | 1 


Detail of failures
------------------

         arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/c3c84ca6e11b268ba5ada7e3dca18bca681ee43d | ORPH
      mipsel |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/86a7c2a47f7ed194f929c48c901a2909d808bf81 | ORPH
     aarch64 |                      efivar-34 | NOK | http://autobuild.buildroot.net/results/b94fcc5a3b632c4d9f2de38b0cbafa06d92b4f37 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e0ef9ff0a4df87938c8fb27a57cfb39feebf8d36 |     
         arc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/518163f5da19fad22255e4993fa579739195e42d |     
         arm |                 gnuchess-6.2.4 | NOK | http://autobuild.buildroot.net/results/746c3cd50f6cde67c87cad9902c7d562c407ed6a | ORPH
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/47991306abbcd80fb8e6baad0bd7490fa74f696c |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6db19bc3ff93050747b6dd17e4aebfb7f7a88eee |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/0f2413344477895f291d5c46c29063a43a08f44a |     
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/3076606f4246db63be0b9d77039d6e7da09886bf |     
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/60cbce2d50d784563ee9551c723d402d015d8688 |     
        i686 |     json-for-modern-cpp-v3.5.0 | NOK | http://autobuild.buildroot.net/results/713ebe23dc839d07199ebc2e981b223efeb54aad |     
    mips64el |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/50125148039cd3e604268547e1ee3050edc5d2a5 |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/f973518f5f73ccbbeeca798cf2ece8fad4089031 |     
      x86_64 |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/67041a0fff31eda670eb450f14b5fe26b908db8d |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/cd1088fe1cd099982250a79b0ac0807995d483dd |     
      x86_64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/abc9b539ab0d954ad17ed6f27abc2b98fe181c26 |     
         arm |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/d7273f83bd3bd7ea2567fe67d64091bc92a1d59b |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/b5b48b2163d3efc5df87ea7857b2894e16e5e30e |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/f3825b2f52e839dee7411ac3f379424b93f9dea7 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/3c64be70ee62cceca8aa39c87d2607dca7e0b4be |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/93db90196ed31370431ca00b3962a4ce36d023f2 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/6cc51b67040a778a832d1bb1d25275d3ce357cec |     
microblazeel |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/7bf6882f64bdd8ed52efb4cb12ae8d4d202f55d5 |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/74e5c2870a049e83536323d785ccf937575c4fc3 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5f0d051cd60655a37a161782135b72bddec353a6 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ac5bf0ff10ee9761ed689832639b82b56a89bdcf |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f8417f92b021d10a37ec67e0dafc634cd44d99d1 |     
    mips64el |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/1f06990535d2fbf74d4c78c61b2e9b01f7778c4b | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6133ae850d565176529d2454d2e931a5f882a4bc | ORPH
     aarch64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/af9cede877373abf3f3a5ea6533dc532419af7ea | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/7e1b536fc98a6c70ec26b916adbdf33a024d2554 | ORPH
     powerpc |                 php-amqp-1.9.3 | NOK | http://autobuild.buildroot.net/results/222873a689f7b9da20acb3604b8364885e96b98d |     
 powerpc64le |                 php-amqp-1.9.3 | NOK | http://autobuild.buildroot.net/results/90710cb2a4873f39aa75db79ff70aa9e4bdf83ae |     
     aarch64 |                 php-yaml-2.0.2 | NOK | http://autobuild.buildroot.net/results/363fe4d6f3419a24f782d17d49c6e909ede77481 | ORPH
      x86_64 |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/50e920953078135bf8852ff6229d5295b2743855 | ORPH
  aarch64_be |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/7b52a771fe00bc73861cc84c9c6594c941e24960 | ORPH
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/fc773bc45b1925416d9ccbeeb4db67d31a208e4d |     
        i586 |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/e8ca0a40d8cd2c333b55fa9e67ddeead1f502d5a |     
         arm |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/e99e937c05be38d33e029fbfc737665b590c33bd |     
        i586 |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/ab827021d4dae8ae98f667328e4a9a7e1c4288d0 |     
         arm |                  sngrep-v1.4.6 | NOK | http://autobuild.buildroot.net/results/fe30c2d82281f427496a3d468d58f27daf48fd17 |     
         arm | sunxi-cedarx-b8f52d913f7372... | NOK | http://autobuild.buildroot.net/results/4dcdff3e2613bef0f6943a8cc8d7462cb2bc8fe7 | ORPH
    mips64el |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/622a2eb2ee1b33923c9a4cd0e9cdd23bfb3dfd51 |     
        mips |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/0c78001d59e6860e5a2d970b5b4e002c10034f00 |     
     riscv64 |                   udisks-1.0.5 | NOK | http://autobuild.buildroot.net/results/74a8d8c247cfc9c0024e749e1f1ac423c9e90855 |     


-- 
http://autobuild.buildroot.net
