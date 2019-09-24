From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Sep 2019 06:13:20 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-09-23
Message-ID: <20190924061326.0852D85C37@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-09-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  3  |  0  | 15  |
  2019.05.x  | 26  |  4  |  0  | 30  |
  2019.08.x  | 12  |  3  |  0  | 15  |
    master   | 167 | 76  |  0  | 243 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      icu-64-2 | 5 
                  check-0.12.0 | 4 
                  cmocka-1.1.5 | 4 
                 libdrm-2.4.99 | 4 
                 mesa3d-19.1.7 | 4 
                    4th-3.62.5 | 2 
               acpica-20190703 | 2 
aer-inject-9bd5e2c7886fca72... | 2 
                     gzip-1.10 | 2 
                   hostapd-2.9 | 2 
                   libcap-2.25 | 2 
                  libsepol-2.9 | 2 
               libupnpp-0.17.1 | 2 
                 libusb-1.0.23 | 2 
                   ncurses-6.1 | 2 
                    strace-5.2 | 2 
                acpitool-0.5.1 | 1 
                alsa-lib-1.1.9 | 1 
                   attr-2.4.48 | 1 
                    bird-2.0.6 | 1 
                  boost-1.70.0 | 1 
           cups-filters-1.25.4 | 1 
                   dav1d-0.4.0 | 1 
                   duma-2.5.15 | 1 
                  exempi-2.5.1 | 1 
                  ffmpeg-4.2.1 | 1 
                    flac-1.3.3 | 1 
                  flashrom-1.1 | 1 
                glorytun-0.2.0 | 1 
           host-gengetopt-2.23 | 1 
              iputils-20190709 | 1 
                jemalloc-5.2.1 | 1 
               libcap-ng-0.7.9 | 1 
                libcurl-7.66.0 | 1 
             libfm-extra-1.3.1 | 1 
                libgdiplus-5.6 | 1 
             libgphoto2-2.5.17 | 1 
             libopenssl-1.1.1d | 1 
         libspatialindex-1.9.0 | 1 
                libzlib-1.2.11 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.12.4 | 1 
          qt5multimedia-5.12.4 | 1 
              spandsp-20180108 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
                    wampcc-1.6 | 1 
                  xxhash-0.7.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/7ff79203c4b22731c1c219ba58639a8b0f586d90 |     
  riscv32    |           4th-3.62.5           | NOK | http://autobuild.buildroot.net/results/8537640176d6001f0bd436f9de62438206f12c2a |     
  riscv32    |        acpica-20190703         | NOK | http://autobuild.buildroot.net/results/18b9f852ce04ba46363a946e3f516977d0474372 |     
  riscv32    |        acpica-20190703         | NOK | http://autobuild.buildroot.net/results/1c03a1e908260bd72fce5473e9abc563137cb9c9 |     
  riscv64    |         acpitool-0.5.1         | NOK | http://autobuild.buildroot.net/results/692aae1d1ec7c7e83022a06dc2fd4b2ae7f28ec0 |     
  riscv64    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/854823bf84775231458ced5d5f66d07f923df07e | ORPH
  riscv32    | aer-inject-9bd5e2c7886fca72... | NOK | http://autobuild.buildroot.net/results/b000f5c4ef234a4eeef7a5dd1d868a3044f9f701 | ORPH
  riscv32    |         alsa-lib-1.1.9         | NOK | http://autobuild.buildroot.net/results/8010d771b5160cf2eaa4c9398a49d1efb3bc376d |     
  riscv64    |          attr-2.4.48           | NOK | http://autobuild.buildroot.net/results/3db50d8a0a913413b2198d6c301419136d2d22a7 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/e6c780e5db8b0ab925e2b248a475d33030b6c4e4 |     
  riscv32    |          boost-1.70.0          | NOK | http://autobuild.buildroot.net/results/97fd18d341cd5ef58fe199fb4eece360a9de4171 |     
  riscv64    |          check-0.12.0          | NOK | http://autobuild.buildroot.net/results/1d520a4dcca46b88c08c7e319fe10b1464e98307 | ORPH
  riscv32    |          check-0.12.0          | NOK | http://autobuild.buildroot.net/results/55338a32f0e2a2839590bdc10705dba4253990d7 | ORPH
  riscv64    |          check-0.12.0          | NOK | http://autobuild.buildroot.net/results/e550980dcfcbcd1abd50dec5a369b478415c35de | ORPH
  riscv32    |          check-0.12.0          | NOK | http://autobuild.buildroot.net/results/1b295dc68891b2f4f0b3b4ed630db435441bd754 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/66e49ea56b3f2d7fd76d983a6168bcd59d735fe7 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/a6fe72af340792a4cd8b8019dc0fe24611facbad |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/04a17d157aea45f9c2ff3586faae79d3af99f1e3 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/5d9e8559a59c34b5359113ad263a277e62ae46a3 |     
