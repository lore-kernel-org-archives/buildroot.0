From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 04 Jan 2021 08:21:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-03
Message-ID: <20210104082139.3A0C3203BF@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  |  2  |  0  | 22  |
  2020.11.x  |  7  |  1  |  0  |  8  |
    master   | 105 | 51  |  1  | 157 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 13
        host-sentry-cli-1.57.0 | 9 
package/python-mwclient/pyt... | 4 
             timescaledb-1.7.4 | 4 
                  bind-9.11.25 | 2 
              fetchmail-6.4.14 | 2 
                       unknown | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
            erlang-jiffy-1.0.6 | 1 
  gobject-introspection-1.64.1 | 1 
                host-go-1.15.6 | 1 
                 libmdbx-0.9.2 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                openblas-0.3.9 | 1 
            quickjs-2020-11-08 | 1 
                   rhash-1.4.0 | 1 
                 rt-tests-1.10 | 1 
               target-finalize | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       vmtouch | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/41dcd6b8079a970b186cce40dbc599d98a94edbe | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/175b5e43488266a889656f42d0d429afd36bc481 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/980d36ed786c21943ded5081b250ac46e7c339f4 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/5c8227395a751c573e5c5f6ac2656320c12cd5a1 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8c0e03f38208f847a0c3b62b13cd589529644ec0 |     
  powerpc    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/0f7061b4702e33bf8dca16c6f49a40f567b16a6d |     
  mips64el   |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/59dc8314ceea42361dc90d998ea16b4e5d043211 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/bd12818858d42787b844329a18a430802ef6e2eb | ORPH
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/b84e7eb20cff0fc5f4611a7a59434cbd6a689e66 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/efa324979ee3d8262eae391be51f80ef4968824a |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8bf6ec565e9a4b98a5df8ecc52ce7d1c6a1252fa |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b6990945fbf509e5ff90f52352a3390ab7383ee3 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6fa46baac438db15619b430108c9b06ca98e1cd9 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ad7418f4eae1874477b806a3b2c68cfbf549306e |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0fecb57bace63521438032790e675d30302b5dbf |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2f9cf38e033a88f41e68f269e4bf47dd66d60f04 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5ac5167c6b4dd3501d5eee194f7ff1821b5e0d93 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/311aea519a6f4854cb5720d165f57a54928c89a5 |     
  powerpc    |         libmdbx-0.9.2          | NOK | http://autobuild.buildroot.net/results/1a60b2c3d2f276f99a22da48e8e16fcf5744eba0 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/27eca338cf95e0b974fbc6c6aa47fb779a7e29dd | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/626fe87070ab2ba4619f0eb67e05554c88db0c40 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/65bd2a727820bf2f14f3a3a920df270c1baf490d | ORPH
  aarch64    | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/7807a21d5960762349864e9fb4c6134d624ebfee |     
  mips64el   | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/52b06a98a4dc1ff83dc8b8f23291812f39edd58b |     
    arm      | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/592a8bd7c4259cf5150edaa6fc419dba7228f245 |     
   mipsel    | package/python-mwclient/pyt... | NOK | http://autobuild.buildroot.net/results/d40f3a5122e758aaa5ff7b10d273908849e27bc7 |     
  aarch64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/5204e54982f0cbb4713585fd3d404b13b8902878 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/9741cbe187d7806d78f80c74015a91268d0502a4 | ORPH
  powerpc    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/5ba8f003db8f166a10b242052de923902b7c7ea8 |     
    mips     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/b454a43e6fd0aebe5f6d42d98121f31f29b6de0d |     
    sh4      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/c4f80463ef5ec3f93128879f80b7b56e44a9c765 |     
  powerpc    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/4fdc8dc20c66ec04bb7dfc2f378fb541d3772d38 |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/7865a675b7cb75225fe90f381af647afed5a8b73 |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/9f19fb9a45e69476f816688e878a7c07e2c8aa28 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/100df71a497d808d8b1b8eeea84c524d207b12bf |     
