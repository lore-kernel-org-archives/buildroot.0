From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 05:50:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-25
Message-ID: <20210626055058.1FEED83B87@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 17  |  4  |  0  | 21  |
  2021.05.x  |  9  |  2  |  1  | 12  |
    master   | 41  | 61  |  0  | 102 |

Classification of failures by reason for master
-----------------------------------------------

           host-libselinux-3.2 | 9 
               memcached-1.6.9 | 9 
              libostree-2021.1 | 5 
                qt5base-5.15.2 | 5 
casync-4ad9bcb94bc83ff36cfc... | 4 
                libselinux-3.2 | 4 
cegui-00b4e1fe174da53b7ed72... | 3 
                   seatd-0.5.0 | 3 
  gobject-introspection-1.68.0 | 2 
                 openmpi-4.0.0 | 2 
          sane-backends-1.0.32 | 2 
               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
gli-559cbe1ec38878e182507d3... | 1 
                   gssdp-1.2.3 | 1 
        host-sentry-cli-1.57.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
omxplayer-f06235cc9690a6d58... | 1 
                openocd-0.11.0 | 1 
             safeclib-08112019 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f8b0194c028db3fbc861444db25f8eea4ba47a78 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/f71ac2f25928d28c8d3facce9313c3b31a1c5728 |     
  riscv32    | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/9a9bd16f6bbd8b4a2092055e7e58bbc2edb8a1d9 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/a02a9b9c8f430ac689d7a0a10c904e1166b1b91f |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/6bad9f1caabb2fb3c0adfa1e2cd20ba96843ddfc |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7c6754dcb71e94228b191ccaf2edc3175a681c2a |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4ba2c2151e12323bedda527619f66295c2d4cbfa |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d5ae2caacfe6a3dc13d4d4c917e9832251712297 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/16bec26342c5ca37d7e0af8fa223f8cc6346bcec |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/14bb6344919bbabc708c718b2ed50913427d081f |     
    arm      | gli-559cbe1ec38878e182507d3... | NOK | http://autobuild.buildroot.net/results/4f1dbb7cf2b071f3b92d00d13984068ef5f5b329 |     
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/fbb3bf30801d44eea4d6aa1d6a5ca275a7c463c1 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1ac33af47e9f112a6fe764c5e7352f1c7c97b09b | ORPH
   nios2     |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/b91142e45d82c4b599ad12e205ba611dbe3ebc41 |     
   mipsel    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c0e49f9ec96588795db18c4c0cf4ff71118a2108 |     
    m68k     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/3ab0d7f0b0b0d501acb51a337d52e3be403fb8fb |     
   mipsel    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/699dced4b54728a52b3f7be71bc78f8a7c799707 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/5e92977b70cdbec68d0c446477eab84394bc7e65 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/c99ef3636d1688dc9b98440ac8f2fde1743cbea9 |     
   s390x     |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/d61df7bf3d4946405c416f4adeb74a27759aae48 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/398b1608ffe2d4738af83027582b5ab592efa624 |     
  riscv64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/fc080932528127b99192fe6de52cb5b688320ff9 |     
  aarch64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/3b9d880e448f99361c1537f1f0db940826e34c8c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5f9b4f9f829cb18c6dfe7c35e52ae2aa78f27d53 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b6734cf6aeb8adc21b3186a7a7095e8f8b9c2ccd |     
  powerpc    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/78b48df57442c9edf0d7fdfdaa1735f158f4c96d |     
   sparc     |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/2dea17c03248bd0725bd02e95b1ecb35ac3486a1 |     
    arm      |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/00c58af1a5d3b11597ff9412da0bac01fee364f8 |     
  mips64el   |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/fd5a9616248f57dd687226cdb9adae875d1916bb |     
  aarch64    |        libostree-2021.1        | NOK | http://autobuild.buildroot.net/results/15be64d6fe170eb9137b1f517a993e3430c014b0 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/73df372f501c017be651317865e1c1d8c3585268 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/4d89d294c6c452f1c5e4ce87cb146183405e727f |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/62d00fc7c6fbf6b5bc6aac1536614d24a8b5e489 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/03f605a8da7587cecb204b0d57f66c3e8505d2d5 |     
 aarch64_be  |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/87bd56e232e61704cb6e2b9bd75445a521cfd087 | ORPH
  powerpc    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/e6360542a8a20b1072bb9c50c22da057cad6d7da | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/9fb2b2a658db0d2d35a95340ab9528f6ed825a8d | ORPH
    i686     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/767f40aec2592048c98274f1bc1939f965e6f41a | ORPH
  mips64el   |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/03f6e3a456922a3f45f4882654136b7190b4b202 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f394e15943bac0851c16af4a5cff2e87105c7caf | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/34cfb33cec457125a6f12d6742297a439d876999 | ORPH
microblazeel |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/f4aa38a255d0dc10ef2c67956aea6cbb3fe7550b | ORPH
    mips     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/53d579f666d9317a635d8d21f9e2f6ab3c84114f | ORPH
    arm      | omxplayer-f06235cc9690a6d58... | NOK | http://autobuild.buildroot.net/results/f81eaa186b104e4f286fcc8511745808f9564a27 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/89f85be9c0fee2b7861b9eb84709052aaa5350e6 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0be6488ea9a779ef3adfa72ed8640888f98fcd45 | ORPH
microblazeel |         openocd-0.11.0         | NOK | http://autobuild.buildroot.net/results/811c143101410f273524ac529d379b42ceea040f | ORPH
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b0add5b693a0cc3979e0262d2f57c9c9a0d04a58 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c2d62d9448551975af6bb8873b8b88da3b7378db |     
  aarch64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7c058c911708ff14f0a972ce87519b9eee5a099d |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/cfd6d6344847b907f0f291b9498abe7fc79b0164 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/608561f0b63c7519c9868b9b9f331749ecb89a09 |     
    arm      |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/e58685629c3f8c5083d601afbd4153ea4cdc2bf1 |     
  powerpc    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/e6a344e3e9312e73a267fd4255c145f946d8da29 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/46a979d562f496510d88d5f2f394a151104a497d |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/e951c7510301b1c65d3c4906691f7b5a6caa2aec |     
powerpc64le  |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/48206b3b88e187e32c557710d6f26386fd0c57ea |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/dd7c63b18c010c97752e87a68301f14f82f27eba |     
microblazeel | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/43a1fdc1c350a7db1d601c6a4632074e1a3dc026 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/22b21b36025b7275d07c74a9c19d2ef678d54ceb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a6174d2912072bbb30138671e5d0c1272bc58b63 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openal-1.20.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/5b3c743749485d6baa1f8a48f90407f77b338753 | ORPH
  sparc64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/58401f957cfa8b803a8cdc31675607d40697a6c4 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/bfd02046e8bfe8ed1f2fb9a46f0963b22503a6d3 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/80254e61dc55bc07b16b3b66710946c71b9d53bb |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
                       mongodb | 1 
                       unknown | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/08bd77a335855c5507fb2119f2ed2b081cae24e5 | ORPH
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/b8cf3ad5ada299aa783aaffaa74f5a5d535aacc9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/987d3bb911c786b28f279e1b64ca7afd4ddba754 |     


Gitlab CI results for 2021-06-25
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897550  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897631  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897645  |      
              freescale_imx8mmevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897649  |      
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897651  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897697  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897726  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897731  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897732  | ORPH 
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897804  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897806  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897809  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897898  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897912  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897909  | ORPH 
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1372897974  |      



-- 
http://autobuild.buildroot.net
