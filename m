From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 04 Apr 2021 09:37:07 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-03
Message-ID: <20210404093712.20AF3400CC@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  6  |  2  |  0  |  8  |
  2020.11.x  |  8  |  3  |  0  | 11  |
  2021.02.x  | 17  |  4  |  0  | 21  |
    master   | 107 | 41  |  0  | 148 |

Classification of failures by reason for master
-----------------------------------------------

                 samba4-4.14.2 | 6 
        host-sentry-cli-1.57.0 | 4 
                       unknown | 3 
  gobject-introspection-1.64.1 | 2 
                  monkey-1.6.9 | 2 
                 pcmanfm-1.3.2 | 2 
                 pixman-0.40.0 | 2 
                xenomai-3.0.10 | 2 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
                coreutils-8.32 | 1 
                 dc3dd-7.2.641 | 1 
       docker-containerd-1.4.4 | 1 
           heirloom-mailx-12.5 | 1 
                    libffi-3.3 | 1 
               luasyslog-2.2.0 | 1 
                  mender-2.5.0 | 1 
                 mesa3d-20.3.4 | 1 
                mono-6.12.0.90 | 1 
package/mender/mender.mk:10... | 1 
       python-rpi-ws281x-4.2.6 | 1 
            quickjs-2020-11-08 | 1 
          sane-backends-1.0.32 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                      tio-1.32 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/6e6c49d8f4df6903304893e4405f8533ceadb18a |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/45ecb914feaae7564bb704a6b1aadc523f2cf970 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/6f6c1fa442c8a271225b7937d19f63d27b4993e3 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dace0c1a40a3ecdc5f1daa9bdeae82f7422dc657 | ORPH
    i586     |    docker-containerd-1.4.4     | NOK | http://autobuild.buildroot.net/results/b23ad38953dd3c14b70d49b292c789552fdf4d85 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d456bfefe8d4b406775514b54d0cf7ed132ebe3e | ORPH
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c45f9614f11866be4cf3dab61c7701353e59846e | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/55811c74ed6a82c1b85b2c60bfbf18591c7796f3 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b830f4a6f10e29126e1833a74438b2f9c5f19771 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6da52195941fe3dfb7859642d2287d56c96601b1 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/91618b7c6282ac4aa8867fe66decb095996fca8b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82412b8b8f1f5e5787c96b1f1aad161dbf64da67 |     
    arm      |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/acdbf7c58ec8ae648f8048bc75650dcdcdca6285 |     
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/792f216903f8b7d43b6b5fc7ce46e08300c2cc31 |     
  aarch64    |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/c79902c7ec43355dbd07bfecbd51e98eda4b806d |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/5db5fd705ddd7850126ff40766c8c30cebe6c4f7 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/973ad38f69784c9200337e6d5b7f8dd46727e771 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/c4865c45e05ce9a9e34d56b0f3639bcd80cb49a9 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1d67bd6c161f09f89012c1b49a99e4e8943868b7 |     
    i586     | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/6ee33ba7d77e550be389db4286d919d176f5b458 |     
  powerpc    |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/35514ce45d7f770de9c46f2d15922a80bd877a7c |     
    arm      |         pcmanfm-1.3.2          | NOK | http://autobuild.buildroot.net/results/30042a0e164bf6cc7e2acfcc1efb85370444c647 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ff4fcc13c7855432f6d574acb042df0a0c9294b8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7fd3177cdc311108a210407743d09a35d9da6314 |     
    arm      |    python-rpi-ws281x-4.2.6     | NOK | http://autobuild.buildroot.net/results/3d037922484bfc45d0f985f87b38f20c5a4ab064 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/cb079ec2ff7821e8e5d6976999c15f5bceeba397 |     
    m68k     |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/3eaf88e0e25eb27c8aa983476f1987f38c46da6c |     
    arm      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/b3f23ffa4dae977d8d5ac0b26762fed5101a9ad1 |     
  aarch64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/b3fe797408b9041de37433602b3a47211818e44b |     
    mips     |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/4e769078faed24966cbbd4623894415b2754c587 |     
powerpc64le  |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/e101c92e3f9767ba19babdbd0959288db7b550ff |     
   x86_64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/26b8f7c1567cfa4331ce63f156f17c9c16caa3e0 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/3054ee896169cc124f48b4ef9d55211402fd1d38 |     
    arc      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/93cb56358109ffddd24d9b02de9a88c83b3977b4 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c542fb6fa4cd66cce2073b20d988925e81d5777f |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ec0a01a6b23d83ad9441084294ec1382858d837a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ebff5edaa32ac2eb5b74b5b7e3ea4359036b56ab |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a44039e2537486478ff2d98670c4e5099ba82f09 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3b16b87203e734c90b7bf208ec557a2dd0058dc9 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/929180589ec4612ad4d26eace1c2d7d0f5ff7f57 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d96626d67524b2817af3c29f6650668bc21c36f8 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 gnuplot-5.0.6 | 1 
             libmatroska-1.5.2 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         gnuplot-5.0.6          | NOK | http://autobuild.buildroot.net/results/7ed576a0ae3616dfdaa73bdfe7d509e00f0033d9 |     
    arm      |       libmatroska-1.5.2        | NOK | http://autobuild.buildroot.net/results/067e5ddf6709f6a3de81a0f7e9e196cf10707165 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                apparmor-3.0.0 | 1 
        host-sentry-cli-1.57.0 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         apparmor-3.0.0         | NOK | http://autobuild.buildroot.net/results/ffc19f8f53a2b1a5d69c8ed4b57eac98a86eac89 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ded2f0d03d3a1ce3b9f0db73598f4fb384a64acc |     
  aarch64    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/6e2711f588ad5b4092770dc95bf7466d3427d0f7 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                dovecot-2.3.14 | 1 
           heirloom-mailx-12.5 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dovecot-2.3.14         | NOK | http://autobuild.buildroot.net/results/4b914362676d27309e265a8e357416a44accd620 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/31f615162bfb9d402306fc7dddd3b30a5caf93bc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/28edde6adc88ed2a6a853427ba4e30b6177ef05a |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e8b7766d2e3e3728d878216d7276be7481a9505 |     



-- 
http://autobuild.buildroot.net
