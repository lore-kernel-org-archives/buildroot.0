From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Sep 2019 06:13:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-15
Message-ID: <20190916061411.C07FA20535@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-15
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  6  |  0  | 24  |
  2019.05.x  | 20  |  4  |  0  | 24  |
  2019.08.x  | 11  |  8  |  0  | 19  |
    master   | 114 | 77  |  0  | 191 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 apache-2.4.41 | 17
            wpa_supplicant-2.9 | 8 
             subversion-1.9.12 | 6 
                    ffmpeg-4.2 | 5 
           host-harfbuzz-2.5.3 | 3 
            host-mfgtools-0.02 | 3 
                      icu-64-2 | 3 
                 libdrm-2.4.99 | 3 
                log4cxx-0.10.0 | 3 
                     apr-1.7.0 | 2 
                classpath-0.99 | 2 
            python-sip-4.19.13 | 2 
                  flashrom-1.1 | 1 
                  gnutls-3.6.9 | 1 
                 haproxy-2.0.5 | 1 
           host-nodejs-10.16.3 | 1 
                libgdiplus-5.6 | 1 
                   libnss-3.46 | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
           lttng-libust-2.10.1 | 1 
                    luksmeta-9 | 1 
                  luv-1.30.1-0 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    qemu-3.1.1 | 1 
                qt5base-5.12.4 | 1 
          shairport-sync-3.2.2 | 1 
                snort-2.9.14.1 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b8d2eab2806506882afe3be6a0caafc5c75c203a |     
    m68k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/7df6089c57b220c12c0b52bbf36f020bda0c1d43 |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/b50808d499b231c130b16613cb68769fec20fb35 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/89edeceff80448d2b838d8cd30c6efe3c9d06f8b |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/26c7f7b7b659a8d71d9e1f30193fad0a431d08c9 |     
    sh4      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/6d3e4f0b09fdac7118e5920d4f61a756fef23a6b |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/08a280d9f87699761818539c790ed0f2218eef6a |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/56b3c91fea1bd2b20c9612e7766f3cfa0e104411 |     
   mipsel    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/567b3644e12fd4344a1a3d934109394ecd60ae31 |     
   nios2     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/4107eb40bb8bd8f0b7ffde6c073ee8900c60fc57 |     
  riscv32    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/16f661de283d3f39115bd16227197ce902c4be5d |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/eae24d85725864656131d32480d30dc9c9dc797c |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/50e396b7e711a08b011d6a65cab49db917988489 |     
microblazeel |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/63a5d5641b8e5308d1279b75add0a48099a11c9c |     
  powerpc    |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/75ece500b0223945fe8a4951f7e0b4637d095315 |     
    arc      |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/060e8dc1850688d56e60fb1cb9e377bd587def24 |     
    or1k     |         apache-2.4.41          | NOK | http://autobuild.buildroot.net/results/5f8b17a784c282a6abdc35663cb028e44b626450 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/31fa49bb9952b487d146b359f0e6c520c2f6dbe7 |     
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/f04a538488ab0a1d2b874733c11821c59e293d94 |     
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/7cfea8150786218f3d0464ed470d25180468de62 | ORPH
  mips64el   |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/a4e60514aca6be6f8ca608579526d5d9854374cd | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/14e9674289bd1d68c731b28df88ac3b7a256d372 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/ba470b9aa13c7b383cc3b51b1d377752f22fb58f |     
   x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/81504fa5a16fe0b1821121e6807349b3eac82a30 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/31d1a29ab37c58b1516c6281e5ff0fa1f0d85d46 |     
   x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/4949ab8c439a0bcf810d94c710fde6eb809ded47 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/f3b043a1e670b7fb87432c484c42a82cd68cf918 |     
   x86_64    |          gnutls-3.6.9          | NOK | http://autobuild.buildroot.net/results/f1af2a6ee6c3acae8500f2876508247bd703d4b7 |     
microblazeel |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/fd11e5bc053c24ac249f8a3eaaa8377de717fc02 |     
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/955efdb36d22daaae1d8b0e28c9699cd541d1ce4 | ORPH
  riscv32    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/3771d85ef51722d6b2b1c4e17646ba93b93d6311 | ORPH
  riscv32    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/339c29989af768c162d07c10d40208c92c606309 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/fba1d80cae1b35288a0bf648d0ec933451f54b78 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/a521ebd8c5292bf5876399aba475801b6e6a322e |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/35aa7817b435fcf3d83b8526620d4ec7e3551a80 |     
    arm      |      host-nodejs-10.16.3       | NOK | http://autobuild.buildroot.net/results/042593d0cae5b69d524730276efea59aadeb628d |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/975a3ea12b9f604755ceb10f9a92a463f2781e28 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/701b2a02c131e47cf39dc171f6dddf3b1d77ba01 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/427fd471e97f2fd14ff650c70631ff3fb248857d | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/a91d1acb84c63dcff7324dcb8e4f28bc5a04d883 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/1280704ec5ac3391dff145775c9ea12ed5060324 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5182ce6ac2357c533c530695705d8d09fc54edc5 |     
