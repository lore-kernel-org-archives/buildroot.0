From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Mar 2021 10:21:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-26
Message-ID: <20210327102105.159FE400C7@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  2  |  0  | 12  |
  2020.11.x  | 15  |  1  |  0  | 16  |
  2021.02.x  | 32  |  3  |  0  | 35  |
    master   | 138 | 49  |  0  | 187 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 10
                  zeromq-4.3.4 | 4 
                  monkey-1.6.9 | 3 
                    mpd-0.22.3 | 3 
                rocksdb-6.13.3 | 3 
  gobject-introspection-1.64.1 | 2 
libplatform-a7cd0d5780ed80a... | 2 
              netopeer2-1.1.53 | 2 
                 pixman-0.40.0 | 2 
           python-pybind-2.6.1 | 2 
sdl_mixer-d1725fcb7c4e987ae... | 2 
                  boost-1.75.0 | 1 
                   gvfs-1.44.1 | 1 
                   httping-2.5 | 1 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
                 pcmanfm-1.3.2 | 1 
          python-dialog3-3.5.1 | 1 
                 python3-3.9.2 | 1 
            qt5location-5.15.2 | 1 
                   strace-5.11 | 1 
                      tio-1.32 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                    vlc-3.0.12 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/53fd8f07a4aeae0c180b975528b6e22496719dcb |     
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9fd1266d5537e12fad197697245b1b2c09a157ec | ORPH
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/db9a9f2b3e7c5e4e9d4554b5e85ded754ed0d241 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/6a561134375bd2a456bbb6f32132c5d25f8a8226 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0b845d63a901f43631b1fa9770d8e4f12bce7e50 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f3d3b80e6c019c94c65333bd0b87deb33201cb55 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9c4780f2c18f2cf79f2fb18f162fcdc1e475b5d7 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/89f922eef47b30789ef5d1d076491f2682ba3d7b |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/20db763518688e68d9f49963eb96cfe74afe72b1 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/69be823d63e267c728b9d6b1c35aee44ae3d7c4f |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a9f0b29f7a77caa4ff87f827a55ffbdf9204aaac |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8c0d713a8eb9d656028dc4f144bd7ce213e796d9 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b3011b35ea7c1b0c11d1b6d9f3aca824666fc739 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dc63b3051fa1fc4ecdc168993d2ab43d7c0320ad |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/8ca070a40c56d66f4a98ffda548c012e59dd8cdd |     
  mips64el   | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/bca9f739760105963fda9be4613fb4641522ba1f |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/25b76d69ba8df6cb5f0cabece1f95d30fb8834d1 |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d79649fa08d86e80c92e82813f8f3845226c1790 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/cdae7293444ebfa1a58cd991a426211815614771 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/fc044e4ab7fea001103784702fa5c325a7bfec30 | ORPH
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/074169714677b47cea8c64f0c09a5e51506b31f0 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/118dfa0bf8f598168e703fb72e508f03fac61a9b |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a1e02400932eb5c888437d5abc449ad9ea2488f4 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/58099e79dee30c220a1f0a4a93a83004de61e7b6 | ORPH
 powerpc64   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/f376fc3e1b64102718f96ea7605ded4daff13954 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/984e2ea305706b677a297081e7bf2e10ec7f1d8d |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/285e7d481c98cfb516bcda5026dac058c1d1644c | ORPH
    arc      |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/330d5a073b8e6a59328c41f415eec4d9c58f218c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ab606736409c0b5738bb2e93200ef6fdb5c5dff7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0b6f2b9f9c032e4e8eff8c2a490a246a0e363e19 |     
  powerpc    |      python-dialog3-3.5.1      | NOK | http://autobuild.buildroot.net/results/c493654ae701551471bd25afd5d277841a0675bf |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/abb0a730871217cc66bc10b09888b52d89912e16 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/6da5cd3000413a640aadde4bf57ed9ca403db884 |     
  powerpc    |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/cb571b0a8e7aa2a559d2f178578dd65267abe938 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/567a93a05a38dc1a5ec1171cd1b8af6d6264f635 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/578eecf1b606f42026fbb726cd3549f449588e1d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d4df42c8b9db5044a2733b90217464c140eb46a8 |     
  riscv32    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f087c1c79f9ad7d25049adbe192a8db89ca44a95 |     
   xtensa    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/0cdca6418e543b129f7706a75d8b81f12295c486 | ORPH
   xtensa    | sdl_mixer-d1725fcb7c4e987ae... | NOK | http://autobuild.buildroot.net/results/56af06617d7f846a84342bf1e8de05f51aa69d61 | ORPH
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/45ba598dd645344f310f7906c37d63026a4fc2dd |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/555913ea623b3b0199e333332f183bfb37776391 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/415be6dc6d007c157063e7fc4efdb9c31ebe2e1f |     
  riscv32    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/56ac8f4633073ead511cb8b3ff8e8cf885c9eed7 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/97c7c106aec249771911338052bea0186e000297 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/be89f91fa31e011a101709f09d1d2587782ff46e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b757a5e166e1e9c7666d9d426a09ae10895cd705 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/82d9587cb18b5e7d5415a9a1e9e1ec233b5628ea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f60790c00d6d1e5abffb6a54dc204a294a520378 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/1485e47ffaa8fd72cc8f43c1dc134038259cddea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9302ed9506bb398cbe6f00c68fff8ed5308529af |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                       kmod-27 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |            kmod-27             | NOK | http://autobuild.buildroot.net/results/961607feff34f6ba7eff58dfffac5eeefe8b4b10 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
            quickjs-2020-11-08 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c0a48a3210c82a197baf3475458709b541eaa14e | ORPH
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/b678003641dfb746f2d759e90e41efdc1012a490 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4765bd3a0a3111b533ee6f0ec8b4c092e01f8d78 |     


Gitlab CI results for 2021-03-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126415989  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126415991  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126415993  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126415997  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416195  |      
                qemu_csky807_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416290  |      
                qemu_csky810_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416291  |      
                qemu_csky860_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416292  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416293  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416294  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416295  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416296  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416297  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416298  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416299  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416300  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416301  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416302  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416304  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416305  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416306  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416307  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416308  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416309  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416310  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416311  | ORPH 
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416312  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416313  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416314  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416315  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416317  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416318  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416319  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416320  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416321  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416323  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416325  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416324  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416327  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416328  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416341  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416329  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416331  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416333  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416335  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416334  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416337  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416339  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416338  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416342  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416344  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416345  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416347  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416348  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416351  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416353  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416354  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416355  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416357  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416358  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416360  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416361  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416363  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416365  |      
                 snps_archs38_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416366  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416368  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416370  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416371  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416373  | ORPH 
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416376  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416377  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416380  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416383  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416386  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416389  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416390  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416394  |      
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416395  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416398  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416400  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416402  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416405  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416408  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416410  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1126416413  |      



-- 
http://autobuild.buildroot.net
