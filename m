From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Jun 2021 05:43:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-06-18
Message-ID: <20210619054402.4B5BD83829@smtp1.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-06-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 24  |  7  |  0  | 31  |
  2021.05.x  | 14  |  2  |  0  | 16  |
    master   | 29  | 97  |  0  | 126 |

Classification of failures by reason for master
-----------------------------------------------

               host-qemu-6.0.0 | 15
           host-libselinux-3.2 | 10
cegui-00b4e1fe174da53b7ed72... | 8 
filemq-8940f34e0f1c8f25c1c6... | 7 
                      pdbg-3.2 | 7 
               memcached-1.6.9 | 6 
casync-4ad9bcb94bc83ff36cfc... | 5 
                harfbuzz-2.8.1 | 5 
                    ffmpeg-4.4 | 4 
                libsoup-2.72.0 | 3 
          sane-backends-1.0.32 | 3 
                   libqb-2.0.2 | 2 
                libselinux-3.2 | 2 
                openswan-3.0.0 | 2 
               pipewire-0.3.27 | 2 
                 pixman-0.40.0 | 2 
                qt5base-5.15.2 | 2 
             safeclib-08112019 | 2 
  binutils-arc-2020.09-release | 1 
                haproxy-2.2.14 | 1 
                 libpsl-0.21.1 | 1 
                librsvg-2.50.5 | 1 
             libsndfile-1.0.31 | 1 
make: *** wait: No child pr... | 1 
                 mesa3d-21.1.1 | 1 
                    qemu-6.0.0 | 1 
                   seatd-0.5.0 | 1 
                   tor-0.4.5.8 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/76e2b0d004d1dc3e31198d3c44fa5529c3eaef72 |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/db15f88b633a357132d56140146d6eb983bd9d1f |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/758f702e044e2a08fb756be9f2d0653d8d68a4e5 |     
 aarch64_be  | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/2273784e5972e283dc9beed71f532b1f0b8c5048 |     
  mips64el   | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/ec48c524a1670cb6d01d83129e83ce563fb120ef |     
    arm      | casync-4ad9bcb94bc83ff36cfc... | NOK | http://autobuild.buildroot.net/results/bb35aeb623d6d97a3d2ca103e91100d5589e0d11 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e69da44e205707519b1820b6f167575366fd9cb0 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/205d77dbf6961a1773138de0c9e9280d74f6d48d |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c4319ec45813e6c2305b3e18d3551854413d18b3 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8de38b67528a34653f98758b1bce2c5db08fe61e |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/813a5f11e637ef70d6cb90e1b932038d6de55f51 |     
    i586     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e7bf0ed8bb993c7150e438feaab6e9a8a9d90a64 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/be94ec8c010947cff3ec2c6cbb9bd1df6e46d742 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fc4d5d94f0873a04edc336c17861987b90657e27 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/04b1065257df97481a559c863ae2e52e8e32f614 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/08f8df74a4e4179830585cb97d9f713440c8d5f3 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1982e9e1ef211add2fb366b539bea36ec03c588a |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d411b4fa4a8e5fa80a73c033009f98a1c5c83cdb |     
  mips64el   | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/6326cfd224efc71282847bb4b58b878a58d534c8 |     
   xtensa    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/8b4e6476a9572688bb6b6770c63abfed6409517b |     
  riscv64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/ced982d6f14bae2532f8196540746b3bf8313001 |     
