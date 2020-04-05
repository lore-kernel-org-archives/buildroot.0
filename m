From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 05 Apr 2020 06:27:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-04
Message-ID: <20200405062746.3ECF185F75@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-04
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  0  |  0  |  8  |
  2019.11.x  | 12  |  0  |  0  | 12  |
  2020.02.x  | 17  |  3  |  0  | 20  |
    master   | 138 | 58  |  0  | 196 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.64.1 | 11
psplash-fd33a9b3d68c89fa22f... | 9 
                libtirpc-1.2.5 | 6 
                   cegui-0-8-7 | 3 
                coreutils-8.32 | 2 
              host-grpc-1.25.0 | 2 
         python-markdown-3.2.1 | 2 
              bitcoin-0.19.0.1 | 1 
                  boinc-7.16.5 | 1 
                    efl-1.22.3 | 1 
      gst1-plugins-good-1.16.2 | 1 
           host-nodejs-12.16.1 | 1 
               libgtk2-2.24.32 | 1 
                   libnss-3.51 | 1 
               log4cplus-2.0.5 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.8 | 1 
   openvmtools-10.3.5-10430147 | 1 
                     php-7.4.4 | 1 
                qt5base-5.12.7 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
                       unknown | 1 
                    vnstat-2.4 | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a2e34d78eb76c7efd88303603981da445d8f4902 |     
 aarch64_be  |          boinc-7.16.5          | NOK | http://autobuild.buildroot.net/results/43d82648f9c10e351b1084277549060f55a4194d |     
 powerpc64   |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/21d9edccfa52485d7ef11229d6cabc259ce3cf37 |     
   nios2     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/389ac89b2974630d62161c6a53a9eb565184b2a0 |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ca26e36e45b580dfbb54bae91b57f231c3ad6de4 |     
  powerpc    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/c913d243ff664c193932e1d9818ea7f18af4b254 | ORPH
  powerpc    |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/529a207cbcb560d134eb23e00c15f5e22af3edf0 | ORPH
    arm      |           efl-1.22.3           | NOK | http://autobuild.buildroot.net/results/3428b9017168db9239756dc06cdaa5ae004cab97 |     
    i686     |    gst1-plugins-good-1.16.2    | NOK | http://autobuild.buildroot.net/results/cb2cfba67ad6d1a501d90c95934ee150d9d2b181 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/22d55fdec2e7736928b03c097163b8a709172d59 |     
   xtensa    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4df26d05fd177fa4992de904cb8c16e77870fc2c |     
    i686     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/a396ccbe855d0b40614006bb39d298faf76b2d4e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a6680600751e807999c3a87e5aae019aa969cdbe |     
   xtensa    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/69c52c8f10f72ef43d0ad13f12605d63526b4f50 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/66ba67775d84f655ee466bfc5fdbebec52559ad3 |     
    or1k     |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1ecb0465802ccee22bf395ba3acaf3e8b96df15f |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/49c1586f60436a170b56a8d74849d394542a2d19 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/fbefabef89b93207b7ae1dd1f6b1a4c1f5429727 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6deb28f81e095f08c9ad7bbf67411d0fe71b1748 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/08f133dc75e9cda4e7dbe978df25f5f02c27c38e |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/3e6bcbccfb6c9d27aa2994304e7ab4e1a70a70b5 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/e455a6ef521784ee766f9d15db534057bce098b2 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6568dde2d6471c0f0790e6664ae60fc3a129d196 |     
  sparc64    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/5088632074ac8cf64428579b19346b238f47c6b7 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/a66e442cd0c09ad02ae8cbe878c77e2c99057bcd |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/beef26e2da612a13bd073fbe442556899855cee9 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/f1486363f146902f67643d875f1a356641e520e5 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/54e7ed609bae0eece4397f71380e53312563a489 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/6197efa3dfb617d5d17194fe62ffc65f803fca50 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/073817229ab35d4cab25989b76c06ad4ba64b159 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/9364afc7f24ca58a7064b2d61a3669fd9dbd1d0b |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/407963a92d6f4b2b89f188084c94fb50b2946118 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/1fbb48c7da78b1b61a2c8a1b4cf70740d91324b2 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/60b3a424ecc05322cd7c677889c1e24f4d1fbdf4 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/ec8e7f2e7997dec6ab5cd1e42acee54d00b981e4 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2cd456c478f3f2a6ac645e61dea8212d0355dd72 | ORPH
  aarch64    |         openblas-0.3.8         | NOK | http://autobuild.buildroot.net/results/dc641b620bf574b4447cba9d521ac51f6e0a27a0 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b18dcb040eeea2a19780955f87fc5b136644569f |     
