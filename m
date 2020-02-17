From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 07:18:17 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-16
Message-ID: <20200217071827.B5839203F7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-16
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  1  |  0  |  9  |
  2019.11.x  |  7  |  1  |  1  |  9  |
    master   | 36  | 28  |  9  | 73  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 6 
                   erlang-22.2 | 3 
                  host-ncurses | 3 
                         libnl | 3 
                    brltty-6.0 | 2 
              host-grpc-1.25.0 | 2 
                 mesa3d-19.3.4 | 2 
                      bash-5.0 | 1 
                   flatbuffers | 1 
                        gflags | 1 
          gstreamer1-mm-1.10.0 | 1 
host-binutils-arc-2019.09-r... | 1 
           host-doxygen-1.8.17 | 1 
                host-go-1.13.8 | 1 
        host-gutenprint-5.2.14 | 1 
host-sdbusplus-4212292bcf13... | 1 
             libopenssl-1.1.1d | 1 
                 opencv3-3.4.9 | 1 
                oprofile-1.3.0 | 1 
               protobuf-3.11.0 | 1 
               qt5charts-2.1.3 | 1 
                       unknown | 1 
                          vpnc | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/bfca306868df54c567215c45c8cdac838d02f567 | ORPH
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0f6d70b077f54e67cdc2148c917faa2c6aeab1ac |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/36c297157481007eb6f21613e584c3b747621b21 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4cf53fdabb5e2fd0142996937cb496bdf4b115b1 |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/0d520d0544852144810ded1ee395b83a7f252c4d |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/b588aaf92f563be4195fef1b86c0df1463365ec4 |     
   mipsel    |          flatbuffers           | TIM | http://autobuild.buildroot.net/results/bace6d24fd04b874fe8232a98f8d67aad9ff56d8 |     
microblazeel |             gflags             | TIM | http://autobuild.buildroot.net/results/1bf3f7e8d69f1c67dbd6f2bf19e86e693004474e |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6a039995be454d64b1a0673bb7c92e46de8d65f8 |     
    arc      | host-binutils-arc-2019.09-r... | NOK | http://autobuild.buildroot.net/results/21d48ddb7b86c2b1094584c4e694ad61a4e9522a |     
   mipsel    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/5dc9dc95d0534b35e2443c120162b5176edafe0b |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/6904dee9b4f20b60499bd4050d314fef45133fc8 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ecdefeb25275a902737a9bb99e981c871507a504 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/531f2181c1a3b8fdde518d440a64a338bf71be20 |     
  aarch64    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/26d2c35d07519861d2c7753c51c43d447e2f1a0d | ORPH
  mips64el   |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/aca9856e24a668effcc0222004e040857ea82d27 |     
  sparc64    |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/91006fe703484da9cce3e912a83283ff34dab621 |     
    arm      |          host-ncurses          | TIM | http://autobuild.buildroot.net/results/4ad248188e1d7491e4d54ea3114f4f0576c06d01 |     
microblazeel | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/e77c84a7be08acf2d5d9453209a9dbf34f34dc5e |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/6897bb606a13f9a3b8a853e6294eba0a1efcaa94 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/0dcf0500c41b12e68c9a8c3f4a2756b4778f9328 |     
  mips64el   |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/816c798a3321d50f1c365abec59c0279a3baaaa8 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/00b6d7c229954b0177ef292f262ff44d43da810f |     
  powerpc    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2de9a8b791713015c416ae16deb5e6bd035befb6 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/c4fdc242e4003ca00370fef80a2ba8ca212e8de9 |     
   xtensa    |             libnl              | TIM | http://autobuild.buildroot.net/results/a2591ffcd205425c0c7f5bc95dbf55e85c3d8b05 |     
