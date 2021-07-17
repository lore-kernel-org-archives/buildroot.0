From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 05:49:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-16
Message-ID: <20210717054946.D2EA940143@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Autobuild statistics for 2021-07-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 10  |  6  |  0  | 16  |
  2021.05.x  | 18  |  6  |  0  | 24  |
    master   | 42  | 50  |  0  | 92  |

Classification of failures by reason for master
-----------------------------------------------

          host-nfs-utils-2.5.4 | 6 
         host-gcc-final-10.3.0 | 4 
                   seatd-0.5.0 | 4 
         host-gcc-final-11.1.0 | 3 
                libsoup-2.72.0 | 3 
                  exiv2-0.27.4 | 2 
             libsndfile-1.0.31 | 2 
                    qemu-6.0.0 | 2 
                qt5base-5.15.2 | 2 
              tpm2-tools-4.3.2 | 2 
cegui-00b4e1fe174da53b7ed72... | 1 
                   eigen-3.3.7 | 1 
          gstreamer1-mm-1.10.0 | 1 
                host-go-1.16.5 | 1 
               host-qemu-6.0.0 | 1 
        host-sentry-cli-1.57.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libfuse3-3.10.4 | 1 
          libmodsecurity-3.0.5 | 1 
                   libqb-2.0.2 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.1.1 | 1 
                  mupdf-1.16.0 | 1 
                  ndisc6-1.0.4 | 1 
               nfs-utils-2.5.4 | 1 
                 pixman-0.40.0 | 1 
                   trinity-1.9 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6a1291692c8033a6edc8bedec7f8eb9b1e2ffaae |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/3061467718faa18d640dc14c8a828551b35494d7 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/07824cc91916d29ea6dfa401938be12044997f9f |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f884141aa5d405878a5dcfa3dde428c0c7eaaf15 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ba3a024a30cd9212ee450c52d66dc1fa3f8dfbcf | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2f197aa10b79d7816fd8abd741af21b5dca49cfd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6547e51ac01b59e08ccd659061658111e8e16e30 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4e7c3485b2ce4cdd1a629f3525e8c299fb498603 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0f1175027e10b00f7882c6643d7b6156d3196692 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/69e62f7b0338926efe2e3e2d7ffd7ae5bce5a54e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/e3017994c8263c7af85307e11575d22088655c8b |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/24cdcbfc2f7c68471f018e79773d6b79f21abd6e |     
  mips64el   |         host-go-1.16.5         | NOK | http://autobuild.buildroot.net/results/47eded78bbdd65f3805d774214d0cd315c7cd1bb |     
   nios2     |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/dbbcacc4d406eae1fe176c4c4f4342d6f303b70c |     
    or1k     |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/a77fea41623f15d978af871939beb23d2274f00a |     
    arm      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/a5eaf19f58729c4c00a2131b6a0c378c0fc0effb |     
    arm      |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/6fee530fcb50c8186bb4431f3b674bea5024410f |     
    or1k     |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/82a2cfcc18cae12906db919c39eb65e793384d23 |     
microblazeel |      host-nfs-utils-2.5.4      | NOK | http://autobuild.buildroot.net/results/56f2fb501c5981f8f00e2bf2cd24317d090ba91a |     
  riscv64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/c76acea7fcbbd1639651de45830417065ef77c39 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/753dc6d53d00d46648e0fda10b21f17e6d30242d |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/976281f214e6ccfa978d7992b4b6e80af3492ddd |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/02af82de3389f538d0360c82fd702d64700bfd3f |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4c639fd967faa06f8ae362bacd38f3409c47267c |     
   xtensa    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/487ec82001650104300db3c7876f7403b4c3ec9c |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/39a444bbf8a69ebc701112522d7d182891d5a81a |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/4f64c74b431bb050026be0ceca64ebed309addec |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/46427ca07746b1795e4867fa6c9cb9474b25c05d |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/eb793455ebbf3544cea2d7388f9f95eb115a3cc8 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/6d312cbdf43c683fe0ae4ef3f2bca5ef9b50f8b0 |     
    i686     |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/5583c5cbdcf887f429bc571c20932a448863d34d |     
    mips     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/168f181c231a6174352e829e1110dba34b4ec549 |     
   mipsel    |          mupdf-1.16.0          | NOK | http://autobuild.buildroot.net/results/9089594c11928b4b9b8d3b6da6030757e6945d6e |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/06015dec01cfe613a5f6423ecc6ff4c6f3cc73b3 | ORPH
   nios2     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/510b3425943f2e31b024c99b3552419a80c2f9f3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fbe57e012674d33972f045622c1358b66dacb861 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/49fb925b0399b2f2009375e3c38aa60ef0d4de7e |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/fdc0ddc26d2c40b979a646f8e936dc1eb7b9dc97 |     
   mipsel    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e6a9aa40200865491c46bbf07c75a2a9794b0bb2 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/e3d572474c5e0b1b8531d266c201df544e990eb5 |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/ad5020c5c1a7730f1ae82bf8215ed63df83421fe |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/a6cf8c78a126b3f3b7f2771c523cd2fcdfd65867 |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/f76572f68ea261ef86c8e6e67a03e65071833594 |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/c0618f179b7444d9c3e7f786426523ea116e720f |     
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/fc34f6478384403f61585567070635d9fc378e49 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/feb9bf67d89f2c811efb8a1880094d4a52447cdf | ORPH
  powerpc    |          trinity-1.9           | NOK | http://autobuild.buildroot.net/results/c58119baed8d7711da799e34a5ee1117f46b96f4 | ORPH
   xtensa    | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/e69785b814cc2ae35bdbccb5c3962c6b99f73575 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7c475f1ebc0437d0f03534be0ce0202d66f79ad6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/719cd70ee6a718eb2d980ec0dd3d6736a7b9ab85 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

azure-iot-sdk-c-LTS_07_2020... | 1 
                  gensio-2.2.3 | 1 
monkey-f54856ce250c4e257354... | 1 
                mono-6.12.0.90 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/4ace5b8d496c87c423bcd999dcf35266828ccd55 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/c031030224bbc409c88e57edcbe7b5dc1a0af995 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c7f21b0940df68d5ccbdfa6c0f737d3341b0c1ca |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/252e2a93b675fce5ee26ad43776356508c298561 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/080b2c68741f5da29ee42502831bcd62ec4d8959 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9cf12cfb517ab551085c284c07ba325c6081556c |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                       gdb-9.2 | 1 
               luasyslog-2.2.0 | 1 
                  ndisc6-1.0.4 | 1 
                 pixman-0.40.0 | 1 
                      tar-1.34 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7a5d7e62476d41b4cf018741bd05dae681e52606 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/65b957f1f4debc2bb23b2e0b682dc8d1742e9432 | ORPH
  aarch64    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/25ab5b9f8729c9d65b7b1e73ed95dfcbdafd74cd |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/30026475b8443d227bdae035b606d7963c3e8522 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/82a13fd41b74bb4d70744aaa07cd7629a86cb11c |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/036334425d3fbb1ff14c47070b2ab0122d1b55ce | ORPH


Gitlab CI results for 2021-07-16
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125093  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125102  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125200  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125227  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125332  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125357  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125360  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125391  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125399  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125403  | ORPH 
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125472  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125480  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125505  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125508  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125510  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125613  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125627  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125624  | ORPH 
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1426125722  |      



-- 
http://autobuild.buildroot.net
