From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Sep 2017 08:31:01 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-02
Message-ID: <20170903063101.8C8B721E11@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-02
================================

      successes : 222
       failures : 55 
       timeouts : 0  
          TOTAL : 277

Classification of failures by reason
====================================

             fontconfig-2.12.4 | 16
                netatalk-3.1.9 | 5 
               ifupdown-0.8.16 | 4 
                 log4cpp-1.1.3 | 4 
                 mesa3d-17.1.8 | 4 
                    libcgi-1.1 | 3 
                      qt-4.8.7 | 3 
                  cairo-1.14.8 | 2 
                    gawk-4.1.4 | 2 
                openjpeg-2.2.0 | 2 
                  boost-1.64.0 | 1 
                    efl-1.20.2 | 1 
              libarchive-3.2.1 | 1 
                libepoxy-1.4.3 | 1 
              libtomcrypt-1.17 | 1 
     linux-firmware-legal-info | 1 
                 mplayer-1.3.0 | 1 
             qt5location-5.9.1 | 1 
             util-linux-2.30.1 | 1 
        wayland-protocols-1.10 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/72f62bb61a51d122e2c3a88de0a8cfd7c35e9ed9 |     
      x86_64 |                   cairo-1.14.8 | NOK | http://autobuild.buildroot.net/results/02020f5847bce98cff3642d69ac0a1c12c93b007 | ORPH
      x86_64 |                   cairo-1.14.8 | NOK | http://autobuild.buildroot.net/results/d51888cbc3a743d53ce38f736ee43953e50bdf61 | ORPH
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/c5925d9e22dde6b2a539b9d5066514b50683f19c |     
     sparc64 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/9a718e5b0c4279fc79b1c610e587877bc1b90402 | ORPH
         arc |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/6c0579d3e17cdabe2d904a90155ca624152c8811 | ORPH
    mips64el |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/d9829b0ceff2b13c22f3058449d8c22a2921a767 | ORPH
         arm |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/52d2b6683131f649b6bcb56f387c18e432e73529 | ORPH
microblazeel |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/c1090b6c7881b8482cb7d4942a35a44876ae3380 | ORPH
      x86_64 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/25e6f9425e460909507a0b995d4496cf5b6547d9 | ORPH
      x86_64 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/268f9372da1659f0d7ee6242a2e7bb779872386a | ORPH
      x86_64 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/cdef044ce1229a7c01106a7dd2019eaab10f3f25 | ORPH
        i586 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/12212914ae9632364a2d58d7b09e6fe4aec705a0 | ORPH
microblazeel |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/43b7b9d35b227f5b6f38d06e0ab5a51c495bab01 | ORPH
         arm |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/20eb48fa07d8525c975262ce4df65ae225ea1ba0 | ORPH
    mips64el |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/f83a5a78654e9ce2600a96b8453c7c10a59fd47e | ORPH
      x86_64 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/bb5eac32dfe5034d57af091b59d69c99bd127685 | ORPH
         arm |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/9ac7fcf247371be72e061e887b69bb6e4b296ad3 | ORPH
         arc |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/b05677caa831b59beaf9a12d543c93d979aaf982 | ORPH
     sparc64 |              fontconfig-2.12.4 | NOK | http://autobuild.buildroot.net/results/67530ab6891211f2ab5e877a39cf79043a794d11 | ORPH
         arm |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/8000de1b46cb5316cf02e36aa7e54e8cfdd68d5f | ORPH
        or1k |                     gawk-4.1.4 | NOK | http://autobuild.buildroot.net/results/e13f9a8d6d3cf8a210dc9bbec7e2e5a90086862e | ORPH
     powerpc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/75eec6c9fc8e90f42c1611fa8132e41aa847c67f |     
     powerpc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/a433f6232318286189022d1532f75ebee1316faa |     
