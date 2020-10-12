From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 09:52:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-11
Message-ID: <20201012095303.7B9EE203CA@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  4  |  0  | 16  |
  2020.05.x  | 18  |  3  |  0  | 21  |
  2020.08.x  | 18  |  7  |  0  | 25  |
    master   | 116 | 47  |  0  | 163 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 4 
        host-sentry-cli-1.57.0 | 4 
                   libcap-2.43 | 3 
        python-m2crypto-0.36.0 | 3 
               target-finalize | 3 
                  boost-1.74.0 | 2 
              host-guile-3.0.4 | 2 
             kismet-2016-07-R1 | 2 
               libupnpp-0.19.4 | 2 
                   mimic-1.1.0 | 2 
                  ndisc6-1.0.4 | 2 
                  pango-1.46.2 | 2 
                  zeromq-4.3.3 | 2 
         conntrack-tools-1.4.6 | 1 
  gobject-introspection-1.64.1 | 1 
                   guile-3.0.4 | 1 
             host-cairo-1.16.0 | 1 
 Makefile:753: target-finalize | 1 
              micropython-1.13 | 1 
                qt5base-5.15.1 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 
         s6-linux-init-1.0.3.1 | 1 
                snort-2.9.15.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/293a53cd9a13aa7f38d02941b822e66a1bb3c9d4 |     
  aarch64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/96a0f7b3edf77b9d83278f24d5f205817f0d6b7f |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c0cea3df8e30f830fba1cd7da209ffd8fa128d09 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7a8eeb232a579c5b327291a9209eb07591f2ef95 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/aa7113533a52ca2acef5d117b1f33d6977b30a66 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/cd849603de1f5d9d9b50dab745b54aa2eeeea029 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/9b533439eef366478220fd4ba14c560f8276b858 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ce481646a6a544c4627f3f8908e8ccfaf34bdc3d |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/768ad3cb44baaf1fb7a65b9934fa6f5df72a24ee | ORPH
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/c0869d73d499e793e07dc4dbdb6ad046f76e77ff |     
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/1bd1d3d290733c04ffece3dfae2e77fedbbb3841 | ORPH
  mips64el   |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/013c64b12f775ecd82d31470b2c67f1eb7940508 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cfef49fcd41c441857a476044b90047c4de8c2b1 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b05b1c6ece47019cb694b644eb0ee8454ecd1409 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/08aa55b4d258a8e704306db50d7d68d20028a176 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/72f43a0361cec33975a4a0aefc77b0217f4b13d9 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/8bbcab6b94e10a458daffcf58b7d69fc9485bc7e | ORPH
   s390x     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3021081babf0f8376e2019239cc2db39d8e3f36d | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/fc3f060cab54550e20369799a54a669eb31595dd |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f6f0edd866408ab359313c2e812dac2af387ed08 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/8e4feea04cbf4f1c90b94c4c5e7f59c70a6684f9 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/532424ca4cdea93957bdbff3dac035e195d31fc1 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/a937ee949a67f1523832492937e99f88e7876a81 |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/d47055b3747516378397996e85899391d3bdfd1d |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/871cfeb2290e4133c1bc9780037e1e587645457d |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8c2552e1c024bbff3e2c244593410bdb70b2b349 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/7678b7fbd93aadc69259bb4683f1c88ed1cab786 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0cffce180bc9f065639d0bd8e55fb255ca9eccd9 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a0836e5e576707759a4ad3bc79d8db72be3caa97 | ORPH
  riscv64    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/ecc8c17e01cdab4cbfec508d1e116a5e52dd6c18 | ORPH
   mipsel    |          pango-1.46.2          | NOK | http://autobuild.buildroot.net/results/fb5feafdda401dc4ea68f7bdf7adfcfa4b7dd33c | ORPH
   s390x     |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/013b2991531bea01229babb0b7906bc743e32f12 |     
 aarch64_be  |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/a1eaf502c1108c3005e89e2686d6068599cbfeca |     
    arm      |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/de68a8d37ec8fd5d66a4def8beacaa1418c5adb8 |     
  powerpc    |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/bc3682395a77d9f02f6429441d1b3d439f686436 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/57fc9ce72026bf2af4de5e22338cee0c2ccd4b61 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/2cf8845fcd18b26d83cc3f9fda5efe38c188e5ad |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/87d82d6e1f28202a5148d00b5f2dab1ffa48e1d3 |     
    arm      |         snort-2.9.15.1         | NOK | http://autobuild.buildroot.net/results/16e1fa98a80182d96e62365491d5a71ed269aa47 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/67992796d5daa5205672504cd451dc206745c363 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/1c78981636bd79f682f32949918da7e425ab1310 |     
    arm      |        target-finalize         | NOK | http://autobuild.buildroot.net/results/061f5f371ae876e897f51cd2001a90760a0da548 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/fc9d7728923669b37083dcea1c7cd3d208ee8f10 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6f615ff649c0d1403d4e95f5732ea12a1eb6a12a |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/f8d3292ec2e87e7dbcfcfd170bf8577b76a114e0 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/fbeb34bd22de1b2a188ca2b107e4fe65a45c61ae |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/27ca8f8155b77f009461f34aad64b2a4629c3b84 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

              host-grpc-1.25.0 | 2 
gr-osmosdr-46698a67e7e06419... | 1 
 Makefile:753: target-finalize | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/d79fcda7d86a8648e39633c7cd8c5b94bc2cc1ca |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c33c01d6c9d97dd4ef603d0f662118fc5cd95491 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aec2a80128f35d9d39a54150934d728ed606db46 |     
   nios2     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/234913f86da45df0708bbe3bf7361169e2398c9f |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
 Makefile:753: target-finalize | 1 
                qt5base-5.14.2 | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/589f0a461fdf64235b72cc4e135cddaf454913bf |     
  riscv64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/9e47ee2a56153379e4e7bc839be5972a2302ba9f |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/699142ab025f59896562a8be56d0a43b2d1ea93e |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

 Makefile:752: target-finalize | 2 
                  ndisc6-1.0.4 | 2 
                minidlna-1.2.1 | 1 
                       unknown | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/6ba50b68344e3417ee65ff9b32727e30f1f4a534 |     
    i686     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/616d67e57c51926f9dc06ee9ffb75e4e2aef963a |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/e102f6b041343d0d7c00f1bc3cb5412318dc9a0d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/aeeab6348588fdf4389b7f9cefac52d39fe10ca2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8a26b3bc3fd50e9d902508ee6103bd92261d3500 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1a0f985dfe73653ab3e2d39b86f7caf7f3cae801 |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/e9e379705d5ecef3ac1bc23996902cbed652b89c |     


