From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 03 Jul 2021 05:48:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-02
Message-ID: <20210703054901.439F1400FE@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 21  |  6  |  0  | 27  |
  2021.05.x  | 18  |  3  |  0  | 21  |
    master   | 42  | 66  |  0  | 108 |

Classification of failures by reason for master
-----------------------------------------------

               memcached-1.6.9 | 7 
cegui-00b4e1fe174da53b7ed72... | 6 
casync-4ad9bcb94bc83ff36cfc... | 5 
          sane-backends-1.0.32 | 5 
              libostree-2021.1 | 4 
                qt5base-5.15.2 | 4 
                   tor-0.4.6.5 | 4 
                  exiv2-0.27.4 | 3 
         host-gcc-final-11.1.0 | 3 
                 mesa3d-21.1.1 | 3 
                host-odb-2.4.0 | 2 
                    libbpf-0.2 | 2 
                    qemu-6.0.0 | 2 
             safeclib-08112019 | 2 
                       unknown | 2 
                 dc3dd-7.2.641 | 1 
         host-gcc-final-10.3.0 | 1 
        host-sentry-cli-1.57.0 | 1 
              keepalived-2.1.4 | 1 
               libfuse3-3.10.4 | 1 
                   libqb-2.0.2 | 1 
             libsndfile-1.0.31 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
                    qpdf-9.1.1 | 1 
                   seatd-0.5.0 | 1 
                    xen-4.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/f90391dfebc0d208d2582eaaa18e6384f02a6ac8 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/3eea34a7c35cb329cfde04778f1c449923d5b235 |     
   nios2     | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/39478c8c3f7a68f69ec59131fd3a42d40c47aac1 |     
powerpc64le  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/cea320ac226f8bda68d442859bf2a4ed86d849e1 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/0578ba7d8ef867d13c47354280289638122f60c0 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a0c11c3f7d360057c7c4209ab34468206d0f1121 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c89c3967b0081ca0f14f50b62a4551d6abea10fc |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/40ada7ebdea880c56998fa93f6880d0e9e3e51ce |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/cd9c6d7dbf389b9d856c2784a086567c2220916a |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8e93df1363d8dc04feda2a8eaf0918f49f98683a |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/01c8f90fd645a8085aa434820153c0f94b527c7c |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3d1b398d598161865ddf717e57962ef30fe7e904 | ORPH
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9648d23c70a1cc42b9e113978e530373f488c199 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e38f4358e752a1c931422ad25eb4914c96b647a3 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cd349965f8f5a2d5b082a1ebcecfd650ed37b45c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fff6d12985e502f963bf7f984b70f8299a24e583 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/3e299a37c13906f812e37ac1d36713a946be1810 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/eef637dfdbc4e2abcd5b34cae21fd47fa966c9de |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9b562c8406d13c14568e7ebeb80dd4dd329092d1 |     
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5a7b4806850e4adfcb081a04dfca8fce94d444f6 | ORPH
   x86_64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d396c811e82bd8d8f83f4ff019c10d7dbabd4f5e | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82dfb843e1baf1d8ec3ce315a9e2269ff65ffe54 |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4deb9ac88ea96c7f7ee89e9bea09683e943c5072 |     
    arm      |           libbpf-0.2           | NOK | http://autobuild.buildroot.net/results/420b1c6aaa998ce8b27115222a86e3e49557054f |     
    arm      |           libbpf-0.2           | NOK | http://autobuild.buildroot.net/results/ad93a7ab9ae1d22c8ee8428c5dd5344daf68e44f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5c4c57b1b5ac36a7aad4681e93161e7ea6b5e03e |     
   nios2     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/bf62f6c3b846162818f2a9d95606266e2e6a1337 |     
  aarch64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/0a05eab088f7f72c38d9527ec348ba945f260d4f |     
