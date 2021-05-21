From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 May 2021 05:43:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-20
Message-ID: <20210521054402.6101E84562@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 22  |  6  |  0  | 28  |
    master   | 85  | 27  |  0  | 112 |
     next    |  2  | 22  |  0  | 24  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 4 
                  zeromq-4.3.4 | 3 
                  boost-1.75.0 | 2 
                  lvm2-2.03.12 | 2 
                 mesa3d-21.0.3 | 2 
               pipewire-0.3.26 | 2 
                   bullet-3.09 | 1 
               host-llvm-9.0.1 | 1 
         imagemagick-7.0.10-62 | 1 
               libtheora-1.1.1 | 1 
 Makefile:755: target-finalize | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
            qt5location-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/a78aeef6e416c6e78af212654519412f1deee5b1 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/91bda8d0a9eafa0e244473511007a35cd7974b91 |     
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/9db945ce0709f4116d2c1c7544322144b6e473bb |     
    arm      |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/48672b8c589df9d926b5ece2e0c9942b87f31172 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c90db777893570afa9da38231921d5ffda110723 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3284ae1d638566fc1afb56053367bb91af254335 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/36b9a0c7bf53645015af468e005815666ad8f7b1 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e1312f2b04f43e5bccc3c5654f289ddbf8f2ec94 |     
   sparc     |     imagemagick-7.0.10-62      | NOK | http://autobuild.buildroot.net/results/900df43bd418d2da0c3ec875db1c5564dd857e94 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/52282fc4999cfd3f9571910455ddb131f99f1c2d | ORPH
    mips     |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/f470ffb55625e2639cecde713442550eb532d0d7 | ORPH
  riscv64    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/57ba012a40ec086fa4e784342d527cf26024e8a4 | ORPH
  aarch64    | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/8624c1e0266822ed39aa93d449988515d9880613 |     
   xtensa    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/d4ec1d6439e8336888696ca2d7aa4fa94b67fb80 |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/11ecaf13d381e4c45407ba5f32b6741cc052c65d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a830b1fa90b93732e218442341935fa6b9e43fc0 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/fce2a5abb7a190ee22b110f0c222336e0704a988 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/da38a1522477d2c958f9d5cb39ffbeaf23d4d4ed | ORPH
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/5b15a231e4dbac2b64baa787798b6588f0eab2af |     
microblazeel |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/442a5dcee57ab20c95ab5d1e7381234ed76d0837 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cadee4f5b3ab755f51b2f69396f72dc79d29ae85 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6271693abd962fa35ed8217a4272a7f9fe6cd1a2 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/2a61fab9b5250bcb42bd1224f141831798d1e78a |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/4a7b7725e6d92d7f20256b95d7e449dafc30965b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/17e9348d4ee24dbc98b467e45facfa73647d1d08 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0acbe07a5c4d7a4ed2935e62666504a72b727c31 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3636a2e666ffdb89507fd4c947fa10b9876ba756 |     


Classification of failures by reason for next
---------------------------------------------

             libopenssl-1.1.1k | 9 
                 freerdp-2.3.1 | 4 
                       unknown | 3 
               aircrack-ng-1.6 | 1 
                  botan-2.17.3 | 1 
             host-flatcc-0.6.0 | 1 
                   netsnmp-5.9 | 1 
                qt5base-5.15.2 | 1 
                    vtun-3.0.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/629ca344e16a1592d45e9b404da769ef0a7a3088 |     
  powerpc    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/0e6c03daab244b285775db39efbce516cfe43a96 | ORPH
  aarch64    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/92148d5d9ff7c6a7b59f5b8da6c22eec6bd2a926 |     
  riscv32    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/32b37d659aee13f613c3aefb394e2e19cbd39fe8 |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/4cfe78f2f2caf531eb86c7ac370d7cd3dc6e673e |     
  powerpc    |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/a2a1324a324f8950bf5b491ef5339b0f675d52cd |     
microblazeel |       host-flatcc-0.6.0        | NOK | http://autobuild.buildroot.net/results/66a80ba1ce9ccba754d46dda89447eceba84c04a |     
    arm      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/4451dc52f2d44ce60a84581ed3aec18cf2f86ae6 |     
   mipsel    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/6d7eebdc5a4e0611a7a7af25f206ac2c48ba3ca4 |     
  aarch64    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/441a235504e8a074573a09ab8a79c5953103e379 |     
    i586     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/5d3a7f1eaa5d19a0b2db7277cc93c64d6798ffab |     
    i686     |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/c85b2a52858e806afe5f301dc872ef2ddfc735a9 |     
    arc      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/97b00980f95474ce8becd2ee79b3804da3c5ddfd |     
    arc      |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/b9384328fac59e36d604273338e9d72bcadb4550 |     
   mipsel    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/36bae29d61608adc2d990f4f87ac1121b6c549de |     
  powerpc    |       libopenssl-1.1.1k        | NOK | http://autobuild.buildroot.net/results/4f2cca5255d9ec9f489f4207424307a498574e3d |     
    arm      |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/114347efc7d3b5cb3285b87dab408dd83bedef5a | ORPH
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/777a4aa2ec88d052c6aa7058590ec534207116bd |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/27f7f2a59a638687e85cb06ccbf0bea34c06a16e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/aa35069133cbc26398e869da785f40c560cd25a3 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7ad77c81154f0b5b0e1e2488b584479b569de843 |     
  mips64el   |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/d3fff0ecfe57acc407ddba70493697c997b36c3b | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 2 
        host-sentry-cli-1.57.0 | 1 
                mono-6.12.0.90 | 1 
                 pixman-0.40.0 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/39ec5372ff16cf9ac23963b4559743c88bda16bd |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/7c42e0e68238ab32337d630cce5177f0fb6fbde5 | ORPH
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f84e367c9e924599f566f01c9615cc507dcc89dc | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4024d43ee5b0ab8578a63f51148749bfb044d9d1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3d37eca602b641945b49c0992b1332e62014fde0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/bc2583e71037a1a2e6c6f744e6a9e3b9aaba7377 |     


Gitlab CI results for 2021-05-20
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431606  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431687  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431689  | ORPH 
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431692  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431694  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431736  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431739  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431832  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431838  | ORPH 
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431839  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431840  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431841  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1278431858  |      



-- 
http://autobuild.buildroot.net
