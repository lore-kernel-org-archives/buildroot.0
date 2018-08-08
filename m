From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  8 Aug 2018 08:00:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-07
Message-ID: <20180808060047.9CC13209AD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   1 |  16 |
   2018.05.x |  13 |   1 |   0 |  14 |
      master | 100 |  17 |   2 | 119 |
        next |  40 |   6 |   1 |  47 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                       unknown | 1 


Detail of failures
------------------

      mipsel |                        unknown | TIM | http://autobuild.buildroot.net/results/7406a7ba9fbd279ddada3b542358b846ad9e0e7d |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 


Detail of failures
------------------

         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/ba24c2754923580bac4c1d9e6ecf8251735ae65f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 8 
                    brltty-5.5 | 3 
           host-libselinux-2.7 | 2 
                    ncmpc-0.30 | 2 
               azure-iot-sdk-c | 1 
                    f2fs-tools | 1 
         host-cryptsetup-2.0.3 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        or1k |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/0af744f37ee6fffe192236f23b94b1248d82c77e |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/650791df697b73234e7308fcaf24c929bcd02b22 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/078047be9289d2438cca312e14b9b5c5e405a563 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2ba7e049160fa6c07b7bf12ca356a6dac1fc12a6 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ae765ef714b7290941a3e582ca80decbee950d67 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/dd2f49ab35ac7f9699c66d60a13583e0d5811722 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/cfdf121db9bdd978eeefc74b1955b29572a73d3d |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1128e1754c8c25c812a36736d59c9cb7a59efe9f |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/eb68e25320b2e8ee4f3c7fd19799fbc5411b064f |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/55b271cceb5b749f911266ed96998c4ee730fb86 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f8ff8c24d940113d7eb9729ae0b1b8e454cb4523 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/c1829952aec2356905a2d5559d77b3e79739ea21 |     
      mipsel |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/4132927b01038f9d84786809e769c8312c28a22e |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/ffda2579b215b53161025b7bc703091cb30ef95d |     
      mipsel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/f19d23e66648439464b7c9d4d2ce7f455492ba1e |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3be7f46f75314f9355214ec5aa0eba5f6f63c658 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/6debffb728ca0cf7a0b70aba3bb9a3b895793204 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/bd8f6b875816307cd86a4bb13d4bfef4ee37458a |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a6262fb9795568ea0be8934429b0e5c8f2e11936 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               azure-iot-sdk-c | 1 
               domoticz-4.9700 | 1 
                  mender-1.4.0 | 1 
                    ncmpc-0.30 | 1 
          openpowerlink-V2.7.0 | 1 
               qt5webkit-5.9.1 | 1 
                  samba4-4.8.3 | 1 


Detail of failures
------------------

     powerpc |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/ed60605ad92f749fb31e53319b97c36f175654b5 |     
         arm |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/4110b2425ef8fe5f4b834a5c8ebfbcf68bfeff3d |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/c6d560d91f7b5d3efa8a90e5dc3fcd02248fab76 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/ab7a3c407ae6778cdf719d1b2d2d6226479c0588 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/dedb1bbeca4b628eb79f87cdc0403b1b0430b82d |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/9d42295fa2c4b53d14894ff36721ed9d9043a6ed |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/8bc070e0a1b700a29e0253bcd0f0dad26059eea7 |     


-- 
http://autobuild.buildroot.net
