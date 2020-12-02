From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Dec 2020 08:08:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-01
Message-ID: <20201202080843.6DAC0876C2@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 11  |  0  |  1  | 12  |
  2020.08.x  | 10  |  4  |  0  | 14  |
    master   | 90  | 28  |  2  | 120 |
     next    | 23  | 11  |  0  | 34  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                        bustle | 2 
         conntrack-tools-1.4.6 | 2 
                       unknown | 2 
                  boost-1.74.0 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
             ipsec-tools-0.8.2 | 1 
               libuhttpd-3.4.2 | 1 
                     mc-4.8.25 | 1 
                 mesa3d-20.2.2 | 1 
              micropython-1.13 | 1 
                 midori-0.5.11 | 1 
                  ndisc6-1.0.4 | 1 
                  netsurf-3.10 | 1 
                    php-7.4.13 | 1 
                samba4-4.11.15 | 1 
       shadowsocks-libev-3.3.4 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                  uhd-3.15.0.0 | 1 
                    vlc-3.0.11 | 1 
               wireshark-3.4.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c1382638a49c5474c4ff593b72f6fe498ee423bd |     
  mips64el   |             bustle             | TIM | http://autobuild.buildroot.net/results/aef1acedcceb011f89422a8ea9dcf4f2fab8e3b9 |     
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/a851de652d755219af6b03a10a2523853e3ff125 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/21ccfc8cde6de05bca7b6469e20fa16f43547981 | ORPH
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/de75555b94031627834ecf851690ea09928db338 | ORPH
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/2b7e87941f853011785bdc462c39f7a703f48d65 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b65c534cd491230afad3d22c4b1220d802eb37bd | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a9d4f0bf0f5d1fcac683287a731e8517d6709c06 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/39423ac1f73a21ab8858f82ea3fbf5043a104850 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aef9616f38a44e5dbbc58e52c8fd11c8b4131b09 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/22155e120ab78e2f9d5d2bf1d374f90d85c0581f |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3d2bc286dbf31aa8d44cb0901019b844b34ff3bc |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/97d41694ee3e803150fb858ef97892cd6b9f6653 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/93df0162fb948e789bb767c4896cc6b3b790dee2 |     
    arm      |        libuhttpd-3.4.2         | NOK | http://autobuild.buildroot.net/results/5891d12e90182460cde1ddfa0ca75e9fd55e3dff |     
    arc      |           mc-4.8.25            | NOK | http://autobuild.buildroot.net/results/efd6c20857d05fed19516d5a130c38991fa2d7f1 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/2139e20b8d5ade767a7e44f2e7b4ea7aed52e53d |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/251d44db6d4f09681d0dcc349e0d0efa37248adb |     
   mipsel    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/36dde7f100413b8d1d8e6a73b190de29f4b5b4ba | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/321ff78787ce15881cc599eef7d011d4b31bf73d | ORPH
    arm      |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/e81568c2b4f5ef5d055c9b94e624ba2d23f50d16 |     
   mipsel    |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/d4d0d316d2987ab4ec619f1f7c89116b73a1e932 | ORPH
    arc      |         samba4-4.11.15         | NOK | http://autobuild.buildroot.net/results/c3ae4c6bcd1f503ffdb6242f6ef8711fc5718e21 |     
    arc      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/e757903cd2afca89baa72dc65df1d5b2f462ff49 |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/8047f232daed4dd67520bf36f4b2b730035132e8 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/67906ab64dff706cdb867976b902519068ca6743 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/824a210be824cb25c86f09ba0c126e77cac8f9c0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/258a078ba85e7baf837438cd592fa7d82ee704bf |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/5c4e40010bf58b4016f4516d4fa8a3706cd1e586 |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/add814fd3c2a29a1aaa7ffcd79f04e469df7904d | ORPH


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                        bustle | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |             bustle             | TIM | http://autobuild.buildroot.net/results/cb445239b25838d2f87eb12a43cfdd5ff1b0cdec |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

             kismet-2016-07-R1 | 2 
                     kbd-2.0.4 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           kbd-2.0.4            | NOK | http://autobuild.buildroot.net/results/9a778db04b50de681f774c74edc73246184e166d | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/37ac5163b658bc5a249b46afda47a0f978d63700 | ORPH
  powerpc    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/16cbf990ea3c0ca923234b74f71c693c5caccc84 | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/dc1202f276399e4ff3784f20e09d13ee75b4fd47 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 4 
            resiprocate-1.12.0 | 2 
               bind-legal-info | 1 
                  boost-1.74.0 | 1 
             host-cairo-1.16.0 | 1 
             kismet-2020-09-R4 | 1 
            quickjs-2020-09-06 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b7005701e582d57049b05600b9a5b33e08474364 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ff437b95e764fce212330bb931dba02a7e5efbfb | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b86f263b66c8279206d53e039aa6f5034c7ee0fc | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6883ba34fb0600b06587ed8eeb35001356182697 | ORPH
    arm      |        bind-legal-info         | NOK | http://autobuild.buildroot.net/results/662897cef85b586f2b199bed1d3e93c6462ef74c | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/c23df7ee51a85c829395798e9831e542f020841e |     
  aarch64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/5d12d51b4f08d8bd806733663d9e2ecad825ee1f |     
  riscv64    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/cc4ef747bfe8325f2c44ddddd0ebb01de0e46565 | ORPH
    arm      |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/f7882c718d0c88ca67eeb6714aa9b6f8fe66f9f2 |     
   mipsel    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/fb194021ac67fd82ad0b19cd5a39a7eda83fa288 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/0f32f6a907808aa9325285e76bcb5d9a8afed489 |     



-- 
http://autobuild.buildroot.net
