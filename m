From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 06:16:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-17
Message-ID: <20190918061626.A01A88614D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  0  |  0  | 19  |
  2019.05.x  | 15  |  5  |  0  | 20  |
  2019.08.x  | 16  |  4  |  0  | 20  |
    master   | 116 | 38  |  0  | 154 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            wpa_supplicant-2.9 | 6 
                  exempi-2.5.1 | 3 
                    flac-1.3.3 | 2 
          host-libglib2-2.62.0 | 2 
            host-mfgtools-0.02 | 2 
                      icu-64-2 | 2 
                    luksmeta-9 | 2 
                    strace-5.2 | 2 
                 ytree-1.99pl1 | 2 
                     apr-1.7.0 | 1 
                  cmocka-1.1.5 | 1 
                    ffmpeg-4.2 | 1 
                   fio-fio-3.9 | 1 
      gst1-plugins-base-1.16.0 | 1 
                 haproxy-2.0.5 | 1 
              iputils-20190709 | 1 
                libnice-0.1.14 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
            python-sip-4.19.13 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 
                upmpdcli-1.4.2 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4da73982f160305ac2d5d2b4f615fa98eec5a7a3 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/5e526515157df607737331cd3b8e2ec8dc2fe425 |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/8860cd17bbdfd14117369486fc37a2b881b5e8aa |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/7ee587945f4d20c7d8a56846366e014e3e210e3e |     
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/eab0a04b6d9cb384489f7f1c20ce4b25b142e0f3 |     
   x86_64    |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/061fd3cd6e29c86f49ebfe47b4abb7497ee17fa5 |     
    arm      |          fio-fio-3.9           | NOK | http://autobuild.buildroot.net/results/b0a5a9f61cada527e8d480d77fc810489a92fa2b |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/eb3a59a78dbb0c83cff78aac2384edea890af830 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/f1360435f0a198ac35bcfd965650da1e204576bf |     
  riscv32    |    gst1-plugins-base-1.16.0    | NOK | http://autobuild.buildroot.net/results/2c5bc3fa3784e7916156c52b2155502b349acaa3 |     
microblazeel |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/4426a5ce9e1b1772f8e70cdf802d19a1d6751dd0 |     
    arm      |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/2b730a6bc0096b15feaea076df094c19362e1ac8 |     
  aarch64    |      host-libglib2-2.62.0      | NOK | http://autobuild.buildroot.net/results/702880f74b5517e3c73c80379748eae5893e2c05 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/6ae9a69b717bf6ed0898779f8b413e6b73870dd5 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/47a10f29f9085c1bdd4e31397357aa36b07f87b9 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/b8841f5642ce9d12928f133c92a5839c6e45fe09 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/8db12ea86d769cba5c40e6b1e76096f68bfae791 | ORPH
   x86_64    |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/c00deb41e465a049dc8dcc9f9ece3ffbf4292c4c |     
   x86_64    |         libnice-0.1.14         | NOK | http://autobuild.buildroot.net/results/4e7e441fecceaec06b452058434be459068d5902 |     
    i686     |           luksmeta-9           | NOK | http://autobuild.buildroot.net/results/c009d5e137318bf6cad7380e445cd8def99e19ca |     
   nios2     |           luksmeta-9           | NOK | http://autobuild.buildroot.net/results/003311c3dd7d0076ef7298cea8bed1c1823dae7e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/474b99a6ae402bdc750e3336cee9e01b2e76a809 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2aa60497e38edde022461c23671a7aa771af7554 |     
  riscv32    |       python-sip-4.19.13       | NOK | http://autobuild.buildroot.net/results/2c5d763e8fa632912b68e042d79ea2b168ce4c11 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8427e399c27a15858bd144df72ec850cc4185611 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/fb2715ba38c6f9a57033c20acbbd739a13af5c2d |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/1a9af7e54715533c85fc3010fc3cf8c9ff0fe093 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/b26b9e6bb1bb26632cf8681539618de6ea04b8a0 |     
    arc      |         upmpdcli-1.4.2         | NOK | http://autobuild.buildroot.net/results/604753a82da6c90dcceaeea1fbdc9f13ff4850ff |     
    arm      |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/2ecf4fa96149ddb47f15f22e05decf563b04fefe |     
   sparc     |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/fe56301266a5198550264ccdee7988fb4c8d4c1c |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0d39920cfa45fce092cac9b24c4a9033a53c433a |     
powerpc64le  |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/76ca8cd3feca37fc5eaa02fd29bb2964308958e8 |     
 powerpc64   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/b5f059176a75207c5912b38856d915f118fcd485 |     
    arm      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/0d3f4f2a6bd19691894def7fe642040ed30c1c07 |     
    sh4      |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/3c7d494221c71092841da2b3a6c1376e484a61c2 |     
    m68k     |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/14ee31c5535acae61a2ceb3e2dcd31e4280d97d7 |     
    arm      |         ytree-1.99pl1          | NOK | http://autobuild.buildroot.net/results/f394983f7ca8a34018c3061d53bf63104a5e10b4 |     




Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

               host-qemu-3.1.1 | 2 
           host-mfgtools-v0.02 | 1 
             libgpg-error-1.35 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/df9b1e988218265770ca14eb9da2a95a7724b42c |     
    m68k     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/15a75c794f98884a40d1904b90d9647d778b8f11 | ORPH
  powerpc    |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/8b1bcda19ab16bda40d757300350588d3211b19b | ORPH
  riscv64    |       libgpg-error-1.35        | NOK | http://autobuild.buildroot.net/results/b8065cf04b52caac4c6369e9b473f8e264d9baa7 | ORPH
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/2168bf338e8dcb46d39322b03c7ee1c29ccd8129 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

             libgpg-error-1.36 | 2 
piglit-ef761094be04d14e258a... | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/0f8af2135b96283a6310402c7cf597f9854c90c2 | ORPH
    arm      |       libgpg-error-1.36        | NOK | http://autobuild.buildroot.net/results/c61eaa5da9496e22120acd5b5d51f4db8dfdea5d | ORPH
    mips     | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/50146e20c58b9b88f286695d1182b3ac2d9d9f27 |     
powerpc64le  |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/727108af1f73d91b2a956d959029f984df9936d5 |     



-- 
http://autobuild.buildroot.net