microblazeel |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/1cd0e1871702ee4ff3817a12e45c6d983313a6e8 |     
 aarch64_be  |          libnss-3.46           | NOK | http://autobuild.buildroot.net/results/12a6757954cbb3f873c0c493bd77925cf6839f3b |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/760cf6814615bfe2f0c1928addbed41dd1dcf0f0 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/1b2e65c573b7bf10806aadd7c35e1aa8a0f7b91b |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/390ab31eccdd5a9a9fdc6e05a1922ccdbd1d6cc1 |     
    mips     |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/773f79067b54fac988813218a4badeec14bab805 |     
   xtensa    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/eee8999d9796fbb58cff5d0ad7b93a3fe5bf4497 |     
   mipsel    |         log4cxx-0.10.0         | NOK | http://autobuild.buildroot.net/results/41e0cf6bcaffed3e43d5e726474e53ce93c9f662 |     
    arm      |      lttng-libust-2.10.1       | NOK | http://autobuild.buildroot.net/results/d6e029fa147744ec2fdc1808b0988be8f2c671ed |     
    arc      |           luksmeta-9           | NOK | http://autobuild.buildroot.net/results/a6247b95f1578fe1daec485589582310c75b5d84 |     
    i586     |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/1e860887488375533c2bba007f8eb262c165abc0 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/a7f72d0795556bb67efaa55b721a713b57ce2256 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/5134f60fbc219ae6cc3a69fc60f7a97f12ce3331 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/66eb8763888d456b4c8306a3fe612a40b0156c29 |     
  aarch64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/d6a7df01e6dc891859209cec66dfd6d43c5bdfb0 |     
  riscv64    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/570efe922566274b4fb325860141c96b14b44e69 |     
  aarch64    |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/8c375749dcccfbbe0025eeab104670e4d5afeb9d | ORPH
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/07a1f1a7844ee0a6ca7af272a5c86f3ed32ae992 |     
    arm      |      shairport-sync-3.2.2      | NOK | http://autobuild.buildroot.net/results/9b1123119cdfb323b4af0558013274d43dbce6e8 |     
 aarch64_be  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/ac408ce130444fd6951c170a35f742d84d18fa30 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/bf5e5438f8391c6e79e5943158cb6267184b5188 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/ad5fe79a94425571bab78257d136b95eff2e5921 |     
    or1k     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/8df781df97bd415bec6cd9708e90987166e52f01 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/3d95273c313b13e0a4355921a7bc0d761d8a6463 |     
    arc      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/af9d3ebaac0a2ffb7fa75ab4c5af8f9797f2b0da |     
    sh4      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/9953dc30e73c41d33f435ce118f5e00b3ade476d |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/33a41b31f8f1af02f857571120e4c919c391f8c5 |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/642859eeaa9b443b217d6d20268bc3c0dbc08bd1 |     
   xtensa    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/8661744cf6b0ba5fac4966b4baf6e7bb2eb73c4b |     
  riscv64    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0057fb844a96474750a32b13bdc39cbbefc902b0 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/d162e538fe5c0a166253aa2c3b7995d8c748e15a |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/6d973ed5529ee3949f8dd204f50c46b80a1d6d1f |     
