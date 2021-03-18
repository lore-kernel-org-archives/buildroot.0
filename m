From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Mar 2021 10:22:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-17
Message-ID: <20210318102222.A3946606A5@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  2  |  0  | 14  |
  2020.11.x  |  7  |  1  |  0  |  8  |
  2021.02.x  | 15  |  7  |  0  | 22  |
    master   | 67  | 43  |  0  | 110 |

Classification of failures by reason for master
-----------------------------------------------

x264-35417dcd65a57321fbadf9... | 8 
                elfutils-0.183 | 7 
                  boost-1.75.0 | 2 
        host-sentry-cli-1.57.0 | 2 
                 python3-3.9.2 | 2 
                       unknown | 2 
              asterisk-16.14.1 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-4.3.2 | 1 
  gobject-introspection-1.64.1 | 1 
                  janet-1.15.0 | 1 
               libglib2-2.66.7 | 1 
libplatform-a7cd0d5780ed80a... | 1 
            lttng-tools-2.12.3 | 1 
              micropython-1.14 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                     pigpio-79 | 1 
                 pixman-0.40.0 | 1 
            qpid-proton-0.33.0 | 1 
                 rt-tests-1.10 | 1 
          sane-backends-1.0.32 | 1 
                  scrypt-1.3.1 | 1 
                   sdl2-2.0.14 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/6fdba1e54a6c8e33f7a6ba6e45f5a2bb71a6fb10 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/720f716c8694d77ed5a6e7de2d18f2e1d483e7a5 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/f3796f36a32494abeefc9dd0a6a7ec6b20f1d760 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8e96384ee2a39fc81dd07fac52965817bfca0d4f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c276d776bac42af1413e1ebb44d1736e207286ba | ORPH
    i686     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/ea0de66508f9348b9b33eb7c188b3c4dc21a881b | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/c4cf42b5c6c4503bd2a5bc34a2fc49674f1e631b | ORPH
    arm      |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/c61c98381dd188e4fe3771ec395e57ba2ea0dc28 | ORPH
   mipsel    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/003ae73c7b48ad6b9837fb19ca197061d20eaf6d | ORPH
  riscv64    |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/d8c4be3a56e7e9dfa578c115b701cac86ad3ddd2 | ORPH
   sparc     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/191d57cd5fa75ea564076c000d83449812ec2405 | ORPH
    i686     |         elfutils-0.183         | NOK | http://autobuild.buildroot.net/results/155dc664894caae0cf4bb96178d69711566ca4cf | ORPH
  riscv64    |          ffmpeg-4.3.2          | NOK | http://autobuild.buildroot.net/results/5faa0bf503ab2f7de98cca2a1852ffd57307b433 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/70f36b245d328a0409a61ced882eb85e5fee4e08 | ORPH
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bdee056232fe7452ca0500bd6c7543ff76a4fa74 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b5598433874867eeb42540fdce946df2a7f7a3ac |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/dd894a7178a395ea29912804132b1516934e8fa3 |     
    arm      |        libglib2-2.66.7         | NOK | http://autobuild.buildroot.net/results/db12d9c5133151d119cdbf678f9445cda780775e |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/92ad31b5e3bcd278ea765571bfab5f7a4c001f11 |     
  riscv64    |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/8e0bf7eaa3d3c34e6bd9ba0324c8d1bd36c6e9e9 |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/d6a10d80d32d298b16b2a7a52e0c65fa8fa8f547 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/41b3a468eff682350668653a7432821630e5f09e | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ebe43db3fa4753e90d45386ad4c8d698ec9d3240 |     
    arm      |           pigpio-79            | NOK | http://autobuild.buildroot.net/results/2a37da01e644e1bfdb59730e90daf2325afdd1dc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ee69ef3a345bf9b51ea2aadac242a89059dad4a6 |     
    arm      |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/1f4cd2982bb536b118ce5a3a29ece665313a231d |     
    i586     |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/c45d7204fca8067bde2560aab1c7c3174eaf935f |     
    i586     |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/6a901b9ff68b7f52cabf8273d1017025fbd93b0d |     
  aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/7d6688a9098fdd0afcfeb74392824ecd3567fd10 |     
    arc      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/8234f1ed28e4955038af402997eea88a03a4de50 |     
   mipsel    |          scrypt-1.3.1          | NOK | http://autobuild.buildroot.net/results/2db1f6a448bdeb30d7faa9aa56fee2af0b7a2069 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/25d56f5d9505837f21a93f2004df3f1e4967dfd1 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/b1b17b819c7ab2b7c188619c195bd608ee4a455d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/3f4410149bdd1196dcd300e433d03c3c025b04c0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dcf9fe1b46e79c000d5af26e931e264ac462b34a |     
microblazeel | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/e263cdc90693044c3a6d99d135eeb8b4610c942a |     
   s390x     | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/b31b7a73e0094c9a3e27621f7f860c3b83de5fcf |     
microblazeel | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/2c114a5eba8ab5fca2ffa72728ffd10bde9952eb |     
 aarch64_be  | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/48cd8fad881bc4885661d963918bad64d947a317 |     
powerpc64le  | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/46a6a6f3aaaef443c35c95cc43d3573ada2824a7 |     
microblazeel | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/c45b2c06c3be9e84e8382f25274318acd71bd6cb |     
  mips64el   | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/a82902559a2f5c9a9eea0dc01f91f214c7051d2c |     
  powerpc    | x264-35417dcd65a57321fbadf9... | NOK | http://autobuild.buildroot.net/results/f46997e6a2b4a2f17875ed148beb1ab15b47d56b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
               protobuf-3.11.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/a6132dba61833153412e8acbebc54905f103dcd6 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/ad0ad4f13e5a5f17b2ad3370c2b6f3aaabb1abe6 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 xinetd-2-3-15 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         xinetd-2-3-15          | NOK | http://autobuild.buildroot.net/results/4be30996ca5ced8b67e31145564da3f5b341c1e0 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                apparmor-3.0.1 | 1 
                  cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
              micropython-1.13 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.53 | 1 
            qt5location-5.15.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/b188c1f941ff059082f877fd79afeb3f918786cf |     
    or1k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/7b8a2c7479a13a0eafad497447ef71fadfd1a0ac |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d359bd9155c75f3e43852e695fbeaa1cc1c67e7b |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/ba4e7f24d85a36b057d3fe305f89e061204d9d7b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/352e7b4782a2f92856219ad52d5e1e76cc583f34 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/0f619058dc756d56af6b6eeed5c02454f806532c |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/1020f6f5e2cafe68c3a4d4f0c4714ce8c4d3ed25 |     



-- 
http://autobuild.buildroot.net
