From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 09 Jan 2021 08:19:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-08
Message-ID: <20210109081913.3341E203CE@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 27  |  6  |  0  | 33  |
  2020.11.x  | 16  |  8  |  0  | 24  |
    master   | 118 | 53  |  1  | 172 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 9 
             timescaledb-1.7.4 | 7 
                    qemu-5.2.0 | 6 
        host-sentry-cli-1.57.0 | 5 
                       unknown | 4 
                mono-6.12.0.90 | 2 
                    olsr-0.9.8 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
                 dc3dd-7.2.641 | 1 
               domoticz-2020.1 | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.15.6 | 1 
            host-libusb-1.0.24 | 1 
                     host-mono | 1 
                   httping-2.5 | 1 
                 mesa3d-20.3.2 | 1 
                    mpv-0.32.0 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/438f979de65b6f01b159ed0fbfac0ef2f0223fdb |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/db4642ecaa209d153d45b28b0e77a5cd14b59d26 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dd1a3fbb66eae92681f2c2aa2cf9c2737264fa35 | ORPH
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/d996f77ed0721b961e95b2fc664cfdb854e502b2 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/635988559a9942ec53029a1807998a1df28d9eef |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d3f016659b3b8b12eff6b842a067ca2f53b27084 | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/b42fcdde6bcea1d3f826c7715eb507e5cc3d8abd | ORPH
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/692d5b38e3755aeb679695ea935b9b40916d0030 |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/8af58965332b7bd2c74fefdaeb88ad288647b504 |     
    i586     |           host-mono            | TIM | http://autobuild.buildroot.net/results/7a50073fa2ddd88b7badab909f31ffaeb3b95158 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed254e66233662c64567fb7785466e410387a2d3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3a9b53b0fb1315894259ada9996301066acba1e |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0e239d288863323a527729692a535a8954e7476f |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/96b449e50b6c7ca27ad49feaad39849e0adf7b42 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6fa3a3a4cf22cab139f3b3b32ede2ca6ad83c104 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/416816abb9be8da3f93608801d5eb968e7f96249 |     
    arm      |         mesa3d-20.3.2          | NOK | http://autobuild.buildroot.net/results/aef9fb242906920a987b628446c9e4f1c1997f8b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/84eeda4b9c92d567e1d93fd79689ea202a417b67 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/8a98f77d6df229ea25a62d73e32da48cfb44421a |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/81afebf589306a7ce26588fa378d01c67f057b86 |     
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ce39f6a549f907bae45667af827faf763205ceef | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e7573e3ec6ea78ee2d56fb9ca8de2a5ddb3c1e7f | ORPH
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/457aaaa36d47a1aa89ab8b574b920bbddde6fc08 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/1a7521884a84670fdaad06b53e7364f5feece7db |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/42321e1517042cbc2829f5a994482cc938852f1b |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/85e53405e8a11eaa2596d712704614938e0c6d89 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/37644b3257b60d36eb66741e00049ee08534d81c |     
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/bea44adb1194db29c98181e70bb12d1a6c51607a |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/3f7438d8af602b79bfec988cb5ea4f9d4c50bc43 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/be483cb87053fae9be8126eba7ec18f239f61156 |     
   x86_64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/f7bbc62bd10e3b99f51587b7bb43d8afcc7d5d68 |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/673b6d015a187eaa9cc1d8b90d81e59a471907a0 |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/52d89e8204fa2227944f0b8aacd3cb879875b7f1 |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/6dcce15cc5f3dc24ad2714f8d80f499151a68792 |     
   x86_64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/7bc184e42319dd0bf4b4c2bbca74a8fc42cc03ac |     
    arm      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/4c36bd1e59887c7df2a6ae059c45b9eebee6266a |     
  powerpc    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/915c34f68ea1ec9ab0b229e9f2a1aa432a303e73 |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/f009f91c81c18a30446aea3c9ce184a2d9fe1ca2 |     
    arm      |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/05b6230b4907d8cbeab0523a40f1416d5c87d765 |     
   x86_64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/4d6b4972f4a61a495f6736bec2468fa269d9968b |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8fc191ed0fc1aec2136ba364e5fb2deb5bb1c388 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7ec3c5cf93c40369e98fd860438016e46dd1bc95 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8f13f29d922aba6d2246f695254e09a782943d9a |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f4bd6f8b3c9c11093e78e72a3103bede94172712 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/b962ccc356c53a63d95b86167b906e06919642d5 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/79ab95a61ac59e5cb9ce7241d6d976570cf61f98 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/6e27060a47b1b009429516af1a5854a2ffac8f23 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/dd1361ebf1723966d5d1cd10c8dddd963724f158 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/7bcecb5cf69596f1913837419570aa992c775109 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3c9a8f5b8dee6770d1a4993e6ac7283014cd081e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5b49a1e678c444ba35702e60f8f2d605998ca7ce |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/9fa91e0c0196e9cf6520ab5cd82bd167439f461e |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f6be7c3b27c6ed01b6e5c5096be747ef74562531 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/3c0c57e8a62070f8583bbec51587feff029abd7d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               acpica-20191018 | 1 
                  cairo-1.16.0 | 1 
             libopenssl-1.1.1i | 1 
   openvmtools-10.3.5-10430147 | 1 
                      tio-1.32 | 1 
                 uclibc-1.0.32 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/977135fc4c692fb57d802983dcd29dae43314385 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/1e71f4dda4aebc4167e8014481269cc1036a2f4f |     
    m68k     |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9aaaf71dcfa1ea4b8212b0d167311e9f7d60a44f |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/891ca6405698a48e085c6a82a916bdd898afd11c |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/2ce6de5edd34ed84ee79cd6a4fc6e91140cf1ed0 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/192154a3c4b704e5a60e448d7ebc8c832d09506c |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 uclibc-1.0.36 | 3 
                clamav-0.103.0 | 1 
       docker-containerd-1.4.3 | 1 
              micropython-1.13 | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.10.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/a5f5e30d7f6aa72295448a61857dbeab1e995a90 |     
   x86_64    |    docker-containerd-1.4.3     | NOK | http://autobuild.buildroot.net/results/b2a54f050eb10fb2034d71dd97ed8f3bfd75dadc |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/93fd4dd010900eaccf1e91673732e14b5cae26df |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d3e482da3e7fe8ebecb8310c6ba83127813f8b44 |     
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/a8e4bc5029b0e1573e0aaf021949423a010bb0f3 |     
   xtensa    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/1f46ecd479fa05c5925f3da2f7aaad5c10a87a96 |     
    arm      |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/1becefa22e060d5953a46f01589307d25efdf5e3 |     
   xtensa    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/c3ce82782a6df49c6f63e982ad8dffd6572e2a89 |     


