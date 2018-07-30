From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Jul 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-29
Message-ID: <20180730060013.EECB720737@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   0 |   0 |  26 |
   2018.05.x |  23 |   0 |   0 |  23 |
      master | 155 |  61 |   0 | 216 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 11
                  boost-1.67.0 | 9 
     linux-firmware-legal-info | 9 
                    ncmpc-0.30 | 6 
             gnuradio-3.7.13.3 | 5 
                cutelyst-2.5.1 | 3 
                 opencv3-3.3.0 | 3 
               mono-5.12.0.226 | 2 
               aircrack-ng-1.3 | 1 
                  dado-1.8.3-1 | 1 
     docker-engine-v17.05.0-ce | 1 
linuxptp-303b08cbf55096aba5... | 1 
                  lpeg-1.0.1-1 | 1 
            lttng-tools-2.10.4 | 1 
package/freescale-imx/firmw... | 1 
package/linux-firmware/linu... | 1 
              python-pyqt5-5.7 | 1 
            qt5location-5.11.1 | 1 
                  samba4-4.8.3 | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/9e60764355e478477379aa85c8ef8e580a57a506 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/78c2832724baf8ca8523d0af48709e713bd37526 |     
         sh4 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/786450e6a38a1cc41b83c304743c69f648721adb |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/336aeb82e0cf83fc3b4fdea24a8e2aaeb0931353 |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6529785ac59a1e5e09a816ad166959501883a1f2 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bdad342b70aa9083145157e825ac5f9cd94c879b |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/cd2d039ab5927201f03fedef188a814f81733148 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/163f573c4c0479397794f1117fda6d1b0b87aeb6 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/cfeffafad52bed884aaa4dadb7e94f848a127d76 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5ccacbff2b08595bc596b6c17183e9b9ae058996 |     
    mips64el |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/4abae787591d4b443cd49ded0f422608b676e576 |     
   powerpc64 |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/555cf0cd59c9c832b15c604dae5bad3640f8b450 |     
        mips |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/ecbe25728a81f13e35a4315b64aacb8e592f5867 |     
      x86_64 |                   dado-1.8.3-1 | NOK | http://autobuild.buildroot.net/results/fa1d50af90d066cd51954a467ad1c211b18ff315 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/8947bb122655a4168b5f84d7dbbe38ed1768983e |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0604cbbc4e4752c683cdd8b995a3dc3e260e1721 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/1c1ab4feb2b50ab45ccaecc03fef9d339b023909 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a1c32ccef1efbe19217f9f06c823b1dce0ac57ae |     
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/e1a6ea63b3fccefbfb3dd32345903df2888586a7 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/364a400da63669769aa130743e33cdecccf26e7b |     
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/2d2696f75a4ee382b5bb067a571025dbbae12ab8 |     
    mips64el |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/3f3694f5222570559dba35fe0485fc9a68337159 |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/45867d71c9db49c4208b23f5f78add78a33c4f8d |     
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/beede3858fb05e75b4420ea67811c75ab222025b |     
         arm |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/466bd34ec3fb1676123e78eaae4df4d78db740c6 |     
   powerpc64 |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/00dd9434a5bde5c67618f1952efc4a96423f73e7 |     
microblazeel |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/33034e34ea0f2e2cb8977ec4d6a351f29a718f8b |     
     powerpc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/600add1753952c5ba173148fd9644530b7da6c0d |     
         arc |      linux-firmware-legal-info | NOK | http://autobuild.buildroot.net/results/fee1aa773e4c3ab95f1c2e0c06849918f1e59b8f |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/efdc9bfae64d62d4516a58432f2643fac791e667 |     
         arm |                   lpeg-1.0.1-1 | NOK | http://autobuild.buildroot.net/results/ebe1d9b88c088abb2cc7c1a3887fc6921c9fb207 |     
         arm |             lttng-tools-2.10.4 | NOK | http://autobuild.buildroot.net/results/93fabf9cc05c199cc05e61c3a127e92bf87511a0 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/b3b125eea732c873b4ef1b67123c6ca20aa36926 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/cb38949bd06083034097aad4989a063738db50ba |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/0e147d3e4c3ad98190baa2c17d6a4ae053e50f98 |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/a6c44f7809347da31c490ce599a97aebb355d640 |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/af20c62775ceb20fcc719d6af74b58df48cf8f6a |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/2d36b22782dc9b157c85364423b5ce2e9fad4e81 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/2b7563dccc7b681d0ae5a07b56426759a4962b00 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/c59073a5c5a2c040873a7aeebd63e79faf7f8f2e |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/305f2bf8cc9b9346a59e7fd28489d7516eb4f536 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/bf50879cf1fe98d12423530602565526b0c6fd61 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/9bcb775214e71e0ba0fc4b988617b65b7ff8dc41 |     
         arm | package/freescale-imx/firmw... | NOK | http://autobuild.buildroot.net/results/796a5599020c7187ca450fc38d58a3e452bb1321 |     
    mips64el | package/linux-firmware/linu... | NOK | http://autobuild.buildroot.net/results/be554e097c6efce97ee9f05bd81782da6c27b3e4 |     
         sh4 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/0cb8ad8735ce3acd9790380ccef1748831263b6d |     
      mipsel |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/5d7333470c31b83c697218382dc77f74af86c666 |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/bb15ded9435bcb01cf65455607e2a2d2fd8dec9b |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4681b76cbca66a267741df80719a4c2e032c6b00 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/8b8251235f6b08ae2275659f7af241d6d43df074 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/6b214f1013d2def0b7ff33af3115147f47afd7a1 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/20d69cb3487bc8023997d32118cbee2f914bf2fb |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/569f64409cf2e593fc5b63514bbb17020b81a3fd |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b992e39c4a1563dceb6fabf246e7dd96c04b920a |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/c3960a95741341114ced8907de09b6a266999184 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/b7b300cc056bdc51a0570be2f250b806e306999e |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/ebe3e12887c89649ad3de0045846836957d83396 |     
       nios2 |                        unknown | NOK | http://autobuild.buildroot.net/results/1b862e22f9d1dfaf9b8d3a998061a83012302b05 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/90fee90a4a8f6bb35be94ee437f8f7c1f0cbb5d9 |     
     powerpc |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/e125b8d3a0da3070fdb85d982da6a88bcafb00eb |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/5105fb10bfe565541b021ae2282f6197fc328675 |     


-- 
http://autobuild.buildroot.net
