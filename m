From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 07 Nov 2020 08:10:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-06
Message-ID: <20201107081007.1AB4A87306@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  1  |  0  | 11  |
  2020.08.x  |  9  |  1  |  0  | 10  |
    master   | 64  | 12  |  0  | 76  |
     next    | 10  | 10  |  0  | 20  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                       unknown | 2 
                  autofs-5.1.6 | 1 
               domoticz-2020.1 | 1 
glmark2-c493520253fbfe3676c... | 1 
                    rpm-4.16.0 | 1 
                    vlc-3.0.11 | 1 
                    xen-4.14.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/f31ef4459cf34cf439a1ef828f3dbbd73260ed9a |     
  riscv64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/99f24677f4b9d018017e80a1ffcaec07cc71d570 |     
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/361dc40e558e2646cb93f405c7b1f621d400fea3 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a9b3e88565abc995ec52cbe767f9b8947cd69f7c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4b2d220630ccb023c1176e5b3884198be236a6c7 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a5b000254f5fac98415653726956c28a503dc22b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3045f1e4a6af697096208d02c59ca3aa2507bbdc |     
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/05dd945d24e8684aad6a2343ba7f6f8a7cea8349 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2bf110469ba1af16bb997d44ceee1528316367c7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b07052de34ca24d5c62f6facec2ced5e092d26e2 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/e8ed20597c80f639ef7e8b71d5b37e2ba69fe450 |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/d966585c931ca4a4ae6a854a21e07eec4c277a02 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/34e5a8d68751ab228a835cc5b28bf92882dab486 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/93c8edaedcbb18d07da928b9e29b1aff3b826f24 |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 5 
          modem-manager-1.14.6 | 2 
              asterisk-16.13.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                rocksdb-6.10.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/11ca8d4e4e56fdd076e6eab3439e18144699b630 |     
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b0f6d3ba15b63421b42d6f1c183d1ccc92bab3e4 | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2d147c470734dd0c0cfff27752c8d020f5b1f8e6 | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/18ad13ffeb8a208eedd22033c2ddcbd0bd90dad8 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7257f9d31bb52fc424c97b5d152b79fbd98603fe | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ff69e614e644d83d21fd140d319b549e5ffefbca | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/86e47cf58c0a1c898b4256690f51fce19e2a10c7 |     
  riscv64    |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/a8a384bd1c529c8151877362e120d3371ef1a0d5 |     
  powerpc    |      modem-manager-1.14.6      | NOK | http://autobuild.buildroot.net/results/90a2980feb84f358b96bc41f8a5845f89f7124d5 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/0dcdf7d8ecbd550fc439bc2c1668ecbdc357e97b |     



-- 
http://autobuild.buildroot.net
