From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Sep 2020 07:09:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-09-23
Message-ID: <20200924071002.A275486B18@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-09-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 20  | 19  |  0  | 39  |
  2020.05.x  | 16  | 23  |  0  | 39  |
  2020.08.x  | 22  |  9  |  0  | 31  |
    master   | 166 | 111 |  0  | 277 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 17
              asterisk-16.10.0 | 8 
                       unknown | 8 
 Makefile:752: target-finalize | 6 
         libcpprestsdk-2.10.16 | 5 
                  zeromq-4.3.3 | 5 
               apparmor-2.13.4 | 3 
                  boost-1.74.0 | 3 
          gstreamer1-mm-1.10.0 | 3 
                 uclibc-1.0.35 | 3 
             kismet-2016-07-R1 | 2 
                   libcap-2.43 | 2 
                   libnl-3.5.0 | 2 
                log4cxx-0.11.0 | 2 
              micropython-1.13 | 2 
                rocksdb-6.10.1 | 2 
                samba4-4.11.13 | 2 
                 ser2net-4.2.2 | 2 
               target-finalize | 2 
              alsa-lib-1.2.3.2 | 1 
              asterisk-16.13.0 | 1 
             babeltrace2-2.0.3 | 1 
              bitcoin-0.19.0.1 | 1 
               capnproto-0.8.0 | 1 
                clamav-0.103.0 | 1 
                 corkscrew-2.0 | 1 
                 dc3dd-7.2.641 | 1 
                 dmalloc-5.5.2 | 1 
dvb-apps-3d43b280298c39a67d... | 1 
              ejabberd-19.09.1 | 1 
                 fwts-19.09.00 | 1 
   gdb-arc-2020.03-release-gdb | 1 
                host-gdb-8.3.1 | 1 
             ipsec-tools-0.8.2 | 1 
                 libpcap-1.9.1 | 1 
               libupnpp-0.19.4 | 1 
                  libvpx-1.9.0 | 1 
            live555-2020.08.19 | 1 
                  ndisc6-1.0.4 | 1 
