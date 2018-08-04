From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  4 Aug 2018 08:00:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-03
Message-ID: <20180804060049.54442207CF@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   3 |   0 |  19 |
   2018.05.x |  11 |   1 |   0 |  12 |
      master | 152 |  46 |   2 | 200 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 
         host-cryptsetup-2.0.0 | 1 
     qt5xmlpatterns-legal-info | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7615d7e6bebeb870de0ef125ade523adf840be70 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/4d2627d5644dc3e4c3478d8a9ebf8ef41dbf4124 |     
     aarch64 |      qt5xmlpatterns-legal-info | NOK | http://autobuild.buildroot.net/results/c8d2767e5541cdb8c36ecc69772b506443b59a83 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                    links-2.14 | 1 


Detail of failures
------------------

      x86_64 |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/1d1a1388689725cb3dd00fe76f988704baae1efc | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 8 
                  polkit-0.105 | 8 
                  boost-1.67.0 | 4 
              argparse-0.5.0-1 | 3 
                cutelyst-2.5.1 | 3 
           host-libselinux-2.7 | 3 
               azure-iot-sdk-c | 2 
                cgilua-5.2.1-1 | 2 
                 host-rauc-0.4 | 2 
                 opencv3-3.4.2 | 2 
               aircrack-ng-1.3 | 1 
             coxpcall-1.16.0-1 | 1 
                    links-2.14 | 1 
linuxptp-303b08cbf55096aba5... | 1 
               mono-5.12.0.226 | 1 
                    ncmpc-0.30 | 1 
          openpowerlink-V2.7.0 | 1 
            qt5location-5.11.1 | 1 
           uboot-tools-2018.07 | 1 
                 wiringpi-2.46 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/d85c8cd4dd0854e3c13e33e067d6234109fbad8f |     
         arm |               argparse-0.5.0-1 | NOK | http://autobuild.buildroot.net/results/db85382cdc977fdbb89bab7574002b67af151932 |     
      x86_64 |               argparse-0.5.0-1 | NOK | http://autobuild.buildroot.net/results/ec0d767365928e0616a0adc5cc46a782ba267577 |     
      x86_64 |               argparse-0.5.0-1 | NOK | http://autobuild.buildroot.net/results/9df255c3e7c012dcec79976244db27ba9c69a026 |     
         arm |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/f1e7cbfde23db3ebb528163b555d41ff9e715680 |     
 powerpc64le |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/130d901b40c542ffc0d8d15047b9b8ae42db8f28 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/98ebf12c40fb8505bb590e6704c0c4bbbb0ff969 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4473b3a601417d65b31fa7ed56350847b8a00279 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/215fe40e21b4cc7bb4a74fd1b12a30e7a1cbf84d |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/22768e06deae3fdfaa4027ad7fb9a74b2b72cb71 |     
      x86_64 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/189b743dcaa1483fce02af27e6b2e1c29d32ac17 | ORPH
      x86_64 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/36a70cd680edc76d24719600e9a31e72bffe9561 | ORPH
      x86_64 |              coxpcall-1.16.0-1 | NOK | http://autobuild.buildroot.net/results/25968ac540cbe1afe1695e52fa214db18849948b | ORPH
        i686 |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/d38411eda9edf16e2c40d8931bcfc889faae43dc |     
         arm |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/90c56e4e001daa71efd92c926fe3a5dc5ec759e7 |     
         arc |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/01933cfc6ef8eea890e3b6c870c7d6cada7db5ee |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/290923910f16a5e1654f53e5e0da33fa4232c92d |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/648dae7e36d3f2e67f23a2c1fe0b8127b1770cef |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c03d0fd25a01b85de34730c65575ffe55fe7059f |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3258a249ba674e1168d8e3c786a1f5822e845f72 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5d5c85453388dee82b839dbac99def4d501a78b9 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/71afc004d7bc8a7c441c13dd7893bf912ae3b432 |     
  aarch64_be |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fe7a07beb2d0ac56f66ce6da222d14e20378c7eb |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/cc148d1064f47759ba36e544f04f6282213f6608 |     
       sparc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ac7c90283b46b177b24280c34f8a3aaa8faef708 |     
      xtensa |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/db4e2f20c86d52946a4dd253e73333c659e2d285 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/ddb55775875439ebebe3abe09e215fadf1ccc818 |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/ad56123ba2fa95ab9c468eda0ab4039ff4fc664c |     
      xtensa |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/5e66b71e737530e6a2ec01621d2e734d386f0aa8 |     
      mipsel |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/16dc8fc6e97da44f3939eee782dc1c5e7ff3feda | ORPH
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/0c83808d90ac04e5002a9166d1d62cf0245505c7 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/2d86a1163d30c9d93ba717291506d4e714281f61 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/77bd168fcf78140108cc333b9ad98eae56af7a66 |     
       sparc |                  opencv3-3.4.2 | NOK | http://autobuild.buildroot.net/results/0b3d8c0d2d6c021f7898ce21b6d6c70655773cf5 |     
       nios2 |                  opencv3-3.4.2 | NOK | http://autobuild.buildroot.net/results/6ccd7155fd5cd343ffdcc8b3cd619a2e9afbcf5c |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/43f0cf875e2827edf6f21d59331da424708b9725 |     
    mips64el |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/899e2b2359d45b8dd1f687aa66be12839c76e301 |     
      xtensa |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/e16c65eee251a2d6a299fb7598e49215f9c6ac34 |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/9cd3078cf2fd2e53241c3efcdea889b594d0d597 |     
      mipsel |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/a5adda089315586297d0bab1b106ac709cc4e600 |     
        i686 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/458d2c4fe30a54b566afe4cc694e6a1938c09c34 |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/cb435dc34d4274ca41a40e6761b2cba499506152 |     
       sparc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/81d23ec68bf9e26fc3708db145bf8a61265e8f62 |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/7894d0859bdd1afafe3e65d5827f60c26a6d5d5f |     
        i686 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/da87ca470b22d599bb25998af8f25136921f35a7 |     
        m68k |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/c0ab35c3cb46f84863fe20c0ee92ecc2379578b6 |     
        i586 |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/8cb1b8e587c6f9965c634ac7bd5b4e36b2e5fbb0 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/05b563e9e1a2b7fd48d73723fe9068894ea709c5 |     


-- 
http://autobuild.buildroot.net
