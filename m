From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Nov 2020 08:09:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-11
Message-ID: <20201112080912.6EE138584F@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  6  |  1  |  1  |  8  |
  2020.08.x  | 14  |  0  |  0  | 14  |
    master   | 55  | 22  |  1  | 78  |
     next    | 11  |  7  |  0  | 18  |

Classification of failures by reason for master
-----------------------------------------------

                   slirp-4.3.1 | 5 
              host-guile-3.0.4 | 2 
        host-sentry-cli-1.57.0 | 2 
                    mpv-0.32.0 | 2 
                    quazip-1.1 | 2 
                apparmor-3.0.0 | 1 
                  boost-1.74.0 | 1 
                        bustle | 1 
          gstreamer1-mm-1.10.0 | 1 
                 mesa3d-20.2.2 | 1 
                  ndisc6-1.0.4 | 1 
                openntpd-6.2p3 | 1 
                 openssh-8.3p1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                xapp_xfd-1.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/ad200394d0fda293c8f9608760f46bb865ff6a82 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7231c804c748c2f4ca515858fec4506ff443eaea |     
  powerpc    |             bustle             | TIM | http://autobuild.buildroot.net/results/319868f2047722ce9ee306ba87b5087bc31116dc |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/fb999410d5fb1d1b16d4e2c0c7544e4045d87857 | ORPH
  powerpc    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1ab7a0098f3cdfbbbfb4703051cda2bd98a5fe75 | ORPH
    i686     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/434bc43a36bc4c292e5c04ca346ce3a5061ac09e | ORPH
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/05ef57565e7b30bdd22962cb1623201e97cb9841 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2e14885269edcc842eeaf1be946367870129589f |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/cbf95834df8c6392c3259dbbfc8cc3042a9dfb74 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/dbb6993cd706b24fcb5876fd427738a62b0845af |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/28eefd6f5e1787ed93936cb7759cb08979bcdbb1 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c99f6ba71870046918a10f3bf302a53549fab29e | ORPH
  riscv64    |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/a00a53d6635c64e72c50d4841658155de5380110 | ORPH
  nds32le    |         openssh-8.3p1          | NOK | http://autobuild.buildroot.net/results/aa1727f01ef76e5589b20aa1ec777fd387787845 | ORPH
  riscv64    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/8726a2c61a0c09d77e64d4cca2ca19cd6e029594 |     
   x86_64    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/99b91b3a42407e7c427e10f236e9d9fbd4e85c82 |     
  riscv64    |          slirp-4.3.1           | NOK | http://autobuild.buildroot.net/results/0b9cff1bc650876a6fff6102b2cb31dcdf4c5e8f |     
   xtensa    |          slirp-4.3.1           | NOK | http://autobuild.buildroot.net/results/6a686f18ec415a20293357b8a8159aabe4b70ac0 |     
    arm      |          slirp-4.3.1           | NOK | http://autobuild.buildroot.net/results/32b8b27c72f115b1c4944cf1eb7d40a9548de188 |     
    sh4      |          slirp-4.3.1           | NOK | http://autobuild.buildroot.net/results/76cb54633b2447fd96045602edc0627c1aef7d23 |     
    arm      |          slirp-4.3.1           | NOK | http://autobuild.buildroot.net/results/50b5ce6b3b4f5a91cf4ddaf9b2fc9275a793075b |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/8995af92bcb40fe45bd69cafb9ce08434e81c23f |     
  nds32le    |         xapp_xfd-1.1.3         | NOK | http://autobuild.buildroot.net/results/aafae4efbb5b0aad6fdd2ea9e00750522f33dd10 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                        bustle | 1 
                 gerbera-1.3.4 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |             bustle             | TIM | http://autobuild.buildroot.net/results/036ac4accb60a888e9b98fb1c01a0cb3e4ffe2f8 |     
    arc      |         gerbera-1.3.4          | NOK | http://autobuild.buildroot.net/results/1d29a01f4f36a809047d5dbf6d9f7f3992906472 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 2 
          modem-manager-1.14.6 | 1 
            quickjs-2020-09-06 | 1 
                    rpm-4.16.0 | 1 
              sigrok-cli-0.7.0 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e32226f003e2a4a32f522ff6a48c65aa25d1facc | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c69e1db7be7e2cb0f922d3e0bce13f2831dbf87c | ORPH
    sh4      |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/1c269338fd4a7f58b882f903805daadc8b091efd |     
    arc      |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/1c45adeb1b8c9c9c272a11ae6e445fc04c6d8b20 |     
    mips     |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/7fe8c4eb90ee610fc04cdd8941e1ba6b58d6b944 |     
    arm      |        sigrok-cli-0.7.0        | NOK | http://autobuild.buildroot.net/results/532aa773a7de4634eceb91b73fdd94e8d847bc50 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f185340a9e499c09214cdfa55d83315af2dfc0fd |     



-- 
http://autobuild.buildroot.net
