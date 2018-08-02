From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  2 Aug 2018 08:00:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-01
Message-ID: <20180802060030.675F4209A2@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.05.x |  25 |   1 |   1 |  27 |
      master | 136 |  38 |   1 | 175 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-guile-2.0.14 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

         arm |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/d87e2d172b7d299db0f1eec7b42cfbb770d43b6d | ORPH
         arc |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/5cd067874122adbd2dd019d3a4b228f55c169e5f |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 
                       unknown | 1 


Detail of failures
------------------

         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/c1f74b5e38195c819bbe081723f3363db099e638 |     
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/d646a50b9e65c8b93a3519f2ac3ef7037676d8fe |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 10
             gnuradio-3.7.13.3 | 7 
                  polkit-0.105 | 3 
                qt5base-5.11.1 | 2 
                 wiringpi-2.46 | 2 
                  zeromq-4.2.5 | 2 
               azure-iot-sdk-c | 1 
                 copas-2.0.2-1 | 1 
                cutelyst-2.5.1 | 1 
           host-libselinux-2.7 | 1 
          host-mono-5.12.0.226 | 1 
     linux-firmware-legal-info | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  lpeg-1.0.1-1 | 1 
            lttng-tools-2.10.4 | 1 
              lua-curl-0.3.7-1 | 1 
                    ncmpc-0.30 | 1 
                 opencv3-3.4.2 | 1 
                  samba4-4.8.3 | 1 


Detail of failures
------------------

        or1k |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/743aba22d527abebc74b244a30c31808118ba7e9 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a9d395f5b942930722160e8894e51b8f5ed9da71 |     
     aarch64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d7907c899e3c69590656d987bdb5b6412d1708e3 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/701d922a32637622bd75a6550c1d76a3675e8ef0 |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2f27cbc22cd04879e2bf4b237046fab4a5350476 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2b5dda8c84003b22e36f1ca544a62e7464e44012 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0736d7b83702095e24579890d8814fdba2a33cab |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d6f18cbc885eda66c9ed0baf7d3b098af9b631f9 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9f5fda5f8c48d6104df0e71a24b8e6133e78b75c |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6351627f224a9294d0dbf65f8e6e33460785b4bd |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/07f65f3d118a10bcd3e8239c24dd6a5f4126a28b |     
      x86_64 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/6be13d29c271a186dad22af1a3ea78498f03ab62 | ORPH
      xtensa |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/b4bd0807fed721d8f553f1392e7d1fa51545d046 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/77836563027ea93801fb5b4a32b00baeb3451dc0 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7e0801170ae2096ed1f1708f5c69170004275bda |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3ccd5a5a8274769ae91caa2f0507ed254dda06e0 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ca54d753d9f01409f8be12b9b7b8592c1c094b8b |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fc6e4f4785ce1e48f7c70472d0cc281652e4fe3c |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b66a232ee4ff04edb1a3a536302b3745bf51e0b3 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/00386e6888ca6021c8d39146789b86997e855edd |     
    mips64el |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/b662d9d687bc8b79835786c2b05859340f9008ad |     
         arm |           host-mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/fd83d3b10522d00e6fec6b18fa1aecd8aa4ff489 |     
      xtensa |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/cc0e44fa854597b8a83dfdcd6435cb55af1c8571 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/57335535517b3801e4473b554bcbce74bfbc1bde |     
         arm |                   lpeg-1.0.1-1 | NOK | http://autobuild.buildroot.net/results/fc39cbca763ce98a73204604949ba17d55894bbe |     
         arm |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/d26e61503728f16af2cdfd4bd3c68e08b08215e1 |     
         arm |               lua-curl-0.3.7-1 | NOK | http://autobuild.buildroot.net/results/3017d076fe1b53662063d8944b3e049d57b88553 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/966113c808b2474386f79dd72b1c48264622f234 |     
       sparc |                  opencv3-3.4.2 | NOK | http://autobuild.buildroot.net/results/5ca221792c72c0a19f8b0e8303c0603d28f3c48e |     
        m68k |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/1ee4c9fea0b7f5b0622f2c811428a88c567c0795 |     
         sh4 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/f6d5f6d2e757fdfbcc0654a2000abf762d34cd9f |     
      xtensa |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/5b9eb0b16c52bc14984e6e26f498ac0e4b74a947 |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/2e3f3fd4fecab9acd7900328d25c77644adaf4ea |     
    mips64el |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/06159500c27026d56a772fafbb0d956c72dd4e6c |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/07be813702563f1f0032af1e5b8b2fd62d40449f |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/0c8903db4d1740bbdb0756777b3d1731edb21418 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/d42e9daeaea01c9b62a01671fd3a3735481bd7c8 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4588c4ad915ac58e2855a2f8238d40faa6129bbd |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ed948785d2b8fcc874aad7474b0891d3002ca417 |     


-- 
http://autobuild.buildroot.net
