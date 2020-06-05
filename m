From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 05 Jun 2020 06:26:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-04
Message-ID: <20200605062635.9DD64879F0@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  6  |  1  |  0  |  7  |
    master   | 89  | 58  |  0  | 147 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 8 
                libdrm-2.4.102 | 7 
        python-markdown2-2.3.9 | 6 
                  gloox-1.0.23 | 5 
           host-wayland-1.18.0 | 4 
                       unknown | 3 
                     avahi-0.8 | 2 
                 gnutls-3.6.13 | 2 
                   libnss-3.52 | 2 
                 rocksdb-6.6.4 | 2 
                  zeromq-4.3.2 | 2 
                  assimp-5.0.1 | 1 
   gdb-arc-2020.03-release-gdb | 1 
          gstreamer1-mm-1.10.0 | 1 
          host-acpica-20191018 | 1 
                host-gdb-8.2.1 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.18.0 | 1 
              ibm-sw-tpm2-1563 | 1 
                 mesa3d-20.1.0 | 1 
                    mpv-0.29.1 | 1 
                 openal-1.19.1 | 1 
pistache-73f248acd6db4c53e6... | 1 
                    strace-5.6 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c21346454fc4a3429f7666baed83e9372d103bd9 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/b471930948c7cbd93d0f2a72524c4b901e34c5a5 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/71565d696c30fab94ec120800b75fedfbae71b92 | ORPH
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/8b4c817126eaa42f12cc4ee4e08b8a45db66f035 | ORPH
    arm      |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/2e5e0e363cd645b194192da181236e2f4732f142 |     
    m68k     |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/1811b333e271648336a561e1cbac635ff83e6ac2 |     
    arm      |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/2239cea4f054e24bf9e13cab66c6000ea0e7948b |     
    arm      |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/0f733ab95d05d31d7384d31330a39d70b1a10da0 |     
    arm      |          gloox-1.0.23          | NOK | http://autobuild.buildroot.net/results/ab949192f596b48d6ad65adb857f2588d14f45e6 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/4e73dd951ded123f33eb885c2a265df51ebc9a71 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/9dc71f81e44cdc79fd8c959f932d76d9996c296a |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/14e13ed204a10e7d06e822473de4f87e8c900b52 |     
  aarch64    |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/a19bc4214a4259229c600095afe5deff95361bb4 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/db3563684b66cf75d04620a98c4fbf0fa67a8b75 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/4a99578b361efc96d5b075a8c387f6f40f148152 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1877209f777ca1e1cef6aa2c96b3a378331ba937 |     
   mipsel    |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/f26523690fc8a2e8de09c2b623571ea5131a6f1b |     
   mipsel    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/f785f724e890599bad4a0e828ee10b363c2c720c |     
  aarch64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/729777b66039e2995b616b3a927fc7a196db5ccc |     
powerpc64le  |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/7af35fc1b6ff432d80d102e3515793221c3bbe54 |     
    arc      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/953b918870dd9ab353555600e7b11510efeb0b7f |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/5878b8fb972b73619732b40f2700bb5aa556c84d |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/2d7d582da05175965fc5e16fafc5e4fcbca66aa3 |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/7c259af4b79a713dee409fe82ee9d9572f6fc6a0 |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/d6e86b20be95ebc7176aeb6d0b3d2384918a2485 |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/e0d513149987d035c3493597d0c56edcad5da5cd |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/1d76aac03ad4c0e086f67cd98d16439ae72f99ac |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/b7910460015b077fcb2431da608c34f95c2f2fbb |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/833534019d86361aada8e374d72140ca5e956219 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/7bb9f058c83bacfa882175fc271166736a6683d0 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/833d428a982e66f43503a9b51b62d30b647b0b9d |     
 powerpc64   |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/bbe5fd294b75910ac2930561be9c606d456ec668 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d4bde2d0cf3dc0416dc8248fc5ab96ff01966d5d |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/1cc05e8ea1e2991a9c92ef4383a74010b0fe6cef |     
   nios2     | pistache-73f248acd6db4c53e6... | NOK | http://autobuild.buildroot.net/results/5d9b1b87d271f5f159dd9449efb4fe4d752b4dc3 | ORPH
   mipsel    |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/1a865c073621947214b09b51124c9852986a42c7 |     
powerpc64le  |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/4de71825fce5c7d8c21cf1e8f77bdfac8255cf10 |     
  mips64el   |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/d110f5521440ce6afda2715f9d1902045651c578 |     
    arm      |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/2288620ca86064d9952108f562e5c69eed648931 |     
  aarch64    |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/43c6802d838e2e212604b6da297d1c12600f658c |     
    arm      |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/386898fb53a44a1260b185b405fa1a2fc6df8b25 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/11222010b7ebb3c18e3e16a1fb9a7a45544aa950 |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/fe17b3cdd87ac4ed7e5983cb3ff0d1bb9f63fcdf |     
  riscv32    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/a8082a053b66da549ef8b70fd6b91b2c5eaa5bd8 |     
  riscv64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/50061c4dc1756d4a0fac9dd23f2a60c179bd2389 |     
  mips64el   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5635e16bdd8b9172a83324d6c35903f71ee77d47 |     
    sh4      |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/049db445dc84d99706df4e41065988f727a473ea |     
 powerpc64   |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/f10fc8aeceb3ed720323b5faa899693766cb760c |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b3b9db98a76a65f4fc98f0337ccaea17f8baf5a6 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/f830b511bed9051d33a46bb23f0667cba781a895 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/f596da4bb7d6a3d0c720c04f738c720ba365398f |     
   x86_64    |           strace-5.6           | NOK | http://autobuild.buildroot.net/results/ca298d6543c07efbf77f2adeb4832bbac00ae73f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/b24cdd6abae1b8fd949034b36f2602a9aeba6cdb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/de88f7fc207fcc987123a04c9cfd786fe19127da |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/24b7f8c63a2afcbe21ed7c868e9f58146f58612e |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/597d47826258189e6dcc67cb4570f5f541598d65 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2a72137175533269199bd485ad83d185af07845e |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/c28f2451357f70ea28e942cf50685b1a0b70165d |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-checkpolicy-2.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/044475b26d29cac3e3790658208fd8574f90940b |     



-- 
http://autobuild.buildroot.net