microblazeel |      cups-filters-1.25.4       | NOK | http://autobuild.buildroot.net/results/8ec2bb7258a385a301403873cc05acf0e3e3f239 |     
    arm      |          dav1d-0.4.0           | NOK | http://autobuild.buildroot.net/results/33f041c8def7a0759d077f34d74ef2852e16a635 |     
  riscv64    |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/ee09b584025d330579235cfd5620df60216ed418 | ORPH
  powerpc    |          exempi-2.5.1          | NOK | http://autobuild.buildroot.net/results/0d81ca15d7e2f7753b7ebbaa4b2384b305a3eff5 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/1388f427af33449cd09a6fbc5558051d42bf4d53 |     
  powerpc    |           flac-1.3.3           | NOK | http://autobuild.buildroot.net/results/5293638b77c769830b7c5b1a2964036a418e1640 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/bedef2ed9b6bfa9bdc8c5bbdbe3c768566be076c |     
    arm      |         glorytun-0.2.0         | NOK | http://autobuild.buildroot.net/results/35e4a49a4e7bb2a946bc0ca7ba61b91cebafeffd |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/b4f6b4643eef319592c294af5edf92837867d4dd | ORPH
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/b1ae6d3a5afd0f59e42e4b3a8e3def2346fd159f | ORPH
    arm      |      host-gengetopt-2.23       | NOK | http://autobuild.buildroot.net/results/2fcc92e0d0fd63e262dd89058a5f3de8b1b4123b |     
  aarch64    |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/baf3be3b565fb67641c1820278932f3ee7c30b8d |     
    m68k     |          hostapd-2.9           | NOK | http://autobuild.buildroot.net/results/f1b831d8a6396d784e3a69734c7f48e0f1fb2f20 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/30624b46c158f5b57982aed02698126c7e444593 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2d74ca81d56c5e7f075123a0e8bc1222ab1d38f6 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/89c466643723f7a21c94837201cf207e85fa8624 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/d643524daca3f58d44f4e93e23cc9ace0905fdb7 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2e070568827f57fb71cc6888bd7934aa9e17a605 | ORPH
  mips64el   |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/b449c4854753053f977759cbcf2e11d074228015 |     
  riscv64    |         jemalloc-5.2.1         | NOK | http://autobuild.buildroot.net/results/91d58fe4fd20856b2de5261ed8d2a8f31bf82615 |     
  riscv32    |          libcap-2.25           | NOK | http://autobuild.buildroot.net/results/bc67431b5756fff2962956af5c8dcf74c440a8e9 |     
  riscv32    |          libcap-2.25           | NOK | http://autobuild.buildroot.net/results/c30892f88015111c465064eeedacfff5913d612c |     
  riscv32    |        libcap-ng-0.7.9         | NOK | http://autobuild.buildroot.net/results/e6b9ec6db96ffa2207c508830f4c933d54bd12b1 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/61b37d8afd8ad00813fb53055f1a2c0a91667864 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/fb1487d31f4a5752452f44ac7ea5db65b1dcf1aa |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/0ccedb984261435bcfcf0f17b73aaee46e2cd0c2 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/bc5fb9e9e2c991165a17d6c263628c38e6f4a789 |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/244ae1fbde93df020e4c03fd3557ccdef91ea871 |     
    arm      |       libfm-extra-1.3.1        | NOK | http://autobuild.buildroot.net/results/cf8fb6162fdb3a76614391f492161269c0b43dae | ORPH
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/caa5356be056c5d232e1ad0caf37e205f37ce818 |     
    arc      |       libgphoto2-2.5.17        | NOK | http://autobuild.buildroot.net/results/aa71c0e7ad2113c6cf63d2aa48b83f0d219910e7 | ORPH
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/57ba812c56d5ca1b858f0116a1c21ac9991b151d |     
  riscv32    |          libsepol-2.9          | NOK | http://autobuild.buildroot.net/results/d2712c1fa4de1a0b4560ef19390f870b26e43038 |     
  riscv64    |          libsepol-2.9          | NOK | http://autobuild.buildroot.net/results/a3959b0613cf561059483abc580b144be4817d1a |     
    m68k     |     libspatialindex-1.9.0      | NOK | http://autobuild.buildroot.net/results/367af45d1edb1a17ab1ce4567d9eccba5ed3184c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/c2072b8f86a7b49f07ec2ac36adf3cfaedae8177 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/8dfa020add1ddbf4a8a2c2a2f64e3337dd039b8c |     
  riscv32    |         libusb-1.0.23          | NOK | http://autobuild.buildroot.net/results/16ac238f17f06d62a61d4eed6cf58ec8057ba60d |     
  riscv32    |         libusb-1.0.23          | NOK | http://autobuild.buildroot.net/results/7780fada05b8440ae3e97618615624a6a2dac03f |     
  riscv32    |         libzlib-1.2.11         | NOK | http://autobuild.buildroot.net/results/fd61577a5192f53a840dbf6efc7a8591882dec21 | ORPH
  mips64el   |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/29f35009a77ec9fa7a51841ad53bf9850d8fce8d |     
    arm      |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/120dc11cdd28ff7e1b404cd705d26327b726f183 |     
    arm      |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/9068faec9cd7fe7402efebb2a2837f7cd3d0dc59 |     
   x86_64    |         mesa3d-19.1.7          | NOK | http://autobuild.buildroot.net/results/58ef664bfbca2e310071664044ac761a75905d94 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/c39a1fe0bd87a24ee0c1cc97970ef7bd049562f5 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0c2e803c295fc93102f68df499eca5129cb263e6 |     
  riscv32    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/b72bfebbbd340754d82f3197e827ba091fc02252 | ORPH
  riscv32    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/415e1cc8c4734ff2638a69db69b78c50271b6e8d | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/950588db14b389f05c027920c6320c26e78b21d6 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/bc8d82b32eed0d113a7d5227b0f6683d3cf1cd7e |     
   mipsel    |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/7e8d6420c97f52abe5b5b20da1b556f24ac7eba4 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/29833162eb3b21cce49b4034f2f6e60a4dcd2e29 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/068888cad67d6ba81d2d62da23792425e499c824 |     
    m68k     |           strace-5.2           | NOK | http://autobuild.buildroot.net/results/5219942e23f468adf01f92a0f8b05dc1829d8c17 |     
   mipsel    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/dae627a066ed91d44d01994b5e8f965fbfaf7440 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/bdccd2f26c5d3117c3bad5e10907fafdf8eb72cc |     
 powerpc64   |          xxhash-0.7.1          | NOK | http://autobuild.buildroot.net/results/a889edb3448730af15e7871b32bf764500e7c8eb | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-cracklib-2.9.6 | 1 
             host-nasm-2.13.03 | 1 
                 libglew-2.0.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      host-cracklib-2.9.6       | NOK | http://autobuild.buildroot.net/results/25faf0411c3e1ac06913a2a86ed1e9d6a7e535f3 |     
    i686     |       host-nasm-2.13.03        | NOK | http://autobuild.buildroot.net/results/0c44e759250c080879ac90aec84521fcd0098e62 | ORPH
   nios2     |         libglew-2.0.0          | NOK | http://autobuild.buildroot.net/results/eb6fd6e64d548a59850c1b72b4c9c9b868d20472 |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                iptables-1.8.3 | 4 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/0f04c089b1bbffb9f2cc3b5f458ac738b87b6dd3 | ORPH
    sh4      |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/c866bbd8c4230ec6d41a85825a43b6389141ea85 | ORPH
    arc      |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/6ba6392b184509076e4e8d9120a20f9925c2467d | ORPH
    m68k     |         iptables-1.8.3         | NOK | http://autobuild.buildroot.net/results/c47fa604bb0d7864a7fa53cf4a3e2a0712bcc9f9 | ORPH


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

           host-harfbuzz-2.5.3 | 1 
               libsigsegv-2.12 | 1 
             openjdk-12.0.2+10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/79533d19438c0167affa24373c1c4e395ad03896 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/752649c800c46dc82f1006f81bc00fdda31811ac |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/031316cb58218c88559e892ed77f8a0a61808cb3 |     



-- 
http://autobuild.buildroot.net
