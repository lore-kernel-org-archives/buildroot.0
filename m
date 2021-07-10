From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Jul 2021 05:47:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-09
Message-ID: <20210710054759.70D666063A@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 18  |  7  |  0  | 25  |
  2021.05.x  | 25  |  1  |  0  | 26  |
    master   | 56  | 71  |  0  | 127 |

Classification of failures by reason for master
-----------------------------------------------

cegui-00b4e1fe174da53b7ed72... | 13
              syslog-ng-3.32.1 | 6 
                qt5base-5.15.2 | 4 
                   seatd-0.5.0 | 4 
                  exiv2-0.27.4 | 3 
                   libqb-2.0.2 | 3 
             libsndfile-1.0.31 | 3 
                harfbuzz-2.8.1 | 2 
         host-gcc-final-10.3.0 | 2 
              keepalived-2.1.4 | 2 
                libsoup-2.72.0 | 2 
                 mesa3d-21.1.1 | 2 
                    qemu-6.0.0 | 2 
                       unknown | 2 
                 dc3dd-7.2.641 | 1 
                   delve-1.5.0 | 1 
                    ffmpeg-4.4 | 1 
                   gconf-3.2.6 | 1 
                   gssdp-1.2.3 | 1 
         host-gcc-final-11.1.0 | 1 
           host-mono-6.12.0.90 | 1 
                host-odb-2.4.0 | 1 
               host-qemu-6.0.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  kexec-2.0.22 | 1 
                librsvg-2.50.5 | 1 
                    ncmpc-0.45 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
                 python3-3.9.6 | 1 
                    ruby-3.0.1 | 1 
                     tftpd-5.2 | 1 
              tpm2-tools-4.3.2 | 1 
                usbguard-1.0.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f40c397f2ff9fe8b52a09038489c6bd562a9e2a4 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d7a26c5a87b0e72466b2bad21abaf28607dc395d |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/838af9089f98a109290b45ef28b3ab61464c6dd4 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e0f9a3d47626637333e7fda7f4eaba9537f7b5a4 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/59949b66d13a75d0c9560d6ce96eec8ef4c52cbd |     
  riscv32    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/10cfe05e7d6694e15f738a0f2e9240134ff71834 |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/64a9adf1e7ef390d7dcb04b322c8a8b486db9830 |     
    mips     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4b244f8b78f2477e337805defc7012e28fb55815 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5ce0469f8b6ee8fe881d9ba91e0d51975545434f |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/299f55a20733bc64e388f5fa7e1e9c629aba171b |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/aa47bf8eeb593955367fd7976d16fbad15e3e291 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b2af78b77cc4822770074a005e61678c9de1bec9 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4d000bf3fcfe3fe11f8fa10cc5af1b83e5f03f80 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/969c32a642e4dcf05e0dbf01e89569193e6b8526 | ORPH
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/3a8ad89b5ed1c1ab1eff592ee1b12bc89430e0d7 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5cde5e522e8bf8139721929eed478d8fe92770c6 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d5238ea19162e98f79662485ed164def1332d8a1 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b68daa98c7ecdd9bb807d8c6ffa9dc220145db12 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/10e2510ce12c821fdabf15e7f112054e6f27cd1a |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5d36cdc8fee6ffa26d5c545e845ec36e378220ea |     
   mipsel    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/94a703db055dc4c41a25df35e1c49846319cfc10 |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/50747ed0a39d25337cd1f4a027e6af607244e017 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/8b7b59434f069c3b57d3d2e0fc14bb810b10dc68 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/374f76403b2ade2c32e6783d4f23147267fe77a5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dbb27ca79735c20d17f972249aedf38880ed545f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/d8f67bb2a00ac96a800728053012aefa51f2140e |     
   x86_64    |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/15d64326f5bd582c54990ee6d204fb0413bdcf55 |     
  riscv32    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d583de6d4743d0da06765ca89bd73cf128e07637 | ORPH
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/6ca0cefb5af70c636270d1ef448845dca01d6031 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5963bc1f5109eb48c79d7e7fe1096d49b358dc48 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/e57930fa3c34f23c1efb2a720b5514f4637a8d42 |     
    arc      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ac624a4e1a439cfaaa5fa2a4945ed67a5efd8ff3 |     
  powerpc    |          kexec-2.0.22          | NOK | http://autobuild.buildroot.net/results/22932529f925630ec6db3c6a4eaebbda68b3fc16 | ORPH
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/afb3ba5cb7245027a21c20035d73f97666395c76 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/283114ee683769f2055133d3d8838ff0e5635c11 |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/ff2fb6d36fe36d3f54f41f727d0fd5e0a3bffbda |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/faa7fa4725f2ec4c52d79568d835225680193207 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/407c5252e09f9724a7363d95fe451a8d90f1459a |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/ba137322468b7a781a9cd94db8a7db3aab7a3c2a |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/c8e2275ca0c92a2f347526574b8d6ed962a21301 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/2a1b9e11837ae083b279e12bff189ce605f3b567 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/a5306fc0d2ad7678afe893aae3dc08a8cc32c8bc |     
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/415ae93ba0dc1e7433549cf64d59bc9b7ed8816a |     
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/647fc2ca74e13b1f3f7e1663d8dc7382bbed286a |     
   xtensa    |           ncmpc-0.45           | NOK | http://autobuild.buildroot.net/results/aeec60153fd04f36d09c7e25d5efd83fe5e860e5 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c1c7951d63d9377fc79a10dcce0c4d40f08d4281 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8f5c1f32c837ef8f69601c711ca06c6ba4979437 |     
  riscv64    |         python3-3.9.6          | NOK | http://autobuild.buildroot.net/results/1e4808740e83d70bc3e8f956727ca017dd9509d5 |     
  aarch64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/469fb1dbafef36c11944ef543724689c1265d2af |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/15597797246e56b8f83fb0f79242f7d583f480e5 |     
    m68k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c9d7e0094ead63fe936eb9c79db1da0d42efb0f3 |     
   xtensa    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6c5726ea1545b0d76553cf47350b2e3f4715dbc7 |     
    or1k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/3595de3d7665e0df3492107cf3988976cd856992 |     
    mips     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a36dc88007c5923a83ccc68ed5660bce996493b1 |     
 aarch64_be  |           ruby-3.0.1           | NOK | http://autobuild.buildroot.net/results/1d1c04cf3151cb6685a0e04fcb5a2d0025778a2d |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/9159d53a4240be2a86ed5c78ace21c000414625e |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/640cbc76d98e8261915a582658fd11ec30b8f09f |     
  powerpc    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/8d1b75476ee0204292f64e48ca26799af4fa6d55 |     