microblazeel | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/0afa345f41f22f7799084537cc763e8f0e8cad32 |     
  riscv64    | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/06a0ae89baea8c58b8d512340658fdf233777b16 |     
   nios2     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/acd198ea29c27801330eda29ce8d2e2bcf08531f |     
    i686     | filemq-8940f34e0f1c8f25c1c6... | NOK | http://autobuild.buildroot.net/results/c42a6dbac8b2c7923614b24dbed7500806054a0f |     
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/c88b305b9dbbe8b20b718f484765d46a2ec83e45 |     
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/345f8c6d05d6231f280de967510e85ecb45949b4 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/1b76f3e184a062911a1d5df9457990eb9fb6295b | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/f0cf86bc3a6148fc01338d74f67985976761bae4 | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/14e69497e9edfea395600cbe808d65effa45848c | ORPH
    arm      |         harfbuzz-2.8.1         | NOK | http://autobuild.buildroot.net/results/3bba50da6c5202249b41890479846af1bfc95173 | ORPH
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/99d4f191d38a9690ff60d12ea59fa23856b061d9 |     
  riscv32    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/f422a98e0dced0bd289f4637d9a18d8e08e63517 |     
  mips64el   |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/24d1ac06660858ac74618ab5e5c3c46b9a41f903 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/12ed814657940a06540c6de54f4072a72455c7e3 |     
    arm      |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/583830eae355389dbb495e03e5503b14f967c23e |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/9aebffc056e7c491bdd5f12d2de76103ec3ae09a |     
   x86_64    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/19ffeec9e2d6f39654c82f1553a2b13cfe9aa377 |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/ced73bd9c5d8bd352b245aff5fb51689ebd28167 |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/1207a586ed633711c75ecd165899b6053a643fcd |     
  powerpc    |      host-libselinux-3.2       | NOK | http://autobuild.buildroot.net/results/34c325a799b450e2f7d2bcea7d52dea28a25cce1 |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/967f8e5345266371efee9b80645a92e8fdc52aaa |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/146e8736a377a77bc2cce498a4a25f8591ac93ff |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/f7db59187a537b12f5d12a4a86b69eeb17856c43 |     
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b0d2b2c4157df8f2202258be8dd4110f9d2258c6 |     
   nios2     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/4025a229a0b3119c5e1255e573c2d45648296c26 |     
    mips     |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/eecbc7290aec8b200e7605341be1339eee098307 |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/25c26f70218905088eabf204f5c299e8b02a4655 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/4a563c98c0b17e06fb8c40875cd9b53b7824cd76 |     
  powerpc    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/00f851a562e05ddf82e422c539a96e74dd366106 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/b9ef7eaabcb3725d9594946ee4f3eff41c0f0246 |     
   xtensa    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/4e482093f63bcb8fe3807c17b4250de8674b4d80 |     
  aarch64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/282e10fa72fa5d3f9a31538e6669160935b8bee8 |     
microblazeel |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/063ec32de84867b802a89373babb0c3155868e73 |     
   x86_64    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/5194b459d8d5c0bc31274b06b525225f8e364c84 |     
 powerpc64   |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/ee9608998715ce20b0f43b56d92bd16c447d8144 |     
    arm      |         libpsl-0.21.1          | NOK | http://autobuild.buildroot.net/results/59039e8b95d8bb85b2d39705a9f12f3e4928aa21 |     
    arm      |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/592b1ad68c55fea58ed4cf46942b655994e9665f |     
  powerpc    |          libqb-2.0.2           | NOK | http://autobuild.buildroot.net/results/376d316094238ba7097e8bdc51960ba38532683a |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/6b2723b8c86973b6b67de9cfc0bef3fd4474301d |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/72fd71e926e88af109bf24a9d40b5494e81c77d3 |     
    arm      |         libselinux-3.2         | NOK | http://autobuild.buildroot.net/results/75dc5123d6d677d886a09cb1c2fa3f526aa2d1c5 |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/5f4be8186eeca3e85b7bb0fe525ec0208d85cf71 |     
 aarch64_be  |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/52874cb775a023f85968e8c8b9e4031336f40c37 |     
   xtensa    |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/6f2001800bd27a0ad6eea1cafe2fb1471f1f1bd9 |     
  mips64el   |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/63d1a306b258abe3d072fa8a7b8d519b4c1fcd60 |     
    arm      | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/ad6620966feab6b03f5833e8ba09dd24b1ac3d3d |     
   s390x     |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/738902f5eb9a5100f4004e16d2690bdce79b1d5b | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/63c6abe55f1436a635d4a2d4c669f441c8c1929d | ORPH
   xtensa    |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/851d9f36bc03de04f13cba4eb4b81ac5ea9e88f5 | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/82bf8f89ced7dbae051a80879dec1aefc5bd5514 | ORPH
    arm      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/0c3a4a904fe3ab43820bbe196fbbb71bd4cbc7b5 | ORPH
    arc      |        memcached-1.6.9         | NOK | http://autobuild.buildroot.net/results/a7ac5c50a3434030126547185c5d3f0485d26bb1 | ORPH
    m68k     |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/443a01e472d452f7d533d1debc6dbd634cde710f |     
 aarch64_be  |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/8576a3207d374f667be7f1e04558e00e5c60bf32 | ORPH
  mips64el   |         openswan-3.0.0         | NOK | http://autobuild.buildroot.net/results/c2d7987e4a0a71f43214f74892eab40b1f992877 | ORPH
  sparc64    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/d84e6a7277946ea05412192032254504fcc52733 |     
    arc      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/1e405e30696164028eedf1bc5ddb9635d4f7f1b0 |     
   mipsel    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/30be7c938e181975ee83c785b83d0907f4f87991 |     
    arm      |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/2aebecffb6e5d5d4ed82cef1bc35b29340027642 |     