open-plc-utils-32408520fceb... | 1 
                openblas-0.3.9 | 1 
                 opencv3-3.4.9 | 1 
             openswan-2.6.51.5 | 1 
                  pango-1.46.1 | 1 
        python-m2crypto-0.36.0 | 1 
                qt5base-5.15.1 | 1 
            qt5location-5.15.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  uhd-3.15.0.0 | 1 
               util-linux-2.36 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-lib-1.2.3.2        | NOK | http://autobuild.buildroot.net/results/1f5cdd10406efe7e4c44d01b27eae7c22022f528 |     
    arc      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/097daf46a3d8710094eca10c3c6f16b26af168aa |     
  riscv64    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/cb29a20246caf4be6f11c9385755161f6c216db4 |     
  mips64el   |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/7f088f3129be199cdf66fea09940864d7353ebaf |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/49c0851cb3ab1792d3556be52d9f95815043dc2a |     
  powerpc    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/f7bb49012f93d83fa29c482f67f7708fe1a6074a |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/0d8e0d7486ec84cad1564b53b294ad7637338786 |     
   mipsel    |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/731f547ea57f6b8b350e0a4e712895a92b728175 |     
    arc      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/8f954c9d3053195131336787003d4666f5eee304 |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/50a7bde53dec5f2827ed7be822ec8a32636c418a |     
    arm      |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/7eee58c0216d9e5881a52b62e9a4ae7fae0dd439 |     
  mips64el   |        asterisk-16.10.0        | NOK | http://autobuild.buildroot.net/results/897eb985a3d1ed5a8f61b199cebddb661c213751 |     
 powerpc64   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/22433aa8e1844bd51c30efaf1c6465383c6118e1 |     
    arm      |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/6c8bce4919e4f80b9deb2971f93ed7be09a60810 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/47290fbd93f4d1a8413eabb3c2b59cf71d6689a2 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/39ddbd17aefbfc3fa8c4b5023a57eded63f0c07b |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/af703e8cf4fd3570e398b287527b38b670967d5d |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/7c371ae6c33ab2d3aa02c69e70bcb0af5837c03c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a5e1e6f872b0d9d27ca358fb0c916d4d44dfe848 |     
    arm      |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/e276894781e3e37fbc03a0745738c61541e0a211 |     
    arm      |         corkscrew-2.0          | NOK | http://autobuild.buildroot.net/results/e89c92623feb4f44748f9ae9437d62cf73dac8d7 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7df2792a8bbc111069a135108e92837ecd57cf4f | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/c74cb466584a85008d486796b131edce22ea6ea7 | ORPH
    arm      | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/c014a0ead3b63c3fbc6d669483fe8c4906f37382 |     
    arm      |        ejabberd-19.09.1        | NOK | http://autobuild.buildroot.net/results/415d1de9c2d683a693f74642b85812039f0ee48e |     
  aarch64    |         fwts-19.09.00          | NOK | http://autobuild.buildroot.net/results/05bf7b52d3869ac66d4b5d0403d239fb58aadaec |     
    arc      |  gdb-arc-2020.03-release-gdb   | NOK | http://autobuild.buildroot.net/results/126791cb4d67a204af6b1aeca7b1f784ed8ed019 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/bcd1350041dc029eaf37820566c1af36fd268662 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/043134ab43a7b602b710c03ec6e1ac72c6d2570e |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ea7a3a9570b1eeb7fd4c94ad073a35ace82617ed |     
    arm      |         host-gdb-8.3.1         | NOK | http://autobuild.buildroot.net/results/e0ece39f512bd5efd2b8c5c195e1ce012d9024d5 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/123f25150b5d95d7094f56c30dee65df86de9a9b |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e8d45326a1c72566a17fd5f2f57019f0d49ab868 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d44ea8ca45085cf6126bbfb9fc41c94b5866b5c5 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/56349fbb8b2ed51b0caa55fe56ecb14160672c6e |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/426b30b694765bc1628623aa9fe3b49028caab57 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3ce8de209aee53c4715a2ddeba2737ec8d10e7ac |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9e55e08399bc986ab09e0580ae0c0071e5b13e8f |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ae5b65e9b1c8c9ee5d25f34afed83f0b43cc8760 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0204d8d5d2ad5f9a6058ea5f56fb2b4049c2240d |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/56609deec68770a06f46cfe437441f69b0e90f8a |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/be0b7ed08a095265733affa9bc6ee95378d559ea |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5375eed9c8f678a1e129cf92777708cf7342faf3 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8255c0215fd35862ab72e2df83141b4e80fac38c |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/721d5ddb87c187ab172713077a92bdb6b6239120 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4be46b49b8b4b4637e3e5e84f2c6178536085f5e |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/74bf498cc1fa73de8e6b29807a76c906bbb900ff |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cd6d701acb559f9c0df4cc5febddaf8345daf69 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/9e181c360c345c00ebdd25de2f83881c8800d67d | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/5bb95ca214100c1032ac572a37b4c11a3b1c5927 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/71a7770113c36028b2447f21e47a064d3b1fa704 | ORPH
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/411f97ce7c5174b1dcbba7e7be8cbd4930c031eb |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/6bb78a3c9e5d6943f0376edff72fcc9906fff5e3 |     
    sh4      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/1489d171220190154e0b3fd91579c0be4efeee86 |     
   x86_64    |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/2795dcab57e6ca287eb93c05c760c3c584a8aa3b |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/0378342eb2394369ef51e4107da1f9687f278a0a |     
    arc      |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/0f9a4b3dcbb3240c67c9f8db24e02efcdbf403e6 |     
    i686     |     libcpprestsdk-2.10.16      | NOK | http://autobuild.buildroot.net/results/0252da1b3dfdfd1362e496fd7a0cba0da89716cc |     
   nios2     |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/bd1c9899eb2e1999c23d867c0f252c21706582b4 | ORPH
    arm      |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/983953b6872fbd2e29577e4628ebd815bec6f33e | ORPH
    arm      |         libpcap-1.9.1          | NOK | http://autobuild.buildroot.net/results/d99dda99722c53730b5964bd4ff1e1281c4ad759 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/8d12ee8df4f465dd0bd8327de4d17c0af0cbc6eb |     
