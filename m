From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-12
Message-ID: <20131213073008.7186F1014EE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-12
===============================

        success : 103
       failures : 26 
       timeouts : 3  
          TOTAL : 132

Classification of failures by reason
====================================

                       unknown | 3 
                 libnspr-4.9.6 | 2 
                     m4-1.4.17 | 2 
      libnetfilter_queue-1.0.2 | 2 
                  thrift-0.9.1 | 2 
                cegui06-0.6.2b | 1 
         dvb-apps-be76da69f250 | 1 
                  sawman-1.6.3 | 1 
             bluez_utils-4.101 | 1 
                 ffmpeg-0.8.15 | 1 
             util-linux-2.23.2 | 1 
             alsa-utils-1.0.26 | 1 
                     lxc-0.9.0 | 1 
gpsd-a496a59c81173881900d97... | 1 
                directfb-1.6.3 | 1 
                      icu-51.2 | 1 
                  nettle-2.7.1 | 1 
               qt5webkit-5.1.1 | 1 
                 libevas-1.7.7 | 1 
                 pixman-0.30.0 | 1 
               w_scan-20130331 | 1 
                    systemd-44 | 1 
                    tcl-8.4.19 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/baa146ca13d9763aa1cc063107dbea530c17df17/
    mipsel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a51823b7be6f98b3b97b97bcbb30415dfd402097/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/9b244b125fc729d79d47b7f29bf97d89c53ae363/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/071033f64829e737536f7ca8fdc8d42e04d19169/
     avr32 |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/92e472004812a3616f62d766a9ea07a997a66e89/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/1d152f4cdd69c0ed0e289da0c5942a2e22731a86/
microblaze | gpsd-a496a59c81173881900d97... | NOK | http://autobuild.buildroot.net/results/81df697ea73aec6442328efc2dd043dcf31d68f7/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/2bed87e72ffe880a8ce2c6e020df6f5dbe1d6c9f/
      bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6505596a2ad404139bf6744078f97c6499eb4ee4/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/b9a00eed05ce07a3b1d005707b1ad583a7edd7de/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/9b75f3cc2b0a28485278ce8301019fe9c0ab6225/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a42beb930d49a04cc141ec485ec5d4fffcb7d343/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b6c3dd9c9d344383b196ae79b4467057316cbb55/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/a5452f8b364c2f41a9ff4244d11611e020977600/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/87981f417a37e1a865b664af357de7bc221d2109/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/f46aa09e3bdaa0c3f206efd234bc6d5949e17ef6/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/40ffd3f8f307c18fe1e82aff99e81dea5e89865c/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/330923197eda427748c27b5e1f733ec7aa3c8d1b/
      sh4a |                qt5webkit-5.1.1 | NOK | http://autobuild.buildroot.net/results/30cb0a6c859435c726f047bf2daa54c5ba8a89e1/
  mips64el |                   sawman-1.6.3 | NOK | http://autobuild.buildroot.net/results/d364e400d4add17d4343597fdab4b48b201c5c71/
   powerpc |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/df5c28310736139b024c4e56d03c4fa65d1de228/
       arc |                     tcl-8.4.19 | NOK | http://autobuild.buildroot.net/results/2dc2cbc650e8b142e4ca09eb191532f215285964/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/c18dd5bc80a7cb7e55ff9f792120796737ea8c60/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/018dc9340ef3264a4b6a56f6df67980e163190f3/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/c29a9534e1b84becead827dd5f0a7fdb582922b2/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/29775e1b5bca691e561911f8961c6cac3d650799/
  mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/a46100589045ed56312b195681937ddc3d52263b/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/13be2d69fe0ac3b55e5d873f2d092c278e1edc97/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/f5fd1239e3e1c9fb2e4bad8a12bbe8ee9ba45fd6/


-- 
http://autobuild.buildroot.net