microblazeel |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/17be78f3b3d42d8957cdb87624df02fc5b1f2680 |     
  powerpc    |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/8e11288b3a4410f455fdefeb209146063e676239 |     
   nios2     |            pdbg-3.2            | NOK | http://autobuild.buildroot.net/results/dc8f8e5f99ddf5964462225f054d4f858a42060e |     
   sparc     |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/179f80cebdf5d5e83fb445a59701486d11555785 |     
  riscv64    |        pipewire-0.3.27         | NOK | http://autobuild.buildroot.net/results/a6f96a11490462dfed615a69dbfab0980e6b0ebd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f672257771907cf415af245d7474ad08a183a917 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/893ca1dc1699a62789963a992a4b688549156c83 |     
 powerpc64   |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ab9f550874296b01894a3a32b252e031d45c7f9f |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/ea5d07046ac14762529e6f85fa29fbca9e925615 |     
 aarch64_be  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f27849aad7947e4ae7a30e226f6e07b14732021b |     
  mips64el   |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/4ab50eba5b414e9fd05a6ea15668ccd38d394818 |     
   nios2     |       safeclib-08112019        | NOK | http://autobuild.buildroot.net/results/02b6779919e8eddef90511e29b4cae16d53364a1 |     
  aarch64    |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/2cb1bf5bc61eacd4a0f34359ce0982b8c79a6400 |     
microblazeel |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/2c44f7ab283540aafc5a414ab5139656b021aaa4 |     
    arm      |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/d2f6b580460e24a7f3d0f329bc7a561ded71db85 |     
    arc      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/6b1813806265e35f251438fd6addbc54330aaa15 |     
  riscv64    |          tor-0.4.5.8           | NOK | http://autobuild.buildroot.net/results/99beda70f15cbe5d1e2394abd1a41969cf193287 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                   eigen-3.3.7 | 1 
                 mesa3d-20.3.5 | 1 
monkey-f54856ce250c4e257354... | 1 
                    mpd-0.22.6 | 1 
                 pixman-0.40.0 | 1 
                qt5base-5.15.2 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/f2db55ba3f2fc7d36a77343c773ce019d9bf5cd5 |     
   x86_64    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/10d594aa659a70cd73d137ff74749f8cec44fea1 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0246f92d2527e0a6fd06b717a9626441a2a0ac3a |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c91c85bba7b05f181cd7dd06500aec321697d7ca |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5e5c5fadce1c9be0ff317dd5e8739f14e35777f1 |     
  riscv64    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7e67c9dd37c34300cd81a1935a381eb33b015f5b |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/6f0b6824971477559f51e505e0012d756731ec3e |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                mono-6.12.0.90 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0d9d65a49659c3510ed120345daaa42bb227c2db |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/b2b8df98dbc24cf80725c391a1f98eaddb77286f |     


