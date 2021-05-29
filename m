From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 May 2021 05:44:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-28
Message-ID: <20210529054446.C1E2A400DF@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  | 13  |  0  | 41  |
    master   | 129 | 35  |  0  | 164 |
     next    |  9  | 28  |  0  | 37  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 9 
               capnproto-0.8.0 | 4 
             host-lvm2-2.03.12 | 3 
                 dc3dd-7.2.641 | 2 
  gobject-introspection-1.64.1 | 2 
               pipewire-0.3.26 | 2 
               apcupsd-3.14.14 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
           host-libcutl-1.10.0 | 1 
                  lvm2-2.03.12 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
                    ruby-3.0.1 | 1 
                   sdl2-2.0.14 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                       unknown | 1 
                  waffle-1.6.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fbbc418c558d073a48279cffc782ceabec62ddac |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/89cfcc7f7ca61cfe135627fd9fd5f17431dc538b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8a8ba7a12bf5250d9ce744b5e44c74becaa06535 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9a9b84aef1b526e041c9bbd59584c442daff0644 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/144e3d04e88fe24668fc999373eb29b6d87d9e7f |     
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/81f33f27126011f82eed4f9b5b1c19b0a46c43cc | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/10ecc068616efba4c72c555f651af0df8c91f3a4 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e0343990bbe8e8de7d2519cea332f8f24ba4425a |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/c96dc8d1b0455d9ebd5c4214f5b36d20a6ae88ca | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/05c1a4d1c5ea9b9503f02272ed1f5e9792dd8ae7 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/14764c18185895c371f7ebfd339d4d5a075a8f20 | ORPH
    i686     |      host-libcutl-1.10.0       | NOK | http://autobuild.buildroot.net/results/115e28dcfa1e46a55d08b7516beaa8099eae5722 | ORPH
  riscv64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/7b6b765ad83ab945505759f0d0d4b241c37cc41d | ORPH
 aarch64_be  |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/06652f2cfbdc1e6717b096b18a4f91399b28a694 | ORPH
  riscv64    |       host-lvm2-2.03.12        | NOK | http://autobuild.buildroot.net/results/6acab6671421f3acd1c40fa7c655ed4a2d37dffc | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c5eaec652f606b550c3fedb7c1725bccfe0454f9 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7fd0b9b5d2c6a0a38d5c75079a4f12c3975dafcc |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/713ca52212072e4cd5ac13540c0d074f78749ac0 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5292e6216df0eaaff5622f9f1128f9107c0ccdbe |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/67199d276d780b0c216e14917183953aee584bcb |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/acd28e58f184bdf8e1bca2aa66ae19f2a5658753 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a8893f6ed66a7aac4da0446213d297b095f9ff07 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/77360e5a3a398209849472ac41e4088baf07ae5f |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/53a7962bcd234fbb6b0fdbfe801a52cc96a4d186 |     
  mips64el   |          lvm2-2.03.12          | NOK | http://autobuild.buildroot.net/results/19b62891a7aab7a55432b713f301fd96bf251aa3 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3211a3cd2cd7aaa16fd3bd633078ffd883abbbd6 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/3a23094ffc39dad319dde95ff2748509efe0141d |     
  mips64el   |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/4454e5a11e735c12f3a31a031ab1e425bd311b8c |     
    m68k     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/c258a2736661af8ea73abeda2503d8682e65f1e2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/73896bbed18a474525378d1e62a2452c5634fbae |     
    sh4      |           ruby-3.0.1           | NOK | http://autobuild.buildroot.net/results/2632fa94258e69d15334f9cb9e93cf4f89c917ac |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/079cbca7d8a8dcec6f6887525f9188083fb0e908 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/54c0a49c806b362a9d7f0d87c755704bf8435601 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7dccf54b81629d3b95c84d7a64f293507a4bac76 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/a80bc97d5daa6ad06e5e1be9e5e443baa593f39b |     


Classification of failures by reason for next
---------------------------------------------

               aircrack-ng-1.6 | 3 
                libsoup-2.72.0 | 2 
             libtorrent-0.13.8 | 2 
                   neon-0.30.2 | 2 
                 rpcbind-1.3.2 | 2 
                  boost-1.75.0 | 1 
                  botan-2.17.3 | 1 
                   bullet-3.09 | 1 
            docker-cli-20.10.6 | 1 
                 freerdp-2.3.1 | 1 
                 gerbera-1.8.1 | 1 
           heirloom-mailx-12.5 | 1 
             host-flatcc-0.6.0 | 1 
           host-libselinux-3.2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libselinux-3.2 | 1 
                 libssh2-1.9.0 | 1 
                   luvi-2.12.0 | 1 
          perl-net-ssleay-1.85 | 1 
               pipewire-0.3.27 | 1 
                   rhash-1.4.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/cdafdefbadb2d7f82304123e2ffdd1dad7b549b9 |     
   xtensa    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/135d7bfa668ff04974ace5e40745ad84edcab4f1 |     
   mipsel    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/2a4a6aefecf74cf0c3ffd880d724d099b2640252 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/809144fb35f7f9672eca2a0dab344b986a3149c6 |     
