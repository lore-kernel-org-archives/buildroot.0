From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 May 2021 05:46:22 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-12
Message-ID: <20210513054627.AD5E560681@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 19  |  7  |  0  | 26  |
    master   | 99  | 46  |  0  | 145 |
     next    |  1  |  0  |  0  |  1  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                   bullet-3.09 | 4 
                  lvm2-2.03.12 | 4 
                       unknown | 4 
                 gerbera-1.8.1 | 3 
                 pixman-0.40.0 | 3 
                    ffmpeg-4.4 | 2 
                rocksdb-6.13.3 | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
                  apitrace-9.0 | 1 
               capnproto-0.8.0 | 1 
                 dmalloc-5.5.2 | 1 
             host-cairo-1.16.0 | 1 
             host-lvm2-2.03.12 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libkcapi-1.1.5 | 1 
                mono-6.12.0.90 | 1 
                    mpd-0.22.6 | 1 
                 openal-1.20.1 | 1 
          perl-dbd-mysql-4.046 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
               pipewire-0.3.26 | 1 
                 rt-tests-1.10 | 1 
                   sdl2-2.0.14 | 1 
                   speex-1.2.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6d67c131a722637ced7b4f9ee442a5e103a64380 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/c5901e7ae91935c4266d5986131ba0e784d56aae |     
  powerpc    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/c49d01589a4a8f7f2d5f1594b43ec998557fd0cb |     
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/bdab03b1188b50e8e59cdbbaf81224e4dda912d4 |     
  powerpc    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/2512c765158b2e721e2ab12b4103afd52dd17090 |     
  powerpc    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/076bdf081c84ce9a273cbb653279c1b363a0853b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2180322884333fbf29b2619b3532c21b892bdead |     
  riscv64    |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/97386d8a55fa522b0ff678db1f2d69ec1351575e | ORPH
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/bdf02798c65ba327e4309227da77a6c19744f03b |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6e468ff30183b78abcf597144b209096a3923780 |     
    arm      |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/611b5962843891d344fca9a47918cb4e77221126 |     
  riscv64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/3df338c04c7e5edbf46b285c52aca957e8f39d15 |     
  riscv64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/cf1b47c025181d2bd08400d5b477e0abf708cb13 |     
  powerpc    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/4e31e784ccc05506fac01cfdf228742a6950cddb |     
  aarch64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/44767ac66cc66323d49a6f7251a1bf7b7c088b39 | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6ff53cbdb7b767554ffaa74d6c897febcd1869fb |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b80b4abb815195178433f6555adf76fd35af2377 |     
    or1k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7410e6c94ec3f8187c5c6fd6db2e05851c97abe8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e772a3dd316a8e79ce068517fb6447568a9b23f8 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/621c112296154a4edf5db02b8d09626b3a45982b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/31d112f50830fc1854792ccbfa2e3e0157b99f4b |     
  riscv32    |         libkcapi-1.1.5         | NOK | http://autobuild.buildroot.net/results/7eb2fb866c717b0b48829411d81cf72cadfe34de | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/430a0191a4d1a54608d6cdbae13f185ccae4e610 | ORPH
    arm      |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/03f3a3db6ce0e28801981245b2138c3fdb95bb11 | ORPH
  powerpc    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/db2ea8d3a499b24a77816ab6d6749cb4f897012d | ORPH
  powerpc    |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/d18c8786049c761ece66d7bc33fee4072cd2b9d1 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3d1d04932b7dd719ccb66fd27ebac266792b9f9d |     
  powerpc    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/ed1b83cf101e00c9f0b6bad3055422cab4efc61b |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/a444ebf99526d7f2b5d4c279f5ac0e0b0ca7f6e7 |     
microblazeel |      perl-dbd-mysql-4.046      | NOK | http://autobuild.buildroot.net/results/9b665ef97dae5bde88eeeac41794875f551f9065 |     
    arm      | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/c6619f06b3ea4950e39a6875c1bb2eb1749b57e1 |     
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/6630e7d4368400f131d5a4244648e8173b04cc4c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/10dfbaa63c0a0e7c17eee1f991a274116b50a2ec |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c38d197dbd9154028aa2fc57aa10acf8bcfae7a2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/75f2f02b5716643b7fae0807e23c87f5fe0d5da4 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/930383af3cebf9f909f553f6910303ad4d3cd52e |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ac8e0c0d4b6a26f2457a5c9c715112d8e63b676f |     
    arc      |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/17c010f289ce72eebed5fd514b44caf4be939020 |     
powerpc64le  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/dd82debc9a106202cef8b5938eae2d78e2a9875f |     
    arm      |          speex-1.2.0           | NOK | http://autobuild.buildroot.net/results/d8d858dd7f85f181f14ec8c7dda08ed85ad400a0 | ORPH
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa74dd109b9541c8ef7888a84175e520288a3cee |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b33c7a55eba822395879c31c3d7e393842435846 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/b044d9c9133a36905847ea0e67426fe57ccdf4c7 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/71c2f78c0aa9536336e9660daade0be952b9da93 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e15b0d1920da3f764ebe3bcdb483ce538954eb6f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8356f89a9db8abad967b110cba55afc7e8702c37 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
        host-sentry-cli-1.57.0 | 1 
              netopeer2-1.1.53 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
                 pixman-0.40.0 | 1 
                 rt-tests-1.10 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c280cc4d085a5c2dfa52013e36458ce19ba15da3 | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9a08609afda2bd5be986d214430e33e3545efeb1 |     
  mips64el   |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/28a5b45723612f5403e00d97e62d9825e88592ad |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/f71c913fbc1e82ea450fc5c06962a14a2ab2ef43 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f56a5d1ea9e20cafa97088b1254aa9b2c7987d38 |     
    arc      |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/2394c058e18d1f1882edbda1d741202704d9c04b |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/12a525196fe4f0443e7b4b963bf7034df07668a4 |     



-- 
http://autobuild.buildroot.net
