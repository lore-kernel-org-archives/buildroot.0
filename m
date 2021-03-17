From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Mar 2021 10:27:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-16
Message-ID: <20210317102727.46BC84EDBD@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  7  |  1  |  0  |  8  |
  2020.11.x  | 10  |  1  |  0  | 11  |
  2021.02.x  | 23  |  2  |  0  | 25  |
    master   | 94  | 30  |  0  | 124 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                 siproxd-0.8.3 | 3 
              syslog-ng-3.30.1 | 3 
               apcupsd-3.14.14 | 2 
                    xen-4.14.1 | 2 
                  botan-2.17.3 | 1 
                     efivar-37 | 1 
  gobject-introspection-1.64.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
              libxcrypt-4.4.18 | 1 
                 mesa3d-20.3.4 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                 pixman-0.40.0 | 1 
       python-rpi-ws281x-4.2.6 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
                       unknown | 1 
                    unscd-0.54 | 1 
               waylandpp-0.2.8 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/11eae0999c91acc9bffc902058cafbc64f93cd27 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f3bebbc2ee2b88d8b5651f9f82b2e27122f4a05a |     
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/28c952e2be85ec13b5793f95dc784bc8de1abbde | ORPH
   x86_64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/f5bdcdca3298f9b1864d5878986d03aa267d161b |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/12e3b95d9995a48f91bf2db1bcc4ac4bc29276ad | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/294b892b04c654b59a3c84572d562b4d3add8bc3 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fa5294d5f381749dd6b202e155e019d9df6c83a |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d35e0d1fb8fd89963140047fdb3dae9db3670770 |     
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ced2809e886e4d2a67c3bf8cc1f038f8c9d07a64 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2036fdbb6514c010dd53d884b9593cede383db9c |     
  nds32le    |        libxcrypt-4.4.18        | NOK | http://autobuild.buildroot.net/results/5ae235b6ec66ac86efadaa2847307be58064c167 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/7814f12778726e14271e28cf0805c78d878419ef |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/2ffc784535faba4790a1acba94dc3b9432a5193f | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/28c696e78573d2259326ec81fd49b7b3feb8bd05 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ba7c342845ca5f15a55663b6d4d67507890bc165 |     
    arm      |    python-rpi-ws281x-4.2.6     | NOK | http://autobuild.buildroot.net/results/f7ae8a2ce9bc8a24b54c937eb0b296dc1b34f328 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/34f440f708de66e49201f748bd554723fa517bc5 |     
  aarch64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/872bbdeb4cbb50265646d582f43677876871f880 |     
    arm      |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/3ba619106640a5d6facef09a05512a856207ed4a |     
    arm      |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/828448fff87772e1c34b3696284a44eb9fc692fb |     
    m68k     |         siproxd-0.8.3          | NOK | http://autobuild.buildroot.net/results/0c59373ab3778cf7b15e73968295cec8d109f7cb |     
    arc      |        syslog-ng-3.30.1        | NOK | http://autobuild.buildroot.net/results/45e517401d14e304e9c6c990f1b4ead92c850ba2 |     
microblazeel |        syslog-ng-3.30.1        | NOK | http://autobuild.buildroot.net/results/597ba6c2829823a82c583ef213a58f617bcac7d4 |     
    arm      |        syslog-ng-3.30.1        | NOK | http://autobuild.buildroot.net/results/232e355749ed69baabf47a6b141f81fbef538e90 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/44445fd75b9c15eb997f2b2fb1a0ebafb25f649c |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/5ef46251a7db89c51b8504589822fa70c32d8c93 |     
    arm      |        waylandpp-0.2.8         | NOK | http://autobuild.buildroot.net/results/175426606e29692a5c35a8c7e939f0c69a2e0cb4 |     
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/a70fe52ab99916dc9642c60502c738999894584d |     
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/3bf29032a1a3c8bf73d1d5dbc1301cb1cd0c9750 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6dcc034eaa726930a988d872bae69d59e2f56d77 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/43ebe42fd58579a18d8db7d4bb725d477da3c7ef |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                openblas-0.3.9 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/1d08af43ca7fe693a8f8d1625857a3b07c3e975b | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8d7d75cbb79c05e8f4a8745d90cdd88752b40e3a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/294cc5052d84b4a0fa65992f474b53feab848bd6 |     



-- 
http://autobuild.buildroot.net