Gitlab CI results for 2021-06-18
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066466  |      
               arcturus_ucls1012a | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066468  |      
        engicam_imx6qdl_icore_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066521  |      
              freescale_imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066541  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066542  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066543  |      
               freescale_p1025twr | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066544  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066545  |      
          freescale_t2080_qds_rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066546  |      
            friendlyarm_nanopc_t4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066547  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066548  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066549  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066550  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066554  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066552  |      
                 imx6-sabresd_qt5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066565  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066588  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066590  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066592  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066594  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066596  | ORPH 
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066597  | ORPH 
                  minnowboard_max | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066600  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066599  |      
                          mx25pdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066602  |      
                          mx51evk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066603  |      
                         mx53loco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066605  |      
                         mx6cubox | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066606  |      
                   mx6sx_udoo_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066608  |      
                          mx6udoo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066612  |      
                      nexbox_a95x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066613  |      
                      nitrogen6sx | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066614  |      
                       nitrogen6x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066615  |      
                        nitrogen7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066616  |      
                       nitrogen8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066617  |      
                      nitrogen8mm | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066618  |      
                      nitrogen8mn | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066619  |      
                      nitrogen8mp | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066620  |      
                         odroidc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066622  |      
                        odroidxu4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066624  |      
        olimex_a10_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066628  |      
             olimex_a13_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066630  | ORPH 
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066632  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066631  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066636  |      
             olimex_a33_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066638  |      
             olimex_a64_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066640  |      
          olimex_imx233_olinuxino | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066642  |      
                         olpc_xo1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066645  |      
                       olpc_xo175 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066644  |      
                    openblocks_a6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066646  |      
                    orangepi_lite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066648  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066647  |      
                     orangepi_one | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066649  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066651  |      
                      orangepi_pc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066653  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066652  |      
                 orangepi_pc_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066654  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066655  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066656  |      
                      orangepi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066657  |      
                  orangepi_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066658  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066660  |      
                    orangepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066661  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066665  |      
              orangepi_zero_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066663  |      
                       pandaboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066666  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066667  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066668  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066669  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066670  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066671  |      
                qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066672  | ORPH 
                qemu_aarch64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066673  |      
               qemu_arm_versatile | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066674  |      
         qemu_arm_versatile_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066675  |      
                qemu_arm_vexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066676  |      
             qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066677  |      
                qemu_csky610_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066678  |      
                qemu_csky807_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066679  |      
                qemu_csky810_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066680  |      
                qemu_csky860_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066681  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066682  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066683  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066684  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066685  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066686  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066687  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066688  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066689  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066690  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066691  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066692  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066693  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066694  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066695  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066697  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066698  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066700  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066701  |      
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066703  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066705  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066707  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066708  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066709  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066710  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066711  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066712  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066713  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066714  |      
                         qemu_x86 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066716  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066715  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066717  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066718  |      
                      raspberrypi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066727  |      
                     raspberrypi0 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066719  |      
                    raspberrypi0w | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066720  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066721  |      
                     raspberrypi3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066723  |      
                  raspberrypi3_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066722  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066724  |      
                     raspberrypi4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066726  |      
                  raspberrypi4_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066725  |      
                 raspberrypicm4io | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066729  | ORPH 
              raspberrypicm4io_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066728  | ORPH 
                        riotboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066730  |      
                    roc_pc_rk3399 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066731  |      
                           rock64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066732  |      
                        rock_pi_4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066733  |      
                      rock_pi_n10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066734  |      
                       rock_pi_n8 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066735  |      
                        rockpro64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066736  |      
                      roseapplepi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066737  |      
                 s6lx9_microboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066738  |      
                       sheevaplug | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066739  |      
                 snps_aarch64_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066740  |      
               snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066741  |      
              snps_archs38_axs103 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066742  |      
                snps_archs38_haps | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066743  |      
                snps_archs38_hsdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066744  |      
                 snps_archs38_vdk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066745  |      
                socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066747  |      
                solidrun_clearfog | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066748  |      
          solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066749  |      
            solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066750  | ORPH 
                  stm32f429_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066751  |      
                  stm32f469_disco | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066752  |      
                  stm32mp157a_dk1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066753  |      
                  stm32mp157c_dk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066754  |      
              toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066755  |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066756  |      
                           ts5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066757  |      
                           ts7680 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066758  |      
                         uevm5432 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066759  | ORPH 
                        wandboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066760  |      
                            warp7 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066761  |      
                        warpboard | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066763  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066764  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066766  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066767  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066768  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066769  |      



-- 
http://autobuild.buildroot.net