powerpc64le  |           php-7.4.4            | NOK | http://autobuild.buildroot.net/results/d5ca3fbe0e88cfad0a76f9361d23201f5e71f455 |     
    m68k     | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/73a216b8c501d9b790421cfde643bf4ed7a1152d |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/707fa40f0b0df15eda0b102e3d8bd22a429063f3 |     
 aarch64_be  | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/59005415c024e8c4282f509a455dc421aef5d3db |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ba203fbac8a14e3784ba92c6be56f3368a20fe0f |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/ff10b306572e890662b4fcecc49e6ca5bdd233ec |     
   x86_64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/f70780280fc4dda1edffd4450b4df778df12847f |     
   mipsel    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/296abc90c5bd50f20bf97342f0cce46b9ae7ef33 |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/2d4fc8bf456b252ff94e235dcae52c6a856ac505 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e22b27cb549ce0a52439ad1ebe71e0bda920419d |     
  powerpc    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/7167be4beb4e22404f849deda03a8e3df7a896be |     
 aarch64_be  |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/4d596f6c57d7de3949657662d88ffb986309b64f |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/d206ae71576fed644cebe36e4bd5db1c1b20f96c |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/11fe6b63b8d244a99ddd787264a240f70e894fd5 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/307c3bd57f694a8a53ce57274e5176f835ed78d4 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/a8bce3c49a8704fa3cecfd32cf23b385cd6f2a9f |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/265dd7b295f337523e88c7719b327c74457705a9 |     
  powerpc    |           vnstat-2.4           | NOK | http://autobuild.buildroot.net/results/7a3185375b8deac2b664252f456b6c5d38b62c58 |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/5d30124e181d19675ae5114be940978da22f6769 | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0a68a640ae9ba35f523d34f3db86c4bbf4817be0 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                      aarch64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498143948  |      
                   armadeus_apf51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498143977  |      
                   armadeus_apf51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498801640  |      
   atmel_sama5d2_xplained_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144001  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144019  |      
       atmel_sama5d4_xplained_mmc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498802455  |      
                bananapi_m2_ultra |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144027  |      
                  chromebook_snow |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144041  |      
             engicam_imx6ul_isiot |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144057  |      
             freescale_imx6ullevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144069  |      
             freescale_imx6ullevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498802708  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144186  |      
                    pine64_sopine |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144200  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144209  |      
                qemu_csky860_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144219  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144226  |      
             qemu_ppc64le_pseries |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144251  |      
                     qemu_sh4_r2d |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144261  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144281  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144288  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144297  |      
                      roseapplepi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144299  |      
                snps_archs38_haps |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144307  |      
   solidrun_macchiatobin_mainline |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144315  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144330  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144417  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144403  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144405  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144406  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144408  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144410  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144412  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144470  | ORPH 
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144499  | ORPH 
       TestPythonPy2Txaio |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144572  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/498144523  | ORPH 




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boinc-7.16.3 | 1 
          host-libsemanage-2.9 | 1 
                qt5base-5.12.7 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          boinc-7.16.3          | NOK | http://autobuild.buildroot.net/results/d1ad897e3289f33cd8336edf13a1d3439957ee26 |     
  sparc64    |      host-libsemanage-2.9      | NOK | http://autobuild.buildroot.net/results/28fd46a77385da81647b9a815a8d122bfa748210 |     
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/6b829c3a9e54ee7c268ea65ecb9692eac5950fea |     



-- 
http://autobuild.buildroot.net
