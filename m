From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Dec 2020 08:14:14 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-24
Message-ID: <20201225081421.80A9020486@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  7  |  2  |  1  | 10  |
  2020.08.x  | 10  |  0  |  0  | 10  |
  2020.11.x  |  8  |  4  |  0  | 12  |
    master   | 52  | 22  |  2  | 76  |

Classification of failures by reason for master
-----------------------------------------------

                   rhash-1.4.0 | 3 
              micropython-1.13 | 2 
            quickjs-2020-11-08 | 2 
                  bind-9.11.25 | 1 
                        bustle | 1 
                coreutils-8.32 | 1 
            erlang-jiffy-1.0.6 | 1 
          fuse-overlayfs-1.2.0 | 1 
               host-sentry-cli | 1 
                ipmiutil-3.1.7 | 1 
                 mesa3d-20.3.1 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.32.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    php-7.4.13 | 1 
           python-pybind-2.6.1 | 1 
             timescaledb-1.7.4 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
         xkeyboard-config-2.31 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/be77eea695ebd5c372f431d90f52bc8d154bdd74 | ORPH
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/1b35040fe263a4a3680fbbe523e79700239e7fcc |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/a6bc1e0d764b413046a7136ee2a38f9df1caf6ab | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9ac6e1bf9eaf922c0b7f869416ec33f40ed3543c |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/94c4366ae1a46923ac2ea553fc752cfdda7627d3 |     
    i586     |        host-sentry-cli         | TIM | http://autobuild.buildroot.net/results/767320ccff1f07523ca785c6198a967965035100 |     
    i586     |         ipmiutil-3.1.7         | NOK | http://autobuild.buildroot.net/results/10a9cfa8853b4faf2c7891c0636f6347187c8507 |     
    mips     |         mesa3d-20.3.1          | NOK | http://autobuild.buildroot.net/results/cff14850dcbfa46bdb604fb8d1479ae35a214b61 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/497a0efe574f0aac8726e6748cbae97a50b7e1f0 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/fd0e2f150c7d722f5a6d8bf7d1f72c58b4d2338d |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a18c8320c073aab547ba341f761edcc0bb9b1673 | ORPH
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/f76c2b5915ce5ee67d630e1160a3f69f61aff5bf |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/95d436babb8883d729a991e3f2df97745e2a7686 |     
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/0096bb32b8804e910e13702fe80a2bf8587d25d7 | ORPH
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/92e08f9e85f22a4d0685d25b2e6ce754dbd679ad |     
    mips     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/602f187e2b4aa87b4b6903f477c5361c91c31d9c |     
    arc      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/b94f987387a457abc7bd5b41388ecb4f4c4a475c |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/5afedbb510696843adb7ca2ac378a73f14e3bba9 | ORPH
  aarch64    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/869dd994708a9dccd9fe3f69ffa78d4d71745db8 | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/5d5f592edff105c3d04bd2713866790a04430db9 | ORPH
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/39b4f25a24671346bf32b28def77a0bbe5c1aba1 |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/d16708bdb55e9a51766432a36eac2a8d8e1732f1 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ebf5c8727992bc4055b1aaac79ff88cdb09fe407 |     
 aarch64_be  |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/c6f5eef920a21fd10af95609135fac28217d392b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             libnetconf2-1.1.3 | 1 
                      rauc-1.5 | 1 
                       vmtouch | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/dc2d40c3a1bb7a8c70d152c61704622d29a26e5b |     
    i586     |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/722aaa1bda35cb722ee6671b2592cbc98a8b18c1 |     
    arc      |            vmtouch             | TIM | http://autobuild.buildroot.net/results/4e20a10dadd2270947fbfcaa05fa413b6a86e9c2 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                host-go-1.15.6 | 1 
                nodejs-12.19.1 | 1 
                      rauc-1.5 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/645832aa490e0d8de633448d4c62a215922bc9ed |     
  aarch64    |         nodejs-12.19.1         | NOK | http://autobuild.buildroot.net/results/9db22d7cf8b1bce14182a8f29e973f655bc26d91 |     
    arm      |            rauc-1.5            | NOK | http://autobuild.buildroot.net/results/eab7465028c68fa73741e5b25fe19feb2b32ea27 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/80ee4d25d99815da7b4430e8530f30d914600029 |     



-- 
http://autobuild.buildroot.net
