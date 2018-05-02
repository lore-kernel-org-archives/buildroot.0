From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  2 May 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-01
Message-ID: <20180502060019.C03FF20829@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   1 |   0 |  27 |
      master | 137 |  61 |   4 | 202 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a738d187045fda86efefae1c8e081777dd59a5fa |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               sdl2-legal-info | 18
                     lxc-3.0.0 | 7 
                    cups-2.2.7 | 6 
      gst1-plugins-ugly-1.12.4 | 3 
                  host-go-1.10 | 3 
           libfreeimage-3.17.0 | 3 
                       unknown | 3 
bluez-alsa-9045edb436ea755f... | 2 
                         boost | 2 
                host-libsodium | 2 
                 host-rauc-0.4 | 2 
                 libcue-v2.2.0 | 2 
               log4cplus-1.1.2 | 2 
                 mplayer-1.3.0 | 2 
                      qt-4.8.7 | 2 
           execline-legal-info | 1 
                  libkrb5-1.16 | 1 
               libupnpp-0.16.1 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                     vlc-2.2.8 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        m68k | bluez-alsa-9045edb436ea755f... | NOK | http://autobuild.buildroot.net/results/707fd46921b1cfda90e9c30be33ca918f2d0cb00 | ORPH
        m68k | bluez-alsa-9045edb436ea755f... | NOK | http://autobuild.buildroot.net/results/c5fabb13249e487f67f7f630d0cb0ee4ea058112 | ORPH
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/65a5da97b7bf66c5afc42118e191b831b37e384f |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/f7ae1eba559820c3cfe4583380f9b2057acc661d |     
    mips64el |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/93ce44fe633362a16820a1c99a70f7ce41a6cdb6 |     
      x86_64 |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/9d7b82de0cd49c1902c0914cbcb5d50de1120061 |     
        or1k |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/08e401cc6561f7e85e24eaae3b84015aef140047 |     
        i586 |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/bfe35805a44c861dc5e69ec9be835392ad57d42c |     
         arc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/9e60ab6d4861e46be79c0ff776f8eb4790f0fa2b |     
       sparc |                     cups-2.2.7 | NOK | http://autobuild.buildroot.net/results/28a3710c6f9165db082c5bf225dc18e35157f93b |     
     powerpc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/6f0dcacbba4abd48927ccae044c32e07a96a50a4 |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/9b396abe17d1c16ebccdd10aff8d41bd4e37746f |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/9f58be352f26e61cdf98a085889caf75b719085b |     
     powerpc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/7d91dc30d6c8622c516cdb3cf224444738165cbe |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e1c9566fea9ee3236939fd650db21488cf8c3776 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2778f875d2c8262aa5f033e1f492d0e3666fa30b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/9c026d53966514a883aa24a536c6c25ca8b4cb9f | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/718b2662109d1f80677bb7b66c2511d832d8fe71 |     
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/aae11a559a7cca29b6ff1ea5730fa9797d866221 |     
    mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/d9d4c1b60ec5f1d7890d321c8098898d2786c177 |     
      xtensa |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/2b39c0d78cb54dfe549dfcdf94de190363f773e2 |     
         arm |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/02712e85db8e538045497e9242b476c040198f1d |     
        m68k |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/f268a439532240376f6eb1e004e4be74b2c7704a |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/62f0561cc67c146a9e4d8143f2220bca2eb019f6 |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/79bff2d16ba741496ab40b74016b5b0f46954889 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f6c55f160bff06d69f2f19521ef3f115dfab5aec |     
       nios2 |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/18a4c020cc5a67c9c9aec3af3831c5243d649ae2 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/04922c9e412f95671b9f1e55635968a3a9e9e73b |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/78de919a52e2b707e46f80bb7bc44e77080805c5 |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/5c1286897ad18c555ed068e2287caec5b8a07205 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d91c091ed4d2913c83387e5926bce46a2581bfb2 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b8b33097664d155cc37b6c7c91bd64302a636b5a |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/132f32ae0cb6410e8bb6e5058de5e4db8e2b27fb |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/92562d151c9e4e85ef82abee69747074c4ff3bf8 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d429901b371c9ff52bfe410cb6f02e920cd4158d |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b38bf160424b2d165f7bfb955f6c2cfe6850ba7e |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/650305750d7d1e66ea1f9c4a9ff18c9109a0c086 |     
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ac8f856eeda152ac0d7e8913c64569506a6a33d2 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6d1cb7e89939e273540057e2b77f2ea061c080e5 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1fb83095d9548ca4df186abe4b62305a9ee9f653 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/88aa811ae5ef32ef3b5467fa456d7ad2337b4107 | ORPH
        i686 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/6ccab6fe77020e83e2baed7915bfc38f4c3ff14b |     
   powerpc64 |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/92b026a4e190f29983b1c58066de0fce585d52d2 |     
         arm |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/ea3b20c180e880243ab2ef41bb12343c3baeca7d |     
      xtensa |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/045fb584140ca01f8adc9bea0db08b18f469b09e |     
         arc |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/3cbbcde478e0d52317a7e8f0bb17bbb2d5756e6f |     
        m68k |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/f2bf5b78d985abe69a0e78ab70f33edfe606a23e |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/1692f49cefda4fb37e5a275e5338a65fa55e2c2a |     
      xtensa |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/41b8b8e9ab65665bae79d7686e3222e5619cb307 |     
      xtensa |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/ebb5cfa8d0f3a9eb0b4989e872848368e66916d2 |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/c7f7ecedc182ac4e2d1a09937c48cffba3bb433f |     
       nios2 |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/694dc75179f510b8c93d7f4881258b7483d867fd |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/e0b0be90d3c44bfbfe9e65a3c7ba852c5a89c5f1 |     
         sh4 |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/6722496b741c491820a4e08a677337d7082796e4 |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/1de2a6464354baf4ad3ce52b4183882824692ac4 |     
 powerpc64le |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/99139711f505599f6d0938d22f2f44a1fcca18e2 |     
    mips64el |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/e0eec170a8ddf7dd251d7ba490fdf40a5b27ee3e |     
         arc |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/311bbd8e988260e5f59da36d5c15712d5973ce73 |     
     aarch64 |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/fb7aa5ddc344074274ab84633e5c829cd583496e |     
        i686 |                sdl2-legal-info | NOK | http://autobuild.buildroot.net/results/25a1d1c5b3a7b0194b88e3ba124ccba0f370d2f3 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4ec48966816b6aaf3fb5baf14c684d16929d2228 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ab6751615ac058d892258be9e7a8e110e68c62c5 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/518403b508d6a9e932369aa63365684814fa6521 |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/597509b53c2ee87a4e84c867674f97615fce0311 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6665725175b8c0fce09cb782a021a3e84102013b |     


-- 
http://autobuild.buildroot.net