microblazeel |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/583dbfbe215c651222aa987bba0fa2157c446d1c |     
powerpc64le  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/090ed208b39a72c09eb0941562586b2496c0b2f0 |     
  riscv32    |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/db51dc68d50df7d9bcedf7bca52f172cb3cbe582 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369104  |      
                        bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369139  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369142  | ORPH 
        engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369148  |      
                 imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369174  |      
                       imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369178  |      
                        imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369180  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369184  |      
               linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369185  |      
                    orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369215  |      
                   orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369214  |      
                 orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369220  |      
                    orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369225  |      
              orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369226  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369228  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369229  |      
                    raspberrypi0w |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369275  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369279  |      
                            warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369307  |      
                        warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369308  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369354  |      
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369355  |      
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369357  |      
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369358  |      
             TestSyslogNg |  https://gitlab.com/buildroot.org/buildroot/-/jobs/295369456  |      




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.33 | 4 
           host-mfgtools-v0.02 | 1 
                    qemu-3.1.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/988cb635a90d6770c562879df1e3bcb91cbef9ea |     
    arm      |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/8ea8037f172f1fd4a56b1a55f8c9872b2b89307b | ORPH
   nios2     |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/9729d6ac796dddd66e60a3d2704196e892029e3a | ORPH
    arm      |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/36afb78c868f09291198d16cb4388a26b341fc49 | ORPH
    i586     |       libgpg-error-1.33        | NOK | http://autobuild.buildroot.net/results/08c1f7209057cc2855521909ead968ff769a886b | ORPH
   x86_64    |           qemu-3.1.1           | NOK | http://autobuild.buildroot.net/results/bf2fa3a149eb6cdfae1b234a2f45d4f43369ba4e | ORPH


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.35 | 2 
                classpath-0.99 | 1 
           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         classpath-0.99         | NOK | http://autobuild.buildroot.net/results/02d294be9c60dda626f107d0a7cd728ca389e35d | ORPH
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/8159f81b4f915b2f686d13dee0961439817a7cf1 |     
    m68k     |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/fe909d2c9513892cdaa04fa1eb293fb13eb793d7 | ORPH
    arm      |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/be82abe46a3f20593c77f8cf18627fc477e1a58b | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
               wireshark-3.0.2 | 2 
                 libdrm-2.4.99 | 1 
               libupnpp-0.17.1 | 1 
                suricata-4.1.3 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3fd54f61bb20ac3c217bc92e41f1c22f4cf01bb8 |     
  mips64el   |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/388bd0952980363ce4ea02e80adb59a7198f3ab7 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/a72e32218f171a15887086d095d7129348caa164 | ORPH
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/50256b1ae644821b4d3979a36db3e1d4b92d62b9 |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/3b51a54fc5b35fd0b5c46d003c319cb9865afc31 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b40753dc8623310e05ecfc92de5582eb767beea |     
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/d899d077460aa31cbb32c0934d71115846fd780f | ORPH
  powerpc    |        wireshark-3.0.2         | NOK | http://autobuild.buildroot.net/results/5a34871e009be63af752e9952c4b82bad537ee47 | ORPH


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           4th |  DISTRO  | https://release-monitoring.org/project/20471 | 3.62.5       | 3625         |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20190816     |     
                         acpid |  DISTRO  | https://release-monitoring.org/project/00019 | 2.0.30       | 2.0.32       | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.0       |     
                  afboot-stm32 |  DISTRO  | https://release-monitoring.org/project/21875 | 0.1          | 0.2          |     
                       alljoyn |  DISTRO  | https://release-monitoring.org/project/21665 | 16.04.00a    | 16.10.02     |     
                   alljoyn-tcl |  DISTRO  | https://release-monitoring.org/project/21666 | 16.04.00a    | 16.10.02     |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r2    |     
                         argus |  DISTRO  | https://release-monitoring.org/project/00107 | 3.0.8        | 3.0.8.2      | ORPH
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.700.2      |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.0       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-07-01   |     
                  b43-fwcutter |  DISTRO  | https://release-monitoring.org/project/00152 | 015          | 019          |     
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                       bcm2835 |  DISTRO  | https://release-monitoring.org/project/21323 | 1.48         | 1.60         |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                         bdwgc |  DISTRO  | https://release-monitoring.org/project/17108 | 8.0.0        | 8.0.4        | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.6-P1    | 9.15.3       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.32         |     
                          bird |  DISTRO  | https://release-monitoring.org/project/00192 | 2.0.4        | 2.0.6        |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.1        | 3.4.2        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.18.1       |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                         boost |  DISTRO  | https://release-monitoring.org/project/06845 | 1.70.0       | 1.71.0       |     
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                        brltty |  DISTRO  | https://release-monitoring.org/project/00220 | 5.6          | 6.0          |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.2.2        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                        c-icap |  DISTRO  | https://release-monitoring.org/project/21325 | 0.4.2        | 0.5.5        |     
                c-icap-modules |  DISTRO  | https://release-monitoring.org/project/21326 | 0.4.5        | 0.5.3        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.38.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.38.0       |     
                        ccrypt |  DISTRO  | https://release-monitoring.org/project/14496 | 1.10         | 1.11         |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                chocolate-doom |  DISTRO  | https://release-monitoring.org/project/08547 | 2.3.0        | 3.0.0        |     
                    cifs-utils |  DISTRO  | https://release-monitoring.org/project/00287 | 6.8          | 6.9          |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.14.0       | 0.15.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.3       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  DISTRO  | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.0          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.1        |     
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.2.12       | 2.3.0        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.25.4       | 1.25.5       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.7.0        | 2.8.0        |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                   dbus-python |  DISTRO  | https://release-monitoring.org/project/00402 | 1.2.8        | 1.2.12       | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 7.2.2        | 8.0.6        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.7      | 19.03.2      |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0-rc.0   |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.7      | 19.03.2      |     
                       doxygen |  DISTRO  | https://release-monitoring.org/project/00457 | 1.8.14       | 1.8.16       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  DISTRO  | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | v18.32       | 21.27        | ORPH
                           dtc |  DISTRO  | https://release-monitoring.org/project/16911 | 1.5.0        | 1.5.1        |     
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.1        | 3.0.6        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 16           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.2       | 1.22.4       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.08        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.22         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.22.4       | 0.23.0       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.0.7       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.0        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.20       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.0.0      | 2.5.1.0      |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.1       | 0.27.2       |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | v1.11.0      | 1.12.0       |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.0.rc1    | 6.4.0.rc4    |     
                        ffmpeg |  DISTRO  | https://release-monitoring.org/project/05405 | 4.2          | 4.2.1        |     
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | fio-3.9      | 3.15         |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.9        | ORPH
                          fltk |  DISTRO  | https://release-monitoring.org/project/00823 | 1.3.4        | 1.3.5        | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.10.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | V18.09.00    | 19.08.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.3.1        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.39.2       | ORPH
                     gengetopt |  DISTRO  | https://release-monitoring.org/project/00892 | 2.22.6       | 2.23         |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
                        gflags |  DISTRO  | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.22.0       | 2.23.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.62.0       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.60.0       | 2.61.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                          glog |  DISTRO  | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                      glorytun |  DISTRO  | https://release-monitoring.org/project/21354 | 0.1.0        | 0.1.3        |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.12.9       | 1.13         |     
                         gperf |  DISTRO  | https://release-monitoring.org/project/01237 | 3.0.4        | 3.1          | ORPH
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  DISTRO  | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.18.0       | 1.24.0-pre1  |     
                         grub2 |  DISTRO  | https://release-monitoring.org/project/01257 | 2.02         | 2.04         |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.0       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.0       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.0       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.0       | ORPH
                    gst1-shark |  DISTRO  | https://release-monitoring.org/project/21854 | v0.6.0       | 0.6.1        |     
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.0       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.8.1        |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.42.0       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.6        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.1        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.8       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.327        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.7       | 2.0.4        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.28.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-rc        | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-64     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 18.4.1       | 19.2.4       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 18.4.0       | 600.0132     |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 18.4.0       | 19.3.pre3    |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  DISTRO  | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.18         | 0.20         |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.90         |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.4        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.62         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.4-Leia    |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 1.1.0        | 2.0.1        |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 1.2.0        | 2.0.1        |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 1.1.0        | 2.0.1        |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.5.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.2.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.7.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.0-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.4-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                       leveldb |  DISTRO  | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                       libbson |  DISTRO  | https://release-monitoring.org/project/09537 | 1.9.4        | 1.9.5        |     
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.25         | 2.27         |     
                        libcec |  DISTRO  | https://release-monitoring.org/project/21468 | 4.0.2        | 4.0.4        |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.1.2        | 4.2.0        |     
                      libcroco |  DISTRO  | https://release-monitoring.org/project/11787 | 0.6.12       | 0.6.13       | ORPH
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                     libdvbpsi |  DISTRO  | https://release-monitoring.org/project/21684 | 1.3.2        | 1.3.3        |     
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.1       | 2.00.5       | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                      libevdev |  DISTRO  | https://release-monitoring.org/project/20540 | 1.7.0        | 1.8.0        |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.6.2        | ORPH
                     libgcrypt |  DISTRO  | https://release-monitoring.org/project/01623 | 1.8.4        | 1.8.5        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.2        |     
                    libgeotiff |  DISTRO  | https://release-monitoring.org/project/21361 | 1.4.3        | 1.5.1        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.60.7       | 2.62.0       |     
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.17       | 1.0.18       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.22.30      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                 libhttpparser |  DISTRO  | https://release-monitoring.org/project/10989 | 2.9.0        | 2.9.2        |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libinput |  DISTRO  | https://release-monitoring.org/project/05781 | 1.14.0       | 1.14.1       |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.16.2       | 1.17         |     
                       libldns |  DISTRO  | https://release-monitoring.org/project/14817 | 1.7.0        | 1.7.1        |     
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libloki |  DISTRO  | https://release-monitoring.org/project/21486 | 0.1.7        | 03.07.2005   |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.18.2       | 1.20.0       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.3        | 1.1.4        |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 1.8.0        | 2.0.0        |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                     libostree |  DISTRO  | https://release-monitoring.org/project/10899 | 2018.9.1     | 2019.3       |     
                        libp11 |  DISTRO  | https://release-monitoring.org/project/01699 | 0.4.9        | 0.4.10       |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | v0.91.171102 | 140214       |     
                       libpfm4 |  DISTRO  | https://release-monitoring.org/project/21491 | 4.9.0        | 4.10.1       |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.2.5        | 6.4.5        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libraw |  DISTRO  | https://release-monitoring.org/project/01709 | 0.19.2       | 0.19.5       |     
                      libroxml |  DISTRO  | https://release-monitoring.org/project/21687 | 3.0.1        | 3.0.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.46.0       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                     librtlsdr |  GUESS   | https://release-monitoring.org/project/15172 | 0.6.0        | 0.7.0        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.0        | 2.4.1        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.1       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.8.5        | 1.9.0        |     
                      libtasn1 |  DISTRO  | https://release-monitoring.org/project/01734 | 4.13         | 4.14         | ORPH
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.8.4        |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.10.2       | 0.11.1       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                        libv4l |  DISTRO  | https://release-monitoring.org/project/09998 | 1.16.6       | 1.16.7       |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.1        | 8.8.2        |     
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 2.4.2        | 3.2.0        |     
                        libwpe |  DISTRO  | https://release-monitoring.org/project/17789 | 1.2.1        | 1.3.91       |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.3        | 0.8.4        |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.03      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.1        | 0.2.2        | ORPH
                         links |  DISTRO  | https://release-monitoring.org/project/01822 | 2.20         | 2.20.1       | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
                    liquid-dsp |  DISTRO  | https://release-monitoring.org/project/14535 | 1.3.0        | 1.3.2        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.03.06   | 2019.08.28   | ORPH
                         lldpd |  DISTRO  | https://release-monitoring.org/project/14019 | 1.0.3        | 1.0.4        |     
                lockfile-progs |  DISTRO  | https://release-monitoring.org/project/10135 | 0.1.17       | 0.1.18       | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  DISTRO  | https://release-monitoring.org/project/01844 | 4.91         | 4.93.2       | ORPH
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.10.1       | 2.10.5       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.10.6       | 2.10.11      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.10.5       | 2.10.7       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                   lua-cqueues |  DISTRO  | https://release-monitoring.org/project/11726 | 20190731     | 20190813     |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.16      | 10.4.8       |     
                            mc |  DISTRO  | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.17       | ORPH
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 19.0.8       | 19.2.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 19.0.8       | 19.2.0       |     
                         meson |  DISTRO  | https://release-monitoring.org/project/06472 | 0.51.1       | 0.51.2       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.0       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.8.2        | 2.8.9        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  DISTRO  | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  DISTRO  | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.10.4       | 1.10.6       |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.6       | 4.3.0        |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.0.0.334    |     
                     mosquitto |  DISTRO  | https://release-monitoring.org/project/06078 | 1.6.4        | 1.6.5        |     
                     mpdecimal |  DISTRO  | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.1.1        | 3.2.0        |     
                         msmtp |  DISTRO  | https://release-monitoring.org/project/02024 | 1.8.3        | 1.8.5        |     
                         mtdev |  DISTRO  | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          mxml |  DISTRO  | https://release-monitoring.org/project/13545 | 3.0          | 3.1          | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.34         | 0.35         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20190914 | ORPH
                        ndisc6 |  DISTRO  | https://release-monitoring.org/project/21531 | 1.0.3        | 1.0.4        | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.2       | 1.21.1-dev   | ORPH
                          newt |  DISTRO  | https://release-monitoring.org/project/15129 | 0.52.20      | 0.52.21      | ORPH
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.2        |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.1       | 1.17.3       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                         ngrep |  DISTRO  | https://release-monitoring.org/project/02084 | 1_47         | 1.47         |     
                   nilfs-utils |  DISTRO  | https://release-monitoring.org/project/02091 | 2.2.7        | 2.2.8        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16k          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 10.16.3      | 12.10.0      |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.10       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.129      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.7          | 1.9          |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                       omniorb |  DISTRO  | https://release-monitoring.org/project/21545 | 4.2.2        | 305          |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2rc2     | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 10.3.10      |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.5.0        | 3.6.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.5.0        | 3.6.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.17       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.30       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.17      | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.40.14      | 1.44.6       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.3       |     
   perl-class-method-modifiers |  DISTRO  | https://release-monitoring.org/project/06735 | 2.12         | 2.13         |     
               perl-date-manip |  DISTRO  | https://release-monitoring.org/project/02785 | 6.77         | 6.78         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
         perl-devel-stacktrace |  DISTRO  | https://release-monitoring.org/project/11840 | 2.03         | 2.04         |     
               perl-file-slurp |  DISTRO  | https://release-monitoring.org/project/11852 | 9999.26      | 9999.28      |     
              perl-http-daemon |  DISTRO  | https://release-monitoring.org/project/02975 | 6.01         | 6.06         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.55         | 0.56         |     
                perl-mailtools |  DISTRO  | https://release-monitoring.org/project/10540 | 2.20         | 2.21         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.22         | 8.24         |     
                  perl-net-dns |  DISTRO  | https://release-monitoring.org/project/03147 | 1.20         | 1.21         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                perl-role-tiny |  DISTRO  | https://release-monitoring.org/project/10665 | 2.000006     | 2.000008     |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                        physfs |  DISTRO  | https://release-monitoring.org/project/03631 | 3.0.1        | 3.0.2        |     
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 68           | 71           |     
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.3        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.80.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 5.0.1        | 6.2.0        |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0-rc1   |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | v5.1.0       | 5.4.0        |     
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 12.2         | 13.0         |     
                            pv |  DISTRO  | https://release-monitoring.org/project/03736 | 1.6.0        | 1.6.6        | ORPH
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a0      |     
              python-alsaaudio |  DISTRO  | https://release-monitoring.org/project/10072 | 0.8.2        | 0.8.4        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.10.0       | 0.15.2       |     
                  python-attrs |  DISTRO  | https://release-monitoring.org/project/15099 | 18.2.0       | 19.1.0       |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.8.1       | 19.9.3       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.6.0        | 2.7.0        |     
