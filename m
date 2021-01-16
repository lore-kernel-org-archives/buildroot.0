From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 08:18:32 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-15
Message-ID: <20210116081840.B279720360@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 27  |  2  |  1  | 30  |
  2020.11.x  | 20  |  5  |  0  | 25  |
    master   | 164 | 68  |  0  | 232 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 12
             timescaledb-1.7.4 | 6 
        host-sentry-cli-1.57.0 | 5 
                    mpd-0.22.3 | 5 
                      ell-0.35 | 4 
                    qemu-5.2.0 | 4 
                  bustle-0.8.0 | 3 
    trace-cmd-trace-cmd-v2.9.1 | 3 
                clamav-0.103.0 | 2 
          fuse-overlayfs-1.2.0 | 2 
                    olsr-0.9.8 | 2 
                       unknown | 2 
                 dmalloc-5.5.2 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
              libostree-2020.8 | 1 
 Makefile:753: target-finalize | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
                  ndisc6-1.0.4 | 1 
            quickjs-2020-11-08 | 1 
            resiprocate-1.12.0 | 1 
                rocksdb-6.13.3 | 1 
                 rt-tests-1.10 | 1 
               target-finalize | 1 
               wireshark-3.4.2 | 1 
         xkeyboard-config-2.31 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/a7f77565f9100ebf284bfed9ec3c30986b6f0728 | ORPH
  mips64el   |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/b9f161884d62e3deaa7361b22e586e427de64594 | ORPH
    i586     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/9d6af2a910fe743e4cfd74919c3408cfbb3c6f91 | ORPH
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/98046eaa87680921f2d579968028be447663290d |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/5280652b3dd2e267f979098121263e6b2537d9bb |     
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/b4d457369f35e1942c294b0ea3b3cab4cae0d7a3 | ORPH
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/421a0aab61251891fe6cf83e55c6fdc164820ec7 |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/5645965497aef0d88f2f08169e817640930edf9c |     
   nios2     |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/44d0af6ca92adadf9cf7de401091fd8cb9038e9d |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/bf00572c4de61c9aa4de96b0bf8c7818aaccb5fa |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/4feac1bbfe21308197f15ef757d8375bde67c647 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/14ea64808c8e9838e2feb3bd82a284de1266940b |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/19a7bd82fb3fbc3bc9f17cd7cd910b946b70690f | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e6a8650c3ba5b38c59efdd75af619505395208cd | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d686ece6aba54c51ef8beb9d24ed39d92477d044 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c8a2419f7e156e554dcb5c38f8c79ac73bcf6e17 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5e9325d018faa3fbf423389c91fda0cf041467d5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/acb784ed41a661b66b1a53826f5a027a45cc6b92 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d6cc8ac9f84877b4c24c4143d0e65eb766a7b2e |     
   nios2     |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/6b74e7d731f8b63c836d3ebe325c4033ade096a3 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/5f944cfc3e7491ac343685a721cfae42fc2d9698 |     
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/62455f2048c127b7ee2c175ef9902c5521dd7599 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/23020042fda04cae1908bbfd449580c2c6db8fcf |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/08138a3b0f361faf4611574d16bf6cd313cf545e | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9d1ffabfc10408fec38fa19ccb72b0c0602f7e52 |     
   s390x     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/5725bd2be883f7f5d16ef7df9991b5e4c1059043 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a4fd1e499d97ef8256e64deec0ef6bfe6e3902d3 |     
 powerpc64   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/3b0ab848704ea948e21aa8610781a7631481a445 |     
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/a4af4ed79d8b4a795d4cd8fa25959eb97477c8ca |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/fff9a40115a5be3487cda4a73e07db3940fc020a |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e427c7704d36b382b675c347b7cf72c362531898 | ORPH
 aarch64_be  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/af39325cec8f4f08fd45b98c54496e0b32602db0 | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/77dbd8adc3a9cf47a50002549eefb535bc87eb0a | ORPH
   mipsel    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/303fd98fa920c4de6670587242a81857cfdae3fd |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/6e7993fbb3d98166b4d5ad6b18059fed1aa77fd2 |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/417669ace40b7a418974e5733bbd31a773575c0d |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/adff1be8b26ff51543d5ef20fbe0e1a85fd1dfef |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/5164a6ad5cb8cc9ef2f053ab328d690b66ea672c |     
   x86_64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/7ac82a3ac4b06cb5ad44e92548d66a0f79d149a6 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/49499854135a4a351a4d7462cc72817839057eb5 |     
    mips     |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/750d5e160e8361c5e04290ff4446feee6d3fda19 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ef4a4052850823819e96fa66ffe709963c815a05 |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/c957d0f804889c2e157ed74d3294c2089cff6edb |     
 aarch64_be  |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/357ac7640c70beced1bd0a459620e954ff04f0ae |     
 aarch64_be  |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/593192ebe018571ad1d15db75c1d67b550a2a30a |     
  aarch64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/be2a1a6fb1e9c1194185d80c08a34e11758794ee |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/1201d4db8adce09fab00a59b22ae732ae42d9718 |     
 powerpc64   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/f926497ca0720ec08687ea9529d0630d6db014e4 |     
   x86_64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/351340880eecf0b1a3fc9928d0368f0ea1e8046b |     