Gitlab CI results for 2020-10-11
================================

Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  DISTRO  | https://release-monitoring.org/project/21391 | R8.8         | 8.8          |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20200717     | 20200925     |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.37.2       | 3.38.0       |     
                 android-tools |  DISTRO  | https://release-monitoring.org/project/13989 | 4.2.2+git... | 11.0.0_r6    |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.8.0        | 1.8.1        |     
                      apparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 2.13.4       | 3.0.0        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.900.2      | 10.1.0       |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.13.0      | 17.7.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.34.2       | 2.38.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.36.0       | 2.38.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | LTS_02_20... | 2020-07-19   |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
               bash-completion |  DISTRO  | https://release-monitoring.org/project/05667 | 2.10         | 2.11         | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2020.2       | 2020.3       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.3       |     
                     bats-core |  DISTRO  | https://release-monitoring.org/project/21396 | 1.2.0        | 1.2.1        |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.65         | 1.68         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.5.0-alpha  |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.5.0-alpha  |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.22      | 9.17.5       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.34         | 2.35.1       |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.7.1        | 3.7.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.1       |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 2.1.0        | 3.0.0        |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 2.00a        | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 5.0.0-alpha2 |     
                        bullet |  DISTRO  | https://release-monitoring.org/project/07669 | 2.89         | 3.06         |     
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.7.5        | 0.8.0        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                        cgilua |  DISTRO  | https://release-monitoring.org/project/58440 | 5.2.1-1      | 6.0.2-0      |     
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-beta   |     
                         check |  DISTRO  | https://release-monitoring.org/project/07593 | 0.15.1       | 0.15.2       | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.1          | 20200710     |     
                      checksec |  DISTRO  | https://release-monitoring.org/project/17677 | 2.2.2        | 2.2.3        |     
                        chrony |  DISTRO  | https://release-monitoring.org/project/08810 | 3.5.1        | 4.0          | ORPH
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.16.1       | 0.17.1       |     
                         cjson |  DISTRO  | https://release-monitoring.org/project/21330 | 1.7.13       | 1.7.14       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.1       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.18.4       |     
                        cppcms |  DISTRO  | https://release-monitoring.org/project/21334 | 1.2.1        | 2.0.0.beta2  | ORPH
                        cppzmq |  DISTRO  | https://release-monitoring.org/project/18648 | 4.7.0        | 4.7.1        |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.3.3        | 2.3.4        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.27.5       | 1.28.4       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.11.0       | 2.12.90      |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.18      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.11         | 4.11.2       | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 9.1.4        | 9.3.0        |     
                       dnsmasq |  DISTRO  | https://release-monitoring.org/project/00444 | 2.81         | 2.82         |     
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 19.03.12     | 19.03.13     |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.27.4       |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.4.0        | 1.4.1        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 19.03.12     | 19.03.13     |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.18       | 1.8.20       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.15.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      earlyoom |  DISTRO  | https://release-monitoring.org/project/17392 | 1.6          | 1.6.1        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.7        | 3.0.8        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.25.0       | 1.25.1       |     
                         eigen |  DISTRO  | https://release-monitoring.org/project/00666 | 3.3.7        | 3.3.8        |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.11.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.1.1       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.17       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.5        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.1        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.8        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.25       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.10       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.6        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.37       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.22       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.38       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.8        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.20       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.43       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.9        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.27       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.7        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.8        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.6.1.0      | 2.6.1.1      |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.25.3       | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/17116 | 19           | 20           |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.4.1        | 3.5          |     
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.23         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.12.0       | 0.13.0-rc2   |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.15.1       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                      freetype |  DISTRO  | https://release-monitoring.org/project/00854 | 2.10.2       | 2.10.3       |     
                fuse-overlayfs |  DISTRO  | https://release-monitoring.org/project/101220 | 1.1.2        | 1.2.0        |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 20.08.00     | 20.09.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.8.0        | 1.8.1        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.38.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.12      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.1.5        | 2.1.7        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.6.1        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.53.2       | 9.53.3       |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.29.0-rc1   |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.64.3       | 2.66.0       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.8.1.0      | 3.8.2.0      |     
         gobject-introspection |  DISTRO  | https://release-monitoring.org/project/01223 | 1.64.1       | 1.66.1       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.20         | 3.21         |     
                    gr-osmosdr |  DISTRO  | https://release-monitoring.org/project/21447 | 0.2.0        | 0.2.2        |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 5.4.0        | 5.5.0        | ORPH
                          grep |  DISTRO  | https://release-monitoring.org/project/01251 | 3.4          | 3.5          |     
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.32.0       | 1.33.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.36.1       | 3.38.0       | ORPH
                       gst-omx |  DISTRO  | https://release-monitoring.org/project/21845 | 1.16.2       | 1.18.0       | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
                    gst1-libav |  DISTRO  | https://release-monitoring.org/project/21848 | 1.16.2       | 1.18.0       | ORPH
                   gst1-python |  DISTRO  | https://release-monitoring.org/project/03881 | 1.16.2       | 1.18.0       |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.8.0        |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.44.1       | 1.46.1       | ORPH
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.9       | ORPH
                       htpdate |  DISTRO  | https://release-monitoring.org/project/132187 | 1.2.4        | 1.2.5        |     
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.335        | 0.340        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.3.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1637         |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 67-1         | 68-rc        | ORPH
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.11         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                igd2-for-linux |  DISTRO  | https://release-monitoring.org/project/21356 | 1.2          | 2.0          |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.10-28    | 7.0.10-34    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.7.0        |     
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.3.2       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.3.0       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.3.0       |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.490        |     
                         iperf |  DISTRO  | https://release-monitoring.org/project/01388 | 2.0.13       | 2.0.14a      |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.8.1        | 3.9          |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.7.0        | 5.8.0        |     
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.6.0        | 1.7.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                            iw |  DISTRO  | https://release-monitoring.org/project/01410 | 5.4          | 5.9          |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.10.3       | 0.10.6       |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.4        | 2.0.5        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.8.0        | 3.9.1        |     
                     json-glib |  DISTRO  | https://release-monitoring.org/project/13144 | 1.4.4        | 1.6.0        |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/07483 | 1.9.3        | 1.9.4        |     
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.1.4        | 2.1.5        |     
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.75         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.75         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.75         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.75         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-09-R4   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 18.8-Leia    | 19.0a2-Ma... |     
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
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.1.1-Matrix |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a2-Ma... |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 6.0.2-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 8.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 6.0.6-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 5.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 6.0.1-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 7.1.4-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 6.4.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 7.0.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.19-Leia | 7.1.1-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.21-Leia  | 7.1.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 6.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 5.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 6.0.2-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 7.0.3-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 7.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 6.2.1-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 5.0.2-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.19-Leia | 19.4.2-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.3-Leia   | 2.6.0-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.5-Leia   | 3.3.0-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.5.0-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.5-Leia   | 3.4.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.3-Leia   | 2.5.0-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.3-Leia   | 2.6.0-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.3-Leia   | 2.4.0-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.3.0-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.4.0-Matrix |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 18.8-Leia    | 19.0a2-Ma... |     
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
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 563          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                 libabseil-cpp |  DISTRO  | https://release-monitoring.org/project/115295 | 20200225.2   | 20200923.1   |     
                   libapparmor |  DISTRO  | https://release-monitoring.org/project/94819 | 2.13.4       | 3.0.0        |     
                   libblockdev |  DISTRO  | https://release-monitoring.org/project/09397 | 2.24         | 2.24-1       |     
                   libbytesize |  DISTRO  | https://release-monitoring.org/project/07869 | 2.3          | 2.4          |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.43         | 2.44         |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.7        | 6.0.2        |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.14         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 5.1.1        | 5.1.3        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.9.1        | 1.9.901      |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.10.0       | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.9.4        | 3.10.0       |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.38.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.64.4       | 2.66.1       |     
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.39         | ORPH
                      libgpgme |  DISTRO  | https://release-monitoring.org/project/01239 | 1.13.1       | 1.14.0       | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.26       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.6          |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 233          | 234          |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20200521     | 20200907     |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.35.1       |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                        libiio |  DISTRO  | https://release-monitoring.org/project/15689 | 0.19         | 0.21         |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.41         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 2.1.20200928 |     
                     libnpupnp |  DISTRO  | https://release-monitoring.org/project/75209 | 4.0.11       | 4.0.12       |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.1.5        | 3.2.1        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 5.1.1        | 5.1.2        |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/01699 | 0.4.10       | 0.4.11       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200718  |     
            libpam-radius-auth |  DISTRO  | https://release-monitoring.org/project/57834 | 1.4.0        | 2.0.0        | ORPH
                    libphidget |  DISTRO  | https://release-monitoring.org/project/115726 | 2.1.8.201... | 2.1.9.201... |     
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.1.0        | 2.2.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.2.0        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.14      | 1.26.6       |     
                   libqrencode |  DISTRO  | https://release-monitoring.org/project/12834 | 4.0.2        | 4.1.1        |     
                       librelp |  DISTRO  | https://release-monitoring.org/project/01713 | 1.2.18       | 1.8.0        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.50.0       | 2.50.1       |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.4        | 2.5.0        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.3       | 0.20.4       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.1          | 20200710     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.1          | 20200710     |     
                      libshout |  DISTRO  | https://release-monitoring.org/project/11084 | 2.4.3        | 2.4.4        | ORPH
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.4        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.72.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.21         |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
          libtorrent-rasterbar |  DISTRO  | https://release-monitoring.org/project/04166 | 1.2.7        | 2.0.0        |     
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.14.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.14.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.38.0       | 1.40.0       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.8.0        | 2.9.0        |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.8.0        | 2.9.1        |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.10.1       |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 4.0.20       | 4.1.2        |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.5.0-alpha  | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.5        | 1.0.6        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.2          | 1.2.1        |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.3       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.12.1       | 2.12.2       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.4.1        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.23      | 10.5.6       |     
                       mbuffer |  DISTRO  | https://release-monitoring.org/project/15518 | 20200505     | 20200929     |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 172          | 173          |     
                         mdevd |  DISTRO  | https://release-monitoring.org/project/16553 | 0.1.1.2      | 0.1.2.0      |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.5.0-alpha  | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.9       | 20.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.9       | 20.2.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.38.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 9.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                      minetest |  DISTRO  | https://release-monitoring.org/project/01978 | 5.2.0        | 5.3.0        |     
                 minetest-game |  DISTRO  | https://release-monitoring.org/project/21522 | 5.2.0        | 5.3.0        |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.10.0       | 2.10.1       |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59b          | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2020.07      | 2020.09      |     
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.14.2       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | 4.2.10       | 4.9.0-alpha  |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                         monit |  DISTRO  | https://release-monitoring.org/project/05483 | 5.26.0       | 5.27.0       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.12.0.90    |     
                           mpc |  DISTRO  | https://release-monitoring.org/project/01667 | 1.1.0        | 1.2.0        | ORPH
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.25      | 0.22         |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.2        | 2.5.0        |     
                          mpfr |  DISTRO  | https://release-monitoring.org/project/02019 | 4.0.2        | 4.1.0        | ORPH
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.3       | ORPH
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.1          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.11       | 1.8.12       |     
                           mtr |  DISTRO  | https://release-monitoring.org/project/02029 | 0.93         | 0.94         | ORPH
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.1          | 3.2          |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 5.2          | 5.3          | ORPH
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.39         | 0.40         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20201010 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.1       | 1.25.0       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.9          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.29.0-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.18.0       | 1.19.3       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                   nginx-naxsi |  DISTRO  | https://release-monitoring.org/project/20448 | 0.56         | 1.1a         |     
                         ninja |  DISTRO  | https://release-monitoring.org/project/02089 | 1.10.0       | 1.10.1       |     
                          nmap |  DISTRO  | https://release-monitoring.org/project/02096 | 7.80         | 7.91         | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.18.4      | 14.13.1      |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.138      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.9       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.6_rc2    |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.10       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.29       |     
                      openldap |  DISTRO  | https://release-monitoring.org/project/02551 | 2.4.50       | 2.4.53       |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.5        | ORPH
                    openresolv |  DISTRO  | https://release-monitoring.org/project/21551 | 3.10.0       | 3.11.0       |     
                       openssh |  DISTRO  | https://release-monitoring.org/project/02565 | 8.3p1        | 8.4p1        | ORPH
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.5       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.9.0        | 3.11.0-rc1   |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.9.0        | 3.11.0-rc1   |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.9.0        | 3.11.0-rc1   |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.9.0        | 3.11.0-rc1   |     
                      opusfile |  DISTRO  | https://release-monitoring.org/project/10353 | 0.11         | 0.12         | ORPH
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.21       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.5.0-alpha  | ORPH
                          owfs |  DISTRO  | https://release-monitoring.org/project/21559 | 3.2p3        | 3.2p4        |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.21      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.46.2       | 1.47.0       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                    parprouted |  DISTRO  | https://release-monitoring.org/project/10309 | 0.7          | 0.65         |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.12         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202009       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.33.2       |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-file-listing |  DISTRO  | https://release-monitoring.org/project/02892 | 6.04         | 6.11         |     
                       perl-gd |  DISTRO  | https://release-monitoring.org/project/12660 | 2.72         | 2.73         |     
             perl-http-message |  DISTRO  | https://release-monitoring.org/project/02977 | 6.25         | 6.26         |     
                  perl-io-html |  DISTRO  | https://release-monitoring.org/project/02992 | 1.001        | 1.004        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.47         | 6.49         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 1.20200824   | 1.20200907   |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.57         | 8.61         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.26         | 1.27         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010005     | 1.010006     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0206       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                    php-xdebug |  DISTRO  | https://release-monitoring.org/project/13302 | 2.9.6        | 2.9.8        |     
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.2.0b2      | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 78           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.13       |     
                          pixz |  DISTRO  | https://release-monitoring.org/project/07490 | 1.0.6        | 1.0.7        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.1          | 20200710     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.116        | 0.118        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 20.10.0      |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                    postgresql |  DISTRO  | https://release-monitoring.org/project/05601 | 12.4         | 13.0         |     
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.8        | 1.4          | ORPH
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7a       |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 7.0.1        | 7.1.1        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.13.0       | 4.0.0-rc2    |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  DISTRO  | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.2      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                  python-aenum |  DISTRO  | https://release-monitoring.org/project/34074 | 2.2.3        | 2.2.4        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b3        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.4        | 0.9.0        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.17.0       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.3.0        |     
             python-asn1crypto |  DISTRO  | https://release-monitoring.org/project/13875 | 1.3.0        | 1.4.0        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 19.3.0       | 20.2.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.7.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.7        | 3.2.0        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.3        |     
                  python-boto3 |  DISTRO  | https://release-monitoring.org/project/08778 | 1.9.210      | 1.15.16      |     
               python-botocore |  DISTRO  | https://release-monitoring.org/project/08748 | 1.12.210     | 1.18.16      |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
        python-cached-property |  DISTRO  | https://release-monitoring.org/project/06048 | 1.5.1        | 1.5.2        |     
                    python-can |  DISTRO  | https://release-monitoring.org/project/17873 | 3.3.3        | 4.0.0-dev.0  |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                  python-cbor2 |  DISTRO  | https://release-monitoring.org/project/64102 | 5.1.2        | 5.2.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.6.20    |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.14.2       | 1.14.3       |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 3.1.0        |     
                python-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.6        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.4.5        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
               python-colorlog |  DISTRO  | https://release-monitoring.org/project/12509 | 4.1.0        | 4.4.0        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.8.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 3.0          | 3.1.1        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.50.0       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.10       | 3.1.2        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
              python-dnspython |  DISTRO  | https://release-monitoring.org/project/13190 | 1.16.0       | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.3.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.2        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.9.2        | 1.9.4        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.15         | 0.16.0       |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.2       |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 1.0.0        | 2.0.0        |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.8        | 3.0.9        |     
          python-flask-jsonrpc |  DISTRO  | https://release-monitoring.org/project/21698 | 0.3.1        | 1.1.0        |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.4        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 3.36.1       | 3.38.0       |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.16       | 0.4.17       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.2.0        | 4.0.0        |     
                  python-hpack |  DISTRO  | https://release-monitoring.org/project/19034 | 3.0.0        | 4.0.0        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0.1        | 1.1          |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 3.0.1        |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.2.0        | 6.0.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 19.0.0       | 20.0.1       |     
                   python-idna |  DISTRO  | https://release-monitoring.org/project/05487 | 2.9          | 2.10         |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.1        |     
                   python-ipdb |  DISTRO  | https://release-monitoring.org/project/12710 | 0.13.2       | 0.13.4       |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.18.1       |     
                python-iso8601 |  DISTRO  | https://release-monitoring.org/project/17228 | 0.1.12       | 0.1.13       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
                  python-janus |  DISTRO  | https://release-monitoring.org/project/56567 | 0.5.0        | 0.6.0        |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.17.0       | 0.17.2       |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
               python-jmespath |  DISTRO  | https://release-monitoring.org/project/08749 | 0.9.4        | 0.10.0       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.4.0       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.98         | 1.0.0        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.5.1        | 4.5.2        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.3          |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.3.2        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a5      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.4.0        | 8.5.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.45.1       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 2.4          | 2.5          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.19.2       |     
          python-opcua-asyncio |  DISTRO  | https://release-monitoring.org/project/131612 | 0.8.4        | 0.98.9       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.1        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
               python-paramiko |  DISTRO  | https://release-monitoring.org/project/03954 | 2.7.1        | 2.7.2        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.7.0        | 0.8.0        |     
                python-passlib |  DISTRO  | https://release-monitoring.org/project/13203 | 1.7.2        | 1.7.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.5.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.5.0        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2.3       |     
                 python-pluggy |  DISTRO  | https://release-monitoring.org/project/07500 | 0.13.1       | 1.0.0.dev0   |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
              python-posix-ipc |  DISTRO  | https://release-monitoring.org/project/13204 | 1.0.4        | 1.0.5        |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.7        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.13.0       | 4.0.0-rc2    |     
               python-psycopg2 |  DISTRO  | https://release-monitoring.org/project/03979 | 2.8.5        | 2.8.6        |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
                 python-pybind |  DISTRO  | https://release-monitoring.org/project/13384 | 2.5.0        | 2.6.0b1      |     
                python-pycairo |  DISTRO  | https://release-monitoring.org/project/13166 | 1.19.1       | 1.20.0       |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 20200714.1   | 20200910.1   |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.6.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev14  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.7.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.5          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.4.0        |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.9.3        | 0.10.1       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.14       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.4        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.58.0       |     
                 python-pytest |  DISTRO  | https://release-monitoring.org/project/03765 | 6.0.1        | 6.1.1        |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.1.0        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.10.11   |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.8.6     |     
             python-request-id |  DISTRO  | https://release-monitoring.org/project/21598 | 1.0          | 1.0.1        |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
             python-s3transfer |  DISTRO  | https://release-monitoring.org/project/10428 | 0.2.1        | 0.3.3        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.17.3       | 0.18.0       |     
                 python-serial |  DISTRO  | https://release-monitoring.org/project/08305 | 3.4          | 3.5b0        |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 50.3.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.17.0       | 3.17.2       |     
          python-simplelogging |  DISTRO  | https://release-monitoring.org/project/21134 | 0.10.0       | 0.11.0       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.3        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.19       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.3        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.4.1        |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 1.1.2        | 1.1.3        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 4.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.4        | 6.1b1        |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.50.2       |     
              python-traitlets |  DISTRO  | https://release-monitoring.org/project/12211 | 4.3.3        | 5.0.4        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.9.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.7.4.1      | 3.7.4.3      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.7.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 4.0.1        |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.2        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.15.0       | 0.18.1       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.3       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.61         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
                   python-xlib |  DISTRO  | https://release-monitoring.org/project/12180 | 0.27         | 0.28         |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.3.6        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.5.1        | 1.6.0        |     
                   python-yatl |  DISTRO  | https://release-monitoring.org/project/50636 | 20200430.1   | 20200711.1   |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.28.5       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.2        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.6        | 3.10.0a1     |     
               python3-cheetah |  DISTRO  | https://release-monitoring.org/project/13246 | 3.2.4        | 3.2.6        |     
                python3-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.21      | 3.0a6        |     
             python3-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
            python3-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.10.11   |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 50.3.0       |     
                      qdecoder |  DISTRO  | https://release-monitoring.org/project/21735 | 12.0.7       | 12.0.8       | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.3.2        | 8.0.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.32.0       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.1       |     
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.9        |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                           re2 |  DISTRO  | https://release-monitoring.org/project/10500 | 2020-08-01   | 2020-10-01   |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20200229   | 2.20200818   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.1          | 20200710     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.4.0        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.10.1       | 6.11.4       |     
                         rsync |  DISTRO  | https://release-monitoring.org/project/04217 | 3.1.3        | 3.2.3        | ORPH
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.2004.0     | 8.2008.0     |     
                      rt-tests |  DISTRO  | https://release-monitoring.org/project/59450 | 1.8          | 1.9          |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.7.1        | 2.7.2        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.45.2       | 1.47.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.45.2       | 1.47.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.38.3       | 0.40.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.3.0      |     
                 s6-linux-init |  DISTRO  | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.2      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.3      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.2.0      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.3.0      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.2.0      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.13      | 4.13.0rc4    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.31       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.2        | 4.0.1        |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.3.0        | 1.3.1        |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.1          | 20200710     |     
                    sentry-cli |  DISTRO  | https://release-monitoring.org/project/135642 | 1.57.0       | 1.58.0       |     
                 sentry-native |  DISTRO  | https://release-monitoring.org/project/135639 | 0.4.1        | 0.4.2        |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 4.2.2        | 4.2.3        |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.4        | 3.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.8          |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.9.2.1      | 2.9.3.0      |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16.1     |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                       spandsp |  DISTRO  | https://release-monitoring.org/project/12600 | 3.0.0-6ec... | 3.0.0        |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.8.0        | 1.8.1        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.3       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.13         | 5.0.4        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
                      sshguard |  DISTRO  | https://release-monitoring.org/project/13819 | 2.4.0        | 2.4.1        |     
                          sslh |  DISTRO  | https://release-monitoring.org/project/06184 | 1.20         | 1.21c        |     
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.5       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.2.1        | 6.3          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.11.17      | 0.11.21      |     
                       stunnel |  DISTRO  | https://release-monitoring.org/project/04901 | 5.56         | 5.57         |     
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                  supertuxkart |  DISTRO  | https://release-monitoring.org/project/04912 | 1.1          | 1.2          |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.1        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.9        | 6.0.0        |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.27.1       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.4.0       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 246.5        | 246.6        |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.96         | 2.97         | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.3          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                     tinyproxy |  DISTRO  | https://release-monitoring.org/project/08699 | 1.10.0       | 1.11.0-rc1   |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.2          |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.2        | 4.3.0        | ORPH
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.2.1        | 0.3.0_rc0    |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 3.0.1-rc2    | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.9.1        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                        tzdata |  DISTRO  | https://release-monitoring.org/project/05021 | 2020a        | 2020b        |     
                   uboot-tools |  DISTRO  | https://release-monitoring.org/project/05022 | 2020.04      | 2020.10      |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                           uhd |  DISTRO  | https://release-monitoring.org/project/12572 | 3.15.0.0     | 4.0.0.0      |     
                        umtprd |  DISTRO  | https://release-monitoring.org/project/46129 | 1.3.6        | 1.3.9        |     
                       unbound |  DISTRO  | https://release-monitoring.org/project/05042 | 1.11.0       | 1.12.0       |     
                      unixodbc |  DISTRO  | https://release-monitoring.org/project/07344 | 2.3.7        | 2.3.9        |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.3        | 5.9.4        | ORPH
                         unscd |  DISTRO  | https://release-monitoring.org/project/07070 | 0.53         | 0.54         |     
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.6.0_lib... | 2.7.0_lib... |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.50.1       | ORPH
                           vdr |  DISTRO  | https://release-monitoring.org/project/05069 | 2.4.1        | 2.4.4        |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.1835     | ORPH
                           vlc |  DISTRO  | https://release-monitoring.org/project/06504 | 3.0.11       | 3.0.11.1     |     
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.62.1       | ORPH
                         vuejs |  DISTRO  | https://release-monitoring.org/project/89353 | 2.6.11       | 2.6.12       |     
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 5.12         | 5.19         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.2.7        | 3.3.1        | ORPH
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.16       | 1.4.17       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20201003     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
       xdriver_xf86-video-vesa |  DISTRO  | https://release-monitoring.org/project/05243 | 2.4.0        | 2.5.0        |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
              xfont_font-alias |  DISTRO  | https://release-monitoring.org/project/15059 | 1.0.3        | 1.0.4        |     
      xfont_font-misc-ethiopic |  DISTRO  | https://release-monitoring.org/project/17195 | 1.0.3        | 1.0.4        |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.30         | 2.31         |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 358          | 360          | ORPH
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2020a        | 2020b        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     
Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2016-5080    | https://security-tracker.debian.org/tracker/CVE-2016-5080   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                 at91bootstrap | CVE-2020-11683   | https://security-tracker.debian.org/tracker/CVE-2020-11683  
                 at91bootstrap | CVE-2020-11684   | https://security-tracker.debian.org/tracker/CVE-2020-11684  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                          bind | CVE-2017-3139    | https://security-tracker.debian.org/tracker/CVE-2017-3139   
                          bind | CVE-2019-6470    | https://security-tracker.debian.org/tracker/CVE-2019-6470   
                       bitcoin | CVE-2017-9230    | https://security-tracker.debian.org/tracker/CVE-2017-9230   
                           boa | CVE-2009-4496    | https://security-tracker.debian.org/tracker/CVE-2009-4496   
                         boinc | CVE-2013-2018    | https://security-tracker.debian.org/tracker/CVE-2013-2018   
                         botan | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                         botan | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                         botan | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                         cairo | CVE-2013-6425    | https://security-tracker.debian.org/tracker/CVE-2013-6425   
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        cereal | CVE-2020-11105   | https://security-tracker.debian.org/tracker/CVE-2020-11105  
                      civetweb | CVE-2019-3821    | https://security-tracker.debian.org/tracker/CVE-2019-3821   
                         cmake | CVE-2016-10642   | https://security-tracker.debian.org/tracker/CVE-2016-10642  
                          cups | CVE-2012-6094    | https://security-tracker.debian.org/tracker/CVE-2012-6094   
                          cups | CVE-2014-8166    | https://security-tracker.debian.org/tracker/CVE-2014-8166   
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
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
                            ed | CVE-2015-2987    | https://security-tracker.debian.org/tracker/CVE-2015-2987   
                          flex | CVE-2015-1773    | https://security-tracker.debian.org/tracker/CVE-2015-1773   
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                   ghostscript | CVE-2018-18073   | https://security-tracker.debian.org/tracker/CVE-2018-18073  
                           git | CVE-2018-1000110 | https://security-tracker.debian.org/tracker/CVE-2018-1000110
                           git | CVE-2018-1000182 | https://security-tracker.debian.org/tracker/CVE-2018-1000182
                           git | CVE-2019-1003010 | https://security-tracker.debian.org/tracker/CVE-2019-1003010
                           git | CVE-2020-2136    | https://security-tracker.debian.org/tracker/CVE-2020-2136   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         glibc | CVE-2020-10029   | https://security-tracker.debian.org/tracker/CVE-2020-10029  
                         glibc | CVE-2020-1752    | https://security-tracker.debian.org/tracker/CVE-2020-1752   
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                       gnuplot | CVE-2020-25412   | https://security-tracker.debian.org/tracker/CVE-2020-25412  
                        gnutls | CVE-2018-10844   | https://security-tracker.debian.org/tracker/CVE-2018-10844  
                        gnutls | CVE-2018-10845   | https://security-tracker.debian.org/tracker/CVE-2018-10845  
                        gnutls | CVE-2018-10846   | https://security-tracker.debian.org/tracker/CVE-2018-10846  
                        gnutls | CVE-2018-16868   | https://security-tracker.debian.org/tracker/CVE-2018-16868  
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2019-14865   | https://security-tracker.debian.org/tracker/CVE-2019-14865  
                         grub2 | CVE-2020-15705   | https://security-tracker.debian.org/tracker/CVE-2020-15705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
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
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
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
                         iperf | CVE-2016-4303    | https://security-tracker.debian.org/tracker/CVE-2016-4303   
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2015-9251    | https://security-tracker.debian.org/tracker/CVE-2015-9251   
                        jquery | CVE-2019-11358   | https://security-tracker.debian.org/tracker/CVE-2019-11358  
                        jquery | CVE-2020-11022   | https://security-tracker.debian.org/tracker/CVE-2020-11022  
                        jquery | CVE-2020-11023   | https://security-tracker.debian.org/tracker/CVE-2020-11023  
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libcroco | CVE-2020-12825   | https://security-tracker.debian.org/tracker/CVE-2020-12825  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                       libexif | CVE-2016-6328    | https://security-tracker.debian.org/tracker/CVE-2016-6328   
                     libgcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                     libgcrypt | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                     libgcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                       libgit2 | CVE-2014-9390    | https://security-tracker.debian.org/tracker/CVE-2014-9390   
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                        libraw | CVE-2020-24890   | https://security-tracker.debian.org/tracker/CVE-2020-24890  
                      libressl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                      libressl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                      libressl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                   libtomcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                   libtomcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                       libupnp | CVE-2020-13848   | https://security-tracker.debian.org/tracker/CVE-2020-13848  
                       libxml2 | CVE-2016-4614    | https://security-tracker.debian.org/tracker/CVE-2016-4614   
                       libxml2 | CVE-2016-9596    | https://security-tracker.debian.org/tracker/CVE-2016-9596   
                       libxml2 | CVE-2016-9598    | https://security-tracker.debian.org/tracker/CVE-2016-9598   
                        libzip | CVE-2017-12858   | https://security-tracker.debian.org/tracker/CVE-2017-12858  
                         links | CVE-2008-3319    | https://security-tracker.debian.org/tracker/CVE-2008-3319   
                         linux | CVE-2014-3250    | https://security-tracker.debian.org/tracker/CVE-2014-3250   
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15889   | https://security-tracker.debian.org/tracker/CVE-2020-15889  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                           lua | CVE-2020-24342   | https://security-tracker.debian.org/tracker/CVE-2020-24342  
                           lxc | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                      mongoose | CVE-2020-25756   | https://security-tracker.debian.org/tracker/CVE-2020-25756  
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                         mysql | CVE-2020-2923    | https://security-tracker.debian.org/tracker/CVE-2020-2923   
                       ncurses | CVE-2018-19211   | https://security-tracker.debian.org/tracker/CVE-2018-19211  
                       ncurses | CVE-2018-19217   | https://security-tracker.debian.org/tracker/CVE-2018-19217  
                       ncurses | CVE-2019-17594   | https://security-tracker.debian.org/tracker/CVE-2019-17594  
                       ncurses | CVE-2019-17595   | https://security-tracker.debian.org/tracker/CVE-2019-17595  
                        netcat | CVE-2008-5727    | https://security-tracker.debian.org/tracker/CVE-2008-5727   
                        netcat | CVE-2008-5728    | https://security-tracker.debian.org/tracker/CVE-2008-5728   
                        netcat | CVE-2008-5729    | https://security-tracker.debian.org/tracker/CVE-2008-5729   
                        netcat | CVE-2008-5730    | https://security-tracker.debian.org/tracker/CVE-2008-5730   
                        netcat | CVE-2008-5742    | https://security-tracker.debian.org/tracker/CVE-2008-5742   
                        netcat | CVE-2015-2214    | https://security-tracker.debian.org/tracker/CVE-2015-2214   
                        nettle | CVE-2016-6489    | https://security-tracker.debian.org/tracker/CVE-2016-6489   
                        nettle | CVE-2018-16869   | https://security-tracker.debian.org/tracker/CVE-2018-16869  
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                        opencv | CVE-2017-1000450 | https://security-tracker.debian.org/tracker/CVE-2017-1000450
                        opencv | CVE-2017-12597   | https://security-tracker.debian.org/tracker/CVE-2017-12597  
                        opencv | CVE-2017-12598   | https://security-tracker.debian.org/tracker/CVE-2017-12598  
                        opencv | CVE-2017-12599   | https://security-tracker.debian.org/tracker/CVE-2017-12599  
                        opencv | CVE-2017-12600   | https://security-tracker.debian.org/tracker/CVE-2017-12600  
                        opencv | CVE-2017-12601   | https://security-tracker.debian.org/tracker/CVE-2017-12601  
                        opencv | CVE-2017-12602   | https://security-tracker.debian.org/tracker/CVE-2017-12602  
                        opencv | CVE-2017-12603   | https://security-tracker.debian.org/tracker/CVE-2017-12603  
                        opencv | CVE-2017-12604   | https://security-tracker.debian.org/tracker/CVE-2017-12604  
                        opencv | CVE-2017-12605   | https://security-tracker.debian.org/tracker/CVE-2017-12605  
                        opencv | CVE-2017-12606   | https://security-tracker.debian.org/tracker/CVE-2017-12606  
                        opencv | CVE-2017-12862   | https://security-tracker.debian.org/tracker/CVE-2017-12862  
                        opencv | CVE-2017-12863   | https://security-tracker.debian.org/tracker/CVE-2017-12863  
                        opencv | CVE-2017-12864   | https://security-tracker.debian.org/tracker/CVE-2017-12864  
                        opencv | CVE-2019-14491   | https://security-tracker.debian.org/tracker/CVE-2019-14491  
                        opencv | CVE-2019-14492   | https://security-tracker.debian.org/tracker/CVE-2019-14492  
                        opencv | CVE-2019-14493   | https://security-tracker.debian.org/tracker/CVE-2019-14493  
                        opencv | CVE-2019-15939   | https://security-tracker.debian.org/tracker/CVE-2019-15939  
                        opencv | CVE-2019-19624   | https://security-tracker.debian.org/tracker/CVE-2019-19624  
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                       openssl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                       openssl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                       openvpn | CVE-2020-7224    | https://security-tracker.debian.org/tracker/CVE-2020-7224   
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2020-7064    | https://security-tracker.debian.org/tracker/CVE-2020-7064   
                        pixman | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                        polkit | CVE-2013-4288    | https://security-tracker.debian.org/tracker/CVE-2013-4288   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                       privoxy | CVE-2019-3699    | https://security-tracker.debian.org/tracker/CVE-2019-3699   
                        python | CVE-2013-1753    | https://security-tracker.debian.org/tracker/CVE-2013-1753   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                          qemu | CVE-2015-8345    | https://security-tracker.debian.org/tracker/CVE-2015-8345   
                          qemu | CVE-2015-8619    | https://security-tracker.debian.org/tracker/CVE-2015-8619   
                          qemu | CVE-2015-8666    | https://security-tracker.debian.org/tracker/CVE-2015-8666   
                          qemu | CVE-2016-1568    | https://security-tracker.debian.org/tracker/CVE-2016-1568   
                          qemu | CVE-2016-2391    | https://security-tracker.debian.org/tracker/CVE-2016-2391   
                          qemu | CVE-2016-2857    | https://security-tracker.debian.org/tracker/CVE-2016-2857   
                          qemu | CVE-2016-2858    | https://security-tracker.debian.org/tracker/CVE-2016-2858   
                          qemu | CVE-2016-4001    | https://security-tracker.debian.org/tracker/CVE-2016-4001   
                          qemu | CVE-2016-4002    | https://security-tracker.debian.org/tracker/CVE-2016-4002   
                          qemu | CVE-2016-4020    | https://security-tracker.debian.org/tracker/CVE-2016-4020   
                          qemu | CVE-2016-4952    | https://security-tracker.debian.org/tracker/CVE-2016-4952   
                          qemu | CVE-2016-4964    | https://security-tracker.debian.org/tracker/CVE-2016-4964   
                          qemu | CVE-2016-5105    | https://security-tracker.debian.org/tracker/CVE-2016-5105   
                          qemu | CVE-2016-5106    | https://security-tracker.debian.org/tracker/CVE-2016-5106   
                          qemu | CVE-2016-5107    | https://security-tracker.debian.org/tracker/CVE-2016-5107   
                          qemu | CVE-2016-5126    | https://security-tracker.debian.org/tracker/CVE-2016-5126   
                          qemu | CVE-2016-5238    | https://security-tracker.debian.org/tracker/CVE-2016-5238   
                          qemu | CVE-2016-5337    | https://security-tracker.debian.org/tracker/CVE-2016-5337   
                          qemu | CVE-2016-5338    | https://security-tracker.debian.org/tracker/CVE-2016-5338   
                          qemu | CVE-2016-6351    | https://security-tracker.debian.org/tracker/CVE-2016-6351   
                          qemu | CVE-2016-6490    | https://security-tracker.debian.org/tracker/CVE-2016-6490   
                          qemu | CVE-2016-6833    | https://security-tracker.debian.org/tracker/CVE-2016-6833   
                          qemu | CVE-2016-6834    | https://security-tracker.debian.org/tracker/CVE-2016-6834   
                          qemu | CVE-2016-6835    | https://security-tracker.debian.org/tracker/CVE-2016-6835   
                          qemu | CVE-2016-6836    | https://security-tracker.debian.org/tracker/CVE-2016-6836   
                          qemu | CVE-2016-6888    | https://security-tracker.debian.org/tracker/CVE-2016-6888   
                          qemu | CVE-2016-7116    | https://security-tracker.debian.org/tracker/CVE-2016-7116   
                          qemu | CVE-2016-7155    | https://security-tracker.debian.org/tracker/CVE-2016-7155   
                          qemu | CVE-2016-7156    | https://security-tracker.debian.org/tracker/CVE-2016-7156   
                          qemu | CVE-2016-7157    | https://security-tracker.debian.org/tracker/CVE-2016-7157   
                          qemu | CVE-2016-7170    | https://security-tracker.debian.org/tracker/CVE-2016-7170   
                          qemu | CVE-2016-7421    | https://security-tracker.debian.org/tracker/CVE-2016-7421   
                          qemu | CVE-2016-7422    | https://security-tracker.debian.org/tracker/CVE-2016-7422   
                          qemu | CVE-2016-7423    | https://security-tracker.debian.org/tracker/CVE-2016-7423   
                          qemu | CVE-2016-7466    | https://security-tracker.debian.org/tracker/CVE-2016-7466   
                          qemu | CVE-2016-7994    | https://security-tracker.debian.org/tracker/CVE-2016-7994   
                          qemu | CVE-2016-7995    | https://security-tracker.debian.org/tracker/CVE-2016-7995   
                          qemu | CVE-2016-8576    | https://security-tracker.debian.org/tracker/CVE-2016-8576   
                          qemu | CVE-2016-8577    | https://security-tracker.debian.org/tracker/CVE-2016-8577   
                          qemu | CVE-2016-8578    | https://security-tracker.debian.org/tracker/CVE-2016-8578   
                          qemu | CVE-2016-8667    | https://security-tracker.debian.org/tracker/CVE-2016-8667   
                          qemu | CVE-2016-8668    | https://security-tracker.debian.org/tracker/CVE-2016-8668   
                          qemu | CVE-2016-8669    | https://security-tracker.debian.org/tracker/CVE-2016-8669   
                          qemu | CVE-2016-8909    | https://security-tracker.debian.org/tracker/CVE-2016-8909   
                          qemu | CVE-2016-8910    | https://security-tracker.debian.org/tracker/CVE-2016-8910   
                          qemu | CVE-2016-9101    | https://security-tracker.debian.org/tracker/CVE-2016-9101   
                          qemu | CVE-2016-9102    | https://security-tracker.debian.org/tracker/CVE-2016-9102   
                          qemu | CVE-2016-9103    | https://security-tracker.debian.org/tracker/CVE-2016-9103   
                          qemu | CVE-2016-9104    | https://security-tracker.debian.org/tracker/CVE-2016-9104   
                          qemu | CVE-2016-9105    | https://security-tracker.debian.org/tracker/CVE-2016-9105   
                          qemu | CVE-2016-9106    | https://security-tracker.debian.org/tracker/CVE-2016-9106   
                          qemu | CVE-2016-9907    | https://security-tracker.debian.org/tracker/CVE-2016-9907   
                          qemu | CVE-2016-9908    | https://security-tracker.debian.org/tracker/CVE-2016-9908   
                          qemu | CVE-2016-9911    | https://security-tracker.debian.org/tracker/CVE-2016-9911   
                          qemu | CVE-2016-9912    | https://security-tracker.debian.org/tracker/CVE-2016-9912   
                          qemu | CVE-2016-9921    | https://security-tracker.debian.org/tracker/CVE-2016-9921   
                          qemu | CVE-2016-9923    | https://security-tracker.debian.org/tracker/CVE-2016-9923   
                          qemu | CVE-2017-5957    | https://security-tracker.debian.org/tracker/CVE-2017-5957   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2020-14364   | https://security-tracker.debian.org/tracker/CVE-2020-14364  
                          qemu | CVE-2020-15863   | https://security-tracker.debian.org/tracker/CVE-2020-15863  
                          qemu | CVE-2020-25742   | https://security-tracker.debian.org/tracker/CVE-2020-25742  
                          qemu | CVE-2020-25743   | https://security-tracker.debian.org/tracker/CVE-2020-25743  
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                         quota | CVE-2015-9534    | https://security-tracker.debian.org/tracker/CVE-2015-9534   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rsyslog | CVE-2015-3243    | https://security-tracker.debian.org/tracker/CVE-2015-3243   
                          rust | CVE-2020-25791   | https://security-tracker.debian.org/tracker/CVE-2020-25791  
                          rust | CVE-2020-25792   | https://security-tracker.debian.org/tracker/CVE-2020-25792  
                          rust | CVE-2020-25793   | https://security-tracker.debian.org/tracker/CVE-2020-25793  
                          rust | CVE-2020-25794   | https://security-tracker.debian.org/tracker/CVE-2020-25794  
                          rust | CVE-2020-25795   | https://security-tracker.debian.org/tracker/CVE-2020-25795  
                          rust | CVE-2020-25796   | https://security-tracker.debian.org/tracker/CVE-2020-25796  
                          shim | CVE-2014-3675    | https://security-tracker.debian.org/tracker/CVE-2014-3675   
                          shim | CVE-2014-3676    | https://security-tracker.debian.org/tracker/CVE-2014-3676   
                          shim | CVE-2014-3677    | https://security-tracker.debian.org/tracker/CVE-2014-3677   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                    subversion | CVE-2017-1000085 | https://security-tracker.debian.org/tracker/CVE-2017-1000085
                    subversion | CVE-2018-1000111 | https://security-tracker.debian.org/tracker/CVE-2018-1000111
                    subversion | CVE-2020-2111    | https://security-tracker.debian.org/tracker/CVE-2020-2111   
                     syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110   
                       systemd | CVE-2013-4327    | https://security-tracker.debian.org/tracker/CVE-2013-4327   
                       systemd | CVE-2013-4392    | https://security-tracker.debian.org/tracker/CVE-2013-4392   
                        thrift | CVE-2019-11938   | https://security-tracker.debian.org/tracker/CVE-2019-11938  
                        thrift | CVE-2019-11939   | https://security-tracker.debian.org/tracker/CVE-2019-11939  
                        thrift | CVE-2019-3552    | https://security-tracker.debian.org/tracker/CVE-2019-3552   
                        thrift | CVE-2019-3553    | https://security-tracker.debian.org/tracker/CVE-2019-3553   
                        thrift | CVE-2019-3558    | https://security-tracker.debian.org/tracker/CVE-2019-3558   
                        thrift | CVE-2019-3559    | https://security-tracker.debian.org/tracker/CVE-2019-3559   
                        thrift | CVE-2019-3564    | https://security-tracker.debian.org/tracker/CVE-2019-3564   
                        thrift | CVE-2019-3565    | https://security-tracker.debian.org/tracker/CVE-2019-3565   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                  transmission | CVE-2018-10756   | https://security-tracker.debian.org/tracker/CVE-2018-10756  
                      trousers | CVE-2019-18898   | https://security-tracker.debian.org/tracker/CVE-2019-18898  
                  vorbis-tools | CVE-2017-11331   | https://security-tracker.debian.org/tracker/CVE-2017-11331  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2020-25595   | https://security-tracker.debian.org/tracker/CVE-2020-25595  
                           xen | CVE-2020-25596   | https://security-tracker.debian.org/tracker/CVE-2020-25596  
                           xen | CVE-2020-25597   | https://security-tracker.debian.org/tracker/CVE-2020-25597  
                           xen | CVE-2020-25598   | https://security-tracker.debian.org/tracker/CVE-2020-25598  
                           xen | CVE-2020-25599   | https://security-tracker.debian.org/tracker/CVE-2020-25599  
                           xen | CVE-2020-25600   | https://security-tracker.debian.org/tracker/CVE-2020-25600  
                           xen | CVE-2020-25601   | https://security-tracker.debian.org/tracker/CVE-2020-25601  
                           xen | CVE-2020-25602   | https://security-tracker.debian.org/tracker/CVE-2020-25602  
                           xen | CVE-2020-25603   | https://security-tracker.debian.org/tracker/CVE-2020-25603  
                           xen | CVE-2020-25604   | https://security-tracker.debian.org/tracker/CVE-2020-25604  
                        xinetd | CVE-2013-4342    | https://security-tracker.debian.org/tracker/CVE-2013-4342   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  
                           zip | CVE-2018-13684   | https://security-tracker.debian.org/tracker/CVE-2018-13684  

-- 
http://autobuild.buildroot.net