microblazeel |          libvpx-1.9.0          | NOK | http://autobuild.buildroot.net/results/88aa80ee006ba2dcc40c15be3af73c756cb62974 |     
    arm      |       live555-2020.08.19       | NOK | http://autobuild.buildroot.net/results/79fa87fa9ef25e28363f9181509af357075dd8bf | ORPH
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/30d71e0cea4ea8ca5eade972f05cf12ea1b1d244 |     
  powerpc    |         log4cxx-0.11.0         | NOK | http://autobuild.buildroot.net/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c |     
   xtensa    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/66a645d349e994c997291ea4efc653cb7bba7ec7 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/e958b47a68a3cf49e88426ed1cc5d3e3c582eea2 |     
    mips     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/56aff1ef161edbf1ab41a1f43a3c97252a816a4c |     
    i586     | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/d34110b4c4649de8471e4f720b2bc0798c61c260 |     
    arm      | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/72d423482cd6d0b75419e48c00d20bb583bc7cd2 |     
   x86_64    | Makefile:752: target-finalize  | NOK | http://autobuild.buildroot.net/results/457412dd87e19b095d3e40942acddb438d7b8448 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/fcfb63e76b8607b2eadc308335b0f7e83f6b1b59 |     
   xtensa    |        micropython-1.13        | NOK | http://autobuild.buildroot.net/results/c915231c500b501a265f441119233b5589f79889 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/c70058300bf759e4a10160f12efa2df7bcb91ea8 | ORPH
    arm      | open-plc-utils-32408520fceb... | NOK | http://autobuild.buildroot.net/results/6b3064b64dea3d4aaf219f787429c25918101483 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/192ba6feff1d17f26781fb7e7c08d8a38ed7dc2f | ORPH
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c4b00ec23cffb61c17ecedee965bef2e182c8d5f |     
    arm      |       openswan-2.6.51.5        | NOK | http://autobuild.buildroot.net/results/650fc0046fd063c70e17ce5ebd9592195657434d | ORPH
    arm      |          pango-1.46.1          | NOK | http://autobuild.buildroot.net/results/2d083d2c60b8b12ef3b62a7c6a8662cf1f8178a1 | ORPH
   mipsel    |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/dd57181603ef8f0be183efcdbdc47560d6bc0474 |     
  aarch64    |         qt5base-5.15.1         | NOK | http://autobuild.buildroot.net/results/827f375fa0689ff555856b82613ff60c6caa5850 |     
    arm      |       qt5location-5.15.1       | NOK | http://autobuild.buildroot.net/results/f16ff438ddc1897e9408ebefedd5674d93157dc3 |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/5390f69a6a8314dd93b4882b8b522f56b020d42c |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/edbfa8975861ce65cf22c4e2cf5ba2e18cd03c96 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/83302fe0e5faf4ff8faa49e89090b27d022d6059 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/76a8dccbe001f14dc455349a5fe53618d0d79e22 |     
    i586     |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/ece234b6367c886a6dd2e74c06ce5a9e21797e1d |     
  riscv64    |         ser2net-4.2.2          | NOK | http://autobuild.buildroot.net/results/6d23e133617dd6b8d6e0c8236f01120512cbf0ab |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/0cf342d059d98dd05e9d7826ef066f0b71874a67 |     
  mips64el   |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ee272070f7dcedf9ec59bffca72fc65f6d66f621 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/6ac3f022a241cbe50a1b1867571f3a03f470e0a7 |     
    arc      |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/687d298e2b5574693151286506a799d93651d3da |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/d99ae9ccec89f28d8753d47e7a04539d69377eb2 |     
  powerpc    |         uclibc-1.0.35          | NOK | http://autobuild.buildroot.net/results/5554afd3b8aa7c6760ddfd9be6983c5f8aab670e |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/7480c6378db0f32b57ae24b862b77dc0178ad4b5 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/45f4c07bce74335671595663efd870d5ceef7e56 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9db907446d64978fff9b1d1db565d50ec6f68162 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4e9eb144708819ced4fe0966030b1c37af54eb50 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/2d7517de532abcfd908597573f29cac3c8f5e754 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f55ea076933b4fa717dc2c8121ac1e579b21dfa9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0ff299ba853b7fe6e1eff5d3b8774c42a24526c4 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/8cdcf7b874555035670eaa077d505b8f10c88525 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e60f622fff2040d3fa2f238d0937274626c1183c |     
   nios2     |        util-linux-2.36         | NOK | http://autobuild.buildroot.net/results/a69c773710c405fae4124fb468d1e26a38af5d51 | ORPH
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/c49bce4f3cfc06302f85a55d77b1a1d149f690ef |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/f5fee8365b2d55b3ffba76bbea7e768039b460a3 |     
    i586     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/0ac6ca52738c064a954c1a55201cdef5c5b5af50 |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/c15239d4131a9a04005c2eb4fdac7edb02deb5d1 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/5059c2878c39b0a2e21fef01797a0b98206cf008 |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/58c844de3222d2a3d6fab3ef15e079351265b7c6 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               ipmitool-1.8.18 | 6 
                       unknown | 3 
 Makefile:753: target-finalize | 2 
                  botan-2.11.0 | 1 
              host-grpc-1.25.0 | 1 
             libopenssl-1.1.1g | 1 
               libupnpp-0.17.2 | 1 
               protobuf-3.11.0 | 1 
                 rocksdb-6.6.4 | 1 
                    vlc-3.0.11 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          botan-2.11.0          | NOK | http://autobuild.buildroot.net/results/918405c3481ef62977e91ddfbc2515720c85514b | ORPH
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/141b7614c084018d664383f411aeb8b7083dc8d2 |     
 aarch64_be  |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/0e6df4188468d78a33c0b6a6f6258d2585b6c5dd |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/b2e546cc9ea40752e97b8488740f426638db3a80 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/86973f8c88f6acf32a993cf73cdf2a5c5e04a294 |     
 aarch64_be  |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/66f63e6ef8066912f23831213a367484c4a95795 |     
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/14bcf4ca38d6230dd10a3efdd6322583718676f7 |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/272d8cb70219758354f6fd9b3b15083147143a93 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/cd11951337ba0e01355bad2c7219a7a501b34288 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/22d35a28c36cdde4af93ec14d268d5372640bf3e |     
   nios2     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/3cf3839e043c94f42baa8522ece5ef5140b5db1f |     
   x86_64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/9f0c2428ff4563afcc883e5262093ab29321289d |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/bc2c4039ce68ffb9c7dd9acc0b9b5f0428d3a72b |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/34c5c3308df8efc5abaaebd62f0a93c00c5aa01c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0c8608d9acfa036721d28378132060ad4dcd0a9c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e89416032a19f25a0dcd5940b846f0a89dab2ff3 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/c4e1feddb9448c7d2bfe84854f7fceffacd16003 |     
    arm      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/7e6f07179ddf3b4cab1445214c064921f2b6f8bd |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/8a78b99ba6ba9d6ab267097469ae8539b2ebd98f |     


