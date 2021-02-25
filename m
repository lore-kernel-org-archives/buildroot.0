From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Feb 2021 08:18:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-24
Message-ID: <20210225081811.F079860758@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  2  |  0  | 20  |
  2020.11.x  | 16  |  2  |  0  | 18  |
    master   | 141 | 58  |  1  | 200 |
     next    | 22  | 16  |  1  | 39  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 10
                  dhcpcd-9.4.0 | 4 
             libopenssl-1.1.1j | 4 
                    qemu-5.2.0 | 4 
                  zeromq-4.3.4 | 4 
                       unknown | 3 
          fuse-overlayfs-1.4.0 | 2 
                   httping-2.5 | 2 
                 python3-3.9.1 | 2 
              asterisk-16.14.1 | 1 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                    efl-1.25.0 | 1 
  gobject-introspection-1.64.1 | 1 
      gst1-plugins-base-1.18.3 | 1 
          gstreamer1-mm-1.10.0 | 1 
                     host-mono | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libgeos-3.9.0 | 1 
              libostree-2020.8 | 1 
              micropython-1.13 | 1 
                  monkey-1.6.9 | 1 
              netopeer2-1.1.53 | 1 
open2300-f21982e0b1f8321561... | 1 
                openblas-0.3.9 | 1 
                 openmpi-4.0.0 | 1 
                   perl-5.32.1 | 1 
           python-pybind-2.6.1 | 1 
             qt5wayland-5.15.2 | 1 
                rocksdb-6.13.3 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/b8350869d39ad68c36b04bff1d13e9a6bd5d0943 |     
    arc      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/bf4731871790a7f3d80854a4f97fb7b6f2ad3d49 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0a75cfdf486411ae516c41efbac793ae149f9706 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/5847eae94f8d0309edf190c4da38355ccd1b0f7b | ORPH
   sparc     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a15671ffb34a8dae85f1aac1326e085c72fb12d3 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/471b9b1f0d9442ad7087eaad6f2bf868646d8e53 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/794733e82c1b3d8b4527424889ace2af1888ee58 |     
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/74f9ca9941101a8f151770fb5d62414e07dfefa3 |     
   x86_64    |           efl-1.25.0           | NOK | http://autobuild.buildroot.net/results/9d35f79561a9cd18cda41a3d84228d10ed936d81 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/2ff24127b887e875c49cec7a45ad5b1ff8912b98 |     
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/e7bc994df6c384e34b81f1a376e6ba2fb49b7758 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/43cf89d05aa7a3b7f8d391dd1c6e3b1825cda5fe | ORPH
    sh4      |    gst1-plugins-base-1.18.3    | NOK | http://autobuild.buildroot.net/results/f245f1dd5d5d672af86eb237738f454ab387dbc5 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e5d40f74cb36e0f3bbd8a402558eb83b9d4d07af | ORPH
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/355a0d47f82bef514c0eec8aca5747f7d021abc3 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3f7df135860e0fbaae14bed1e439688da559f90 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82f876519096f68a3e9b945585ca502ff2b15542 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c770645b99348273b033eeb0de80af448757b16d |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/039639e1e3a106aa1ae3325dc72837588a68e3ba |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fb90a998f407d295c2f1eece470be080ae2bbde7 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/757261046f715ebce265c5cee64ec18ab1eeee8a |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7fadcf8442f12ee4ec6732dec36dad82d5f3b866 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a96179c85f4c2c5af7ce4b612b10b6bbbe04faf7 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/102493a5746b2f7ef397c0bea5c94872247077bf |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/adfe831df49fac61481f3bf677b46ff7b415ac38 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/741e825a634bce8166fcf77a8ad081e5d1c69a72 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/e78c55aaef99e32ee1021fa91a794ec02d4604a3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/764906815de87533ba4d9097d9d5dd12bb205705 |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/c9141b9ff2dcf44196f4e5a03e60d985f8d63c6a | ORPH
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/b2301036e887f81e478695d64118fefd7e427148 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/a54cc82f761a71cee984248e168b1943a8e50173 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/2fc8d74181e7f85113809f198492c1120fb2950e |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/0dfca03d892b090102decf064a9a0852ba38475b |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/53788469d495dac5bfa28da214b8e87c58d3520e |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/608db41424bdfc1a60d457ff9f1a2b9c2d415131 |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/6c0229581baa4de5685b2e701262009dcd7d5687 | ORPH
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/de281fd47038182e5241e77fe286f9badb7f4827 |     
  mips64el   | open2300-f21982e0b1f8321561... | NOK | http://autobuild.buildroot.net/results/cd1cf792e3119e65121e38a7f1031211890f91d0 | ORPH
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/578e3aa3b05350bee2c60d363bcca7ee99484f59 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/62defe48fcdd0cc153820105628afce281ea9772 | ORPH
  powerpc    |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/a6b31dc0f17bff62a78bff6d98037fc55b1e72df |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/5aa7284bef25b9a094f5c1de676a9fd389d4b1c3 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/06d3d0523a7194a5fbbbf03341ed4035c24f78f6 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/9d7a764955970ed6fd4917703682824ac0d69cea |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/f405f81720253b3f5d99e8c9e9f77136090fa00e |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/332fe140775563ab5ae74e3e2728f9b5c99b82cb |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/60650efb6069c3f4113ff3c18ef026bb0359c2ec |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/bfebc2a74baeedda13de601df34c3f5d714a136a |     
    arm      |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/2f038d089ba8496aaefc65e348ebf22069f637be |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/71e3bbb8df03b94dd5d2285f8b421c885423c39c |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/877879987f7adea0fa239e879b056c248968b1e9 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/2630e953598ce79bf060cd2798787ef4713048eb |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e17ca34082a8544f5968566c6c88f4d3a330e3d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d4fe43e4cd3dfff179ce749a9745156faade2ee8 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1953cea623346fb774301593ff529c387a776057 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c45aeebc6f60fbb5ac08fdfe2830645c22225ff6 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/60f931c77bc172e1bba60a2adaa9e5b271c09fab |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f9a4c53f135fa4c851f1109de9263c3799de4040 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/98588c16341fb9aa5c126cef7d18c1e5adcbbd59 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                    vlc-3.0.12 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/3e34f150afc7f0b53b5c56662bf4c12c694c4a14 |     
    sh4      |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/661c7495f95f4230f8c207d505c209d43bd8faa0 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
              wpewebkit-2.30.5 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7e970305f5d13bf1b5fe3bd97a72396aa61da23a |     
    arm      |        wpewebkit-2.30.5        | NOK | http://autobuild.buildroot.net/results/f7298741dea541869157a04eaacb154b2836242b |     


