From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Jul 2017 08:30:54 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-10
Message-ID: <20170711063054.ED62420E4E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-10
================================

      successes : 167
       failures : 91 
       timeouts : 5  
          TOTAL : 263

Classification of failures by reason
====================================

     python-cryptography-1.7.2 | 34
                  lshw-B.02.18 | 6 
             host-aespipe-2.4d | 5 
       python-smbus-cffi-0.5.1 | 5 
                 sngrep-v1.4.3 | 5 
make: *** wait: No child pr... | 4 
               host-efl-1.19.1 | 3 
                busybox-1.26.2 | 2 
                  bwm-ng-0.6.1 | 2 
                  cppcms-1.0.5 | 2 
dvb-apps-3d43b280298c39a67d... | 2 
           python-pynacl-1.0.1 | 2 
                   trinity-1.7 | 2 
                      x265-2.4 | 2 
    azure-iot-sdk-c-2017-06-30 | 1 
              dieharder-3.31.1 | 1 
                     efivar-30 | 1 
                    efl-1.19.1 | 1 
                  ffmpeg-3.3.2 | 1 
                     gpsd-3.16 | 1 
              leptonica-1.74.1 | 1 
           libmemcached-1.0.18 | 1 
                libressl-2.5.4 | 1 
         libspatialindex-1.8.5 | 1 
                 libv4l-1.12.5 | 1 
        ltp-testsuite-20170516 | 1 
            lttng-libust-2.9.0 | 1 
                  nginx-1.12.0 | 1 
                    norm-1.5r6 | 1 
                openocd-0.10.0 | 1 
           oracle-mysql-5.1.73 | 1 
                     php-7.1.6 | 1 
               qt5webkit-5.8.0 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

         arm |     azure-iot-sdk-c-2017-06-30 | TIM | http://autobuild.buildroot.net/results/04e682d4d9f7bfe51423e28c028cea6e1f607853 |     
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/538f6b273f520b259ccca3e019e5623da754eea1 | ORPH
     sparc64 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6e31c13bbf937e3ded88c1c168b208d8c79be8bc | ORPH
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/81f9fe852cdabb47e8859c8f9e0bc1ed5cd70eb5 |     
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/aaea2ddf7a9f69c83f397573409582882694ad88 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/290139065d836b8921fd9c7b9285f413f46f838b | ORPH
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/50be2fc88479a1c47c1224cf87a5da238558c843 | ORPH
         arm |               dieharder-3.31.1 | NOK | http://autobuild.buildroot.net/results/cf08d42be8fcb659d59288e2cedf3f18b660e8a6 |     
        m68k | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/67ea6ea28cc1ff334c8b8d463c90a4b2322b8825 |     
      mipsel | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/2eebe390ff279da882fcff11cad2cb1d16fe03b4 |     
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/33adc3ef139d6814aef4c92ae0bcc4c810ab0b86 |     
     powerpc |                     efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/125e7b42ecca5e7034e38d62c0a2547a4148762f |     
         arm |                   ffmpeg-3.3.2 | NOK | http://autobuild.buildroot.net/results/b8424f91ad85070808741dd21cf71cf8de0a016f |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/5bb16e716c0379e9f2ef3e66094b5dbf04b27f66 |     
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/8e0a49767b20b9f5132ffa22c55a9c468b52d4b8 | ORPH
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/4f21eb5d0c6cbf5044f6a47db04646d104e4c2bc | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/fa3e87e28a4ed2cadebd1ed71bcbb64b173a0f74 | ORPH
         arc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/f12644c14523775636c0cd5b6844968f91557d46 | ORPH
         arc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/1e02df02c171d476b9f4e51ce503c38a79e296de | ORPH
         arm |                host-efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/798647a7d8fa101442c453662965c39d23a2891d |     
         arm |                host-efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/b51b806ab0ba36c08cf4b9808df63635c48c5d01 |     
         arm |                host-efl-1.19.1 | NOK | http://autobuild.buildroot.net/results/711671b358dab1b83232399adfe001a5516f981f |     
      mipsel |               leptonica-1.74.1 | NOK | http://autobuild.buildroot.net/results/8247a1c0f3a52dc2eb5409aa9bcd4c3015e77903 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f426806793d0cf0d4945626963161a839b9aba91 |     
        m68k |                 libressl-2.5.4 | NOK | http://autobuild.buildroot.net/results/2e379f778b2b5f8c363e4082e9cad932af9eb03b |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/256f621d6a5b6408860911794cbca904eabcab2b |     
        bfin |                  libv4l-1.12.5 | NOK | http://autobuild.buildroot.net/results/7e8fbd99a8c091d7bbeedd16066297682bbe29fe | ORPH
    mips64el |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/ad9f4e68d28d01dfaaeff9e4c718d162559d4bbf |     
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/7970f656d8d73965471902f8c15c478ba00a12dd |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/6e72bae4e44ec7c3b9aae08de5b26f736a11943d |     
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/160f57c4d945c679121560768dd58f74b4199b65 |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/94bb667c1b9ada7b1f45c4e8d6d3fd574408ca81 |     
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/49024b1b44c3c17bf24a25c4de3b3cd5d27bd6c1 |     
         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/0bd757579892b0de588e2dc27b75462544164197 |     
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/7e136ae8f12c40bc1c3ef705716afa2e9f279078 |     
 powerpc64le | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/62b7468c80d27652043898a8ab2dbfcc0f8760f1 |     
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/3e442e4b814bc3b08924aa6756cb301ff578ea48 |     
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/7872eff2ce6c761b9d1dab361f6812af5527a33f |     
        i586 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/cc6d3f41a6432bafd8f9cc6cec436a098bbe9a61 |     
         arc |                   nginx-1.12.0 | NOK | http://autobuild.buildroot.net/results/ff66e6f4f0f7cb58359a5e20f115cd416c30ebc0 |     
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/63d9dfab96735894e7973eb80cf8861c068486ab |     
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/cfbc93f6dc92b6902949e69c471f5726bbc3cebf | ORPH
         arm |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/71c6e158e0c60619ba46d63e59f2fd3afe5978a8 | ORPH
         arm |                      php-7.1.6 | NOK | http://autobuild.buildroot.net/results/1da84bee5123b60912a5bdf8bd38b8b1dc880167 | ORPH
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8b626ffb5d56a7d190f3f4bc8bbc4ff7031303f2 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/362e34d01fc28069be75cab9fbf004590be16d8d |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/3b2c45179d1857862b306dcdcb205bf7dab0adee |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/288b24b972caa7735c1408e42ea7246d72b75031 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/20e95e06a81db0a5789843a912e63428970a022a |     
       sparc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1b25834498690c773f63c67a0d0e90facce7b610 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9331adb11796d82fd9ba5021a51f10dd5c7ac3d9 |     
        m68k |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/50a064c97dbe7b5147df80a6609fdf0435b80ee9 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/c2a4a562cd2f7cf1778888b97d2e69dac7a360f4 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/698db03f704943fd9b04a51bdd42c479e5d2c6fe |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/01a464c7f3e6acaa1fe34f6cb411dc7abdc87860 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/063c1fe9e1f654ca56af9a3f518adc0ac99380a2 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e83505212824f66da0ab23edf6ffa4423f76e387 |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ff4f47028167b938938731bd04ac1f0b19446c3f |     
         sh4 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0c9135fa1eebb2b10fe657c53730f3a86af66f2e |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/6cb349d0023f67359e48951f0f6306f9eda2ff46 |     
     aarch64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/db9b2920b8646e9c33ec18f6bde898ce96e68d71 |     
 powerpc64le |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ca8637b8548b1ee8e37852aae24c1da583c6dc21 |     
     powerpc |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7584fb8af3a177b3498e08ea1a15eb8b29fb4a1e |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0b4fb724ef6e2329c826e6c690aa1b457b3360d7 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/02d656333e475469d22210710875b4d66fa4b7ba |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/2df35c5b7efa37aae4538f40fd53eaaf3154e989 |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/7323c54096ac7e71293f7f6e91c12bd890f1db03 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ddaf70f32b7c20c6e4dba5602f893d5a677b2186 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/9a1b2f3da7504817e4bf2bb86e3ac61fd0bc0127 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d693fb21422e12aee8dcea0d3f728b6e48ce0d89 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ac19608b9e0165a4acf85504fdd49e861d45a10f |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/1c5ec08123c40fc4d1979e4ed5df57ba1973df8b |     
       nios2 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/50ec135d2ff60d0e0822af0801850615007dd10e |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/cd8066cef18edc9fda7770319b3e10ecb220b3fa |     
      xtensa |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e6a8aab88b68a37f42350f8dd16a0d23bb4e0d3f |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/0d2712ba90926947b45f799f13779188b4a1ad31 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/85c8b3172ecc187d4089f9b257692d4501963438 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/48733e606bcc442fe4b3c8655f04e1af615ac1d4 |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/cf71da26383966206348260ea2adeb4d1442824d |     
    mips64el |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/21de7715c0493fa227de84c6179d08ba7b93d705 |     
         arc |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/ebdfa78ba825977db53b075661ecee30be15c939 |     
        i686 |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/3a93f08ff1f993706b6881e9ef5f57bb4a725062 |     
        mips |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/e23f238c55389793b53ba268fe5ac4334213332a |     
        or1k |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/7703c7f93b3417471b4e7276abec82baf0742f0e |     
         arm |        python-smbus-cffi-0.5.1 | NOK | http://autobuild.buildroot.net/results/1243effa0a74219de8bb988956f9c36c21a85a6b |     
        i686 |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/db2dba906f3376b138a2d32da9a407ac11492649 |     
         arc |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/3695d283d6980836655cadf07390e7f20619ab59 |     
 powerpc64le |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/2fc42b33ba03752cd3101648332b8cec5fcb3437 |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/912f20cf63df4d66cdd494eb56bdee148818bbff |     
     aarch64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/253a0522393184aba56fb9c9e5fd2487109243cd |     
         arm |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/7c365f1bf04b5a1da2d936096be0d95868f161aa |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/f435bbeac015b24df78b47938bc48d83319ffe1d |     
         arm |                    trinity-1.7 | NOK | http://autobuild.buildroot.net/results/e86e184f83fa5f442c65003ff5e04a4617f6603a |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/097caefd6e85a16f309069c1734b8205218a0d3c |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/120c7f339c3f96b754c3d3fec22100fa34197110 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/9cec6e8847c5a04d11c25f17cd65c11e30b436ce |     

-- 
http://autobuild.buildroot.net
