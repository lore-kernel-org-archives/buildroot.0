From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 06 Mar 2021 08:14:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-05
Message-ID: <20210306081449.50DC84EC07@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  3  |  0  | 15  |
  2020.11.x  | 13  |  1  |  0  | 14  |
    master   | 98  | 52  |  1  | 151 |
     next    | 19  | 19  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 11
                 pixman-0.40.0 | 4 
               capnproto-0.8.0 | 3 
                libshout-2.4.5 | 3 
                  monkey-1.6.9 | 3 
                 openmpi-4.0.0 | 3 
                  zeromq-4.3.4 | 3 
  gobject-introspection-1.64.1 | 2 
                 rt-tests-1.10 | 2 
                  boost-1.75.0 | 1 
                clamav-0.103.1 | 1 
                   delve-1.5.0 | 1 
                  dhcpcd-9.4.0 | 1 
                directfb-1.7.7 | 1 
          fuse-overlayfs-1.4.0 | 1 
                  host-python3 | 1 
     host-python3-pyyaml-5.4.1 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
libcamera-ab72e6641c56e876f... | 1 
              libeXosip2-5.2.0 | 1 
                 libgeos-3.9.0 | 1 
             libopenh264-2.1.1 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-20.3.4 | 1 
                openblas-0.3.9 | 1 
            resiprocate-1.12.0 | 1 
                 ripgrep-0.8.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/5e0022a4f4276535b10d642da2f72e11fcbdf589 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d99a3ade02c3cdc313e3bf1f2efec926c492dd29 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cc64e99098b9a9a66fc9c693c05d728262c16a9c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/946e683bb806b647ba1f38e09ab03c7cdb127946 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/7bcfecf7733f40403f25c4c8fcbaa3708592395d |     
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/08bdd6b8911df21f578e33ea8c22b26f9328b0e3 |     
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/56301b566e210f06ac581e04ad1ec2ca3f9b7103 |     
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/6a110032a41bd9e5ddb5d5c8558c78f7210b0be3 | ORPH
  riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/9962cd43d23111c5beacde0763f4327161e44b9b |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/320fed4eb24e39b84c28379817ea622cc2545b95 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1dc9b0b8940003b47ba0c80911d5912dc3fdcfca | ORPH
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/9f1c44814dede322b781594276222ad35409e0da |     
    arm      |   host-python3-pyyaml-5.4.1    | NOK | http://autobuild.buildroot.net/results/bc36ae51a1e4d70c5fd2a3eb4b458aba4220f2dc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6d867337ae3b1aa47b1d58817901379269637db8 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6340c0da3fd7da0f22c2968ac69a33d7cece2cc8 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ba7aa9de424cf57b8817e4319aa0d55c994b3f8d |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/95330f58f3a1863c1811daa132955853cc5f0cab |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/59cb52f395da7401fb90657011ddbbfbb262d627 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5b0fe733dccd3f92c59de73595e21ced65878d57 |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/892cc6a4516935e159a0aeb751f5bbf4ef3afb22 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dd389b5ce048f8914dd52ab3f1c71d954865cce5 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/aefd23a010f01654d8c3a2539897b5fa07362b1a |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a713467186d8a3d2c523ad431f063876a0899c30 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c35b54174d4e5971ea62bce7d4136d5f69496291 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/556ee3c4fc8c2cb80060608fb518feb35cfa8c69 |     
   nios2     | libcamera-ab72e6641c56e876f... | NOK | http://autobuild.buildroot.net/results/8ac599392f773eecff4773393ef0d0232a22f372 |     
  riscv32    |        libeXosip2-5.2.0        | NOK | http://autobuild.buildroot.net/results/89d8d4ba99d6dcc1618cf6b5302c124a92d75be9 |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/37d2f6898e9c8bbc572ab0f5a2951a541842c4b3 | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/336e99bf2520268d7d25b3037a3902eca7744dd1 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/81fc1beacb3fe82144c766034ea781aeb23f35aa | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/049d023058870a9b73483ed188f99e95200eee74 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/a6b7df5d4b4bccbfe54f3173365e88d849ed0e30 | ORPH
    mips     |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/c1441d24873d5645480d809b559ebe884df4aa04 |     
  mips64el   |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/fc4048cb162e1ea4b6a76b2bef526eb0377e18fe |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/df531f22fd1bb0863613dc1e524416d931dfe4cd | ORPH
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/6f7514984adf6d7905359caa24f2f3a84051449d | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/fc9ab47e26b07a3621d426ff6cfb8fad77d2e14d | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5184779d91987459703818aee87db5d8d0950a1f | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e239b214c4dfc2224293f8b20c19d2ec2abc8cf6 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/c95871164c1d1c4321b3cb4cff92feba445191f9 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/863e42e2cf62728f7eb650361c13d1df3388f4df | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/99871703baf639cb246db75e1cbe73f39d3b3c07 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2a15bc3c1334e2e96e9e040ffb71c0ce244aa979 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/149056c9cda5cd7e4cd312f821136bb94a5d906d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/11d679cfcb5f50742402090a94cb354d084161e8 |     
 aarch64_be  |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/63f9136e44b6301c7c176b49c3d000c0cc6ae933 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/272485038758e0e3af63d17f26e2101fc943734b |     
   x86_64    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/94be6190bd818b8904da74e8b111857c67a771c4 |     
  mips64el   |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/f03aee6bc446907b0d3a2978fcbd45bc30b37c54 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/93535ffc67d0be5b94fbdd8f037e3648e36ebd84 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/985595bc4204659990a4dc8d44ba8cd436970872 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0af3a4e5f83ed3978906b0cd868d0351fcf79bf3 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/855f742f6956dad46d66a7b027632d8f6e8aaf2a |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
                   mimic-1.1.0 | 1 
                openocd-0.10.0 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/e248b9e5789de084cb2c0297cf5995436dca8ea6 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b345ca5ac147599a987b0d00fbd041a4e84fd068 |     
    m68k     |         openocd-0.10.0         | NOK | http://autobuild.buildroot.net/results/8220dcc709ff50213291823f8d76880ec7d8160c | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9ca18fa13098ade8e7453fd5faa71eb971aa98aa |     


