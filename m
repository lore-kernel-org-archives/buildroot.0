From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 05 Oct 2019 06:16:05 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-04
Message-ID: <20191005061613.91713883B2@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  1  |  0  | 13  |
  2019.05.x  | 23  |  1  |  0  | 24  |
  2019.08.x  | 20  |  2  |  0  | 22  |
    master   | 97  | 70  |  0  | 167 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 14
                    brltty-6.0 | 12
             subversion-1.9.12 | 12
                    bird-2.0.6 | 7 
                 mesa3d-19.2.0 | 2 
                qt5base-5.12.4 | 2 
                  uacme-1.0.19 | 2 
                 ytree-1.99pl2 | 2 
                  c-icap-0.5.5 | 1 
google-breakpad-7515ab13768... | 1 
                 host-icu-64-2 | 1 
                      icu-64-2 | 1 
              iputils-20190709 | 1 
                 libdrm-2.4.99 | 1 
                libgdiplus-5.6 | 1 
               libsigsegv-2.12 | 1 
                  libssh-0.9.0 | 1 
                   libva-2.5.0 | 1 
               log4cplus-2.0.4 | 1 
                    mpv-0.29.1 | 1 
       python-matplotlib-3.0.3 | 1 
                snort-2.9.14.1 | 1 
                    strace-5.3 | 1 
                 uclibc-1.0.31 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/887d8a65e575c7747d08f0bf2766be9556c2afb7 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/40c3889cf1f71f696b66da656f04a884f5846d7c |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/960b17a8e35e0906af7082320a330dbe04c2e4c1 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/86eed066206da21c40edb2dd8f52ddd3215ce3a6 |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/f41eed3e7c2d27e95ba83ee2c97720fe07a12fad |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/2267bdba70a4ed587177da3c54174e9d671615d8 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/3fc5b7431ddc89a3fbc4946199f61de8dacb0730 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/db9ff2276320c0c5cad0847060e39a87b91e2d09 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e5a429925d98e82cbcadadfc54f3f0fb5391109e |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b93025cf7b8812e2371b1d7bbac713895b6e6910 |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1b921b3241f46cc6c14ab7b45ede354073c88197 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3751675f8f08477b1d7b102881f584e3fd210ac5 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bf22e8885240e298fef2e7f604c92c9d892db856 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b82e94698f89f475fbf76cff9a937e825b1dacf2 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2b83ae5fff80d154038198a80ccb3a82889e9a98 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f0acf2c8577bf1ddc94037ad974f7a0b661372e1 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/533586ab8cba7283d5c82eba64f9c48371a25ef8 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0a8af89df5e283ae300a3bb06377ec1bcdbf294c |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bbcae66d73c94b40e1ef3bec1080d3c366df6be7 |     
    i586     |          c-icap-0.5.5          | NOK | http://autobuild.buildroot.net/results/a034b7130d40acb580ca0884ed3f3224dae9a17a |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/701dd5cea50e600fbc5158c8c10863d4c0c0e8a6 |     
   sparc     |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/ffa187f1fbdc5b5eac04a07a4ce8c3f2a4a7fe7c | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/5668eaa3bbeb5bfe213eb3d5ec2b927f1281e4c8 | ORPH
   xtensa    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/74097d14761f563b9369fcc26b2fbe1e6719332a |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/cf1b4b43a540653f092821b5aab65136a6828447 |     
   x86_64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/56bcfd80f201db68bbaa6213e4ced0c8c23b740d |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/173cd71d6eb2cc891a21ea3eaf87c565d50d9172 |     
   xtensa    |          libssh-0.9.0          | NOK | http://autobuild.buildroot.net/results/85e8cbc2717c57ecea08760d7997d277b9997e0a |     
   x86_64    |          libva-2.5.0           | NOK | http://autobuild.buildroot.net/results/333031898d0d8b518533aae57607359cf9be8c2c |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/938d30dd9509c81d44f92ed6a502cec4b7c25567 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/65f170a1079629cf2c4aaf6c9ca8376ec80a2d12 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/d2e4e27326e90629d4d61d70e0cc72bb16a63f2d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ede9ca40b6f0d965b1d829ac197c7ea41d02c8e5 |     
  aarch64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/63ac2b19f19f51ad2c0756ad0746824dd6dc6d9c |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/56369ed9f40fd3217d3e45318bbca81105b583c5 |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/7b550d22aef1136b5489b157fc2346f520623dcb |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/a48b95dc821244198182fe0899c5f5afe24da8a9 |     
    arm      |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/0e575f175e901cf7a792d13206ecc4bdad8e0d0f |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/925b770d4114ac4a4e67d516f79ee81b3728628f |     
    m68k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/92e18ee8e26c39691d8f26f4fd8a1121d2ec00ca |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/aeb31b2936f11700d3ac998682d9533c80f38b52 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e76a3f646a61fb776d287bcdc038de773c487578 |     