microblazeel |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/4cf43a1ff70a2e2751e2a1a768940401c5583cdf |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8dd66e39d8775dc64d8566a5cd4d3635209b924c |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6b769f28808a1f648d5ec7fdd924067e6e29695e |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/409ba085fe09f5c52b20549c8249edfc0f2b78a5 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/b81216edf19c42e05b63cd8f34b43fa57acb9e80 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/be9005e45ea4eaf2dadc3378b147b0d255bb31e7 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f63990d2308e021ed8798b3892c3f27a796503d6 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/08069839f5ba4cea38813dec70ad13770da1d2ec |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/c3c6731af0d7fe2f8a1d048f1bdb3d60a0ea1a3f |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/ae519b6b9c61ceb3dce5e44c6251860f9323e9dd |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6ebe7ef1075c5a7304652ee7cca89ac8a5d7b8f1 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7c72eab6624d1ca14a5a16514e956ae5b86c0813 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/c2b238e844056e3e21986b9fabc663a33d1923fe |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/9089e34627c10b733f1b1d9ef25a7c03c2306bb7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3e0a87a1fcc579b2bc59355b3f7366fae3037b1b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/3dce421382c3eb917eb89d8af39f78184d200d9e |     
   nios2     |            vmtouch             | TIM | http://autobuild.buildroot.net/results/20248b267f1a5d217375975e9bb8babcecd044a7 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               host-go-1.13.15 | 1 
              openjdk-13.0.2+8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/8c7c6e41a56940ed2d80659f29081a3aee8f837d |     
 powerpc64   |        openjdk-13.0.2+8        | NOK | http://autobuild.buildroot.net/results/8ef9c7085f20a8c8e6723074268f7f63e885e488 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 uclibc-1.0.36 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/c2599fede030af3de53261b450d02b017426fbdb |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20201217     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 3.38.0       |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 11.0.0_r25   |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.0        | 3.0.1        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 10.1.2       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.14.1      | 18.1.1       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.38.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.36.0       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.5.0        | 2.6.0        |     
                         audit |  DISTRO  | https://release-monitoring.org/project/15225 | 2.8.5        | 3.0          |     
                      autoconf |  DISTRO  | https://release-monitoring.org/project/00141 | 2.69         | 2.70         | ORPH
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.3       | ORPH
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.10.1       |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_07_20... | 2020-12-09   |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 5.0          | 5.1          | ORPH
               bash-completion |  DISTRO  | https://release-monitoring.org/project/05667 | 2.10         | 2.11         | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2020.2       | 2020.4       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.4       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.65         | 1.68         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.4.8        | 4.5.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.4.8        | 4.5.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.4.8        | 4.5.0-alpha  |     
                    berkeleydb |  DISTRO  | https://release-monitoring.org/project/138386 | 5.3.28       | 18.1.2       | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.25      | 9.17.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.34         | 2.35.1       |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.7.1        | 3.7.4        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.20.1       | 0.21.0rc3    |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 2.1.0        | 3.0.0        |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.74.0       | 1.75.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.0-beta1  |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/00220 | 6.1          | 6.2          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.7          | 5.9          | ORPH
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 2.89         | 3.08         |     
                       busybox |  DISTRO  | https://release-monitoring.org/project/00230 | 1.32.0       | 1.33.0       | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.6        | 0.5.7        |     
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 2.2.4        | 2.3.0        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     can-utils |  DISTRO  | https://release-monitoring.org/project/10554 | 2020.11.0    | 2020.12.0    |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.301        | ORPH
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.12       | 4.1          | ORPH
                        cgilua |  DISTRO  | https://release-monitoring.org/project/58440 | 5.2.1-1      | 6.0.2-0      |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-beta   |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.15.1       | 0.15.2       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.1          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.4.0        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 3.5.1        | 4.0          | ORPH
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.11         | 6.12         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                         cjson |  DISTRO  | https://release-monitoring.org/project/21330 | 1.7.13       | 1.7.14       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 11.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.19.2       |     
                        cppcms |  DISTRO  | https://release-monitoring.org/project/21334 | 1.2.1        | 2.0.0.beta2  | ORPH
                        cppzmq |  DISTRO  | https://release-monitoring.org/project/18648 | 4.7.0        | 4.7.1        |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.3.0        | 8.4.0        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.28.4       | 1.28.6       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 2.14.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.11.2     | 0.5.11.3     | ORPH
                         dav1d |  DISTRO  | https://release-monitoring.org/project/18920 | 0.8.0        | 0.8.1        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.18      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 4.11.2       | ORPH
                    dehydrated |  DISTRO  | https://release-monitoring.org/project/11312 | 0.6.5        | 0.7.0        |     
                         delve |  DISTRO  | https://release-monitoring.org/project/40149 | 1.5.0        | 1.5.1        |     
                      dfu-util |  DISTRO  | https://release-monitoring.org/project/10195 | 0.9          | 0.10         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 9.1.4        | 9.4.0        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20200327 | 1.3-20201126 | ORPH
                       dmalloc |  DISTRO  | https://release-monitoring.org/project/21417 | 5.5.2        | 5.6.5        | ORPH
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.28.0-rc1   |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
                      dos2unix |  DISTRO  | https://release-monitoring.org/project/00453 | 7.4.1        | 7.4.2        |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.9.0        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.15.0       | 9.15.1       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.2        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.25.0       | 1.25.1       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.3.9        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.181        | 0.182        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.11.2       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.2.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.17       | 1.0.18       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.1.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 1.0.6        | 1.0.8        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.11.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.1        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.9        | 1.0.10       |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.25       | 1.0.26       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.10       | 1.0.11       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.7        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.6        | 1.0.7        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.38       | 1.0.39       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.23       | 1.0.24       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.39       | 1.0.40       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.9        | 1.1.10       |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.20       | 1.0.21       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.44       | 1.1.45       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.10       | 1.5.1        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.28       | 1.0.29       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.8        | 1.0.9        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.6.1.0      | 2.6.1.1      |     
                         faad2 |  DISTRO  | https://release-monitoring.org/project/13755 | 2.9.2        | 2.10.0       | ORPH
                      fail2ban |  DISTRO  | https://release-monitoring.org/project/06602 | 0.11.1       | 0.11.2       |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.5          | 3.6.1        |     
                   fftw-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
              fftw-long-double |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                     fftw-quad |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                   fftw-single |  DISTRO  | https://release-monitoring.org/project/00803 | 3.3.8        | 3.3.9        | ORPH
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.25         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.12.0       | 0.13.1-rc1   |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                    fluidsynth |  DISTRO  | https://release-monitoring.org/project/10437 | 2.1.5        | 2.1.6        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.15.1       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.93      | ORPH
                           frr |  DISTRO  | https://release-monitoring.org/project/18555 | 7.4          | 7.5          |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.2.0        | 1.3.0        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 20.08.00     | 20.12.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.8.3        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.9        | 0.9.10       |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.38.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                          gdbm |  DISTRO  | https://release-monitoring.org/project/00882 | 1.18.1       | 1.19         | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.12      | 2.42.2       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.2.0        | 2.2.1        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.6.4        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.29.2       | 2.30.0       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.68.0       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.1        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                        gnupg2 |  DISTRO  | https://release-monitoring.org/project/01215 | 2.2.25       | 2.2.26       | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.1.0      | 3.8.2.0      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.15       | 3.7.0        |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.64.1       | 1.66.1       | ORPH
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.20         | 3.21         |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.13.2       | 2.14.4       |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.2        | 0.2.3        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 5.4.0        | 5.5.0        | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.33.2       | 1.34.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 3.38.0       | ORPH
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 4.0.0        |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.8.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.46.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.2.6        | 2.3.2        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.7.2        | 2.7.4        | ORPH
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.13       | 1.9.14       |     
                        hidapi |  DISTRO  | https://release-monitoring.org/project/05594 | 0.9.0        | 0.10.1       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.11      | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 3.0.3        | 3.0.4        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.4.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1637         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 68-1         | 68-2         | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.11         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.36       | ORPH
                igd2-for-linux |  DISTRO  | https://release-monitoring.org/project/21356 | 1.2          | 2.0          |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.10-51    | 7.0.10-54    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.6.1        | 1.7.1        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.2.2     | 3.20.11.0    | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.4.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.4.5       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.5.1       |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20200616     | 20201118     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_490        | 3.491        |     
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.0.13       | 2.0.14a      |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.7.0        | 5.10.0       |     
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.6          | 7.10         |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.6.0        | 1.7.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.23         | ORPH
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.14       | 1.9.16       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.3       | 0.10.9       |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.79         | 0.80         |     
         jitterentropy-library |  DISTRO  | https://release-monitoring.org/project/29701 | 2.2.0        | 3.0.0        |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.6        | 2.0.90       |     
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.8.0        | 3.9.1        | ORPH
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.4.4        | 1.6.0        |     
                         jszip |  DISTRO  | https://release-monitoring.org/project/141558 | 3.2.2        | 3.5.0        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.3.0        | 2.4.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.1.5        |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.20       | 2.0.21       | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.77         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.77         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.77         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.77         |     
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.9-Leia    | 19.0b2-Ma... |     
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 3.0.0-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 3.0.0-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 3.0.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 3.0.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 3.0.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 3.0.1-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 3.0.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.6-Leia   | 2.6.6-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.4.0-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.9-Leia    | 19.0b2-Ma... |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 7.0.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 9.0.1-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 7.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 6.0.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 7.0.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 8.1.3-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 7.1.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 8.0.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.19-Leia | 7.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.21-Leia  | 8.0.3-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 7.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 6.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 7.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 8.0.0-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 8.1.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 7.2.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 6.0.0-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.21-Leia | 19.5.1-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.3-Leia   | 2.6.0-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.5-Leia   | 3.3.0-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.5.0-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.5-Leia   | 3.4.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.3-Leia   | 2.5.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.3-Leia   | 2.6.0-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.3-Leia   | 2.4.0-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.3.0-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.4.0-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.9-Leia    | 19.0b2-Ma... |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.2-Leia   | 4.0.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 2.0.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.3-Leia   | 6.3.0-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.3-Leia   | 3.4.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.4-Leia   | 2.3.0-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.4.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.3-Leia   | 2.4.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.2-Leia   | 4.4.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 3.0.0        | 3.0.1        |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.4.3        | 3.5.1        |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.24         | 2.24-1       | ORPH
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.3          | 2.4          | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.45         | 2.46         |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.7        | 6.0.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.16      | 2.10.17      | ORPH
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.14         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.1.1        | 2.1.2        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.1       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.10.0       | 3.10.1       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.2       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.66.3       | 2.67.1       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.39         | 1.41         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.13.1       | 1.15.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.26       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.5        | 1.6.2        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.1        | 1.10.0       | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk2 |  DISTRO  | https://release-monitoring.org/project/13942 | 2.24.32      | 2.24.33      |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 233          | 234          |     
                 libhttpserver |  DISTRO  | https://release-monitoring.org/project/21934 | 0.18.1       | 0.18.2       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.35.1       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.21         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.1.0        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.1        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.42         |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                 libmicrohttpd |  DISTRO  | https://release-monitoring.org/project/01658 | 0.9.71       | 0.9.72       |     
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1.20201016 | 2.2.1        |     
                        libnet |  DISTRO  | https://release-monitoring.org/project/01673 | 1.1.6        | 1.2          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.7        | 1.1.8        |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/01699 | 0.4.10       | 0.4.11       | ORPH
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.201110  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                       libpcap |  DISTRO  | https://release-monitoring.org/project/01702 | 1.9.1        | 1.10.0       |     
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.1.0        | 2.2.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.3.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.2        | 1.4.4        |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/01713 | 1.8.0        | 1.9.0        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.4        | 2.5.1        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.3       | 0.20.4       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.1          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.1          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.3        | 2.4.5        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.6        | ORPH
                  libsocketcan |  DISTRO  | https://release-monitoring.org/project/21689 | 0.0.11       | 0.0.12       |     
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.72.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/15633 | 0.10.0       | 0.10.1       |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.7        | 2.0.1        |     
                     libuhttpd |  DISTRO  | https://release-monitoring.org/project/89386 | 3.6.0        | 3.7.0        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.14.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.14.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.9.1        | 2.10.0       |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.10.5       |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.20       | 4.1.6        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 5.0.0        | ORPH
                      lighttpd |  DISTRO  | https://release-monitoring.org/project/01817 | 1.4.55       | 1.4.58       |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.4.8        | 4.5.0-beta   | ORPH
                linux-firmware |  DISTRO  | https://release-monitoring.org/project/141464 | 20201022     | 20201218     |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2020.08.19   | 2021.01.01   | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.93.2       | 4.94.0       | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.2        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.1       | 2.12.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.2        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.27      | 10.5.8       | ORPH
                         matio |  DISTRO  | https://release-monitoring.org/project/01893 | 1.5.18       | 1.5.19       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 172          | 173          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.1.2      | 0.1.2.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.4.8        | 4.5.0-alpha  | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 2.3.0        | 2.4.1        |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.38.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.10.5       | 2.10.6       |     
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.10      | 2020.12      |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190618     | 20201225     | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.11       | 4.9.0-alpha  |     
                      mongoose |  DISTRO  | https://release-monitoring.org/project/07603 | 6.18         | 7.0          |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.27.1       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.12.0.90    | 6.12.0.107   |     
                         mp4v2 |  DISTRO  | https://release-monitoring.org/project/98413 | 4.1.3        | 4.1.5        | ORPH
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.1.0        | 1.2.1        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.25      | 0.22.3       |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.0.2        | 4.1.0        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.4       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.32.0       | 0.33.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 2.1.0        | 2.2.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.11       | 1.8.14       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.93         | 0.94         | ORPH
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.14.7       | 2.0.4        |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 5.2          | 5.4          | ORPH
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.39         | 0.42         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20210102 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.28.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.9          | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.6          | 3.7rc1       | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.29.7-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.6        | 0.9.7        |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.41.0       | 1.42.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.18.0       | 1.19.6       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                   nginx-naxsi |  DISTRO  | https://release-monitoring.org/project/20448 | 0.56         | 1.3          | ORPH
                        ngircd |  DISTRO  | https://release-monitoring.org/project/02083 | 26           | 26.1         | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.19.1      | 15.5.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.138      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.12         | 1.13         | ORPH
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.10      |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.20.1       | 1.21.0       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.13       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.30       |     
                      openjpeg |  DISTRO  | https://release-monitoring.org/project/02550 | 2.3.1        | 2.4.0        |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.4.3        | 6.5.0        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.1.0        | ORPH
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.12.0       |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.3p1        | 8.4p1        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.53dev2   | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.2.0       |     
                          opkg |  DISTRO  | https://release-monitoring.org/project/59397 | 0.4.2        | 0.4.4        | ORPH
                      opusfile |  DISTRO  | https://release-monitoring.org/project/10353 | 0.11         | 0.12         | ORPH
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.22       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.4.8        | 4.5.0-alpha  | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.22      | ORPH
                 paho-mqtt-cpp |  DISTRO  | https://release-monitoring.org/project/21376 | 1.1          | 1.2.0        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.46.2       | 1.48.0       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.48.0       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         | ORPH
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.12         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.6        | 1.2.8        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202011       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.35        | 10.36        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 3.1          | 3.2          |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.33.5       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.49         | 6.51         |     
       perl-lwp-protocol-https |  DISTRO  | https://release-monitoring.org/project/03050 | 6.09         | 6.10         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.63         | 8.70         |     
                 perl-net-ssh2 |  DISTRO  | https://release-monitoring.org/project/03163 | 0.71         | 0.72         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
              perl-params-util |  DISTRO  | https://release-monitoring.org/project/11888 | 1.101        | 1.102        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0206       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                           php |  DISTRO  | https://release-monitoring.org/project/03627 | 7.4.13       | 8.0.0        | ORPH
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 2.9.6        | 3.0.1        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.2.1        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 78           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.18       |     
                 pkcs11-helper |  DISTRO  | https://release-monitoring.org/project/91990 | 1.26         | 1.27         | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.1          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.116        | 0.118        |     
                      popperjs |  DISTRO  | https://release-monitoring.org/project/141557 | 1.16.0       | 2.6.0        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 21.01.0      |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.4          | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6e       | 1.3.7a       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.2.0        | 7.2.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.14.0       | 4.0.0-rc2    |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.10         | 1.11.4       |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 2.2.6        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b3        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.3.0        | 0.3.1        |     
               python-aiofiles |  DISTRO  | https://release-monitoring.org/project/12743 | 0.5.0        | 0.6.0        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.7.3        | 4.0.0a1      |     
                python-aiojobs |  DISTRO  | https://release-monitoring.org/project/21252 | 0.2.2        | 0.3.0        |     
              python-aiosignal |  DISTRO  | https://release-monitoring.org/project/41889 | 1.0.0        | 1.1.2        |     
              python-aiozipkin |  DISTRO  | https://release-monitoring.org/project/56569 | 0.7.1        | 1.0.0        |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.17.0       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.3.1        |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.3.0        | 1.4.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a3      |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.3.0       | 20.3.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.12.3      |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.10.0       | 1.10.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.9.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.7        | 3.2.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.3        |     
               python-bluezero |  DISTRO  | https://release-monitoring.org/project/21929 | 0.3.0        | 0.4.0        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.9.210      | 1.16.47      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.12.210     | 1.19.47      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.19      |     
        python-cached-property |  DISTRO  | https://release-monitoring.org/project/06048 | 1.5.1        | 1.5.2        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.4        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.2.0        |     
               python-cchardet |  DISTRO  | https://release-monitoring.org/project/14813 | 2.1.6        | 2.1.7        |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.4       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 3.0.3        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.2.0        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.6        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.5.1        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 8.0.0a1      |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.1.0        | 4.6.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.12.3      |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.0          | 3.3.1        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 3.0.1        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.50.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
             python-defusedxml |  DISTRO  | https://release-monitoring.org/project/03821 | 0.6.0        | 0.7.0rc1     |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.10       | 3.1.4        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.1.0rc1     |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.4.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.6.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.4        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.15         | 0.16.1       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 4.0.0        |     
                python-esptool |  DISTRO  | https://release-monitoring.org/project/11619 | 2.8          | 3.0          |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 1.0.0        | 2.0.0        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.1.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.4        |     
             python-frozenlist |  DISTRO  | https://release-monitoring.org/project/41138 | 1.1.0        | 1.1.1        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.36.1       | 3.38.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.16       | 1.0a1        |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.2.0        | 4.0.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/19034 | 3.0.0        | 4.0.0        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 3.2.0        |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.2.0        | 6.0.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 20.0.1       |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.10         | 3.0          |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.1        |     
                   python-ipdb |  DISTRO  | https://release-monitoring.org/project/12710 | 0.13.2       | 0.13.4       |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                    python-ipy |  DISTRO  | https://release-monitoring.org/project/19783 | 1.00         | 1.01         |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.19.0       |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.12       | 0.1.13       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.1.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.17.0       | 0.18.0       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.9.4        | 0.10.0       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.8.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.3.1        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.9.1        |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.99         | 1.0.0        |     
               python-m2crypto |  DISTRO  | https://release-monitoring.org/project/06599 | 0.36.0       | 0.37.1       |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.3.3        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.3.9        | 2.3.10       |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.3.3        |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 1.0.0        | 1.0.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a6      |     
              python-modbus-tk |  DISTRO  | https://release-monitoring.org/project/22813 | 1.1.1        | 1.1.2        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.4.0        | 8.6.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 1.0.0        | 1.0.2        |     
              python-multidict |  DISTRO  | https://release-monitoring.org/project/11132 | 5.0.2        | 5.1.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.4          | 2.5          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.20.0rc2    |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-packaging |  DISTRO  | https://release-monitoring.org/project/11718 | 20.4         | 20.8         |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.1        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.7.1        | 2.7.2        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.7.0        | 0.8.1        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.2        | 1.7.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.2        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.5.1        |     
              python-periphery |  DISTRO  | https://release-monitoring.org/project/21705 | 2.1.0        | 2.2.0        |     
                 python-pillow |  DISTRO  | https://release-monitoring.org/project/07974 | 8.0.1        | 8.1.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.3.3       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 0.13.1       | 1.0.0.dev0   |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.7.0        |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/13204 | 1.0.4        | 1.0.5        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.8        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.14.0       | 4.0.0-rc2    |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.2        | 5.8.0        |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.8.5        | 2.8.6        |     
             python-ptyprocess |  DISTRO  | https://release-monitoring.org/project/06446 | 0.6.0        | 0.7.0        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2020.1       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.9.0        | 1.10.0       |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.20.0       |     
          python-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.9.8        | 3.9.9        |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.7.3        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.27         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.1        |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.7.3        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.6          |     
                  python-pyjwt |  DISTRO  | https://release-monitoring.org/project/05653 | 1.7.1        | 2.0.0a2      |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.5.0rc2     |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 0.10.1       |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.1.0       | 20.0.1       |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.6       | 3.11.7       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.2       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.14       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.6        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.58.0       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.1.2        | 6.2.1        |     
                 python-pytrie |  DISTRO  | https://release-monitoring.org/project/21594 | 0.3.1        | 0.4.0        |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.5       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.1.0        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.2       | 20.0.0       |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.11.13   |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2020.8.6     | 2020.11.20   |     
             python-request-id |  DISTRO  | https://release-monitoring.org/project/21598 | 1.0          | 1.0.1        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.2.4        | 4.2.5        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.2.1        | 0.3.3        |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.2        | 3.3.0        |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.10.2       | 3.0.0-dev.1  |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.17.3       | 0.19.5       |     
           python-setproctitle |  DISTRO  | https://release-monitoring.org/project/11699 | 1.1.10       | 1.2.1        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 51.1.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 5.0.1        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.13.1       | 1.14.1       |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.0       | 3.17.2       |     
          python-simplelogging |  DISTRO  | https://release-monitoring.org/project/21134 | 0.10.0       | 0.11.0       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.4        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 5.0.4        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.3.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.1          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.4.0b1      |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.5        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.1.3        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.0.1        |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.2       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1b2        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.55.1       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.3        | 5.0.5        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.9.0       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.4.1       | 20.12.1      |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.2        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.1        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 4.0.1        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.2        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.2       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 1.0.2        |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.20.4       | 2.21.1       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.62         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                python-wsaccel |  DISTRO  | https://release-monitoring.org/project/07278 | 0.6.2        | 0.6.3        |     
                python-wtforms |  DISTRO  | https://release-monitoring.org/project/11805 | 2.3.3        | 3.0.0a1      |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.29         |     
                   python-xlrd |  DISTRO  | https://release-monitoring.org/project/15107 | 1.2.0        | 2.0.1        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.3.7        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20200711.1   | 20201121.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.28.7       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.2.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.9.1        | 3.10.0a3     |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.6        |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
             python3-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
                python3-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.7.2        | 5.8.0        |     
         python3-pycryptodomex |  DISTRO  | https://release-monitoring.org/project/36851 | 3.9.8        | 3.9.9        |     
            python3-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.27         |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.11.13   |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 51.1.1       |     
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.3.2        | 8.0.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.4       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.33.0       |     
                         qt53d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                       qt5coap |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                        qt5knx |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                     qt5lottie |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                       qt5mqtt |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
              qt5quicktimeline |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
              qt5remoteobjects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.0.0        |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 6.0.0        |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.15.2       | 6.0.0        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.5        | 6.1.6        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.10-rc.5  |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                      readline |  DISTRO  | https://release-monitoring.org/project/04173 | 8.0          | 8.1          | ORPH
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.1          | 20200710     | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.13.3       | 6.15.2       |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.1.3        | 3.2.3        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2010.0     | 8.2012.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.48.0       | 1.49.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.48.0       | 1.49.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.40.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.3.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.5.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.3      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.2.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.3.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.2.0      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.17      | 4.13.0rc4    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.31       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.4          | 1.5          |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.0.1        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.12       | 2.0.14       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                       sdl_ttf |  DISTRO  | https://release-monitoring.org/project/07988 | de50cffd41e6 | 2.0.11       | ORPH
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     | ORPH
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.57.0       | 1.61.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.1          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.9.2.1      | 2.9.3.0      |     
                         slirp |  DISTRO  | https://release-monitoring.org/project/96796 | 4.3.1        | 4.4.0        |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 7.1          | 7.2          | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.7        | 1.4.8        | ORPH
                         socat |  DISTRO  | https://release-monitoring.org/project/04848 | 1.7.3.4      | 1.7.4.0      |     
                     sofia-sip |  DISTRO  | https://release-monitoring.org/project/10509 | 1.13.1-d1... | 1.13.2.33... |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.8.1        | 1.8.2        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                     spi-tools |  DISTRO  | https://release-monitoring.org/project/20628 | 0.8.5        | 0.8.6        |     
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.3       | 0.14.91      |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.13         | 5.0.4        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.5       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                    stellarium |  DISTRO  | https://release-monitoring.org/project/04891 | 0.20.3       | 0.20.4       |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.11.17      | 0.12.01      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.9.0        | 5.9.1        |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.1          | 1.2          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.1        | ORPH
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2020.04      | 2020.11      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.1       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysprof |  DISTRO  | https://release-monitoring.org/project/21649 | 1.2.0        | 3.38.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.4.2       | 12.5.2       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 246.5        | 247.2        |     
             systemd-bootchart |  DISTRO  | https://release-monitoring.org/project/11774 | 233          | 234          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                       tcpdump |  DISTRO  | https://release-monitoring.org/project/04947 | 4.9.3        | 4.99.0       |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.4.1        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/08699 | 1.10.0       | 1.11.0-rc1   |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.2          |     
                     tpm-tools |  DISTRO  | https://release-monitoring.org/project/21640 | 1.3.9.1      | 1.3.9.2      |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.2        | 5.0          | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0_rc0    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.1        |     
                          ttyd |  DISTRO  | https://release-monitoring.org/project/13890 | 1.6.2        | 1.6.3        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2020.04      | 2020.10      |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.0.0.0      |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.4        | 6.0.3        | ORPH
                usb_modeswitch |  DISTRO  | https://release-monitoring.org/project/05059 | 2.6.0        | 2.6.1        | ORPH
                      utf8proc |  DISTRO  | https://release-monitoring.org/project/07455 | 2.6.0        | 2.6.1        |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.50.2       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.2293     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.11       | 3.0.11.1     |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.62.1       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 2.6.11       | 2.6.12       |     
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 2.0.20       | 2.0.21       |     
                       wavemon |  DISTRO  | https://release-monitoring.org/project/05120 | 0.9.1        | 0.9.3        |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3.1        | 1.0          | ORPH
                          wget |  DISTRO  | https://release-monitoring.org/project/05124 | 1.20.3       | 1.21         | ORPH
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 5.12         | 5.22         |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20201112 | 1.0.20201221 |     
                       wlroots |  DISTRO  | https://release-monitoring.org/project/18357 | 0.11.0       | 0.12.0       |     
                       wolfssl |  DISTRO  | https://release-monitoring.org/project/21631 | 4.5.0-stable | 4.6.0-stable |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.2.0        | 1.2.1        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20201003     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/15059 | 1.0.3        | 1.0.4        |     
      xfont_font-misc-ethiopic |  DISTRO  | https://release-monitoring.org/project/17195 | 1.0.3        | 1.0.4        |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.8.0        | 5.10.0       | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.44         | 5.45         |     
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 358          | 363          | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.02         | 2.03         |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.2       |     
Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                      apparmor | CVE-2008-0731    | https://security-tracker.debian.org/tracker/CVE-2008-0731   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2016-5080    | https://security-tracker.debian.org/tracker/CVE-2016-5080   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                 at91bootstrap | CVE-2020-11683   | https://security-tracker.debian.org/tracker/CVE-2020-11683  
                 at91bootstrap | CVE-2020-11684   | https://security-tracker.debian.org/tracker/CVE-2020-11684  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                          bind | CVE-2017-3139    | https://security-tracker.debian.org/tracker/CVE-2017-3139   
                          bind | CVE-2019-6470    | https://security-tracker.debian.org/tracker/CVE-2019-6470   
                      binutils | CVE-2020-16590   | https://security-tracker.debian.org/tracker/CVE-2020-16590  
                      binutils | CVE-2020-16591   | https://security-tracker.debian.org/tracker/CVE-2020-16591  
                      binutils | CVE-2020-16592   | https://security-tracker.debian.org/tracker/CVE-2020-16592  
                      binutils | CVE-2020-16593   | https://security-tracker.debian.org/tracker/CVE-2020-16593  
                      binutils | CVE-2020-16598   | https://security-tracker.debian.org/tracker/CVE-2020-16598  
                      binutils | CVE-2020-16599   | https://security-tracker.debian.org/tracker/CVE-2020-16599  
                       bitcoin | CVE-2017-9230    | https://security-tracker.debian.org/tracker/CVE-2017-9230   
                           boa | CVE-2009-4496    | https://security-tracker.debian.org/tracker/CVE-2009-4496   
                         boinc | CVE-2013-2018    | https://security-tracker.debian.org/tracker/CVE-2013-2018   
                         botan | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                         botan | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                         botan | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        cereal | CVE-2020-11105   | https://security-tracker.debian.org/tracker/CVE-2020-11105  
                      civetweb | CVE-2019-3821    | https://security-tracker.debian.org/tracker/CVE-2019-3821   
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                         cmake | CVE-2016-10642   | https://security-tracker.debian.org/tracker/CVE-2016-10642  
                     coreutils | CVE-2013-0221    | https://security-tracker.debian.org/tracker/CVE-2013-0221   
                     coreutils | CVE-2013-0222    | https://security-tracker.debian.org/tracker/CVE-2013-0222   
                     coreutils | CVE-2013-0223    | https://security-tracker.debian.org/tracker/CVE-2013-0223   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                          cups | CVE-2008-1033    | https://security-tracker.debian.org/tracker/CVE-2008-1033   
                          cups | CVE-2009-0032    | https://security-tracker.debian.org/tracker/CVE-2009-0032   
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                           cvs | CVE-2020-2324    | https://security-tracker.debian.org/tracker/CVE-2020-2324   
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                            ed | CVE-2015-2987    | https://security-tracker.debian.org/tracker/CVE-2015-2987   
                          exim | CVE-2004-0399    | https://security-tracker.debian.org/tracker/CVE-2004-0399   
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
                          flex | CVE-2015-1773    | https://security-tracker.debian.org/tracker/CVE-2015-1773   
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                    gdk-pixbuf | CVE-2020-29385   | https://security-tracker.debian.org/tracker/CVE-2020-29385  
                           git | CVE-2018-1000110 | https://security-tracker.debian.org/tracker/CVE-2018-1000110
                           git | CVE-2018-1000182 | https://security-tracker.debian.org/tracker/CVE-2018-1000182
                           git | CVE-2019-1003010 | https://security-tracker.debian.org/tracker/CVE-2019-1003010
                           git | CVE-2020-2136    | https://security-tracker.debian.org/tracker/CVE-2020-2136   
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2019-14865   | https://security-tracker.debian.org/tracker/CVE-2019-14865  
                         grub2 | CVE-2020-15705   | https://security-tracker.debian.org/tracker/CVE-2020-15705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                         iperf | CVE-2016-4303    | https://security-tracker.debian.org/tracker/CVE-2016-4303   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                       libexif | CVE-2016-6328    | https://security-tracker.debian.org/tracker/CVE-2016-6328   
                     libgcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                     libgcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                       libgit2 | CVE-2014-9390    | https://security-tracker.debian.org/tracker/CVE-2014-9390   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libressl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                      libressl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                      libressl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                   libtomcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                   libtomcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libupnp | CVE-2020-13848   | https://security-tracker.debian.org/tracker/CVE-2020-13848  
                        libzip | CVE-2017-12858   | https://security-tracker.debian.org/tracker/CVE-2017-12858  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                         links | CVE-2008-3319    | https://security-tracker.debian.org/tracker/CVE-2008-3319   
                         linux | CVE-1999-0037    | https://security-tracker.debian.org/tracker/CVE-1999-0037   
                         linux | CVE-1999-0234    | https://security-tracker.debian.org/tracker/CVE-1999-0234   
                         linux | CVE-1999-0297    | https://security-tracker.debian.org/tracker/CVE-1999-0297   
                         linux | CVE-1999-0403    | https://security-tracker.debian.org/tracker/CVE-1999-0403   
                         linux | CVE-1999-0798    | https://security-tracker.debian.org/tracker/CVE-1999-0798   
                         linux | CVE-1999-0894    | https://security-tracker.debian.org/tracker/CVE-1999-0894   
                         linux | CVE-1999-1288    | https://security-tracker.debian.org/tracker/CVE-1999-1288   
                         linux | CVE-2000-0017    | https://security-tracker.debian.org/tracker/CVE-2000-0017   
                         linux | CVE-2000-0701    | https://security-tracker.debian.org/tracker/CVE-2000-0701   
                         linux | CVE-2000-1207    | https://security-tracker.debian.org/tracker/CVE-2000-1207   
                         linux | CVE-2001-0136    | https://security-tracker.debian.org/tracker/CVE-2001-0136   
                         linux | CVE-2001-0473    | https://security-tracker.debian.org/tracker/CVE-2001-0473   
                         linux | CVE-2001-0690    | https://security-tracker.debian.org/tracker/CVE-2001-0690   
                         linux | CVE-2001-0889    | https://security-tracker.debian.org/tracker/CVE-2001-0889   
                         linux | CVE-2004-0496    | https://security-tracker.debian.org/tracker/CVE-2004-0496   
                         linux | CVE-2004-0497    | https://security-tracker.debian.org/tracker/CVE-2004-0497   
                         linux | CVE-2004-0565    | https://security-tracker.debian.org/tracker/CVE-2004-0565   
                         linux | CVE-2004-0626    | https://security-tracker.debian.org/tracker/CVE-2004-0626   
                         linux | CVE-2004-0633    | https://security-tracker.debian.org/tracker/CVE-2004-0633   
                         linux | CVE-2004-0634    | https://security-tracker.debian.org/tracker/CVE-2004-0634   
                         linux | CVE-2004-0635    | https://security-tracker.debian.org/tracker/CVE-2004-0635   
                         linux | CVE-2004-0888    | https://security-tracker.debian.org/tracker/CVE-2004-0888   
                         linux | CVE-2004-0889    | https://security-tracker.debian.org/tracker/CVE-2004-0889   
                         linux | CVE-2004-0891    | https://security-tracker.debian.org/tracker/CVE-2004-0891   
                         linux | CVE-2004-0914    | https://security-tracker.debian.org/tracker/CVE-2004-0914   
                         linux | CVE-2004-0918    | https://security-tracker.debian.org/tracker/CVE-2004-0918   
                         linux | CVE-2004-0930    | https://security-tracker.debian.org/tracker/CVE-2004-0930   
                         linux | CVE-2004-0932    | https://security-tracker.debian.org/tracker/CVE-2004-0932   
                         linux | CVE-2004-0933    | https://security-tracker.debian.org/tracker/CVE-2004-0933   
                         linux | CVE-2004-0934    | https://security-tracker.debian.org/tracker/CVE-2004-0934   
                         linux | CVE-2004-0935    | https://security-tracker.debian.org/tracker/CVE-2004-0935   
                         linux | CVE-2004-0936    | https://security-tracker.debian.org/tracker/CVE-2004-0936   
                         linux | CVE-2004-0937    | https://security-tracker.debian.org/tracker/CVE-2004-0937   
                         linux | CVE-2004-0947    | https://security-tracker.debian.org/tracker/CVE-2004-0947   
                         linux | CVE-2004-0969    | https://security-tracker.debian.org/tracker/CVE-2004-0969   
                         linux | CVE-2004-0972    | https://security-tracker.debian.org/tracker/CVE-2004-0972   
                         linux | CVE-2004-0975    | https://security-tracker.debian.org/tracker/CVE-2004-0975   
                         linux | CVE-2004-0980    | https://security-tracker.debian.org/tracker/CVE-2004-0980   
                         linux | CVE-2004-0981    | https://security-tracker.debian.org/tracker/CVE-2004-0981   
                         linux | CVE-2004-0983    | https://security-tracker.debian.org/tracker/CVE-2004-0983   
                         linux | CVE-2004-0990    | https://security-tracker.debian.org/tracker/CVE-2004-0990   
                         linux | CVE-2004-0996    | https://security-tracker.debian.org/tracker/CVE-2004-0996   
                         linux | CVE-2004-1004    | https://security-tracker.debian.org/tracker/CVE-2004-1004   
                         linux | CVE-2004-1005    | https://security-tracker.debian.org/tracker/CVE-2004-1005   
                         linux | CVE-2004-1009    | https://security-tracker.debian.org/tracker/CVE-2004-1009   
                         linux | CVE-2004-1025    | https://security-tracker.debian.org/tracker/CVE-2004-1025   
                         linux | CVE-2004-1026    | https://security-tracker.debian.org/tracker/CVE-2004-1026   
                         linux | CVE-2004-1027    | https://security-tracker.debian.org/tracker/CVE-2004-1027   
                         linux | CVE-2004-1029    | https://security-tracker.debian.org/tracker/CVE-2004-1029   
                         linux | CVE-2004-1030    | https://security-tracker.debian.org/tracker/CVE-2004-1030   
                         linux | CVE-2004-1031    | https://security-tracker.debian.org/tracker/CVE-2004-1031   
                         linux | CVE-2004-1032    | https://security-tracker.debian.org/tracker/CVE-2004-1032   
                         linux | CVE-2004-1033    | https://security-tracker.debian.org/tracker/CVE-2004-1033   
                         linux | CVE-2004-1034    | https://security-tracker.debian.org/tracker/CVE-2004-1034   
                         linux | CVE-2004-1036    | https://security-tracker.debian.org/tracker/CVE-2004-1036   
                         linux | CVE-2004-1037    | https://security-tracker.debian.org/tracker/CVE-2004-1037   
                         linux | CVE-2004-1052    | https://security-tracker.debian.org/tracker/CVE-2004-1052   
                         linux | CVE-2004-1090    | https://security-tracker.debian.org/tracker/CVE-2004-1090   
                         linux | CVE-2004-1091    | https://security-tracker.debian.org/tracker/CVE-2004-1091   
                         linux | CVE-2004-1092    | https://security-tracker.debian.org/tracker/CVE-2004-1092   
                         linux | CVE-2004-1093    | https://security-tracker.debian.org/tracker/CVE-2004-1093   
                         linux | CVE-2004-1096    | https://security-tracker.debian.org/tracker/CVE-2004-1096   
                         linux | CVE-2004-1106    | https://security-tracker.debian.org/tracker/CVE-2004-1106   
                         linux | CVE-2004-1107    | https://security-tracker.debian.org/tracker/CVE-2004-1107   
                         linux | CVE-2004-1108    | https://security-tracker.debian.org/tracker/CVE-2004-1108   
                         linux | CVE-2004-1110    | https://security-tracker.debian.org/tracker/CVE-2004-1110   
                         linux | CVE-2004-1115    | https://security-tracker.debian.org/tracker/CVE-2004-1115   
                         linux | CVE-2004-1116    | https://security-tracker.debian.org/tracker/CVE-2004-1116   
                         linux | CVE-2004-1117    | https://security-tracker.debian.org/tracker/CVE-2004-1117   
                         linux | CVE-2004-1161    | https://security-tracker.debian.org/tracker/CVE-2004-1161   
                         linux | CVE-2004-1162    | https://security-tracker.debian.org/tracker/CVE-2004-1162   
                         linux | CVE-2004-1174    | https://security-tracker.debian.org/tracker/CVE-2004-1174   
                         linux | CVE-2004-1175    | https://security-tracker.debian.org/tracker/CVE-2004-1175   
                         linux | CVE-2004-1176    | https://security-tracker.debian.org/tracker/CVE-2004-1176   
                         linux | CVE-2004-1304    | https://security-tracker.debian.org/tracker/CVE-2004-1304   
                         linux | CVE-2004-1307    | https://security-tracker.debian.org/tracker/CVE-2004-1307   
                         linux | CVE-2004-1336    | https://security-tracker.debian.org/tracker/CVE-2004-1336   
                         linux | CVE-2004-1491    | https://security-tracker.debian.org/tracker/CVE-2004-1491   
                         linux | CVE-2005-0004    | https://security-tracker.debian.org/tracker/CVE-2005-0004   
                         linux | CVE-2005-0077    | https://security-tracker.debian.org/tracker/CVE-2005-0077   
                         linux | CVE-2005-0206    | https://security-tracker.debian.org/tracker/CVE-2005-0206   
                         linux | CVE-2005-0470    | https://security-tracker.debian.org/tracker/CVE-2005-0470   
                         linux | CVE-2005-0535    | https://security-tracker.debian.org/tracker/CVE-2005-0535   
                         linux | CVE-2005-0667    | https://security-tracker.debian.org/tracker/CVE-2005-0667   
                         linux | CVE-2005-0754    | https://security-tracker.debian.org/tracker/CVE-2005-0754   
                         linux | CVE-2005-0988    | https://security-tracker.debian.org/tracker/CVE-2005-0988   
                         linux | CVE-2005-1121    | https://security-tracker.debian.org/tracker/CVE-2005-1121   
                         linux | CVE-2005-1267    | https://security-tracker.debian.org/tracker/CVE-2005-1267   
                         linux | CVE-2005-2557    | https://security-tracker.debian.org/tracker/CVE-2005-2557   
                         linux | CVE-2005-3624    | https://security-tracker.debian.org/tracker/CVE-2005-3624   
                         linux | CVE-2005-3625    | https://security-tracker.debian.org/tracker/CVE-2005-3625   
                         linux | CVE-2005-3626    | https://security-tracker.debian.org/tracker/CVE-2005-3626   
                         linux | CVE-2006-0071    | https://security-tracker.debian.org/tracker/CVE-2006-0071   
                         linux | CVE-2006-3005    | https://security-tracker.debian.org/tracker/CVE-2006-3005   
                         linux | CVE-2007-1500    | https://security-tracker.debian.org/tracker/CVE-2007-1500   
                         linux | CVE-2007-3103    | https://security-tracker.debian.org/tracker/CVE-2007-3103   
                         linux | CVE-2008-1078    | https://security-tracker.debian.org/tracker/CVE-2008-1078   
                         linux | CVE-2008-1383    | https://security-tracker.debian.org/tracker/CVE-2008-1383   
                         linux | CVE-2009-1573    | https://security-tracker.debian.org/tracker/CVE-2009-1573   
                         linux | CVE-2010-1159    | https://security-tracker.debian.org/tracker/CVE-2010-1159   
                         linux | CVE-2011-4613    | https://security-tracker.debian.org/tracker/CVE-2011-4613   
                         linux | CVE-2013-0348    | https://security-tracker.debian.org/tracker/CVE-2013-0348   
                         linux | CVE-2013-2031    | https://security-tracker.debian.org/tracker/CVE-2013-2031   
                         linux | CVE-2013-2032    | https://security-tracker.debian.org/tracker/CVE-2013-2032   
                         linux | CVE-2014-3250    | https://security-tracker.debian.org/tracker/CVE-2014-3250   
                         linux | CVE-2014-4909    | https://security-tracker.debian.org/tracker/CVE-2014-4909   
                     logrotate | CVE-2011-1548    | https://security-tracker.debian.org/tracker/CVE-2011-1548   
                     logrotate | CVE-2011-1549    | https://security-tracker.debian.org/tracker/CVE-2011-1549   
                     logrotate | CVE-2011-1550    | https://security-tracker.debian.org/tracker/CVE-2011-1550   
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2020-24342   | https://security-tracker.debian.org/tracker/CVE-2020-24342  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                      mongoose | CVE-2020-25756   | https://security-tracker.debian.org/tracker/CVE-2020-25756  
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                          mono | CVE-2010-4254    | https://security-tracker.debian.org/tracker/CVE-2010-4254   
                          mono | CVE-2011-0989    | https://security-tracker.debian.org/tracker/CVE-2011-0989   
                          mono | CVE-2011-0990    | https://security-tracker.debian.org/tracker/CVE-2011-0990   
                          mono | CVE-2011-0991    | https://security-tracker.debian.org/tracker/CVE-2011-0991   
                          mono | CVE-2011-0992    | https://security-tracker.debian.org/tracker/CVE-2011-0992   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                         mysql | CVE-2012-5627    | https://security-tracker.debian.org/tracker/CVE-2012-5627   
                         mysql | CVE-2020-2923    | https://security-tracker.debian.org/tracker/CVE-2020-2923   
                       ncurses | CVE-2018-19211   | https://security-tracker.debian.org/tracker/CVE-2018-19211  
                       ncurses | CVE-2018-19217   | https://security-tracker.debian.org/tracker/CVE-2018-19217  
                        netcat | CVE-2008-5727    | https://security-tracker.debian.org/tracker/CVE-2008-5727   
                        netcat | CVE-2008-5728    | https://security-tracker.debian.org/tracker/CVE-2008-5728   
                        netcat | CVE-2008-5729    | https://security-tracker.debian.org/tracker/CVE-2008-5729   
                        netcat | CVE-2008-5730    | https://security-tracker.debian.org/tracker/CVE-2008-5730   
                        netcat | CVE-2008-5742    | https://security-tracker.debian.org/tracker/CVE-2008-5742   
                        netcat | CVE-2015-2214    | https://security-tracker.debian.org/tracker/CVE-2015-2214   
                         nginx | CVE-2009-4487    | https://security-tracker.debian.org/tracker/CVE-2009-4487   
                       ntfs-3g | CVE-2007-5159    | https://security-tracker.debian.org/tracker/CVE-2007-5159   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                       openssl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                       openssl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                       openvpn | CVE-2020-7224    | https://security-tracker.debian.org/tracker/CVE-2020-7224   
                       p11-kit | CVE-2020-29361   | https://security-tracker.debian.org/tracker/CVE-2020-29361  
                       p11-kit | CVE-2020-29362   | https://security-tracker.debian.org/tracker/CVE-2020-29362  
                       p11-kit | CVE-2020-29363   | https://security-tracker.debian.org/tracker/CVE-2020-29363  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2006-7168    | https://security-tracker.debian.org/tracker/CVE-2006-7168   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2014-5459    | https://security-tracker.debian.org/tracker/CVE-2014-5459   
                        pixman | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                        polkit | CVE-2016-2568    | https://security-tracker.debian.org/tracker/CVE-2016-2568   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       proftpd | CVE-2001-0027    | https://security-tracker.debian.org/tracker/CVE-2001-0027   
                        python | CVE-2007-4559    | https://security-tracker.debian.org/tracker/CVE-2007-4559   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                          qemu | CVE-2007-0998    | https://security-tracker.debian.org/tracker/CVE-2007-0998   
                          qemu | CVE-2008-4539    | https://security-tracker.debian.org/tracker/CVE-2008-4539   
                          qemu | CVE-2017-5957    | https://security-tracker.debian.org/tracker/CVE-2017-5957   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                         quota | CVE-2015-9534    | https://security-tracker.debian.org/tracker/CVE-2015-9534   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rsyslog | CVE-2015-3243    | https://security-tracker.debian.org/tracker/CVE-2015-3243   
                          shim | CVE-2014-3675    | https://security-tracker.debian.org/tracker/CVE-2014-3675   
                          shim | CVE-2014-3676    | https://security-tracker.debian.org/tracker/CVE-2014-3676   
                          shim | CVE-2014-3677    | https://security-tracker.debian.org/tracker/CVE-2014-3677   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                        strace | CVE-2000-0006    | https://security-tracker.debian.org/tracker/CVE-2000-0006   
                    subversion | CVE-2017-1000085 | https://security-tracker.debian.org/tracker/CVE-2017-1000085
                    subversion | CVE-2018-1000111 | https://security-tracker.debian.org/tracker/CVE-2018-1000111
                    subversion | CVE-2020-2111    | https://security-tracker.debian.org/tracker/CVE-2020-2111   
                    subversion | CVE-2020-2304    | https://security-tracker.debian.org/tracker/CVE-2020-2304   
                     syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110   
                           tar | CVE-2007-4476    | https://security-tracker.debian.org/tracker/CVE-2007-4476   
                     tcpreplay | CVE-2020-24265   | https://security-tracker.debian.org/tracker/CVE-2020-24265  
                     tcpreplay | CVE-2020-24266   | https://security-tracker.debian.org/tracker/CVE-2020-24266  
                        thrift | CVE-2019-11938   | https://security-tracker.debian.org/tracker/CVE-2019-11938  
                        thrift | CVE-2019-11939   | https://security-tracker.debian.org/tracker/CVE-2019-11939  
                        thrift | CVE-2019-3552    | https://security-tracker.debian.org/tracker/CVE-2019-3552   
                        thrift | CVE-2019-3553    | https://security-tracker.debian.org/tracker/CVE-2019-3553   
                        thrift | CVE-2019-3558    | https://security-tracker.debian.org/tracker/CVE-2019-3558   
                        thrift | CVE-2019-3559    | https://security-tracker.debian.org/tracker/CVE-2019-3559   
                        thrift | CVE-2019-3564    | https://security-tracker.debian.org/tracker/CVE-2019-3564   
                        thrift | CVE-2019-3565    | https://security-tracker.debian.org/tracker/CVE-2019-3565   
                        thttpd | CVE-2002-1562    | https://security-tracker.debian.org/tracker/CVE-2002-1562   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2009-0414    | https://security-tracker.debian.org/tracker/CVE-2009-0414   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                         unzip | CVE-2008-0888    | https://security-tracker.debian.org/tracker/CVE-2008-0888   
                  vorbis-tools | CVE-2017-11331   | https://security-tracker.debian.org/tracker/CVE-2017-11331  
                       wavpack | CVE-2020-35738   | https://security-tracker.debian.org/tracker/CVE-2020-35738  
                           xen | CVE-2011-1763    | https://security-tracker.debian.org/tracker/CVE-2011-1763   
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                         xterm | CVE-1999-0965    | https://security-tracker.debian.org/tracker/CVE-1999-0965   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                           zip | CVE-2018-13684   | https://security-tracker.debian.org/tracker/CVE-2018-13684  

-- 
http://autobuild.buildroot.net