powerpc64le  |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/e677935e17c9ec9d3eb0914f8bc91f44b339150a |     
  sparc64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/7e09d6194223a6771a51abc67a43519de81fa957 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/d8da2fd277490143c84fc3d7db00d5c89d35b3a7 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/a94e48a53361d04fe49ad33baa60ee7e1bad3381 |     
   nios2     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f5a69e64fd4e0bfe22bd26ddf9848461aa938fe8 | ORPH
   x86_64    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/c7052366fdedff310e3675e41111a7cede791843 | ORPH
  powerpc    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e947f707c785392ed11ad8985b3ba1c046d430a3 | ORPH
    i586     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/d7de1ca70f12fad74dd2c08eee83e44472e1ac47 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/706563606aa1cccae8420a2a26c8efdffa7cbf15 | ORPH
    or1k     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/ff5e4734e0d47529d4388fbcbe204582a95bbd3a | ORPH
   sparc     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/62eceab5ce29030ba38040338364f086be9b8b03 | ORPH
  mips64el   |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/8dc055a9151039e4bce5609b173f1b9ad9e9070f |     
  mips64el   |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/8d5cd064e80e2ac15544bafde05a21d99e4580c5 |     
  aarch64    |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/69e44367ef015dd22c9a43c0489d34e14ef5abcf |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3817d163f64f7f1fbc2fe2af3edfca9e3fced14a | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9500f0274e4f35200431cdbbff278fd79f140acd |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b827d5d7bf775840c1005474795844384e7fb2de |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/f4ca5c7d6b21a72a0a5808d065f9b19a9d1f51b5 |     
    arm      |           qpdf-9.1.1           | NOK | http://autobuild.buildroot.net/results/9dc45c8c5b248258b965dab3c1bf42656851b19d |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/856a364bf651ad9d92970e630d91d17af6c1012d |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5a4b36915364c721872796b27c51faa2566e159b |     
   x86_64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/49858eb62d5ad83b3087a25dfea8d1799ab97afa |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e59e9d740a9acb9d26d545ac0b6dc7e798ad6176 |     
   nios2     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/c8c11088ac8350e2812bc8ffae5c058751737844 |     
microblazeel |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/e36e4591b3fcc5e7504401dbe8f6efd370340999 |     
   xtensa    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/c362f5e7f04608ed9dda771345dca27f7d2ec6fe |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/673e7a6af80265200df556a0c38fcfa657b58ac7 |     
    arc      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/7c64513dc7cf3fa40d3f9d8a102a20cfe4c085a3 |     
  riscv64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/39d7f87ce88fbf5ed6593d89573b3e697a958d84 |     
    arc      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/d9ec14d0b19b100b284960307c621a234c5ba8a2 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/aab64efbfa7875cbd2c88ecb8dc16c2e1df7b062 |     
  sparc64    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/22f222c4570b64b3c7114156d4a5ef62ceb44488 |     
  aarch64    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/1fec397fc7fec1e120f60a3e13e555ac803e107a |     
   mipsel    |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/5a2b0c7a4533886dc9929eda9538a5f0c2621d52 |     
    arc      |          tor-0.4.6.5           | NOK | http://autobuild.buildroot.net/results/37ce7bd321040687b80f46ba9262804bc89f8726 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b03424e8e3e7c64fe3ba649bf8b03fb48b8d96e7 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e23d2073aa1915a1fad02ee63c55a63f376461d |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/66573ad0abc4244c0dfeac8b684a7bfcc31c0d4d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 
           spidermonkey-60.5.2 | 1 
             util-linux-2.36.1 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6ab0afd7cce682006190a482af5c85f8cf7830b2 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/77ef1a865defa423676adfbb08d6ca1b8a370a2b |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9dc9c06da9294200c9ddcd69d87708e5bb9b1b35 |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/90dbb474e49e7d2eb14521ca18a05fc3daf8cbfc | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/bc5a955b1b4eea49be3224a4c33eed7a7a3271a0 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/24dbdb26411c97875febb21e1976a258bdc3f949 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
        host-sentry-cli-1.57.0 | 1 
               pipewire-0.3.26 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cde49cbc6a3020492236daaa5a6bf08a5dd63762 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9dec5dbc6f2550e0bedac4f3262e8d2536dd4e17 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/d46cc4295b5838034e63fa6d095e82810d1ceb4f |     


Gitlab CI results for 2021-07-02
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149387  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149404  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149473  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149531  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149564  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149567  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149647  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149664  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149665  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149685  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149691  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149694  | ORPH 
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149769  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149775  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149803  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149805  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149808  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149941  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149956  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391149952  | ORPH 
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1391150052  |      



-- 
http://autobuild.buildroot.net