microblazeel |             libnl              | TIM | http://autobuild.buildroot.net/results/b315d439d4210dea5237a6d0442ff0536f437e7f |     
   x86_64    |             libnl              | TIM | http://autobuild.buildroot.net/results/966dd769991230070c99a81139d6d46a058d9403 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/322207ef733f56b30161da83b143c7797fc20286 |     
  riscv32    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/3f2f58efd62c7c814a4fff420c33a559196e8f2b |     
  riscv64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/e579575c7cc831d4fdf65c770620cece39bee1bb |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/2b25e22d50c5fcf5d2f8557aa06a924eadbcb9d8 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e1cc564eede16382cc621cc83034080d92366c77 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/7f9607cfa0f628d7d85b522ac75ab8f6b747bbf3 |     
    arc      |        qt5charts-2.1.3         | NOK | http://autobuild.buildroot.net/results/4bc62fbe67bec9b5d8c6d4bb28a4987ac67308bb |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/c08779f7d912bf8d4b0d382280a8ebd387c8381f |     
  aarch64    |              vpnc              | TIM | http://autobuild.buildroot.net/results/d7b785446ac17a4efd93c38527f1f1e4f228b33b |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              python-pyqt5-5.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/b0f1178d146f41cb01c56d0e44f54733a68e888f |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                         libnl | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |             libnl              | TIM | http://autobuild.buildroot.net/results/9ab23f0daf2a45522e4f8554ef69c27dba3b2d4d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/431f1fd2b5c4a6c3a6a11293a04e43e14c1c2f91 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8..7_SP3.... |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20191018     | 20200214     |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.3       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r29   |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.850.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.2       | 17.2.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.35.1       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
                        avro-c |  DISTRO  | https://release-monitoring.org/project/59411 | 1.9.1        | 1.9.2        |     
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2019.5       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2019.5       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.60         | 1.62         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 4.4.0-alpha  | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.13      | 9.15.8       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.5.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.19.1rc2    |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.3       | 7.16.4       |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.4.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.13.0       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.4.1        | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.5.5        | 0.5.6        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.5.3        | 0.5.4        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.5       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     can-utils |  DISTRO  | https://release-monitoring.org/project/10554 | 2020.02.0    | 2020.02.04   |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.41.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.41.0       |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.13.0       | 0.14.0       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191204     |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.9          | 6.10         |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.16.4       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                       connman |  DISTRO  | https://release-monitoring.org/project/00337 | 1.37         | 1.38         |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.0        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.1       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                        davfs2 |  DISTRO  | https://release-monitoring.org/project/07487 | 1.5.5        | 1.5.6        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.12       | 1.2.16       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9.1        | ORPH
                          dhcp |  DISTRO  | https://release-monitoring.org/project/05584 | 4.4.1        | 4.4.2b1      | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.6        |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.5      | 19.03.6      |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.12       | 1.3.3        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.5      | 19.03.6      |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.11.0       | 9.12.0rc1    |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.3       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.01        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.178        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.1       |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.28         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 22.2.6       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.13       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.3        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.3        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.21       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.6        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.31       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.18       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.30       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.3        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.17       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.38       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.4        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.22       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.2        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.2.1        | 3.3          |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.1        | 6.4.2        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.17         | 3.18         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.0        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.12.1       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.01.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.1        |     
                        gauche |  DISTRO  | https://release-monitoring.org/project/00873 | 0.9.8        | 0.9.9        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.35.90      | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 1.5.1        | 1.5.2        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.4        | 1.4.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.24.1       | 2.25.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.91      | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.7      | ORPH
                      glorytun |  DISTRO  | https://release-monitoring.org/project/21354 | 0.2.2        | 0.3.0        |     
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.8        |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.10       | 3.6.12       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      grantlee |  DISTRO  | https://release-monitoring.org/project/21448 | 5.1.0        | 5.2.0        |     
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.3          | 3.4          | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.27.2       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.2        |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.5.91       |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.0        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.2        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.91      | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.1.2        | 2.1.3        |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.12      | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.332        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 65-1         | 66-preview   | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.9-23     | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.4.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.4.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 20.1.pre1    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.5        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.3        | 1.8.4        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.3          | 5.4          |     
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 1.5          |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.11         | 0.12         |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.8.1        | 0.8.2        |     
                         jhead |  DISTRO  | https://release-monitoring.org/project/10546 | 3.03         | 3.04         | ORPH
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.67         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-12-R2   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.2-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.1-Leia   | 2.2.1-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.1-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.1-Leia   | 2.1.2-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.1-Leia   | 2.1.2-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.3-Leia   | 2.2.1-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.4-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.5-Leia   | 2.1.0-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.3-Leia   | 2.1.0-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.3-Leia   | 2.1.0-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.2-Leia   | 2.1.0-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.2-Leia   | 2.5.4-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.8-Leia   | 3.0.1-Matrix |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.4-Leia   | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.4-Leia   | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 4.1.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.20-Leia  | 5.3.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.8.8-Leia   | 4.9.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 4.2.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.15-Leia | 6.2.6-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.18-Leia  | 4.3.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.5-Leia   | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 5.5.1-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.3-Leia   | 4.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 4.9.4-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.5-Leia   | 3.2.1-Matrix |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.0-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.3-Leia   | 2.2.1-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.5-Leia   | 1.1.2-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.0.1-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.1.0-Leia   | 3.0.1-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.0.2-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.1.2-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.1.1-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                    libarchive |  DISTRO  | https://release-monitoring.org/project/01558 | 3.4.1        | 3.4.2        |     
                     libargon2 |  DISTRO  | https://release-monitoring.org/project/15244 | 20171227     | 20190702     |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.32         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.1        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.0        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.31         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.8        |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                        libgee |  DISTRO  | https://release-monitoring.org/project/01625 | 0.20.2       | 0.20.3       |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.3          | 3.3.2        |     
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.4       | 2.63.5       |     
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5          |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.7        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.18         | 0.19         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.17         | 1.18         |     
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.20.4       | 1.22.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                   libnetconf2 |  DISTRO  | https://release-monitoring.org/project/31639 | 1.1.3        | 1.1.7        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.1        | ORPH
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.191211  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.0.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.47.3       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.20.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191204     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191204     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.2        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.69.90      |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.14         | 4.16.0       | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.6        | 1.12.0       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.18.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.34.1       | 1.34.2       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.1        |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.10.0       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                       libyang |  DISTRO  | https://release-monitoring.org/project/18554 | 1.0.109      | 1.0.130      |     
                        libzip |  DISTRO  | https://release-monitoring.org/project/10649 | 1.5.2        | 1.6.1        |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.02.11   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.4        | 1.0.5        | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 2.0.0        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.11.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.11.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                          luvi |  DISTRO  | https://release-monitoring.org/project/21512 | 2.9.3        | 2.10.1       |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.22      | 10.5.1       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.23       | 4.8.24       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 165          | 168          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.5.22       | ORPH
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 19.3.4       | 20.0.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 19.3.4       | 20.0.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.35.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.0      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.1.0        | 5.1.1        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.1.0        | 5.1.1        |     
                    mini-snmpd |  DISTRO  | https://release-monitoring.org/project/21523 | 1.4          | 1.5          |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.1        | 2.9.2        |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.3        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.105    |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.0        |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.19      | 0.21.20      |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.1.0        |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0-rc1      |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.0        | 3.2.1        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.6        | 1.8.7        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.5        | 1.1.6        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.13.3       | 1.13.4       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.7          | 4.8          | ORPH
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200215 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.206        |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.4       | 1.23.1-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.11-dev   |     
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.7       | 1.17.8       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.14.1      | 13.8.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.10.1       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.5       |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.7        | 0.3.8        | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.27       | 2.0.28       |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.1.1        | 6.2.1        |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.48       | 2.4.49       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.3rc3     | ORPH
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.9.2        | 3.10.0       |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.1p1        | 8.2p1        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.5       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.8.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.8.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.8.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.8.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.19       | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.5        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.4        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          pcre |  DISTRO  | https://release-monitoring.org/project/02610 | 8.43         | 8.44         | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.33        | 10.34        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.1       | 5.31.8       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
                      perl-dbi |  DISTRO  | https://release-monitoring.org/project/02811 | 1.642        | 1.643        |     
            perl-io-socket-ssl |  DISTRO  | https://release-monitoring.org/project/06569 | 2.066        | 2.067        |     
             perl-module-build |  DISTRO  | https://release-monitoring.org/project/03077 | 0.4229       | 0.4231       |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.32         | 8.33         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.21         | 1.22         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-path-tiny |  DISTRO  | https://release-monitoring.org/project/11962 | 0.110        | 0.112        |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                 perl-sys-mmap |  DISTRO  | https://release-monitoring.org/project/05675 | 0.19         | 0.20         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.008003     | 1.008005     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0202       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.2.96       |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.0       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191204     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.85.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6b       | 1.3.7rc2     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 6.3.0        | 6.3.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.4       |     
                    protobuf-c |  DISTRO  | https://release-monitoring.org/project/03716 | 1.3.2        | 1.3.3        |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.5       |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.2.0        | 1.3.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.11.1      | 20.2.1       |     
                   python-avro |  DISTRO  | https://release-monitoring.org/project/59411 | 1.9.1        | 1.9.2        |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.8.2        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.9.11    | 2019.11.28   |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.1       | 1.14.0       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.5.0       |     
               python-colorama |  DISTRO  | https://release-monitoring.org/project/03807 | 0.4.1        | 0.4.3        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 20.2.1       |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.43.1       | 0.46.4       |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.0        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13.3       | 0.15         |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.10.0       | 3.11.2       |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.12.2       | 1.0.0        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.4.1        | 0.5.0        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 3.0.0        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.1.1        | 3.2.0        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.14.0       | 0.17.0       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 1.0.0        |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.8          | 2.9          |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.12.0       |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.15.1       | 0.16.0       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.10.3       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 21.1.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.97         | 0.98         |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.1        | 4.5.0        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.1        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.1.1        | 3.2.1        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0rc3     |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.8.1        | 0.8.4        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a2      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 7.2.0        | 8.2.0        |     
                python-msgpack |  DISTRO  | https://release-monitoring.org/project/21831 | 0.6.2        | 1.0.0rc1     |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.18.1       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.6.0        | 2.7.1        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.5.1        | 0.6.1        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.1        | 1.7.2        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.2.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.4        |     
                python-pexpect |  DISTRO  | https://release-monitoring.org/project/07654 | 4.7.0        | 4.8.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 19.3.1       | 20.0.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.3        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.11.0       | 3.11.4       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                     python-py |  DISTRO  | https://release-monitoring.org/project/03981 | 1.8.0        | 1.8.1        |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.7        | 0.4.8        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.7        | 0.2.8        |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.18.2       | 1.19.1       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.4          |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.5.2        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.0        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.2        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.6        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.4       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.14.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.79         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.9        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.28       |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.27.2       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.48.0       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.2.5     |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 3.1.1        | 3.1.2        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.14.1       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 45.2.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.3.3        | 3.5.0        |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.2        | 1.0.4        |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 0.48.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 2.1.1.dev1   |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.4.0        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 1.9.5        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.13       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 0.17.4       |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.9.1        | 0.10.3       |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 2.1.1        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.42.1       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 18.8.1       | 20.1.1       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.5        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.8       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.7        | 0.1.8        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.5        | 1.8.6        |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.0        |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.25         | 0.26         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.7        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.24.4       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 4.7.1        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.1        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.0        | 1.1.1        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 45.2.0       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.30.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.14.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.14.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.14.1       |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.3-rc.1   |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191204     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.1911.0     | 8.2001.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.0        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.41.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.41.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.3       |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.6       | 4.12.0rc2    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.29       |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                           sed |  DISTRO  | https://release-monitoring.org/project/04789 | 4.7          | 4.8          | ORPH
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191204     |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.1          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        snappy |  DISTRO  | https://release-monitoring.org/project/04844 | 1.1.7        | 1.1.8        |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.32-9731... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.8          | 5.0.1        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.0.2        | 6.1.0-rc1    |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.4          | 5.5          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.00      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.2        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.12.2       | 1.13.0       | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.1.1      |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.2        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.5       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.1        | ORPH
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.24.1       | 3.25.1       |     
                       sysrepo |  DISTRO  | https://release-monitoring.org/project/34820 | 1.3.21       | 1.4.2        |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.3.1       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 244.1        | 245-rc1      |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.1        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.2        | 2.4.0-rc1    |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                         uacme |  DISTRO  | https://release-monitoring.org/project/22795 | 1.0.21       | 1.0.22       |     
                        uclibc |  DISTRO  | https://release-monitoring.org/project/13815 | 1.0.32       | 1.0.33       |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10         | 4.10.1       |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.9.1        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.5        | 1.4.6        |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.96         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.47.4       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.2.0267     | ORPH
                        vnstat |  DISTRO  | https://release-monitoring.org/project/07283 | 2.4          | 2.6          |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.91      | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.4       | 2.27.90      |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.5        | 5.5.6        |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.3         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.3        | 5.0          |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.4       | 2.27.90      |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191217-... |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.4.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.28         | 2.29         |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.8          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 353          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 2.00         | 2.01         |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           zsh |  DISTRO  | https://release-monitoring.org/project/05307 | 5.7.1        | 5.8          |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
