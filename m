From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Dec 2019 07:17:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-28
Message-ID: <20191229071802.7EEDA203F6@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 11  |  2  |  0  | 13  |
  2019.11.x  | 10  |  1  |  0  | 11  |
    master   | 122 | 43  |  0  | 165 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-grpc-1.25.0 | 3 
                   mimic-1.1.0 | 3 
                    mpv-0.29.1 | 3 
                apr-util-1.6.1 | 2 
                  gmpc-11.8.16 | 2 
              iputils-20190709 | 2 
               libupnpp-0.17.2 | 2 
                 mesa3d-19.2.7 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
           uboot-tools-2019.10 | 2 
                       unknown | 2 
                 xvisor-0.2.11 | 2 
       alsamixergui-0.9.0rc2-1 | 1 
                bitcoin-0.16.3 | 1 
                  flashrom-1.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
                host-go-1.13.5 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
              jpeg-turbo-2.0.3 | 1 
                libgdiplus-5.6 | 1 
                   libnss-3.48 | 1 
                oprofile-1.3.0 | 1 
            python-cffi-1.13.1 | 1 
                qt5base-5.12.5 | 1 
                 ripgrep-0.8.1 | 1 
                 systemd-244.1 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/1d542729ad2b1d33773d05920836dd827958546e | ORPH
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/e170ba9842998ab7bbdacf8f4fed8c2a470453f3 |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/0fae5e101a27f203738246a9fb940e5ed4697238 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/1035aa318dde1dccbfe85ebedd98d0f4c1808b6d |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/c02d1f3b4fc941f815070754d10c423f2c5b11ac |     
   xtensa    |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/4acce24f0389dc80989f67ebb9d8d20df4d12c2f | ORPH
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/5ccad9ef8d9069bdae4bb50f0c13673afd893c4c | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ff29a5e5e9e5e3f6bbb0ffcc2c5bbb82d68c449a |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/b25b3aff79196bd4f8808d05fb0407e4fd8887fa |     
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/db1b2d8240e75bf12e1fbefe48f127ce7c7799de |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6437ae5d9ec31e7ed8f3b45289dbb98107d95360 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9abc2f1a4827b67061e76afb7ad86afa52fc560b |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/afb5e1acba94ee1d7d1dc99c6a58748abeb8ab2b |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/db63622a3c1bac641892487a1803c509e3e73fa1 |     
    arm      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/82d4738711a009959436fa419bd78c7a9540d33e |     
    arc      |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/c3694659496570ffe137472cdbd94915df9f141a |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/ba6b4f5dcaf9e4a4e15e72e64b49ccf25bcf09bc |     
  riscv64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/23fa779bd590038a978f6a8f3fd9c3685b447895 |     
powerpc64le  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/55c6053af50ed343604ca47d9ded3896a9cd00cb |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/689ae2809b233b8667a94d7614901c35167a0598 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/65d3920a18792401391abfea24c6b3735d4eb2a9 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/599dc3478ed65d36fbf9f5e9625691dfa813b530 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/4ffb27e313780a06a1e133e89aca8b434e29c44e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d7ba199d8cf499c54df6c393012218fd1426ea1c |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/c5f08dd9f06a71d17500c3fedacd2213f904fec1 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4f75ab036cde5219e695be3571d173a6b6ebdd1d |     
  mips64el   | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/607922226662106becc6e1402fbf57acf169c5f6 |     
  riscv64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/22ed4c6b785fde828f36f20c88fdaee70e1a940c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/fd8c2b912f6d353a0f02ee37a0d48e4255189c52 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a0cdebeb2913662b72fc2cfa68fb2c4ba26b6ac8 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/509292387443224b5a7b062442ad62c1c6690e8b |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/32e705a93f23cc91113e5d6f1f74d2d03877092e |     
  sparc64    |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/4e45bc660b389ae32aac8303420364332c09e3ba |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/a2a7ebe6e754de9322c4ac44d0536025928dfcec |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/b1dad7932d65a22abcb6fa0807ac2d29f0856332 |     
    mips     |         systemd-244.1          | NOK | http://autobuild.buildroot.net/results/7637f39f33c85da87573213716a2955f98330656 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/54e7f66330ee42527afe202bf84bf0b189b4f913 | ORPH
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/26d48ac0705c186795336a0d470a643499fec84a |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/42af9226466dce46bde18da0f9a94b6446678797 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/fed8257945125a47a60d216851f8a1a5c4090a39 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e58ff0a949633ad822e679c285b376cdb9646053 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/ae41a7ef2d4a5f27e05a4ba84e337f5ed47cb6d6 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/5032e69df2383453a19ce33356f1b1ca7e02785d |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/bed698daf86c9e522c6f4d93f604a738237fbce6 |     
microblazeel |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/66430ccf371332d0344323e985bfd0c9a62225d3 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/fe68b805b424e7ca749161bc9b0cfd10870b8166 |     



-- 
http://autobuild.buildroot.net
