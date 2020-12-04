From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 04 Dec 2020 08:14:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-03
Message-ID: <20201204081427.C2CFC87C0E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  2  |  0  | 14  |
  2020.08.x  | 14  |  0  |  0  | 14  |
  2020.11.x  |  0  |  1  |  0  |  1  |
    master   | 85  | 27  |  1  | 113 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 9 
        host-sentry-cli-1.57.0 | 3 
                       unknown | 3 
                xenomai-3.0.10 | 2 
                  boost-1.74.0 | 1 
                        bustle | 1 
         conntrack-tools-1.4.6 | 1 
                lmbench-3.0-a9 | 1 
                 mesa3d-20.2.2 | 1 
                   rhash-1.4.0 | 1 
                rocksdb-6.10.1 | 1 
                rocksdb-6.13.3 | 1 
                    ruby-2.7.2 | 1 
         s6-linux-init-1.0.3.1 | 1 
              xapp_xload-1.1.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/246ff58edece5d08a6c25236c4e800f6199dc8dd | ORPH
   nios2     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/da5bf837bdc8f82b0dca08de38a5bccd26737f13 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b2ebe0bdd460a31f0a0c530ac2b40dc4d28657e9 | ORPH
   xtensa    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/afee302955c9dc1a59e23b4c00e7b0efe6a1b7ed | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b00fd401e089ef12a543ca3a35fb81ff1d9a3c95 | ORPH
microblazeel |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ee0c65bc64dc76ab9bb23d143a82c2fac8b15ef8 | ORPH
    mips     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b725f59e2e56a101424b20b7edb7e0d9d7a7d2a2 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/858034f6399d266d496fae8bda93ca4333fc44fa | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f1b285579621de0796e4ec0e0a4bf33f6715a2f6 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/318dd5fffa3b88f2fdf41b26cb582f4038603861 |     
   mipsel    |             bustle             | TIM | http://autobuild.buildroot.net/results/dc58c2ce0fd74872c995f34d5ec09b3fb4c735a6 |     
    arc      |     conntrack-tools-1.4.6      | NOK | http://autobuild.buildroot.net/results/509f34685f23bea36d00a2134f5ae83e6e84f692 | ORPH
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3c8a002d9864de71d6665d5e7c4441ce6ab36f2f |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/30c5c4b85c417fc78437e0da1345eaf1136bc059 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c932269149f7c9b6a5140df19b05bdb5972a1613 |     
    arc      |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/59698711d9932b08a870e96a0c2a9ce0e8bb9bbe | ORPH
    arm      |         mesa3d-20.2.2          | NOK | http://autobuild.buildroot.net/results/3d032a96ac6fc55201576ba00ff2b49cf5eef630 |     
 powerpc64   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/8605c16cc28316954ce8b9dcc266974390c5da20 | ORPH
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/684cd70f3753b1d408a2b9f0df64f8e7b2eb2ab6 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/77bc98d15e57e2bf6088933f316b0c371cfab538 |     
    arm      |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/f204583c8f7b7ca285da81720812a4f287361397 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/d77d388ece6d186ab915fe88d2a9bd300928508a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/92a8297a5a72184e16e7108b21ac3c8c624268be |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e4169a5a199c26057f97e6c3131f7170f89fede4 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0e0a61d005722de7bbab2afdd48602599c95c596 |     
    arc      |        xapp_xload-1.1.3        | NOK | http://autobuild.buildroot.net/results/2ad27875ce5c16a111d54d452eb395257e9b5e2b |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/11fbb6b1ca498d4f3dc33ba48dfe6280e4bf9087 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a354aea7739c48a426602277a0b1b0f172b2653a |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/69c867b0e817bfa34a23cccd4fa84fc76e2cfe2e |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/02b31b83794de7511814a16e0ecf68dfc846c36a |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                    mpv-0.32.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/23e0418a5f3a85051f483ce47c010f5e09896c95 |     


Gitlab CI results for 2020-12-03
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567645  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567647  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567648  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567651  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567652  |      
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567655  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567656  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567760  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/887567804  |      



-- 
http://autobuild.buildroot.net
