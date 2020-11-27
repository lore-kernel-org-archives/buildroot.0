From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Nov 2020 08:10:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-26
Message-ID: <20201127081055.C99CA87BEB@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  0  |  0  | 10  |
  2020.08.x  |  8  |  1  |  1  | 10  |
    master   | 93  | 22  |  0  | 115 |
     next    | 16  | 19  |  0  | 35  |

Classification of failures by reason for master
-----------------------------------------------

               belle-sip-4.3.1 | 2 
                  boost-1.74.0 | 2 
        host-sentry-cli-1.57.0 | 2 
                rocksdb-6.10.1 | 2 
              asterisk-16.14.1 | 1 
                 dc3dd-7.2.641 | 1 
                   gvfs-1.44.1 | 1 
             kismet-2020-09-R4 | 1 
              libostree-2020.6 | 1 
                 mesa3d-20.2.2 | 1 
         multipath-tools-0.8.4 | 1 
                openblas-0.3.9 | 1 
                opencv3-3.4.12 | 1 
                    rpm-4.16.0 | 1 
       shadowsocks-libev-3.3.4 | 1 
                  uhd-3.15.0.0 | 1 
          wolfssl-4.5.0-stable | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/aed2e217b77680fc0c7c84d424995cc5663a73d5 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/e5aeb122737f8fe9c214a0d521170be51a86385f |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/536efa62950603af9acf94ac8a4ed953847e4ba4 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/6f63c1690c389034226f6010d6e585659ea1f2e0 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/ff1986b98bf6cfe62b3f6a4d8e2fd7db4e5a30b1 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7ebdd55c09a56a6f6ab54eb2ae1ecff3ad824a8d | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/5164958a71d9306388275f50c871b36973599fc1 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2838197a9a19901da43ec4f5af416a1b1ec8c28d |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5b2ccea24208efde2a3d670cdf641ddf1aa28ca2 |     
  riscv64    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/b4d428a373c3991d29080a31c5015d4936eece1b | ORPH
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/9298ff56bca16effed62ae14768abe41fb128b69 |     
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/0a69978d975237e97ba021304956804fad1ee12e |     
 aarch64_be  |     multipath-tools-0.8.4      | NOK | http://autobuild.buildroot.net/results/6f019751f53b933a7fdee5d1ab6d0bb9dfaa3eb6 |     
  aarch64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/9bb01680bd2cb4c90058dcb7c9b93b665082b3ab | ORPH
    arm      |         opencv3-3.4.12         | NOK | http://autobuild.buildroot.net/results/9490f50d47d6ac04495e721741f7f6e260d73fb6 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/04912bbc5ef5630b7aa977c9adc0825d4512f3e8 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/1086161f0d155858466e01ad642aeefbf5c55f92 |     
  mips64el   |           rpm-4.16.0           | NOK | http://autobuild.buildroot.net/results/5044e0d34d3c6a7e96597f5ac1e107c1a0d1d5e9 |     
    arm      |    shadowsocks-libev-3.3.4     | NOK | http://autobuild.buildroot.net/results/45b92e0e1703c08ab5db5f9f0e8c3cfa3745c29c |     
  riscv64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/a38e3f504dc0b57c8f2dea99a1fe4c54fa86047b |     
    arm      |      wolfssl-4.5.0-stable      | NOK | http://autobuild.buildroot.net/results/9b8ef8772c93bfc42a0ddf8b6631da9da4882c05 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/939ec601718cee6b5935d46cbb1243e4f3dddf55 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                        bustle | 1 
                    php-7.4.12 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |             bustle             | TIM | http://autobuild.buildroot.net/results/b2549a9b39a7488db2047278c9dda1d53a5c1dd7 |     
  mips64el   |           php-7.4.12           | NOK | http://autobuild.buildroot.net/results/0981dc0e2e55b0cf02dea45c705a0137d2422280 | ORPH


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 5 
            resiprocate-1.12.0 | 3 
                   rhash-1.4.0 | 3 
              asterisk-16.14.1 | 1 
                 dmalloc-5.5.2 | 1 
        host-sentry-cli-1.57.0 | 1 
package/bind/bind.mk:129: b... | 1 
           python-pybind-2.6.0 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/c52e9381e8adfc6341ad8445fb190b6ce73d1d9f |     
   mipsel    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a6782a7031e467aaf9eb5844c04ac66e3c4c9e07 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/278539fbb74cdd7e2833349a2bb049ef7180ae87 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4110104a48c40e9c3bc4b7622ad2aa01ebd24ff8 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e3d175dbd562e5b231d8a760e86e5e9358a82cc6 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2d392f675b041342814881716163b7e099eff78b | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/58b444884f86d3f56ba2d5f1d2472563bb980e73 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/468628b862b1a1582c62def333c7385d5a13a344 |     
  powerpc    | package/bind/bind.mk:129: b... | NOK | http://autobuild.buildroot.net/results/7b0b2287717084210d322574d1b29df206e80e1b |     
  riscv64    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/0b0921d4a796e0e8aca0842ba90cec406d0b6a0f |     
  riscv64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/bfad2c2c7d1679f38cf179bea2995a876645fb9e |     
   xtensa    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/f0af5aa06d4ae0b1bedf4e6d1bfd4512eb8670f0 |     
  mips64el   |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/a48a4f5dd1f19869374c520ff5e9ac9efb322dd7 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/f527048372321246994bc94d82b127cfd216503a | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/d32ee42738559b0f8960fdb85db3e7ee17a9c9e9 | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/1f0523856fa14be0bb40e9642771627509f749a5 | ORPH
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a47dd90a34d4c68efabdeb550af54d0e4f75842d |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/304837116031b93646213885c7a7575c0093f38f |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/54a57c2f05b0e2525f1f98a64ff095e56cd61760 |     



-- 
http://autobuild.buildroot.net