powerpc64le  |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/17a7b4c700245a0d28afc3f1f972cfaf371a50f7 | ORPH
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/db3fe67ec2a3ba3519f297b4cbfd2d690b29731c |     
    i686     |       docker-cli-20.10.6       | NOK | http://autobuild.buildroot.net/results/1c7d94673f95a0ec0315b38b89e62027f2441e7b |     
    m68k     |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/ce64a2274d67e764efaabb24a9fc169fcd8abeb6 |     
  riscv64    |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/5f8e055752a3e5b9f12dc617ba4b383ea9d3142d |     
   xtensa    |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/ad4fa377846e58c1dd567135e93d251f17e10f13 |     
    arm      |       host-flatcc-0.6.0        | NOK | http://autobuild.buildroot.net/results/3053b22169baf26630aad34ff45ce95de2060a00 |     
   xtensa    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/dfed73608fa0a16831f6ab54df3f197ff62d03fd |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/410aca9aa5d333ebe1d3effbaa11dc8411df686e |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/98d12c979d95a47f1bce1092e7fe463df8d35006 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/7e0c64069357ccd38c6f3ba5a246a03f18d64e79 |     
   s390x     |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/a39fe0856b2088eaba91fcda308afd784bb8f185 |     
    i686     |         libssh2-1.9.0          | NOK | http://autobuild.buildroot.net/results/3a0c92f4fad050197042731c606a119f8fa91fad |     
    i586     |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/293bdcb23c15913f4e7cc66c62d45d781e2f29d7 | ORPH
  riscv64    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/1d40dc5662654291c1fc44afa984bab6fe5a7538 | ORPH
   x86_64    |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/d8452e2de1bd866953d3bb0cb951e9f877f9a6e0 |     
    arm      |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/7095449908088aa859456983be9bcf96940d62cc | ORPH
 powerpc64   |          neon-0.30.2           | NOK | http://autobuild.buildroot.net/results/04f84ff5f5cc175651f3b6e7a6a0a1e5419e5390 | ORPH
 aarch64_be  |      perl-net-ssleay-1.85      | NOK | http://autobuild.buildroot.net/results/10cb13a6f06fca04ec2d4444a19d17f63d457dfe |     
    arm      |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/bda810ab80642dac28fd2e40b63012c769e1696b |     
powerpc64le  |          rhash-1.4.1           | NOK | http://autobuild.buildroot.net/results/43fc2e3e57245470925d257be92f499208a9a7ba | ORPH
    m68k     |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/89598a260eed87747d5e7470953416327f1248c9 |     
   x86_64    |         rpcbind-1.3.2          | NOK | http://autobuild.buildroot.net/results/4d8f384a9f98fb6ced0292678427153352874fc7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e089b36d8cd565e99cfcc358f91ef34b4e8a3399 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 5 
                  boost-1.75.0 | 1 
            erlang-jiffy-1.0.6 | 1 
             host-cairo-1.16.0 | 1 
            lttng-tools-2.12.1 | 1 
                    mpd-0.22.6 | 1 
                 pixman-0.40.0 | 1 
                rocksdb-6.13.3 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/5cd3caafeabe288e6257122e61ae44072e58ed9d |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5625b99ba6ce43a0607cc7f26e9a7b74d3404f5b |     
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/c8de881ff42655f079cebf7d2e27d6d5186bf773 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/16ab71b10460ccb4ce3c8bba117c3dbfb2f90916 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/54152cfe26abab90184be980a340fdb28e3a323f |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/774a83927213160151c69a0df66fbbe0685b3e6f |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/79075fd7963b061127b7ed4b28bf2468afbfb5e2 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/17ab7ad7a4350457d64d43eac19159fe7774df4f |     
  riscv32    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/cddb7e663eb8b7e0b1060f809c84bf5b5e3347c2 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/43acf9125ada7e10ddd7997b1a26ab5b4b500b88 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/603e1786e5c6e2522f7ef40513aa5e5d89fc2706 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/1f3356c1eec606ba7d70d44087e623148f6f147a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c505ec2351c6fd312450d491097c92ac40d84227 |     


Gitlab CI results for 2021-05-28
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337827  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337914  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337915  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337919  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337962  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297337965  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297338045  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297338050  | ORPH 
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297338051  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297338053  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1297338080  |      



-- 
http://autobuild.buildroot.net
