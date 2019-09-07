From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 07 Sep 2019 06:13:16 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-06
Message-ID: <20190907061322.CC0778821B@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  1  |  0  | 17  |
  2019.05.x  | 30  |  3  |  0  | 33  |
  2019.08.x  | 24  |  5  |  0  | 29  |
    master   | 159 | 102 |  0  | 261 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          host-capnproto-0.7.0 | 17
            wpa_supplicant-2.9 | 17
             libgpg-error-1.36 | 14
                 apache-2.4.41 | 7 
                log4cxx-0.10.0 | 7 
                  luv-1.30.1-0 | 7 
             subversion-1.9.12 | 3 
                     apr-1.7.0 | 2 
                    flac-1.3.3 | 2 
                  flashrom-1.1 | 2 
                 haproxy-2.0.4 | 2 
            host-mfgtools-0.02 | 2 
                    strace-5.2 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
         xlib_libxkbfile-1.1.0 | 2 
               capnproto-0.7.0 | 1 
                classpath-0.99 | 1 
                  cmocka-1.1.5 | 1 
                   cups-2.2.12 | 1 
                   dav1d-0.4.0 | 1 
                    ffmpeg-4.2 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
                      icu-64-2 | 1 
                 libdrm-2.4.99 | 1 
           libfreeimage-3.17.0 | 1 
                libgdiplus-5.6 | 1 
                    mpv-0.29.1 | 1 
                       unknown | 1 
                   wget-1.20.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/3726a27f10bb5ee2e76284620478f0a66f48f29d |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/61f9bc64d83b002bc50e76d7a8d8840d913607b5 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/53278bf5d081a69631c88c3366197a9256b8a1af |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/e45cbaac8bc007cd6097369c7de3e3b81c32edaf |     
    mips     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/f21d6a557105238fdd6463736191ba4f6e963075 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/c348674e18eaefb50cc4ae661c4fc7a6faf6b50f |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/ac3ad74d72d2a5dd345e9c346fa5d210298a1524 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/ebe4a7ab6b5a15ed9de7ac3c552b7d8fa5cec46c |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/bae4ad60b833968a7823bb8f0f614cbd7040481d |     
    arm      |        capnproto-0.7.0         | NOK | http://autobuild.buildroot.net/results/b2c35bc8747a30d7a1039dbaecf2932dc6ef5771 |     
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/0a59dea1ea1e0f4a42d83eb9dd30caa27d344b8d | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/4878fc54eaef92151da132ee8fc1418c508aed32 |     
   x86_64    |          cups-2.2.12           | NOK | http://autobuild.buildroot.net/results/fa50d04099814402237468e4f85c1b5693b3d299 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/412f1b759507851fe0a31d50132bf5834c175c71 |     
   x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/23d4961e2199a13d822deff9e04641b3d1703a74 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/135a17fca3ec50ef12b9587388b0bc355bfab21d | ORPH
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/9b3db5b907dc9aeb2a45ef067a2ba67b435ee9e7 | ORPH
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/987dc055fd90da58248ed097c816fe5310465dec |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/df60cdfb0491ecfab6959523529b67231eddbec7 |     
  sparc64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/02d5baae2e85b42d980cdc05fd02eab734313ee3 |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/4b8f9c7852d5847cac526e259ac79bd00607e155 |     
