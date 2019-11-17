From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Nov 2019 07:16:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-16
Message-ID: <20191117071623.1FD8486AF9@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  0  |  0  | 14  |
  2019.08.x  | 15  |  2  |  0  | 17  |
    master   | 109 | 44  |  0  | 153 |
     next    | 14  |  7  |  0  | 21  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 8 
                       kmod-26 | 3 
       gst1-plugins-bad-1.16.1 | 2 
                 haproxy-2.0.5 | 2 
              host-grpc-1.23.0 | 2 
                libselinux-2.9 | 2 
                   mimic-1.1.0 | 2 
                oprofile-1.3.0 | 2 
                 acsccid-1.1.7 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                  flashrom-1.1 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                 jack1-0.125.0 | 1 
                libdrm-2.4.100 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
               log4cplus-2.0.4 | 1 
                   lsof-4.93.2 | 1 
        ltp-testsuite-20190930 | 1 
                 mesa3d-19.2.4 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
           oracle-mysql-5.1.73 | 1 
                supertux-0.6.0 | 1 
toolchain-external-codesour... | 1 
                    xen-4.12.1 | 1 
    xserver_xorg-server-1.20.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/a2e0d3fccd4774e00ea54ff6d3f9f46cf4ea3b34 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/828839807534e3e6ae15a9e8846aa73fa2ab1c0a | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/651830cf83c2d20a11fc0100dfd71168b5eb1ef0 |     
   x86_64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6017104ac4833114daa2aa9b448c9ce385617f4b |     
    sh4      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/237c67f3da037360a98602b137b18909fa079b73 |     
  powerpc    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/0a876c4721a29c46c73b3d11677aeab056e5117b |     
    m68k     |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/bc7fdaddf75b7f72278b6ee46c3427ea32649027 |     
   x86_64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/a044ae55a873eb930381b220894b2ea875eb86c9 |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/3399750c988dfc44096669a29112d40336f41959 |     
   mipsel    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/67f984e830462a96129501edd089ffe9aa0291ca |     
    arm      |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/4296e0f319e6c4a5077a4c2af894f2551b031829 |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/99d0b892d83813e220e070b3e7c3ddd7efa06f77 |     
  aarch64    |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/764dd365a175a6631684338973e7abae5e3c5fac |     
    arm      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/892d898ee5e4096ac8bc0c7c85c3f18ffc37f373 |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/61560ec26af8373aea55d934b13a774fa45101ea |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/0ea86f5493b40a8430e01f6ddce0af806d45a6cf |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/08e045193d013980f5020b8943aaee3bc5ddeb20 |     
  sparc64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/84c40cd063c3df8ba7e5e076bda110d33ea244c1 |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/8dbce0a58be738e6e44922ef6e8519cb52def069 |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/a6e1c3e204b274e39609ea250618c3b69781ce60 |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/06a6d865b6b7d8ebd793bde214f4a4c40e0962e1 |     
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/733bfaf3ac62f4219fed42850deedbbc0011fef8 |     
  riscv64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/f421aeeb93b54763b83ec0f5f7e82e9615b56867 |     
   x86_64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/fde1b1cae109917c625c5e77f3681f598c1abfb8 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e94f9bf02255795ca0918319dc42e2c0c9a8fdef |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e99878f96d21caaaae61d3122f117fe87f2dab8f |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/76b4b111bab4ff6170e8299e8cfbfe7228ae2174 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/fc6844d5e1017997c9579a90f9a7fe8b4f44fae6 |     
   xtensa    |          lsof-4.93.2           | NOK | http://autobuild.buildroot.net/results/0c228e0d3ea1ff2d728ddc906e242d40ed973222 | ORPH
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/e69aafaee07816b1978a1f12208b0bf064354b5b |     
    arm      |         mesa3d-19.2.4          | NOK | http://autobuild.buildroot.net/results/6d893a7e7b172c9d29e21bd357adceff103cdca3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/ec1b7bb7e97af7719545d711156ce10d63ed211b |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6368447ee2bc97cdd657de9c82294ff73c11c695 |     
  aarch64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/00ae3bda7db0e2128f540dd44013a0c123aafebc |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1c28531ff5ed9edfe0b7e44ee0bab32c05072229 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2bb8a4245518ccca2a2c633f9cba748095212cae | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c2f72932605063fb2f9b31a79ba66399691bae7f |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/18b246d18e63957fa31da1845146550175bb74a2 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/09ee22b3f174b9c0a5292b5115234b1ae00592ee |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/dff1a32087d2a4703418d97c82c87179454a1b2d | ORPH
   x86_64    |         supertux-0.6.0         | NOK | http://autobuild.buildroot.net/results/9e06b80730720237b27d8052167dd8f35e5c76fd |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/eee415e0a87871f7b2cd2898dcfcc82892431db3 | ORPH
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/2022951826be5b6be8576b9f8bbb29f25377187c |     
   mipsel    |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/3bf01a109974edefc21bdb13f3bb6e8521634974 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/7b1d57f871cf2113790d0060a2a5576a6b8772e0 |     
  sparc64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a9376cfec80130f00dc5cc3001362a1841a0d8c4 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

domoticz-0f411f781ae4fb4a82... | 1 
           host-dtc-legal-info | 1 
              host-grpc-1.23.0 | 1 
                libdrm-2.4.100 | 1 
                   mimic-1.1.0 | 1 
                 samba4-4.11.2 | 1 
                    strace-5.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/5fcde1449af221f4343e0409337df6539f82895c |     
   x86_64    |      host-dtc-legal-info       | NOK | http://autobuild.buildroot.net/results/799bddc1467413b1f202a8803e902c797f4f9c92 |     
    arm      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/73345a1493e0846cc1088abcdfe8b4fcc13cb749 |     
    i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/16068efc94f0dea6fce9288a3ef4849bef463e68 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/bd312f8833b1e067a9ac421f9b92e26386f5ff2c |     
    arc      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/3309915bdc77833d1167de78d07363ba8a119011 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/36d6bf99478794a4e2a5b23baf829f2d5a004a52 |     



-- 
http://autobuild.buildroot.net
