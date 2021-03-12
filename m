From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Mar 2021 08:13:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-11
Message-ID: <20210312081405.EE40F84418@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  2  |  0  | 16  |
  2020.11.x  |  6  |  3  |  0  |  9  |
    master   | 116 | 58  |  1  | 175 |

Classification of failures by reason for master
-----------------------------------------------

                  janet-1.15.0 | 9 
                 avrdude-r1450 | 8 
        host-sentry-cli-1.57.0 | 8 
                 mesa3d-20.3.4 | 3 
                rocksdb-6.13.3 | 3 
  gobject-introspection-1.64.1 | 2 
                     mc-4.8.26 | 2 
              netopeer2-1.1.53 | 2 
                   sdl2-2.0.14 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
android-tools-4.2.2+git2013... | 1 
                      bash-5.1 | 1 
                clamav-0.103.1 | 1 
         coremark-pro-1.1.2743 | 1 
            erlang-jiffy-1.0.6 | 1 
             host-cairo-1.16.0 | 1 
                  host-python3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
libplatform-a7cd0d5780ed80a... | 1 
              libxcrypt-4.4.18 | 1 
            lttng-tools-2.12.3 | 1 
              micropython-1.14 | 1 
                 openmpi-4.0.0 | 1 
                 ripgrep-0.8.1 | 1 
                      tio-1.32 | 1 
                    unscd-0.54 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7e365539e65d75774c6b9c8ccd378785e36df7b3 |     
  mips64el   |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/d1d033e8341cb621163ab9b44f23de1db3757584 |     
   mipsel    |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/30c5056a1f252c1cd69fd4b27b48b1dd29e61614 |     
    arc      |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/fc9d005503694277d180c804b69fd0c3c3cba250 |     
powerpc64le  |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/5925ed28a51630c4ee53743bc3f158dc523e2f98 |     
  nds32le    |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/0e15d7e161bac6b2f8b53cb59da70d22fd119d83 |     
  aarch64    |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/a472572e1b3ee172b25c1292151ee129d0fca3c4 |     
    arm      |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/c9b777b31608f2c9ebb516e2646c8cb52b1ea709 |     
 aarch64_be  |         avrdude-r1450          | NOK | http://autobuild.buildroot.net/results/34eb8f8d93a76e06fe38890bba98586a7528b81e |     
    arm      |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/5c14c916ea4f39fba6253876adec9522a2430ec4 | ORPH
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/b09afb8b2041eb39bddd49fef7f45fcf37d71b67 |     
   xtensa    |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/d46de558653ed10d184b201dce23f00a3ed247f0 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a8977ba43872db30ab12921a886faaabc456bf9f |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d53c411d33fc84ed039f19a34d4826a9456b0dec | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/59da27135a8f8d096883825d88d2cd79099fa5f0 | ORPH
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/f8202dc762dced654b7d25b8fa398c22c3754912 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/5dd87b3f06dd79ea7ea8133f5e31cf6d3f6a8129 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dce72044ffb5e4d015efebdc8c31f730fd28c871 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/81b6060c94e76d2547d4af098f4c08f665ec6381 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5c6d7794f274bcbdf186230a20cd802741dc1a12 |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d0b27afa35822e12c800311eedbefff0d4fd5b27 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/856b36fff3419c1b5790825807dad58d6d0f1512 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2569d1d7e538ad304ee12c61d2d2cf66f653a210 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d51e35092221cf095a3ff8820bba9e052a14dbbc |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/00ef35bf1f83a66ccb17099cfd96dfbcc3eaea24 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/34dad0c196cb47ab5878a68810dd250783f6012e |     
  mips64el   |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/d5e46e094b27f40e12b32624d1431bfeeb617be3 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/55da3adb3e725b50eb4746093f85a8fc6681e8c0 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/6e44d07998b1466efd0c7cc19674193a3e15c66e |     
 aarch64_be  |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/fd6bea0a977375cf7540772456adc52e042f285a |     
  aarch64    |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/82eecb29779a40204d88b12068ec53f966605fb0 |     
   s390x     |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/52bc10c13397681dedff3a249287949be2153ea9 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/3f3818bda0b8b50983e46480c6b4fca56928a232 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/7375d0ed8626ab3aa5156d01f6bb366bfd794e8b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/98b2502093f967d1e62dada4711b11cfb268b7b7 |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/77b7aa0ea91dfcdbd094c69972593e0799ba30a7 |     
    arc      |        libxcrypt-4.4.18        | NOK | http://autobuild.buildroot.net/results/287a683a362500b7ea02a9c69299e5815e23758c |     
  riscv32    |       lttng-tools-2.12.3       | NOK | http://autobuild.buildroot.net/results/8fd891005c83c3ee67196cbf43afaf4f0f4ecf64 |     
   sparc     |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/ed2306fe3aaba783f5a71f048f1b1c77bc4aa625 |     
    arc      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/ab373d14fe3fc29eac5cc81feabe0edbd564a498 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/ebb9b275f101a0f4362787dd4d9ed052400553ab |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/32cb386b0660efec04bb5ea4683337e06f05af33 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/3592a30db407bab1a8ca5aa4526b2eff97e11f0d |     
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/82fb2cd145ca0dba23daba1c05b7f5f4076acb5d |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/9791fe941d90e79331d306021c01a8ee8a68501a |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/b37d15ed8ba366bd722b42f8442277a047dea1dc |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/20a10608ac17da4695475599d290ea907d0a994a | ORPH
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f7c5492d5c8b11397b478d1d0907148a8201b772 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/05908648b14a86009bacc004a91d04d22e04494b |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/fbc345dd5778d488421f34df774eb6f709e9f077 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/ee933e7d9a2512eab9cb10c38a5ad6c61e25a6f7 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f9765e56c4ffcc538a94c4124529e6226d31404d |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/9de34b9199f82f938685df602d16d1b47326f1ca |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/baec254e642186179142dfd10f631383491fb66e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/90f74508db97eb9931431bb84ef6e210a13b954f |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/f84cec0a13b1a999cafef959010318e272363cf4 |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/a7174e1cb7123c8332c0a8928c850f9a655ec96f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/99fcbbf82be6509fc95b4381e6942abb2307255c |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9716e4eeb2499bf2612a68e85f5f973a61c41816 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/88a0ad2a0d9032c61be66a4e2c166b0205ff92f3 |     
 aarch64_be  |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/da4c884c2f136fdda3afa3ac5bd8c598b9f68fe2 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                  autofs-5.1.6 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |          autofs-5.1.6          | NOK | http://autobuild.buildroot.net/results/bc0c069fb7ed286fb68e081998bc6a644c8e6e15 |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/a8516bd11e509530f25b01dada165f8ccce98c6e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d7a259807304795bb3f0542014b7794b1311701f |     



-- 
http://autobuild.buildroot.net
