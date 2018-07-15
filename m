From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Jul 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-14
Message-ID: <20180715060016.8241820876@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   1 |   0 |  31 |
   2018.05.x |  24 |   1 |   0 |  25 |
      master | 156 |  64 |   0 | 220 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             freerdp-2.0.0-rc0 | 1 


Detail of failures
------------------

        or1k |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/07151335ad6da99a27cfb469402a0a65b2fff2ff |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                   qt53d-5.6.3 | 1 


Detail of failures
------------------

      mipsel |                    qt53d-5.6.3 | NOK | http://autobuild.buildroot.net/results/c64f9f78e066f97b845a2f332f697654fc7121e7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  squid-3.5.27 | 23
                  boost-1.67.0 | 9 
             gnuradio-3.7.13.3 | 5 
linuxptp-303b08cbf55096aba5... | 4 
                   wampcc-v1.6 | 4 
           cups-filters-1.20.3 | 3 
                    host-rustc | 3 
                qt5base-5.11.1 | 2 
               aircrack-ng-1.2 | 1 
               domoticz-4.9700 | 1 
             host-gauche-0.9.5 | 1 
                libmpeg2-0.5.1 | 1 
                   libnss-3.38 | 1 
                  mender-1.4.0 | 1 
               mono-5.12.0.226 | 1 
                 opencv3-3.3.0 | 1 
               qt5webkit-5.9.1 | 1 
                 wiringpi-2.46 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.2 | NOK | http://autobuild.buildroot.net/results/8d8cbb9983e9c51b07f62746e6a1f43d8600e794 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c5210e74b18d4c61edb1740eb1e2327da83e19bf |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2ad203f06e1892c642acf46bd9688570a4d80015 |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/42e18470c7eeb9f8f1d02f313437ae1233695736 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/dd40e5d7da35aacb3d610a95cadece94e250d28d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/07aab585d0773807a9ed980086a8d61e0138d43a |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a9798aa697be6acccac50bc8fc43345e7546fbe2 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0e5652b1b40ec079b1e1b24bc688ce03a8ddcb7d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/94f42f963ff8a97290479d21e72b9dfd4c79b09d |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6e82577788d93a05e30d88e664790425582b76c6 |     
      xtensa |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/3c9731beb9bb06732170fb72bd2efca9b70ee942 |     
 powerpc64le |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/d8d291d8ae788f16874199affa304715cd78749c |     
      mipsel |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/e295578d55781d4c71db65fd641d46b3bba25fac |     
        i686 |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/c9bdc3f224ff5fe4630ff316c7c1faacce4118b6 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c2b5c3d152e580439f41873a027619525a8cd79d |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/06357915b82b89ef25f2f015e34452a8a0ff36b4 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3b71fc0c691a105948a39ffef94132254d23abc2 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/9ce80e0b9414ac2b48fecf67b721f1a9dff84a8c |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4a8422df3be325aaec013defed7d9a2dcf3479fa |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/90f6e8f5b014cd96e972d7eb438746bc2ef475fd |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/c5466c05f7db2d25ebccbbc54c2cf329161ea8bc |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/0beb09d58e223263d8d04811fc1acd63a9d2e2ec |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/33b682a35335bf30466c5b8d2b9ad32ce61c58a9 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c0acb985d3924dd44df0ce18431318ba7846b07d | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/3ddd5701e5ea3fe45d3ca45e690981bb6abb1fb4 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/114474266e8140040647d38edfadd00aa733039c |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/706a33bccc1c30bf95856c44efa11023bb7549cc |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/5c30b4f8e7ac5c1eed732a71c8dd52179f126f52 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/2c719fc8202a37f7e85f625b588a31282ae824f9 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/3e09057d9396c7a149696d29c66ec6ccd9503510 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/53fffd9b34d7d3bea8a14d5e709317d2ef825ea4 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/e23f3193addb41c948276fa8a600069006544407 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/028eb52e0639a22a283341b27fc64cd42f29e76c |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/02421ede43175f1d1dfc453dbeac8fe64821a55d |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/d45743d791d335f8e20e75fe3807bb00b5589dec |     
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/f0684fea7abbd7f4ded9bf9dc239b7d86d7bf8af | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/a4df9a44808718e9247dfce5191ebd5185045f42 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/9f8489762ff33cbd4d050681135d47d3fb6dc06f | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/cce0b3b611061dcd4956f8d3b28fd9ab08ba5c64 | ORPH
        i686 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/6ebf23648e597ec7ccb9742323a53e8e578ec88b | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/242d5fecf6b730cebc0d9a06ae18fdb30c37428b | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/00f55a849b7ce0082797b3aee00306a303a4ee58 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/69d3c2c15bca9f316c7cc07839d75f7750164962 | ORPH
      x86_64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/84fabd3198b5bd0c42171aaf5f0ffb94991824a9 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/6233029aaee7643c678a9a601fe26e7f1eea31b5 | ORPH
      mipsel |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/b4d87182d35b9ff44c8c46a265ac1fca3fed0831 | ORPH
       nios2 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/cbc8470e0d0489a49d689aba09e7468fef8962a4 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/9b7eded25695b86a11a1f2599231c23559bf7202 | ORPH
         arc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/f327d3634be502606666bdc1a2e812c03b375394 | ORPH
     aarch64 |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/b1f72340d7d994bad109389cb9c259197831b8e1 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/c8f403b2b909b4f586449971d61ef496a5594383 | ORPH
    mips64el |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/4782a8b71f0b0545f1438b182d7448b2befa4f3a | ORPH
        mips |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/ac506acce812be70d328d6256d7e434d4d87627e | ORPH
 powerpc64le |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/99f2d58ce1d1aa323b0548e42bd3f01ca310da03 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/945fe1f1366a5c64522570b9274d3d5be0008c6c | ORPH
       sparc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/725d84d4df9f6ec211bcf8a855bac3aa63a65c41 | ORPH
     powerpc |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/8698d5fef26b87375141cc48d17e05d382540c11 | ORPH
         arm |                   squid-3.5.27 | NOK | http://autobuild.buildroot.net/results/65bc47971013e67704832bd12e3a97fff2e36435 | ORPH
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/d733c2be8c0989cf4e740b4fe81600ece23f8596 |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/bd6282523cead4d5922fa75d1df8b7e0386a9566 |     
        mips |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/1950861b3eeaac0da5f6bb7a7077599e7604111a |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/95bff4c6e06d1a0880aee48dbc48ac1abeb87316 |     
      x86_64 |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/2ed053c0c87f9b284629ae9f97d70cdecaa17d47 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/73a1f3d78052d683b5468d1fc40daff620384527 |     


-- 
http://autobuild.buildroot.net