microblazeel |         haproxy-2.0.4          | NOK | http://autobuild.buildroot.net/results/4f378ae1d1a7a4929b08fee473b9e98d311a6fb1 |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/7875ad9eda98e1a4a17e0fe6e4f81c6786509ea7 |     
   x86_64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/510c4f9b028d88cdb746abd34de60e4ccab28438 |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/559be747e8c7cd7beb63d58bad0d94e0084a7c0b |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0043aefad54ff7ef7ee84ebc59fbdace1ffa3ff7 |     
   sparc     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/23c53e81042588689a620f191710513df9f1191f |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/f243b33a056f691612a4d44971af6b824b8ff522 |     
  mips64el   |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/be7aa7b0884c836069ef8034317ba4928a50333e |     
   sparc     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/bedfd6da81c990b44f9d1385f33f5606f8becf13 |     
    i686     |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/0ab579b0b3abfc74ca5cd005b67c521d95cab0e3 |     
  aarch64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/c2bb22f73a08081adecffb38d580d8c26c93483d |     
  riscv64    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/45add389a2a98ea378106394a093b572ab5077ec |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/641ce1c283eba903a8591e0d0c9d393b9e654919 |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/50d6eb06fb8f44816b47c8ecd3b3e6377fb3edb4 |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/80fdc1767345f8de1061108b7d773c86360cd89e |     
  powerpc    |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/230c59e020c2671643649fcdecad2f45558ddc1c |     
    arc      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/246f561de31ee5afe6410c24dd0587bb765b6bbc |     
    arm      |      host-capnproto-0.7.0      | NOK | http://autobuild.buildroot.net/results/e356734d054b1345dc5f1d28a7da42b4d32c4c37 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/183ca1bedb8a9f89f57fbdb4b1d2f19e7b1ce081 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/598a92e6debf156b2eba3f88ac007f45dbf0dc82 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/4bd4564aeae3b621cf62722038367c934ee34f98 | ORPH
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/b2c18f01fb968fc06eb9b88417023f985e153c6a |     
  riscv64    |      libfreeimage-3.17.0       | NOK | http://autobuild.buildroot.net/results/36747ebd6dbcab74963827bc95c0337a47703230 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/742c058b9b6175207d67d2f134cea2231e21dca7 |     
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/cbc44ec4b721a8b394fadd103a38e6dacfbf92b0 | ORPH
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/a9ba1582c8ccb28d9c65c5920fd8637ec778c28c | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/be4378a9dcd45d57dad75c3734a3385f8920ed42 | ORPH
  sparc64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0dedc343f580c9b2d4b9c7bbf409face29cca15a | ORPH
    i686     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/a4af4203a92e4f3580026c649e8db1a15a8a7497 | ORPH
    mips     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/2c9b609b31587fd5b871c7200cc4340de814b74b | ORPH
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/bbf7cf4b1795e1453519fedd292eee958a0b584e | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/bd8d2cd18d3f3c7bdb0edfed60ac6799de44bd38 | ORPH
   x86_64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/9850ef7463ca2d7f41937375b9c8fcb0960623e8 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/1a8e635ce1f9442be35fde482cc405dfb74d9bb5 | ORPH
  sparc64    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/91bae53d61a6f9dce06a91cf80b236abc3297cb9 | ORPH
    sh4      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/ebd0683dd1b957801d358dd61e5bec357424a2eb | ORPH
    i686     |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/b57a658c00cb73d1cfb3156ae1add842a7ccd294 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0b8287b40204afdc1223bb675f19a07599db5596 | ORPH
   nios2     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/c6d3882e7a4648f1291e86753992c24b9be27e87 |     
    m68k     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/9236d162f69daae119a5b78659a51a40dce8c2b0 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/288d028e69962e65805d715b0a54d80f676dd3af |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/8676310a2bb847fa3093b151ea81bfd8ebe54ce3 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/746ce3e8ac3d71d7c4aa5369f3746d2c3dd5e857 |     
    arc      |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/005997c44a4470302fe7442954c980989ca21967 |     
