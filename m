From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 10:20:04 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-15
Message-ID: <20210316102009.4F1FF6062C@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  9  |  2  |  0  | 11  |
  2020.11.x  |  6  |  2  |  0  |  8  |
  2021.02.x  | 20  |  3  |  0  | 23  |
    master   | 59  | 32  |  0  | 91  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
  gobject-introspection-1.64.1 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                  monkey-1.6.9 | 2 
                proftpd-1.3.6e | 2 
                      tio-1.32 | 2 
                 dc3dd-7.2.641 | 1 
          fuse-overlayfs-1.4.0 | 1 
                libkcapi-1.1.5 | 1 
               libtheora-1.1.1 | 1 
            lttng-tools-2.12.3 | 1 
                 mesa3d-20.3.4 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
           python-pybind-2.6.1 | 1 
            qt5location-5.15.2 | 1 
          sane-backends-1.0.32 | 1 
              syslog-ng-3.30.1 | 1 
                       unknown | 1 
                xenomai-3.0.10 | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/29bdce0417e2eb2ec397ecbdf60f7074e39f258c | ORPH
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/df97dac307cbaf01af126bdac4769bc35a98de12 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/757a9402ccbfe4d024bb566005d7a92d2b4d82d6 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6f128ba3d1f2718b9edc451a4cc9d3a5fcbe87ff | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9274090c6fa98110cb1daec8159b38b1db01e0ad |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a4e7346ef1987c105bca6d327c7c922661ae3c05 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9e237307a34368ec770303ad2686c34cdbac18c0 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3953975bebf3ead31eed939dc19288db7def09da |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2b28bfdb8409413f1ebae7a2ea01f5c14595e75f |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e996fb0a301d2fd2beb3ddb93e7c1a33e3688f0c |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c4b551f712d783f9eee4e51dde30906f04d95c4e |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/57b51c1707cd52b938f5a977950b412802c0ee3d |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d236311b7a53f188f6af28d7bb985d9591fc08e2 |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/25385d40eded0bd95c86f7c63759c02e74f7a110 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/75774bd8b0bba4d194ebe040bdeba9a944539ff3 | ORPH
  riscv64    |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/1fc15da6c3aaadade2574bd7d1d4980f474b55f5 |     
  riscv32    |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/842a67fcce239a3a4a0b32b884a878c90f1c0455 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/18074f7267f465b406733dfb30e87f53bc67e112 | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/27757adbff96be9d19372cd7e9085720ba5cb978 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ae81e1fd89b17e2b61638ea3346ba7d9332f8f02 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b4ef94377cea5e34ab8e7cc3ce0a9655024a57d1 |     
    arm      |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/c4a34115dc088b8504df3b59ff885d0f690b4736 |     
  aarch64    |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/d6ce64245c2724cbd94583490bf009c188182b1b |     
microblazeel |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a0bba92eee4124413c1fb2e48c93d37f9ce71ecf |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ab90514ce106f54565e55a30d0407398827c482a |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/2a6680da494678c33a92b3f7e52092fb8f3c5596 |     
    arc      |        syslog-ng-3.30.1        | NOK | http://autobuild.buildroot.net/results/25218f49f47c8f670e95497a35c0923a7ee4a776 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/315a1fde35df17d9b9e485845e1d0096a73b10ef |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1e6bc801cbbed1b824c76fabaf6b0e51bba962d0 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f3d55814ea9769876c841d763267fdbf16dbf59e |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/533de7ab8860fe7537101057f2edeb1bd19e8622 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/3a9b09e503a261ac537bd620f03d4d7661cb5a00 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                upmpdcli-1.4.6 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/31ffb6d955ea022bc8f7517812c42f4d74245962 |     
    arm      |         upmpdcli-1.4.6         | NOK | http://autobuild.buildroot.net/results/358b92eddb203a286e9f023236d8592cc8ad7fa3 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              asterisk-16.14.1 | 1 
                 gerbera-1.6.4 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/7aa2262cb6e534857f6a200cc590dee394c40365 |     
    arm      |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/4f0aebf24a26529b3822f77a5236724719dceb24 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
                  gensio-2.2.3 | 1 
open2300-f21982e0b1f8321561... | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/808ea1005f0e84b6a03540175d1afdf0487c42f3 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/6fa6393db6a75574cc109e8147e1519387a4acf0 |     
    arc      | open2300-f21982e0b1f8321561... | NOK | http://autobuild.buildroot.net/results/cd1f6c3b42e107802af39e0adf67252ae60303ad | ORPH


Gitlab CI results for 2021-03-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
              TestGlxinfo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1097748912  | ORPH 
...ystemSystemdRoNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1097748893  | ORPH 
...nitSystemSystemdRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1097748894  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1097748899  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1097748924  | ORPH 



-- 
http://autobuild.buildroot.net