Classification of failures by reason for next
---------------------------------------------

                     mc-4.8.26 | 3 
                libselinux-3.1 | 2 
                   gvfs-1.44.1 | 1 
                ipmiutil-3.1.7 | 1 
                  janet-1.15.0 | 1 
             kismet-2020-12-R3 | 1 
             libopenh264-2.1.1 | 1 
             libopenssl-1.1.1i | 1 
                libshout-2.4.5 | 1 
                  monkey-1.6.9 | 1 
              netopeer2-1.1.53 | 1 
                  perl-gd-2.73 | 1 
                   xlib_libICE | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/2d08eaffa208d88325b246a7466b36a52739c53b | ORPH
   x86_64    |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/194ae96d09fb29655e8cbb7ead13dd6ba556677d |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/1910e9bf9afddf19458dfe2d50d918f4d9051fe0 |     
    arm      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/5329349a450a4a62ccdd7e262a53c9de8b49dc74 | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/2375356f2f5f086929dde8293e73eeac25daf6b3 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/fb2820bf3ad51e6703bb3fe5cadd59ee4b836822 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/5d1e7a11e700c4a549361444307fbe05e8bc5b2d |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/00374e73d226f242a9949332b9a61788080d2bc0 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/1226dde258d0c6d7ddbb6dcdb69103c61f2f242c | ORPH
    i686     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/676426be7c7c01171e274630aea777ec0ccb9cfb |     
    i586     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/9a8c9c2a728eaaba31334f9468d24e1cea5333eb |     
    arm      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/114d78c2ab777a30f0e9b22015f4f0805518136a |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/cbf7957fb77f94fcfdb5bf5a29b9915fffbdcef7 | ORPH
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/de51cbe4eb42ab2f428c737b4093d27de3b95f1e |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/e8db05033b9dae58658717a09efa72d097e35adb |     
 powerpc64   |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/b6783d9a79724205ab0285b9106c3ae0e67a737a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cb24e07334b6fbde1fa5a2070b47fd03f75b7298 |     



-- 
http://autobuild.buildroot.net
