From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Mar 2021 10:27:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-22
Message-ID: <20210323102802.1F34A40374@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  8  |  2  |  0  | 10  |
  2020.11.x  |  2  |  1  |  0  |  3  |
  2021.02.x  | 10  |  1  |  0  | 11  |
    master   | 46  | 17  |  1  | 64  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                 python3-3.9.2 | 2 
                       unknown | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-20.3.4 | 1 
                       mongodb | 1 
                  ndisc6-1.0.4 | 1 
            quickjs-2020-11-08 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/395dcfaaa97c91b07a5f631be0506596f9f6486d |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/83d5815fc2da2bf938be960f1861fd2f16420326 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/024e41b3c3d92a6110aff31de136ecbdc41d3508 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/316cf3cdae035f8f35f665f04db4644a08aadc44 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f7a3cabb83393c245e59538696ade584d730ba5f |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cf6c2b363604fb704ba43cfb5a18b63df8a3be9 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/870fa3c19407f0013bda4569d3ea69fdc9b2f931 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c2ac6cef4b86d69b062683915744e9663c613e3 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d05a5db2835f693aa4415f39cc8d02e8d43b6af |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/49fd294a473377a7f7686b87ecd7ac525cc902e9 |     
  riscv32    |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/6f2bde7a047b85c0da67f15f0413d8df49e52cf1 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/9c1da2cdc2e6910ce216bce51deb1ec814c3f67f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7b68af75f68b0e577c0a469d9ea22861515f85b8 | ORPH
    arm      |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/3d89b659feb107387055ce47e7cabd86968c33af |     
  powerpc    |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/03707d53ad1f99a4198f3b8313cb07dcd10c21dc |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/172c27c6036881678f37bbca0b1d7c651a78eb6a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/6591d87357f1392f3905024b14b76aa6e7c77878 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1796c6bfdeae1aceafdc84f9957deb8ac04eb6d4 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
sconeserver-6b932d7d8dbb700... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9e4908b59a803b42816f5a00f39c0225a4474941 | ORPH
  sparc64    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/7ab563c19240151fd77a88d108437ffecd517ba8 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

              micropython-1.13 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/101e1ec20d8c479aad96cec6333d835aed2efaea |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 mesa3d-20.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/80e9e7c95592059563c105ee7a54e9fdf6d5cbca |     


Gitlab CI results for 2021-03-22
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323521  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323524  | ORPH 
       TestInitSystemNone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323506  | ORPH 
...InitSystemOpenrcRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323507  | ORPH 
...InitSystemOpenrcRwFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323508  | ORPH 
...nitSystemSystemdRoFull | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323509  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323490  | ORPH 
...0Grub2ExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323491  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323494  | ORPH 
...slinuxExternalCompress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323495  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323496  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323497  | ORPH 
             TestLuaLzlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323568  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323565  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323567  | ORPH 
        TestOpenSshuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323575  | ORPH 
  TestSELinuxExtraModules | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323472  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323473  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323516  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1116323517  | ORPH 



-- 
http://autobuild.buildroot.net