Classification of failures by reason for 2020.05.x
--------------------------------------------------

               ipmitool-1.8.18 | 6 
            ghostscript-9.53.0 | 3 
              luabitop-1.0.2-1 | 2 
                  zeromq-4.3.3 | 2 
               apparmor-2.13.4 | 1 
              host-grpc-1.25.0 | 1 
             kismet-2016-07-R1 | 1 
                  luajit-2.1.2 | 1 
 Makefile:753: target-finalize | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                 rocksdb-6.6.4 | 1 
                       unknown | 1 


Detail of failures for 2020.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/1e1d07cf56e743ea31040dae6cece940a86c1b96 |     
   nios2     |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/c25f26957fe3ba8741566d2b630e7a6edbee059e |     
    arc      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/4daa27dc970faa08d4486509814a8017908ce21e |     
    arc      |       ghostscript-9.53.0       | NOK | http://autobuild.buildroot.net/results/689022f1a1fb836dc676655f29dadd3679dea9ac |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c8c7174dd1b309f2d83dc4fff4944f616af16799 |     
   mipsel    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/d1871944202d616ee4e0a59c8ed0291c8fc42ef6 |     
    arc      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/6dfab6af54ed65eefe2f90ab170edeeb001d3793 |     
  riscv64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/4cec68f6712e7b648d7519db08974cfb7d31dc1e |     
   x86_64    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/ce5631a7f9f1e2b6bc64bd47fd32c0e434966ffa |     
  powerpc    |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/336c4c13dcecc1439335717806d1dd0c38b0bb57 |     
   nios2     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f06054459db52c0252c5451764c4b93765c16757 |     
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/dcf35ac8a68ba6af9c179efc37f0ccc7b5eefbcd | ORPH
  powerpc    |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/c606971d1360438af234be62a553fa0a37ef06ef |     
