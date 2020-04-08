From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 08 Apr 2020 06:27:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-07
Message-ID: <20200408062758.36846203D2@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.11.x  | 13  |  4  |  0  | 17  |
  2020.02.x  | 24  |  7  |  0  | 31  |
    master   | 154 | 60  |  0  | 214 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

psplash-fd33a9b3d68c89fa22f... | 16
               libglib2-2.64.1 | 6 
                     avahi-0.8 | 4 
                       unknown | 4 
                  zeromq-4.3.2 | 3 
                coreutils-8.32 | 2 
                   libiio-0.19 | 2 
                libtirpc-1.2.5 | 2 
                 openal-1.19.1 | 2 
                qt5base-5.12.7 | 2 
                  bcg729-1.0.4 | 1 
               belle-sip-4.3.1 | 1 
              bitcoin-0.19.0.1 | 1 
      gst1-plugins-base-1.16.2 | 1 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
               libgtk2-2.24.32 | 1 
                 libuwsc-3.3.4 | 1 
                 mesa3d-20.0.4 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                  ndisc6-1.0.4 | 1 
                     php-7.4.4 | 1 
         python-markdown-3.2.1 | 1 
                    qemu-4.2.0 | 1 
                 qt5svg-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2e4a7bed26a1f9339355c304a8d61f24dcdd296c | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/2fd38b69ec1a5da0a0a9801f142d63fc6be03703 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/61600b87be713456cbec2c544b980136777d6c45 | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/194b9865b8e26dead2ac964f9ab602284ba970da | ORPH
    arm      |          bcg729-1.0.4          | NOK | http://autobuild.buildroot.net/results/71914706e3d96d6366e89c4528693bae2ab32d06 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/66fca7ea86640a189ab4f9b43ab8c34343fe3382 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/79c2326d080e56766c4c7918492b068db4e97479 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/e3d70a2a12ea859f902564ad260b28e22ff6e2c4 | ORPH
    arc      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/767a07f441f05ee379eb8ee99afa44be31dd9100 | ORPH
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/b3a4c5c98685d19e535cbcad443a9c12204be8c1 |     
  riscv32    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/11b5a326eb48171ca7bc9c35b84f205d569b27cd |     
  mips64el   |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/548dbd360c14823626aedfffc3ecc5e5fe711243 | ORPH
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/77dcd9757f78c38bc6318e17df406a56ce726028 |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a2efc3658738092b7d4036f088238cff80d97350 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/35992509de4f522411364983fda49261343fc578 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/82051170b252be108f360b6caab8078acde99d7e |     
  riscv64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/26c0a154fcb3501f0011edaa62639daf235553e9 |     
  riscv64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/65fcb7da0bc343d22d56057487247d14b7d7a64d |     
  sparc64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/db3c31df3defd365c79d112a9b34c5bc73812e13 |     
   x86_64    |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/e442ef69577c7986c0e22de01af28cac9811af25 |     
    arm      |          libiio-0.19           | NOK | http://autobuild.buildroot.net/results/f6c8fa70147a7118932e6dbd636079f420b9941c |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2cfbed2a07e0d365dd40aeb42213c4df3d08c031 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8ffd4c20edb443919b04cf09042ef5dcf7481c7d |     
    arm      |         libuwsc-3.3.4          | NOK | http://autobuild.buildroot.net/results/6941ef934542f7cb415465229b118b1b9cd65bb1 |     
    arm      |         mesa3d-20.0.4          | NOK | http://autobuild.buildroot.net/results/4bb17cf6a0964934e289c3a30cbba62c19588c86 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/7552fd6cb1dcfc88a6a00748c9d551fa286716cb |     
    arm      |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/538486e7d218c85bb31db0f28450eef2b9ce217f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3b35a1c5b794ba2a733e04946f0936558d4601ec | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/808f37c021a44fba5d623544b76346bead5d71e9 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/8d49cf0a78db7aca7549dac84868eaa9b904aec3 |     
   nios2     |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/08e2ab45e6587c28a97324650db0b8cf05056ec7 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/84c1c4641d82d99c104b49935ce28a25edef78a7 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9b9f6122c384aee50e3766282ccc26d4cd65c46a |     
   xtensa    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/822daa40cd9fd843e10c446cd291068877216d28 |     
 powerpc64   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/05042afc7ca18e2edf1ac2023ab1774dac9828f9 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/72f9b67e114f83dc5f9b527f4d8f2348897859e0 |     
    sh4      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/306a68fdf2c4b554e34f59e821faf8ab624ed58a |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/d85e23d3c5f1b437573ecd9b7b9120b23828a259 |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2e07c7645c4a0c0270a896f22da938eeca2b24d8 |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/01b81680defc881def3c59a98ec9086efb702414 |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/c189f171a25f1f918a48349febdb27bf8662de0d |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/340561507f460a926c158a403a809ace10794b61 |     
  riscv32    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2a3e332cde39401fa4160da47075aa0246257c4e |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/efea3a0efaf053948d9b7fc65de765995133ebf0 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/776727ed5aeb38a2e940facab85d66c6eb863bb5 |     
   nios2     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2e5f3348d294eda8e568fa8487d9c4991a61b646 |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/b9c4b201b43db5a37f9b581fd0081b61e8d33765 |     
    i686     |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/2aa946ee1029f39c6c0e5a179d44606eca435523 |     
    arm      |           qemu-4.2.0           | NOK | http://autobuild.buildroot.net/results/259c198ba3ba21cfa17858fc3535b8f7cec212a8 | ORPH
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/254c8f206946878a30aaee4cde265a7857d6c585 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/1c33879063ed19627d710ae7fb77cf8695072479 |     
    arm      |         qt5svg-5.12.7          | NOK | http://autobuild.buildroot.net/results/edff0abbb65f15876bd8fe9071d6a7e54838e8a8 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b6d8d18dbe5638270fb7c03561b4993b4b18e48b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e1714511bb58bad4222a752fd585e3f61ef1b1fa |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/f461acb23bfdb00076ccd07af59773c2fe640e62 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ac2f522d3c315891f0d37872db4fd32f86f4ecd |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/32f81480e99b2a12a1a67a669950c95ce0d179c8 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b55b399f4276d27424a604410e3822aee821550d |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/8038796128e1fb5a77f111b4be85a5a77c3d7005 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/265ab06b8d5bc09f02fe156bb16b8357cb87b866 |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/9c5bde49189ec4952444dd50befe3ef215017e77 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

      gst-plugins-base-0.10.36 | 1 
                snort-2.9.14.1 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |    gst-plugins-base-0.10.36    | NOK | http://autobuild.buildroot.net/results/fde9ea78d3ac59618257cc3262cb13cc119d8567 |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/9b23a6239e972c4989a432a6e5fd156ae80dba7a |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/10a0164c9944698befe66b8dcc76b9647b853fe0 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/94c03e5c2453d2f3aafa7f225e32d9bebcf78423 | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

               libglib2-2.62.4 | 2 
                host-go-1.13.8 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.7 | 1 
                      tio-1.32 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/c1870d4917d04e68d9a541806c66195c29839bf0 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/46ea3c8f2a18434b996f4d4e43741f0fcd88adf7 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e32187da0e278f64b56ffecbaa0b7f651ed2bce2 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b2e01223450913b6d9de237c51fac815d10b2135 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/377421f8dee68aef9f3c4bf50c2f7b3151f4117f |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/180e462f490be66e64252dd9dc4cf6b467ca8fea |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/46a5cc353d89170c724b68622e35b53af9fd007c |     



-- 
http://autobuild.buildroot.net