powerpc64le  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/02878296789303b2a58eaa9a0d65fb0bb9fbce2a |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/400ffaacf60d1d27d5efee566455ecf3a7731ea3 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6935bb512a6368c176bab62757aa22de5a02f45a |     
   xtensa    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/d74baf9ffab1b24e25a5694e8e84af557e56ceb8 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/512a7550106f1c236fdfed731eb5f50d39354d58 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/46475f66a489a8691a80943a6e4da18f9a1beefb |     
  riscv64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e3ad16b3fbdbbe63142421bfb7b67f206e0955c1 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f8c09d6daaf7810b951efde9cc2c6053d51b4baa |     
    arm      |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/db00e00be1ba3dfada1d30a409a3a741b2c59b0a |     
    arm      |          uacme-1.0.19          | NOK | http://autobuild.buildroot.net/results/457c6f00ec735649ae490ebaac0eb67062090e00 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/99bc93816b83cc9d086e2c9f3e9ba3992996d0fd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3a309c2d67f60422a7002bda805665519ca265ef |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/24ce1afe5a6f3e789d15ca48609b411fe8006b4f |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/649366304f681b2ba9f40d0f09399f8e2c5e98fe |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/78f289ce185efabdfd7d071b5db7867f4a9b488c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/cae5a2ca4810ee517ded42be3c138df98a2543aa |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6835b55c08c2339317f1be3830347dff713c6f95 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/bbed08a8b44529c0b5ca477793fde41d71570b6c |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f272cfd7762104c3ce8c5e7c63d808144c51874b |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/bfbf825d78d218d995028bc4b8e0f798ad5dafa6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c81b192f31fd6a3e4632021de8bd9c8f9995e1b3 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/22aa6e7325afea1781c9224de112d55713148e6f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/f1b97359756c9fa08d30afb74c6ea29a28113e1a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/35e4374ffb0679ecd5aa410accfafe2281d67e7f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7fd105981b4955bf337c4d807c54e8f58096ce64 |     
   nios2     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/8aaf5985df8096d29e24730f359fb989cee5e609 |     
    arm      |         ytree-1.99pl2          | NOK | http://autobuild.buildroot.net/results/3fb4f165de3d2a1555324dcf89b0ae8cea424b7e |     
    arm      |         ytree-1.99pl2          | NOK | http://autobuild.buildroot.net/results/63abb37229ad573014e1d743bc1c57271a41fbfe |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  brotli-1.0.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |          brotli-1.0.7          | NOK | http://autobuild.buildroot.net/results/9e126ef9431d28505626392d22941bd17942b5da |     




Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               libsigsegv-2.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  nds32le    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/3c8e5b63af155d94b55a7a471dadbe283c97e291 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

           host-harfbuzz-2.5.3 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/b162d66c9aa018b1f847bbfb73873947c5b656e1 | ORPH
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/10e13dce189f85f72cf23df6b2b21a67198bbaa6 |     



-- 
http://autobuild.buildroot.net