Gitlab CI results for 2021-01-08
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622474  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622546  |      
                   qemu_m68k_q800 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622548  |      
            qemu_microblazebe_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622550  |      
            qemu_microblazeel_mmu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622552  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622553  |      
            qemu_mips32r2el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622554  |      
              qemu_mips32r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622555  |      
            qemu_mips32r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622556  |      
                qemu_mips64_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622557  |      
              qemu_mips64el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622558  |      
              qemu_mips64r6_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622561  |      
            qemu_mips64r6el_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622563  |      
                 qemu_nios2_10m50 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622565  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622566  |      
                 qemu_ppc64_e5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622568  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622569  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622570  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622571  |      
                   qemu_ppc_mac99 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622572  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622573  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622574  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622575  |      
                qemu_riscv64_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622576  |      
                       qemu_s390x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622577  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622579  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622580  |      
               qemu_sparc64_sun4u |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622581  |      
                  qemu_sparc_ss10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622582  |      
                         qemu_x86 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622584  |      
                      qemu_x86_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622583  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622585  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622586  |      
                      raspberrypi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622595  |      
                     raspberrypi0 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622587  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622588  |      
                     raspberrypi2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622589  |      
                     raspberrypi3 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622591  |      
                  raspberrypi3_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622590  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622592  |      
                     raspberrypi4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622594  |      
                  raspberrypi4_64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622593  |      
                        riotboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622596  |      
                    roc_pc_rk3399 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622597  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622598  |      
                        rock_pi_4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622599  |      
                      rock_pi_n10 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622600  |      
                       rock_pi_n8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622601  |      
                        rockpro64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622602  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622603  |      
                 s6lx9_microboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622604  |      
                       sheevaplug |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622605  |      
                 snps_aarch64_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622606  |      
               snps_arc700_axs101 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622607  |      
              snps_archs38_axs103 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622608  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622609  |      
                snps_archs38_hsdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622610  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622611  |      
                socrates_cyclone5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622612  |      
                solidrun_clearfog |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622613  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622614  |      
            solidrun_macchiatobin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622615  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622616  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622617  |      
                  stm32mp157a_dk1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622618  |      
                  stm32mp157c_dk2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622619  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622620  |      
                           ts4900 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622621  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622622  |      
                           ts7680 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622623  |      
                        wandboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622624  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622625  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622626  |      
                    zynq_microzed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622627  |      
                      zynq_qmtech |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622628  |      
                       zynq_zc706 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622629  |      
                         zynq_zed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622630  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/948622631  |      



-- 
http://autobuild.buildroot.net
