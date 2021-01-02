From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 02 Jan 2021 08:20:45 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-01
Message-ID: <20210102082053.4EE462033E@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  4  |  0  | 20  |
  2020.11.x  | 17  |  4  |  0  | 21  |
    master   | 97  | 39  |  2  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                 uclibc-1.0.37 | 9 
                       unknown | 4 
                  bind-9.11.25 | 3 
        host-sentry-cli-1.57.0 | 3 
            quickjs-2020-11-08 | 3 
                       vmtouch | 2 
                  boost-1.74.0 | 1 
                  bustle-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                ejabberd-20.07 | 1 
            host-libusb-1.0.24 | 1 
                    htop-3.0.3 | 1 
             kismet-2020-12-R3 | 1 
                  ndisc6-1.0.4 | 1 
                    php-7.4.13 | 1 
                    qemu-5.2.0 | 1 
             qt5wayland-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
                rocksdb-6.13.3 | 1 
                 systemd-246.5 | 1 
             timescaledb-1.7.4 | 1 
              xapp_xload-1.1.3 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/ac9a3a690d4b2b894887fe626dad5014ae0ae890 | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/4f2362cc2ede650a85c0ec9aa5007e090baf01ac | ORPH
    arm      |          bind-9.11.25          | NOK | http://autobuild.buildroot.net/results/25896798d97499d5440bdf01089a3808195a4993 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/61c1d91d8134f4e8ea44b341bcbd552ecbeaf591 |     
   mipsel    |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/b5d8d8d8452342373c2446613ba3051c20a97c03 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a28659d11a0c1db35d87d33c3550cdc0c61c4670 | ORPH
   x86_64    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/a179682fcd2f0d89fb7a6001efeb8a0fba9540da |     
    arm      |       host-libusb-1.0.24       | NOK | http://autobuild.buildroot.net/results/eb1ae190ca941efe31734619ec9b40abb9dc6729 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1b46d99610a0bc843caee6abc54c14274d0e665c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2fda2cd896f8fa2084514fa980ba685c60f4382e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dec365567b391daf9ecb8284e4695d87591989db |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/0d44ee684d96a74828567ea92b08f7484c07aa3f | ORPH
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/4f1697ffd41d0bf91aac33620ca0314e67ef11d3 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2a0e91363facc2b5625ca02f885fe2f60e407934 | ORPH
  mips64el   |           php-7.4.13           | NOK | http://autobuild.buildroot.net/results/2e218326dcc052ef1fce4f2dccd6c702b83171db | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/338bb44e3aade37f2376bf82d1d5420e5a163e59 | ORPH
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/be2aafc3d9b79c1bf3973ad52ba125083552e1c3 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/26291b013240048f4f45f855653813085202cb93 |     
  riscv64    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/f2dc1c89b2c3f5c97aaf1e48544a54fb06ff3810 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/b66db07926888697058a87e56c1e523e01a92962 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/33de44e5e059d2f29f2265ec92eedb62d03dbb30 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d3a5a7efb6e315477cd230fb214c414ccbd41f71 |     
  aarch64    |         systemd-246.5          | NOK | http://autobuild.buildroot.net/results/9292aeb56ef96b0d77157ecb4eab49847bb88db4 |     
  riscv64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/dcc019d794e5db32daef1ca5b018d30c0ffffc5f |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/e3e974bbf1c7bdddd3f3cd5792e14a06007b9aee |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/1484cb526565f5ec68d37b1eae935f6b6b4a031f |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/3a25a996b9a2621a82b96a2707d90c834ae416da |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/cc0ed02a7e345a22a245462047a2054533fbfa6d |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/659c1947807497a88fea86293445959db33200b7 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0f511697c4f8e0a4628d7b4d7d45bf53add0e275 |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/ef1718305979089afa33af8eb7451a89a050ad68 |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/42a24638d402d8b9916d8e064b338e663bbe1e32 |     
  riscv64    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/87a34985cf18029f4a6ded5973fda8b1c2f442d3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d8ab02cdc51e5e4ce1fd2f02b21b39c21dab6d51 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d3f511fc22830d587eeb8ad6e71ba299dfb31c7e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/b0b5c3cb8546395807af5b536d762349262caeac |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/55575be44113c6db173e1dd0ba3da5da325b352e |     
   mipsel    |            vmtouch             | TIM | http://autobuild.buildroot.net/results/7d33e2262ac329d53e23866da4960de1b9985706 |     
    arm      |            vmtouch             | TIM | http://autobuild.buildroot.net/results/662693f1778a1aabce60d2c6f8cfa2b7c97b733c |     
    arm      |        xapp_xload-1.1.3        | NOK | http://autobuild.buildroot.net/results/f0775a44c4df9a8de747e90ba28d18fa1a8a5b02 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cacc05fa5df1301de034a85b5e8b94495c4ec5ee |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 binutils-2.32 | 1 
        qt5imageformats-5.12.8 | 1 
                 uclibc-1.0.32 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/ed37018f7e956f3a8f24f2b6b31a5c49e77768bd |     
   xtensa    |     qt5imageformats-5.12.8     | NOK | http://autobuild.buildroot.net/results/a60da9871f5ee4f7ba884aa55bcf7f62eee71808 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/c44bf0b4642e24fe75c5b3db9e071a040a9bb089 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ff3c6f7f17b289f6edc54808acc7bce8bae7890 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a91b70cd86642e2d88a7640f97b4b2745d34c5e6 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c310ca43a2979ebd5472b106030215fe379944ba |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6be995f1f2ec87a9aa8098c61c767f72e104b77b |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/e8bfdb3eec2eaca111ae963784401498a71b2d15 |     


Gitlab CI results for 2021-01-01
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                       nitrogen8m |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922366  |      
                      nitrogen8mm |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922367  |      
                      nitrogen8mn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922368  |      
               qemu_ppc64_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922448  |      
            qemu_ppc_virtex_ml507 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922455  |      
                       qemu_s390x |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922458  |      
                   qemu_sh4eb_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922461  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922475  |      
          solidrun_clearfog_gt_8k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922498  |      
            solidrun_macchiatobin |  https://gitlab.com/buildroot.org/buildroot/-/jobs/938922500  |      



-- 
http://autobuild.buildroot.net