microblazeel |        luabitop-1.0.2-1        | NOK | http://autobuild.buildroot.net/results/804886f9fd39645150af20f185e53e0c12c5b75e |     
  powerpc    |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/d98080124682900a70c1ba10960ed14a4d17542a |     
   nios2     | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/7e1f6ab8a7c7fd9fafa76a97992950ccaf549ee1 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/3ecceee5c550e7605ac27020898c07b8ddd3497d |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/8c34db72d6e524e0ad439b866705d9c2bfc2feff | ORPH
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/5b884dcbb9cbb95be44a82061ea0e2c244fb6714 | ORPH
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2705d92bdb1071d02dc8ba819bd59d54bc5e9608 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/09f16c0a425cde19f5692675345a69d6b7ad72fe |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/4cd803e16d71bb4ee0494d06ac3ee86a4b699c5b |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/4a6f12414d1816af51dfc11d724964c59ff30ee3 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

               ipmitool-1.8.18 | 5 
              bitcoin-0.19.0.1 | 1 
               host-efl-1.24.3 | 1 
            live555-2020.06.25 | 1 
                       unknown | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c4d517baff456d57baaadeca30b3982f0a7918fc |     
  powerpc    |        host-efl-1.24.3         | NOK | http://autobuild.buildroot.net/results/1e8ae2f40e73de982acd82f23dbb7c4865c34cd2 |     
    or1k     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/943743e8d62309b82d69713405af6c0eee95d26c |     
powerpc64le  |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/070a88a2a6d8b389957fd3a3db972d30aade152a |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/3f2a4d5ee7643e38a3a8e482374724aef22efd1e |     
    arm      |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/f09b872fdb21d811a32117064eb7fddd210cc443 |     
   nios2     |        ipmitool-1.8.18         | NOK | http://autobuild.buildroot.net/results/e37cdd13e01748bd8d13183e9f846eab7d55000f |     
    arm      |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/74f8e529f57fcf9ecf75d69b79cd8de7155b503b | ORPH
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/ff485e475dcd8ce29857959a495f52b5cbcd50da |     


Gitlab CI results for 2020-09-23
================================


-- 
http://autobuild.buildroot.net