python-backports-ssl-match-... |  DISTRO  | https://release-monitoring.org/project/11988 | 3.5.0.1      | 3.7.0.1      |     
                 python-bcrypt |  DISTRO  | https://release-monitoring.org/project/09047 | 3.1.6        | 3.1.7        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.5.3        | 4.8.0        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 3.1.5        | 3.1.6        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.13      | 0.12.17      |     
        python-cached-property |  DISTRO  | https://release-monitoring.org/project/06048 | 1.4.0        | 1.5.1        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2019.6.16    | 2019.9.11    |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 5.10.0       | 6.5.8        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.2.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
                python-couchdb |  DISTRO  | https://release-monitoring.org/project/09473 | 1.1          | 1.2          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.9.1       |     
              python-cssselect |  DISTRO  | https://release-monitoring.org/project/11593 | 1.0.3        | 1.1.0        |     
               python-cssutils |  DISTRO  | https://release-monitoring.org/project/13259 | 1.0.1        | 1.0.2        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.29.1       | 0.43.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.0.11       | 4.4.0        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.0.1        | 3.4.0        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.4        | 3.0a1        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 3.5.1        | 4.0.2        |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.3.1        | 2.4.0        |     
                   python-dpkt |  DISTRO  | https://release-monitoring.org/project/10497 | 1.8.r98      | 1.9.2        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13         | 0.13.2       |     
                   python-fire |  DISTRO  | https://release-monitoring.org/project/21700 | 0.2.0        | 0.2.1        |     
                  python-flask |  DISTRO  | https://release-monitoring.org/project/03867 | 1.0.2        | 1.1.1        |     
            python-flask-babel |  DISTRO  | https://release-monitoring.org/project/20024 | 0.11.1       | 0.12.2       |     
             python-flask-cors |  DISTRO  | https://release-monitoring.org/project/19867 | 3.0.3        | 3.0.8        |     
            python-flask-login |  DISTRO  | https://release-monitoring.org/project/03868 | 0.4.0        | 0.4.1        |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
                     python-h2 |  DISTRO  | https://release-monitoring.org/project/19033 | 3.0.1        | 3.1.1        |     
               python-html5lib |  DISTRO  | https://release-monitoring.org/project/08053 | 1.0b10       | 1.0.1        |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.10.3       | 0.13.1       |     
             python-hyperframe |  DISTRO  | https://release-monitoring.org/project/19035 | 5.1.0        | 5.2.0        |     
              python-hyperlink |  DISTRO  | https://release-monitoring.org/project/19142 | 18.0.0       | 19.0.0       |     
                python-ibmiotf |  DISTRO  | https://release-monitoring.org/project/21699 | 0.2.8        | 0.4.0        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
               python-influxdb |  DISTRO  | https://release-monitoring.org/project/12696 | 5.0.0        | 5.2.3        |     
                    python-ipy |  DISTRO  | https://release-monitoring.org/project/19783 | 0.83         | 1.00         |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.4.0        | 7.8.0        |     
                   python-jedi |  DISTRO  | https://release-monitoring.org/project/03893 | 0.13.3       | 0.15.1       |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.0.2        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.94         | 0.97         |     
                python-logbook |  DISTRO  | https://release-monitoring.org/project/20016 | 1.4.3        | 1.5.2        |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.4.0        | 4.4.1        |     
                    python-m2r |  DISTRO  | https://release-monitoring.org/project/15243 | 0.1.12       | 0.2.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.0.6        | 1.1.0        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.0.1        | 3.1.1        |     
              python-markdown2 |  DISTRO  | https://release-monitoring.org/project/03917 | 2.3.6        | 2.3.8        |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.1.1        |     
           python-mbstrdecoder |  DISTRO  | https://release-monitoring.org/project/21702 | 0.2.2        | 0.8.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 1.0.2        | 2.0.0        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8          | 0.8.4        |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 4.0.1        | 7.2.0        |     
              python-netifaces |  DISTRO  | https://release-monitoring.org/project/05644 | 0.10.6       | 0.10.9       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.3          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.2       |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                  python-parso |  DISTRO  | https://release-monitoring.org/project/16689 | 0.4.0        | 0.5.1        |     
               python-pathlib2 |  DISTRO  | https://release-monitoring.org/project/12723 | 2.3.3        | 2.3.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 10.5         | 12.0.1       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.16.0       | 0.29.0       |     
              python-periphery |  DISTRO  | https://release-monitoring.org/project/21705 | 1.1.1        | 1.1.2        |     
                python-pexpect |  DISTRO  | https://release-monitoring.org/project/07654 | 4.6.0        | 4.7.0        |     
            python-pickleshare |  DISTRO  | https://release-monitoring.org/project/12037 | 0.7.4        | 0.7.5        |     
                 python-pigpio |  DISTRO  | https://release-monitoring.org/project/19651 | 1.42         | 1.44         |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 19.1         | 19.2.3       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.9.1        | 3.10.0-rc1   |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2017.1.2     | 2019.1       |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.6        | 0.4.7        |     
         python-pyasn1-modules |  DISTRO  | https://release-monitoring.org/project/11987 | 0.2.4        | 0.2.6        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.24         | 0.25         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.3        | 1.5.5        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev3   |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.2.0        | 2.4.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.3.1        |     
                  python-pylru |  DISTRO  | https://release-monitoring.org/project/21584 | 1.0.9        | 1.2.0        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 1.4.0        | 2.2.0        |     
                python-pymysql |  DISTRO  | https://release-monitoring.org/project/07284 | 0.7.10       | 0.9.3        |     
                 python-pynacl |  DISTRO  | https://release-monitoring.org/project/12703 | 1.2.1        | 1.3.0        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.2       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.1       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.76         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.3        | 0.5.6        |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
                  python-pysmi |  DISTRO  | https://release-monitoring.org/project/13209 | 0.3.3        | 0.3.4        |     
                 python-pysnmp |  DISTRO  | https://release-monitoring.org/project/12027 | 4.4.6        | 4.4.11       |     
            python-pysnmp-apps |  DISTRO  | https://release-monitoring.org/project/21590 | 0.4.1        | 0.5.3        |     
                python-pysocks |  DISTRO  | https://release-monitoring.org/project/10673 | 1.6.7        | 1.7.0        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.15.0       | 0.26.1       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.27.1       | 0.46.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                 python-pyyaml |  DISTRO  | https://release-monitoring.org/project/04123 | 4.2b4        | 5.1.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.0.2       | 18.1.0       |     
                  python-raven |  DISTRO  | https://release-monitoring.org/project/08715 | 6.9.0        | 6.10.0       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.2.1        | 3.3.8        |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 1.1          | 2019.4       |     
             python-request-id |  DISTRO  | https://release-monitoring.org/project/21598 | 0.3.1        | 1.0          |     
      python-requests-toolbelt |  DISTRO  | https://release-monitoring.org/project/05665 | 0.7.1        | 0.9.1        |     
               python-rpi-gpio |  DISTRO  | https://release-monitoring.org/project/12026 | 0.6.3        | 0.7.0a2      |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                  python-scapy |  DISTRO  | https://release-monitoring.org/project/04764 | 2.4.0        | 2.4.3        |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | v0.18        | 0.32         |     
          python-secretstorage |  DISTRO  | https://release-monitoring.org/project/04020 | 2.3.1        | 3.1.1        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.7.10       | 0.11.2       |     
       python-service-identity |  DISTRO  | https://release-monitoring.org/project/07917 | 17.0.0       | 18.1.0       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.2.0       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
            python-simpleaudio |  DISTRO  | https://release-monitoring.org/project/21607 | 1.0.1        | 1.0.2        |     
             python-simplejson |  DISTRO  | https://release-monitoring.org/project/04026 | 3.11.1       | 3.16.0       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.15.0       | 0.45.2       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.19.13      | 4.19.19      |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.0.2        | 4.3.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.2          | 3.4          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.3        | 1.3.8        |     
           python-subprocess32 |  DISTRO  | https://release-monitoring.org/project/04043 | 3.5.3        | 3.5.4b1      |     
              python-tabledata |  DISTRO  | https://release-monitoring.org/project/21613 | 0.0.5        | 0.9.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.7          | 1.14.1       |     
              python-texttable |  DISTRO  | https://release-monitoring.org/project/11635 | 0.9.1        | 1.6.2        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.9.3        | 0.11.0       |     
                python-tinyrpc |  DISTRO  | https://release-monitoring.org/project/12824 | 1.0.1        | 1.0.3        |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.9.3        | 0.10.0       |     
                python-tornado |  DISTRO  | https://release-monitoring.org/project/07498 | 6.0.1        | 6.0.3        |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 17.8.0       | 18.6.0       |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 19.2.1       | 19.7.0       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.0.0       | 19.1.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                 python-typing |  DISTRO  | https://release-monitoring.org/project/10922 | 3.6.6        | 3.7.4.1      |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.0        | 2.5.2        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.12.0       | 0.14.0       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 1.3.1        | 2.0.1        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.12.2       | 0.14.0       |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webob |  DISTRO  | https://release-monitoring.org/project/06181 | 1.8.1        | 1.8.5        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40.dev1    |     
       python-websocket-client |  DISTRO  | https://release-monitoring.org/project/07288 | 0.47.0       | 0.56.0       |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 7.0          | 8.0.2        |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.15.2       | 0.15.6       |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.10.11      | 1.11.2       |     
                  python-ws4py |  DISTRO  | https://release-monitoring.org/project/12030 | 0.4.2        | 0.5.1        |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 0.9.6        | 1.2.1        |     
              python-yieldfrom |  DISTRO  | https://release-monitoring.org/project/21621 | 1.0.3        | 1.0.4        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.7.4        | 3.8.0        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.0.1       | 41.2.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1        | 4.1.0        | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.0.0        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.1       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.1       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.1       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.0-rc.1   |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.8.6        | ORPH
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                     rng-tools |  DISTRO  | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.14.2.1     | 4.15.0-rc1   |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1908.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.6        | 2.6.4        | ORPH
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.37.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.37.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.7.1.1      | 2.9.0.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.0.0      | 2.3.0.2      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 0.4.0.0      | 1.0.2.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.0.0      | 2.5.0.1      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.0.2      | 2.3.0.4      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.1.1      | 2.2.1.3      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.4.0.1      | 0.5.0.0      |     
                      safeclib |  DISTRO  | https://release-monitoring.org/project/21385 | 03032018     | 30122018     |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.8       | 4.11.0rc4    |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  DISTRO  | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                      sdl2_gfx |  DISTRO  | https://release-monitoring.org/project/04780 | 1.0.1        | 1.0.4        |     
                    sdl2_image |  DISTRO  | https://release-monitoring.org/project/04781 | 2.0.3        | 2.0.5        |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                      sdl2_ttf |  DISTRO  | https://release-monitoring.org/project/04784 | 2.0.14       | 2.0.15       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.2.4        | 3.3.1        |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.2.2        | 3.3.2        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 3.1          | 4.1          |     
                       skalibs |  DISTRO  | https://release-monitoring.org/project/05486 | 2.6.4.0      | 2.8.1.0      |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | v4.28-966... | 4.30-9700... |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.09.58      | 0.10.05      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 3.1.4        | 4.0.4        |     
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.3        | 5.0.0-beta1  |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 3.0.12       | 4.0.1        | ORPH
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                     syslog-ng |  DISTRO  | https://release-monitoring.org/project/04930 | 3.22.1       | 3.23.1       |     
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.6       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 241          | 243          |     
                      sysvinit |  DISTRO  | https://release-monitoring.org/project/21648 | 2.90         | 2.96         |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.4.1        | 1.5.0        |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.8          | 3.0          |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.0.5      | 0.4.1.5      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.0          |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                      turbolua |  DISTRO  | https://release-monitoring.org/project/11727 | 2.1.2        | 2.1.3        |     
                      udftools |  DISTRO  | https://release-monitoring.org/project/15774 | 2.0          | 2.1          |     
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.9.11       | 4.10         |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.6.4        | 5.8.1        | ORPH
                         unscd |  DISTRO  | https://release-monitoring.org/project/07070 | 0.52         | 0.53         |     
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                      usbredir |  DISTRO  | https://release-monitoring.org/project/16012 | 0.7.1        | 0.8.0        |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.46.0       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.0133     | 8.1.2041     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.58.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.24.4       | 2.26.0       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.1        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.16         |     
                     wireguard |  DISTRO  | https://release-monitoring.org/project/13481 | 0.0.20190905 | 0.0.20190913 | ORPH
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.3        | 3.1.0        | ORPH
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.2.2        | 1.3.91       |     
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.24.3       | 2.25.91      |     
               xapp_fonttosfnt |  DISTRO  | https://release-monitoring.org/project/21723 | 1.0.4        | 1.0.5        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
              xapp_xsetpointer |  DISTRO  | https://release-monitoring.org/project/21716 | 1.0.0        | 1.0.1        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20150503.1 | 3.20160805.1 |     
      xdriver_xf86-input-evdev |  DISTRO  | https://release-monitoring.org/project/05217 | 2.10.5       | 2.10.6       |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 0.28.2       | 0.29.0       |     
  xdriver_xf86-input-synaptics |  DISTRO  | https://release-monitoring.org/project/05239 | 1.9.0        | 1.9.1        |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
    xdriver_xf86-video-nouveau |  DISTRO  | https://release-monitoring.org/project/05229 | 1.0.15       | 1.0.16       |     
 xdriver_xf86-video-openchrome |  DISTRO  | https://release-monitoring.org/project/05230 | 0.5.0        | 0.6.0        |     
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.04         | ORPH
                xlib_libXfont2 |  DISTRO  | https://release-monitoring.org/project/17165 | 2.0.3        | 2.0.4        |     
                    xlib_libXt |  DISTRO  | https://release-monitoring.org/project/01793 | 1.1.5        | 1.2.0        |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.4          | 3.5          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                         xvkbd |  DISTRO  | https://release-monitoring.org/project/05273 | 3.9          | 4.0          | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.22         | 0.23         |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           znc |  DISTRO  | https://release-monitoring.org/project/05305 | 1.7.4        | 1.7.5-rc1    |     
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.2        | 1.4.3        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.1       |     

-- 
http://autobuild.buildroot.net