microblazeel |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/8d184bdabbe47f6172658d2b10269c47387762b7 |     
microblazeel |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/5d6ced0b85879d1af22651ff4e8b44bf064aaa49 |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0b3dde1094387b96d76615c95976c7d316a7bfdb |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/162f06bfbae91c37778f6c920befad1ad29fa0f0 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8a9a5736640a782fe0e92ffc89eafe40b6c8321a |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/8b4ae1adc66df94feeb3be832de663310cf7129f |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d514a4038c9725f6bf59f3136770e886f702b6db |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f2fae0ecb01bb54ce9e960f4b60883c48e6fb353 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/5785e073be088f2612cfde01af9684bfbd9db18a |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/571111e75aa4f410bb645ee5d9407b27fe7f7363 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/4bcb9e9d9d3ab48cb5d53c958131583f0c44fa6f |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/b7af213fe79867640c988359c40c151ee899352d |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/1cb70a77778257d891c790b1d426be96360a00da |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3eeff4cbd6c4cb0c70cedb88ccf24e65940679f6 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/74a2a8f35c85e903f358a118ec2dfe66b2259f42 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b772fb681669a11e59952d6700dd2c877ef7e7e0 |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/cd9144d4a109e3d979c6e8f9d3337e8387e04c2f | ORPH
    arc      |     xkeyboard-config-2.31      | NOK | http://autobuild.buildroot.net/results/d90f185c8b6e5e0117659f7b88158be1c1fa6175 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6c5eb956fbc55f36761dccb7d02146ad6ce6a50e |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
               qt5webkit-5.9.1 | 1 
                       vmtouch | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/88fcb1708a36a4669dc842810111f4fcba8ce69b |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/d9e06fa28861f8354fd0ea82909bc496d4770402 |     
 aarch64_be  |            vmtouch             | TIM | http://autobuild.buildroot.net/results/f5805a3ca2ef8df41d9c69ea2a2643c47a41720d |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
               capnproto-0.8.0 | 1 
                 uclibc-1.0.36 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/28468934b11cdf786d669c21010927d3d67637ce |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3bc644462d57c43501f0f8c9b3f490614ad16069 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/43eb05468e6937df75193501e6a5ce9b09eed21b |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff925deac12ae25cba69667d3614f1c40a9d82d0 |     
  riscv64    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/56fe39f223dc383217410f70bea82056480a72dd |     


Gitlab CI results for 2021-01-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
        freescale_imx6dlsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451197  |      
          freescale_imx6dlsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451198  |      
         freescale_imx6qsabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451199  |      
           freescale_imx6qsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451200  |      
          freescale_imx6sxsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451201  |      
             freescale_imx6ullevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451202  |      
           freescale_imx7dsabresd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451203  |      
              freescale_imx8mmevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451204  |      
              freescale_imx8mnevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451205  |      
              freescale_imx8mqevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451206  |      
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451208  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451209  |      
                 hifive_unleashed |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451223  |      
      microchip_sam9x60ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451255  |      
                      nexbox_a95x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451284  |      
                        odroidxu4 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451293  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451375  |      
                       rock_pi_n8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451384  |      
            solidrun_macchiatobin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451398  |      
              toradex_apalis_imx6 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451403  |      
                    zynqmp_zcu106 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451418  |      



-- 
http://autobuild.buildroot.net
