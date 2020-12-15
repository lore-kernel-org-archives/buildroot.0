From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Dec 2020 08:17:30 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-14
Message-ID: <20201215081737.9A52620394@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  2  |  0  | 20  |
  2020.08.x  |  7  |  0  |  1  |  8  |
  2020.11.x  | 13  |  4  |  1  | 18  |
    master   | 53  | 53  |  0  | 106 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 24
                   rhash-1.4.0 | 5 
              asterisk-16.14.1 | 2 
      gst1-plugins-base-1.18.2 | 2 
                 libusb-1.0.24 | 2 
             timescaledb-1.7.4 | 2 
               belle-sip-4.3.1 | 1 
                bitcoin-0.20.1 | 1 
               domoticz-2020.1 | 1 
                    git-2.29.2 | 1 
                   gvfs-1.44.1 | 1 
            libodb-mysql-2.4.0 | 1 
              libostree-2020.8 | 1 
                lmbench-3.0-a9 | 1 
                  ndisc6-1.0.4 | 1 
            qt5location-5.15.2 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                samba4-4.11.17 | 1 
                snort-2.9.16.1 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/7531cbd8db351e08cf996be7d8d2c67f0e10d30b |     
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/55405ab2c657b79286f67bc558141476fe16a446 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/3cac2f1c98c104d9bb0f3b77d0b459f2c7004ef4 |     
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4b5a4bd201bd3f0ac40dc71f95c2bf1bda553a32 | ORPH
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7ba0392a516637fc65d36ed5845cc3fc11c2e2a3 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f966eb8fb6a5a65f8919d0c485065bf968d38f30 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ae9aa906bf2af603cc3adeb43ea83858a0539b11 | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f41c548af4effc15643a5a198756741ad001f9fb | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ffc96c093cea8559e5fcc7a567fe01bbf951ddf7 | ORPH
    i686     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/6368430d569b6203ee618a5907830431b8e5abfe | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a1b49545af7e2fdc1fcfc289453f4af8cd13f7b2 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9a51a9340ce1ce6a3fbd597799288e69607d5faa | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2f98ec44ccd4a7646a30009bcaca0cf46b1ac57c | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/67770067c3402a15a2df2359e026ab6bd8cc0000 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4fdf4b0fb8f7e220561153d6206895dae95e60bb | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c574fa0b3d4cca7819976045097ccdc0ca1266a4 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/8491901a4d56e51739145b43da514d642ec1f9e8 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/478efb0aa59b05d9360fac612ebe6dcc196107cb | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b8523008f68c0243828b1ce44357d54d7924dbb5 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0fed5706d153748ed629ef9b836bfae40c7a0e97 | ORPH
    i586     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d0056b76f906415da32dbce91620755407fd25bb | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7c933d9a52e19a291f2a9e7e494789e2e6ab5cea | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/86c6da9114562e557ef00c5a832111bb66478f40 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3df010decde4e6706927ff07984ee4b97b77cc57 | ORPH
 aarch64_be  |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c34567a1f6eed959162c7f5ff25b4ee8e1155880 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7d16ad6497b1ce19080b9cfc14018909aeb2efb4 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/0208f7d50232f76ed5062f98cdb7424055b97971 | ORPH
    arm      |         bitcoin-0.20.1         | NOK | http://autobuild.buildroot.net/results/1e15374407a406142b972b142396b832af6707f5 |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/da0847b64e5ee17a540b76ffc18539b51d251481 |     
    arm      |           git-2.29.2           | NOK | http://autobuild.buildroot.net/results/d41638d1ad8e78dd6f654367c905996b838ee649 |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/91f8a78a012fb30f323d82d1d7094f28d018a768 | ORPH
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/a152a219ef8cfc8a61ff1397be90c2a4e36c5c74 | ORPH
    mips     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/6272907229dd8cdcfaa6594b5f628d59248aab54 | ORPH
    arm      |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/ba2c5ef1bb54c2751569f79beef21ff486348469 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/47618c1033917bdb85d4c593cdc64dd6aa3822f4 |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/8cd3dd1b3a3a553424c0333aa622891b94ed1001 |     
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/d8564e15542c9275477ab0652d0c123a4b19409f |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/b0501b6379d105de7c2282998bb80ee445a85533 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f7bc094af14c2e4fd21d05087f0cd8916da3ec30 | ORPH
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/21a2505f21e40355f236e0c20b69c093a9912c31 |     
    arc      |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/73f2e2f4f4b621bb0796b1e7a2516c55bab7c665 |     
microblazeel |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/0cafda586fcfb14f8dee39c592118787c3bf18a0 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/997fad9fc0acb796c0ecc66e74f34386ecc57727 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/a24b49585159aced4335d1544ced626a0eb0ce36 | ORPH
  nds32le    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/708a3fe4ad3ff95b4296e3928738f3d189404243 | ORPH
    mips     |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/4894e1994181fe3cf578c55f206d3f6b2ef932b1 | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a693290e7826ec73ea9d691775380391854af24f |     
    arc      |         samba4-4.11.17         | NOK | http://autobuild.buildroot.net/results/47e88f5d5419a4cb855e37b50ca7a4e21f21613c |     
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/7cae2ebc72972b33ade5e75a8b9625bfdff996ae |     
   s390x     |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/88712b51d397cfd20d852f4994367faf9d4c79a6 |     
    i586     |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/f17558c514b28a1d71059a034047530b628ce8be |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/c1be3c4e39e3e9c5d7d958f49ee45c019a049390 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/4efbb0f01b63a9d48c10e65bb6723117fe9a6a71 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

        qt5connectivity-5.12.8 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |     qt5connectivity-5.12.8     | NOK | http://autobuild.buildroot.net/results/a7920b928a485d7f9edd91e61f2112cdce4a313b |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/d5ef3624334e0aaae1420af5fe26856318b07f8c |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                        bustle | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/eec9957bdcf11329613f87e9794038f7452d5835 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                        bustle | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                    mpv-0.32.0 | 1 
                 xinetd-2-3-15 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |             bustle             | TIM | http://autobuild.buildroot.net/results/568e251a4d877c9ea0bd17f583319280d20a08bf |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b062b5af2fefbcba7566dfb8ef62d8a1d0d928bb | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d7acbb47dc42d49e046a8606d3cfff866d6d4d70 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/af4b15dd6534a7bd2a7957d865d8cb5f0ad62938 |     
    arc      |         xinetd-2-3-15          | NOK | http://autobuild.buildroot.net/results/c3980cc7d92ae0c0902024aa1685b518163aaba4 |     


Gitlab CI results for 2020-12-14
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/908555863  | ORPH 
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/908556305  | ORPH 
           TestLuaLuaossl |  https://gitlab.com/buildroot.org/buildroot/-/jobs/908555922  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/908556111  | ORPH 



-- 
http://autobuild.buildroot.net