Classification of failures by reason for next
---------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  monkey-1.6.9 | 2 
                  perl-gd-2.73 | 2 
             babeltrace2-2.0.3 | 1 
                clamav-0.103.1 | 1 
                  dhcpcd-9.4.0 | 1 
                     efivar-37 | 1 
                elfutils-0.181 | 1 
            erlang-jiffy-1.0.6 | 1 
              netopeer2-1.1.53 | 1 
package/ruby/ruby.mk:88: ru... | 1 
                 pixman-0.40.0 | 1 
                     ply-2.1.1 | 1 
                    qemu-5.2.0 | 1 
               ruby-legal-info | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/608a26ccb2ed85ac958141f3d133f168fe310717 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/d05122aeb601e68ccb1a3ba9c18ebaef6b2ed7d5 |     
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/364427c7437885f2cff40d5460fc7eeacb67a2f1 |     
    arm      |           efivar-37            | NOK | http://autobuild.buildroot.net/results/8da5abf78262511339bb3d4ee3077de8eb501f3e |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/32a4e30288eaceabf140e00f17d637dded98a939 | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eb73ef06a12aceef9aad0f89446dab26684c0769 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/af68fe7ffc304db2ec86d3036f709d4d17ce740c |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6d5e16d8c62d3c4641ea5069e17455fef829e4b5 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/923dd5c6aa6d3fb6722ecf5780e569d899675e80 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/84e2eba7364c96fd9fb250759299054b7e1a32f2 | ORPH
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/62708011995d101f71d8659a32e1244b5c59a377 |     
  aarch64    | package/ruby/ruby.mk:88: ru... | NOK | http://autobuild.buildroot.net/results/04fe88246cba36c7df952d93afce0e8ee9fa66a7 |     
microblazeel |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/1b3c4df9ccfba9d0bda350c1792a8e0b610099a2 |     
    arc      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a6aa00e7464e3afcd12522ce5a42adf9f379a32c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/85c14684226b8c6265ae517eb87dd67bb19c4a31 |     
    arm      |           ply-2.1.1            | NOK | http://autobuild.buildroot.net/results/91530420345192d9883c728c062e8a59624e323f |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/96d0da8efb21b42e662499d7bb349a3a2e14ef3f |     
  mips64el   |        ruby-legal-info         | NOK | http://autobuild.buildroot.net/results/3c2a848b72a7a255eeb9e0d4eef0c01628a1d5f5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6a42fa97bed68a6a79ff90c65aabe1aa67c5ecc5 |     


Gitlab CI results for 2021-03-05
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1071966234  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1071966343  |      
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1071966347  |      



-- 
http://autobuild.buildroot.net