microblazeel |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/4d384b90848cb731fb6ad62456cf7ef0c3ded509 |     
    mips64el |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/de7d97a3619dae21c5353cdc3f517a386ddc9504 |     
      x86_64 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/5220422cbc1c338040ccf9fdd1a76bf566f945b1 | ORPH
         arm |                     libcgi-1.1 | NOK | http://autobuild.buildroot.net/results/5a26244f98e55d08fe502ce6fa546a90c3b438b0 | ORPH
microblazeel |                     libcgi-1.1 | NOK | http://autobuild.buildroot.net/results/e83f3399ff58f6292379695d80593e218a985889 | ORPH
microblazeel |                     libcgi-1.1 | NOK | http://autobuild.buildroot.net/results/d0b4740bdbd84ed6fcbba706caf42ebba4c07d15 | ORPH
     aarch64 |                 libepoxy-1.4.3 | NOK | http://autobuild.buildroot.net/results/5b77479c101dc43f92f23d3fd893d2df80697db0 |     
     powerpc |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/60feec952ab785fb22683e77a6384828abfc49d0 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/626252dfbb9dcc96a5debd94aaf93efb32c0a6f7 |     
      x86_64 |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/ea9bae57146c88821e2f25409f10877d411119f5 |     
         arm |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/f1c67f30fd01f4fa3a8623c50da52653ca4b155d |     
      xtensa |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/0f8e681e476eb5a0f580a81457121d0ee9cb9f82 |     
         arm |                  log4cpp-1.1.3 | NOK | http://autobuild.buildroot.net/results/ad95b617db199f57d4c90504ee95b30bc9175da3 |     
      x86_64 |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/4f5ddad88edf215a70fba23c128f4e12b6952e4a |     
      x86_64 |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/b67bf7d67af02070168dc6a0b443a835bc9fa822 |     
         arc |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/1b1f8c1e8c3f1baed224648ef47850f43c6ef01c |     
       nios2 |                  mesa3d-17.1.8 | NOK | http://autobuild.buildroot.net/results/f9713528c0ba6aee55165893bbfef26cc70980b1 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b776c575d472c3104145c4b7be2e4626bad48e3d |     
    mips64el |                 netatalk-3.1.9 | NOK | http://autobuild.buildroot.net/results/0a7c94e074da5a4944f2046cd33fdcc51d3884e5 | ORPH
         arm |                 netatalk-3.1.9 | NOK | http://autobuild.buildroot.net/results/81fa486ab2197e48af870271148c7778892b02cc | ORPH
    mips64el |                 netatalk-3.1.9 | NOK | http://autobuild.buildroot.net/results/524fdca85bdef63fdc053e2a3f5add960a05661f | ORPH
         arm |                 netatalk-3.1.9 | NOK | http://autobuild.buildroot.net/results/1ea7ec7398d275fd0a95663121ab8d9caa577d79 | ORPH
    mips64el |                 netatalk-3.1.9 | NOK | http://autobuild.buildroot.net/results/0a0eb61e447fa80fbcbe40c568b79813831d9c98 | ORPH
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/907c6fa38ce5219019a8d6db7633859ccc9c6e19 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fd1ece244b0222b695abfb3aec3a41291f63457f |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4de636fd4e79e55a2491e310c62ac74c7cea3562 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6b53421e12d565b41fe59c89d9c73f80a7332861 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b89a5d1cecfb5335cd7b96f56ea5ebfa5c874590 | ORPH
         arm |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/8f851184830ed06d396df49f3342fc28e1405f8c |     
    mips64el |              util-linux-2.30.1 | NOK | http://autobuild.buildroot.net/results/ea7430012f1d8e2ae3ceb8fe5d41630ea1eaa3af |     
    mips64el |         wayland-protocols-1.10 | NOK | http://autobuild.buildroot.net/results/3afb82d3fa2e797bd72b8e12bf32b61315fdfedb |     

-- 
http://autobuild.buildroot.net