microblazeel |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/19daad13ff27b18482af48b5950bf95bd0a170a7 |     
    arm      |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/e9445e2596e93166c816ec8342fa3e1735fe7308 |     
  riscv64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/7e88da99512165f48fbed2d6763f35d647698f3f |     
  mips64el   |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/884d2b008d2af6381ac3bfe1662443304b463c57 |     
  riscv64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/77d04d965a9a9f1c18b814bfd5ee046435efc2fa |     
   x86_64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/0deb1d601401545d15c8d18b04e2b194d2471122 |     
   x86_64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/32130aa4e69a1849258b446a5791e578fa6543bb |     
   x86_64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/b9d87654290df81933660a3681266d328562f411 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/1fd109f8f1b9f2f40baeac4cc2a3d749e6813b89 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/e453ef3b50496f25670a17d373d9597cd8b59103 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/5722f898cb4ef24064935974b80209072238f512 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/882da7d2dc339600d191b675cea91f4abab0912b |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/b804f3cd934c8adf38bb483d0f253c05f753b4d1 |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9082c7b7e7ee4da1f1a797d8da1dcef6c52c4504 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/e95b5c46b3defbc3d9548735c0b4394d58511a2d |     
   mipsel    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/e1ce1e3c875044fec0e5f537d877b9391b363e11 |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/cbfc0bde1cc9b98d354b7ad6def6b8b3f2838431 |     
   x86_64    |          wget-1.20.3           | NOK | http://autobuild.buildroot.net/results/c92bcec8f6d973bcf848256006bf32ba772406f7 | ORPH
  riscv32    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/97e307de33408d34d3adf31385548e73cbff1b8e |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/95a090c8e5e61a3ca07d34180f8dc746f40a5a4a |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/543b78c20a0320044b30922d9d9664ec00c5598e |     
  aarch64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6e57de265140c8d45cfc25017fee2cb893743ea0 |     
   mipsel    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6f72a48220d8f3501f2648823b831c65c588a13c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/802bbcc8e748a9d2bc2a0e06717df05c6632b06f |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8f6ffc8611307a9292028e5b5f1e2fd4b181f777 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/1cf449568ec82517d1b403f8309a4cd8aba09d16 |     
    m68k     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/23f1f269f7f363ed233f433693c11634f534cf12 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/e9c16ba036dcc0d5430d8a3a2cb6699f515bbd31 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/59866f3deea6cad82a0658dec78a5fe721dd2f8a |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/80da7b4ce9a1f6cc88e172a30ce57e1e35f59510 |     
    arc      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/eb1819074de9c34d65fcebfdc35826b395051adb |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6dfe239c54563ffd164249057d7078ecb6e1e950 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/a7b00dd892b7df14ccb14311f48a8edc40d81ef7 |     
   x86_64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/728005b6332715cd7ff5c124837c594bd0fc32ed |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/f35265f7d8fe4a5e43bbaf426a3d959bb1d18320 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/2669318b11b7c9836080a91c180a584172d6df49 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/483bcfbd5162fb22fd413e4c08355ba81b61b953 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126211  |      
               arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126214  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126246  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126249  | ORPH 
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126255  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126282  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126286  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126288  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126292  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126293  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126321  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126320  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126326  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126331  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126332  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126334  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126335  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126382  | ORPH 
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126413  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126414  | ORPH 


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126471  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126473  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126475  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126476  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126477  | ORPH 
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126581  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/12db11af07c9345a31088747d48756975d3d7fa6 | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                gnuchess-6.2.5 | 1 
             libgpg-error-1.35 | 1 
                qt5base-5.12.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         gnuchess-6.2.5         | NOK | http://autobuild.buildroot.net/results/2209c58e3239e12f2580acc62452d51af4cf6bf1 | ORPH
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/ea337f297edd45090ff1d85ece32f5594a69157c | ORPH
 aarch64_be  |         qt5base-5.12.2         | NOK | http://autobuild.buildroot.net/results/48c63638ef1baa0f9eb087ce22fd58812df343e6 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 1 
            host-mfgtools-0.02 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                      icu-64-2 | 1 
               libsigsegv-2.12 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/244d9f0eed20d86f69fa5e24e4f1c69930a8b53c |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/068dd6d1f71df3bac75eab7d4d68b3a46da8207f |     
  aarch64    |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/c0dbe12d3a81a9dab12ceb0317585eda84fe28d5 |     
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/4faec45d50552efc05674780d2597e5ee6f61e3d | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/2578b612171b4a9aad8d476dd2c76c0b7570628f |     



-- 
http://autobuild.buildroot.net
