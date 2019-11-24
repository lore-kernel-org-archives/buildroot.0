From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Nov 2019 07:16:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-23
Message-ID: <20191124071655.01A9B85E6E@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  1  |  0  | 15  |
  2019.08.x  | 12  |  4  |  0  | 16  |
    master   | 120 | 34  |  0  | 154 |
     next    | 11  |  6  |  0  | 17  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 acsccid-1.1.7 | 2 
                libselinux-2.9 | 2 
               libupnpp-0.17.2 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
                qt5base-5.12.5 | 2 
            qt5location-5.12.5 | 2 
                snort-2.9.14.1 | 2 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  cmocka-1.1.5 | 1 
       gdb-arc-2019.09-rc1-gdb | 1 
                   grpc-1.23.0 | 1 
       gst1-plugins-bad-1.16.1 | 1 
                host-go-1.13.3 | 1 
              host-grpc-1.23.0 | 1 
               host-llvm-9.0.0 | 1 
            host-mfgtools-0.02 | 1 
              jpeg-turbo-2.0.2 | 1 
                libdrm-2.4.100 | 1 
                libgdiplus-5.6 | 1 
                  libssh-0.9.0 | 1 
               log4cplus-2.0.4 | 1 
                   mimic-1.1.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
              python-pyqt5-5.7 | 1 
                    strace-5.3 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/65f342669467598948bc1f350f22c6d9ae2ae45f |     
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/21b067f67c98bfafe2ec4c89615a01092c8b7815 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/56d73f0d567d950bebc2a3d0b146c7eebb1f7361 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/bd3780ca69d9b6c075c9f4a9455ecd8825c063f7 |     
    arc      |    gdb-arc-2019.09-rc1-gdb     | NOK | http://autobuild.buildroot.net/results/fc7e21106ee78d4d3b406996efe6aa318d71e1ae | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/e04e95a481b4b5ba496f2d2a10b04bb2df35c12e |     
  mips64el   |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/f7f6e7f339aaa826444706c562d8d706b6b760e5 |     
  mips64el   |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/060301abac0d064ff33c9484651bdd86f2ea84b4 |     
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/9809e85e1b57d5aef4987ba0adae64d4b62e900f |     
    sh4      |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/c0d54b6245b820746b7753173a5de1c974084857 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c49a1b0eabdd37ad7602c5ed68ca5a0030dbcfb4 |     
 aarch64_be  |        jpeg-turbo-2.0.2        | NOK | http://autobuild.buildroot.net/results/5e8dd6a5e78dc50fd0108163295539d6ee02c122 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/2aecff2818f286da6fe47bcfd97c52aed1fd40bf |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/a1799796fa244304c857fa10d6df5bd33add443f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e40175dd9d20e601f238b1d608cdc976a8a5f45b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6d1114e4cb6763eca7db1d24cbea0f6b20452c22 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/0a1b22706b7dc66df9b2e9a6699442a4920c334b |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/9458943bf4107fe8214dd68a3f67b28247310432 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/28aa3a79a55770d6d4e2f779472267f34b67b76b |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/fe56bc2ace13eeaf5e89802353424606cb2b9253 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d26eee111b604c253c27397b6ec4a75b78110454 |     
   nios2     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/801175597ef31aecfe0aa6bb8f2729c991bbc2dc |     
  riscv64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/b3d20ce746a01c3c4587d448355127641285dfaa |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/d4e737192a13b0da89aa567a63bbc0bec4c75600 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/a6f0773ce58b8f9fbc294aa91e8b04e2256ef45d |     
    i586     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/555a207e50cf7f40fae46aab4e0d2c2715bdb66c |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/17021987f29f4c292f47da9d3e353970986dfc7d |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/380f91b2fceb35d31ed2822b7121d149252b60a2 |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/ea6d54e7ae192809ff64d8e6370b926badcb64e8 |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/9155fdb30d0d6e10c5306333b45e76c316c6e25f |     
    i686     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/7ae1b80031eaa83580e6b15e2414dc05dccd8f36 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/870166b6683d91edbc9882db3431ae0fb2a8d809 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/2b168635e76209234f416bd300ff87a36e41ddc1 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/440dc893c823e0fc9041eba7cf3719c0c63dab03 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/68721b369b75b0c97b85bbff1e0904299f45e5b4 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

      gst1-plugins-base-1.16.0 | 1 
                snort-2.9.14.1 | 1 
                       unknown | 1 
               wireshark-3.0.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |    gst1-plugins-base-1.16.0    | NOK | http://autobuild.buildroot.net/results/37acf2303d8ac1b00039c3011c2f214582eac33a |     
   nios2     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/3cdb4f509e206269ba92f5a41feb90da33081c35 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9b1ce7ebd309ef856b772d643c7a8b93ee4d458f |     
   mipsel    |        wireshark-3.0.5         | NOK | http://autobuild.buildroot.net/results/404e853320311377536880acf3efdca246c99f72 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 1 
                 gerbera-1.3.2 | 1 
                libselinux-2.9 | 1 
linux-serial-test-9965dad53... | 1 
                    mpv-0.29.1 | 1 
                 samba4-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/8d3c34bf3b132900e4d6348a87a8e4f212f56ef5 | ORPH
   mipsel    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/24199339a094b03b7054dd28812acb6d63383dc9 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4b6d55b2e253badee19348cb7cc66032df5e9449 |     
   sparc     | linux-serial-test-9965dad53... | NOK | http://autobuild.buildroot.net/results/876280d7a8625f6568461a080e1038e0cc72c2dd |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2e94373519221665e303415c9c639f81e40244bb |     
  mips64el   |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/a8c0ca77850fa7dd4f40111028157624beaac3bb |     





-- 
http://autobuild.buildroot.net