microblazeel |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/3a2f33c41b237a42f12f584a4d56e64fb740edd2 |     
    or1k     |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/bda1a0e869a6556d3cead6197cb95c34895cb572 |     
    arc      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/24daf9bde1494345b87e86e7e0e9abdec012eb11 |     
   xtensa    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/6d2ef902c3db194e110d7b5ab01232a2daa403e7 |     
  riscv32    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/1e67fb4668ed8011385ec037a91344877f9a4036 |     
  sparc64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/620cf42fe43f9352c2c5f4764a356ae6707efa17 |     
    arm      |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/d208020943bfd65847a7ff22f047df49421ed8d5 |     
  powerpc    |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/913e8b75422c8beba60df5ea2e2c9e431364566e | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/128c211b77fedc0836780a739dcda38c145c57fc | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/05cfd01c259b6a3a9955a4b4e45987d8dd5f12b5 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/42488eccfc67bfbbf2be6f23cd383a3a923b41f6 |     
    arm      |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/ce7d265da3f8c4900e32d9840cb65d40c9f18e1b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2511ff5b753d5012c7ca9b95dcfeefe4bd663b00 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 2 
monkey-f54856ce250c4e257354... | 2 
       python-matplotlib-3.0.3 | 1 
                 samba4-4.14.4 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c3fbfb3946193c8306befde61d2ec5e1205501a3 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0496784a28244c5c4ada7d92ca765011a7d126b9 |     
 powerpc64   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/dee1884fd62322461db42c847437353d3b5dd411 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/7f25ca05db4e575d169c1b7d2997521bf5ad757d |     
    arc      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/bb0d00fdf789421a00e802fccf803021a888a1c5 |     
    arm      |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/9ef5bdbbfb50494559dc312d66a7e6580b8713dd |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3bde6a77f32214b6c9205b3e2a797d61990bf476 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

host-gdb-arc-2020.09-releas... | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/11396217f2f9038aa5febd33d0fa934978eb2823 | ORPH


Gitlab CI results for 2021-07-09
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090232  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090244  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090324  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090378  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090386  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090388  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090399  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090402  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090404  | ORPH 
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090437  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090441  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090462  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090464  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090465  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090538  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090543  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090542  | ORPH 
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1408090586  |      



-- 
http://autobuild.buildroot.net
