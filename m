From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 08:00:49 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-17
Message-ID: <20180418060049.7435A20884@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  33 |   2 |   0 |  35 |
      master | 158 | 136 |   1 | 295 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

        bfin |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/49f7ed78f4c233b74fbff9464364d05eb133efee |     
         arm |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/12ea8e8a8b8fbed16f51d421cce354cfcbe0e2ab | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

host-squashfs-e38956b92f738... | 27
dtv-scan-tables-07b18ecef17... | 21
                     lxc-3.0.0 | 17
                  zeromq-4.2.5 | 15
x264-7d0ff22e8c96de126be9d3... | 10
                   flann-1.9.1 | 8 
               libglib2-2.56.1 | 7 
                  host-go-1.10 | 5 
squashfs-e38956b92f738518c2... | 5 
          usb_modeswitch-2.5.2 | 3 
                  cc-tool-0.26 | 2 
gst1-interpipe-10dba89eecc2... | 2 
               libupnpp-0.16.1 | 2 
                  boost-1.66.0 | 1 
             expect-2014-05-02 | 1 
                  flare-engine | 1 
          host-waylandpp-0.2.2 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                    liblo-0.29 | 1 
              luaexpat-1.3.0-1 | 1 
              lynx-2.8.9dev.16 | 1 
              openblas-v0.2.20 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                 qt5base-5.6.3 | 1 
           uboot-tools-2018.03 | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/1d96b682f2e1af557a8127904ac9d61a8baee8e4 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a237d7f17e48e57e37a6738108a516050aad6a87 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/875b8243258295d672225a0b9e6fa26cab7378c8 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/9b6816673dafdb49f97e7b615a3ccd51527258c0 |     
      mipsel | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/0ca6887c3eb346b1e5b1f9c0c2b4b2efce28806d |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/53ee6dcfc8c6cc9f421c0cb29bf2c6e21c2cc301 |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/3029d606f7e00293ce6219748b30533a0f04c8b5 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/b5df264d88b1d5d75503e5a0387e87cb2dd9979a |     
 powerpc64le | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/36534dd4d8503ce66303f7fe495987069dbc1fbc |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/8c0399e99f88e19d9b3eadf6b42e990e3b53311d |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/5b9d2e734949bbb1cebecc358cefc7c15652d66e |     
    mips64el | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/1d01247a2d45bf5f23e65d74564831431ef58007 |     
         sh4 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/c82e451b7d0465ea7ac5321a3bfcea877057aa50 |     
   powerpc64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/f63c13615f232287b4d6eb773de8e475c03258fb |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/868bca69817e9f17c92589ef165576015c03265b |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/cdf82b7271981d80470285f047762ae9dc7875d4 |     
        i686 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/3fe3033116099e18e9bc6d88b742029af68a66ab |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ae8a8f289cea5b2b1d27b07628ab4b2d8e404334 |     
       nios2 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/262e3f461164df559c85646befde7df3cdabd188 |     
         arm | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/ad968f93a2128401f893cf8754eed2d254f46529 |     
      x86_64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/214d32cd8cd5dedccd47e2413ea1c33cfd6b46e5 |     
         arc | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/3578ec85995d7bed88bd72d7444d2503c77ca345 |     
      xtensa | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/38f6e0af82e7a3651175e5a64aaef0ab22555f39 |     
     aarch64 | dtv-scan-tables-07b18ecef17... | NOK | http://autobuild.buildroot.net/results/53b927c88003a19873edc8076bf7891a598088b0 |     
        mips |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/617a53de4959e06da84019eb8c21e87d15b5ff7e | ORPH
       sparc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/2a6679db17b714378bc18b52b4ea4f8b573118a6 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/46d24b1397436f5eb60a46ba1d18b7a88b1c1c6d |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/2649b815a7a81f3a46a750eb0deea42dd9c4a9ef |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0e7e9295e04192d93541f12ce1add30264cf8164 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/640bb14326e9d75f14f8ccc5165ccac557a7ba1b |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0c43cb672a0e0867f0532e940198753661121f4f |     
        m68k |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b83e42364b2ff9a5a98b45157f938d92a10217ac |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ca80ff91ec0d5af8707b4d3d834af7af81761918 |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/f5434ff9012562f8a6aa13c4d52d6d1f76a38579 |     
      xtensa | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/aa0a0d2668a2320e5b47794f6704e11eb77fb917 |     
     sparc64 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/616c07b20bea8fba68898c7f53a1ea583b5fcbf9 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b82800422d4ca88448762d8650dc7c8388a89e88 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/6a1091ac54a9bb8f31ef732ccc0ddc20b7a294d8 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3425c2621fe299b71a78d1316eb244da00ed9dda | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5febeea386a01f7c6880d8aa758c2e9fd16f57e7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/24227963c60a1162c699ab57fc2e62ff0545e596 | ORPH
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/394141c462b8650b0aa0e27d97346909c940ee3a |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e04952157ae60c1c57bda94661a95ec731b1c1d8 |     
      x86_64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/32e257e09668028573a89625371a3a5230516c20 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/d353e78656f984dffe574019532663aaee83e7d8 |     
        i586 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e5a9941eae0b3844fcbd79aca3c5b7714e8d8528 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/0e63d2d896f80276e4673de38395206b533fc5d4 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/a5e16275fa5889a79642b161c5f3f6bc62ffbf45 |     
        mips | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/4f88b0aea78a8c8be245ec26e8e53f32d8a90eb5 |     
        m68k | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/e6108325032bafeb84d63c80d24e229079d634b5 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/c83b7dc0b80b68d1ae284f4d4d46589668ed8c40 |     
     powerpc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/7e0a30197ce727b96bfbefde4d950e12b7fe2334 |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/9500814e1fb314bf717fa791736318402a3dc943 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/299234ddd9bac2a20b9db272605d28bf5a1bb379 |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/576631887d20922295bbcbd5e1bf766ac1a17161 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/299d1b53bc30f523ba8b0bd1ed5a29c9ee0c9d2f |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/d58cee05de781e4017a38ece1f8fc0fb1a637e8f |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/b9a6161053ce5719932ae9d61bd4bd29cff7f71c |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/f73433129e89647134b2ffbfb42f8aff2e9b8972 |     
         sh4 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/85fc8c19bd5708450e4ac43f8dfcdf86deca8f7d |     
         arc | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/918bfa16688a8097e488659ad4f94cc87b36cdec |     
      x86_64 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/68e46ab409c90bb5f47f11217ca1e32b3207e0ce |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/4643003210e4a3ff0da36bb202b384d1059c54f3 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/ddb67b751a7d168362e797425bfef07d71c03732 |     
         arm | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/76d15b1ba974fb62166c1a6137fe3c785e6edaed |     
    mips64el | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/150c57852e6440a861f612943e0676bb229fab38 |     
       nios2 | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/3972aaeb675355f65316a35fb762fc09cc1e3cf9 |     
      mipsel | host-squashfs-e38956b92f738... | NOK | http://autobuild.buildroot.net/results/d964fd80448474ef4e94832374e78afcd502d22c |     
     sparc64 |           host-waylandpp-0.2.2 | NOK | http://autobuild.buildroot.net/results/fbc2f0b0097cdde0464f361626b27ae225637d1b |     
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c19525276a6d93d485eac3c3f26ad3e4473fadd9 | ORPH
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/a5561d9fe47cb0e4082d7733eea72523c66e0ae7 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e3dfe6e1c9db6cc90d7a0a6f9bd495695fb4277b |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e58ec8d0e42e7d8135fe442359d1d8c4e417b4f0 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/e605c3d19adb29987cf54ecfbfee872c82a834bb |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/5a4fd2d7ac432e07cd918e9b5d6136d4b45db10d |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/a8ea8d126f24e6ee828b7b9df61df106439dbf2f |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/340f376e7deb558a15297b906366da6ecb49470a |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/92a181c67e29bc0ed5fb91d06f6286b644d5e4ec | ORPH
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/ceb8bbdf673ab74ed8c9a4f729bbcc52c00de3d4 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/f9b6c66f3bb1d3b8f7a84a72b462510360a95763 |     
         sh4 |               luaexpat-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/b126bce0bbd111f021ed5be7c8773fef2a8f8579 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d966548bbb364e88914e08c6ae6ec07fbd357971 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a3fb46df47e5991e2e5aca8d4bbc6905ea190a7b |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d30d45c24de80da62fd1d68ab8f9a6223f93f7ab |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f16c5f085a150cde4e9e673ea9a8c93e96a756b9 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ecc17f73675b3446f6ab1eda5dd18316f11ab437 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/4b19056a0b729ceb2f846a6e4755aaa28c5e78ba |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c895d9f5e071d1651790ae6f83e78824c5a38477 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/84c334cc9cf9937165943d3e195d3e6d896a19d5 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c116564058847c0eb0630f93dc3ec81473094d64 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b69bfb44b80546916e4fd5619354ef8438beac99 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f8a70ba3c6c545a68f844f8958433ae761d9dc1f |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/26222ad93f67649f08dfd2bdbe96978d39e12e99 |     
        i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/052993c063fbcfb0cb7b2aefd141a039e8855d19 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c12bcd47430a5e222fd6f82725d758a14fedde35 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/cb4970f0ada6d3a802597b8e299109c22836cfd3 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/75460630ee400eb59890001f509dbee4fba34148 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/339c729c3156539587eed3bf48a7bf521b849f4a |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/3a90cd81190929fae451a4c10727c9bb8dabb450 |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/f13d93372449c9bf1b3c79ed056b8d820470ae89 |     
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/080411fed3e05d50baa9205630e78c32cb245b52 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/8ace336ed10517d5a786d3846ecdbb0721740c3a |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/6eee4128a75e7e89f108208680c59754d8c6c4d6 |     
     sparc64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/ae451bc5bb6dbd99db60149adc4e184fa74962ae |     
      x86_64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/8fec9270802c3b60371b5e1835cbbfe8eea978ec |     
      x86_64 | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/dba3a320f021550b2341077310af354855a1e117 |     
         arm | squashfs-e38956b92f738518c2... | NOK | http://autobuild.buildroot.net/results/31a125c7c49d617292cc5c90a3596187c9a7c8d3 |     
         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/44927220e3eef6049fee7dda25e59ccc31fc6c8f |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/d3704ce5ec5ecf67344487622a48d514d466b4cb |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/b4d4e925763cb6558af915f9781afe07fc557ebc | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/b91386592a70314558c6b813d458cd1e63d74883 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/673d9b33219dd0aa803d357adbe949b6428c092b | ORPH
      xtensa | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/0ad076dbff15ded787f510084b9b18118b545485 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/1f2b4a583b16d2ca522840b98dfa880c984798c4 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/2e831bfcaaaefe0651aa24e269604abaa1f2e4a0 |     
     sparc64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/5f3cba61bd1af9e66b4c8fb51e294d4e3ce3e775 |     
      xtensa | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/25756e085b5e61c27dfd4ed638ccb3e11140dad6 |     
microblazeel | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f1a5f3c94eb5c6b1e2427da649883bbc59b379cd |     
 powerpc64le | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/1a5a000ec5578b8149a482e689e081cb8e28650e |     
    mips64el | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/f72c259247dd017929189c59c2c9d03aa4088a5b |     
      x86_64 | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/b58551729f1603a2ab92c0b8518d7d9ca3000b04 |     
         arm | x264-7d0ff22e8c96de126be9d3... | NOK | http://autobuild.buildroot.net/results/efac4fb7bca50381fdf42711af4efad8fb5ee4d1 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/92f2d74976fca148bc35535daf6e7065d5cc200d |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2d070074097270a1e6973bc19e2bded2a7023c49 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2c364b8e349c5ab4744b80b074bcdcae6b3458e4 |     
        or1k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4dcc7b318dfc5be15d93e14c07f23597bb3803ad |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6baf62fb9f7efc32762d209091ea43d090d1266c |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/25fc4dc47b7cd7853904450e2aaf897feed57690 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8f6016fa053b9c0a3b9da9d3c9d06e37dd4ee24e |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a971d4a332418923b8ba2ebf69897f6135f0c927 |     
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/69b0bb90f59bdf9265707aec7d805d4805841c08 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/4bd11d3be8a7aaf34512261ebeac70930c5eae79 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e2e4bb24bf5096e325d91a011dbc3a02bd57f75f |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/97c5b9f3bc2c94f8476e884b9a3163bbf2dad8d4 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/86ab2fb72dba27c88d5d85f9bf64054511bc13a1 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/61ea42f17cd5e83e7dd46ae5018c070f80f3d364 |     
         arm |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1ce6d6f0f6390f552954a09f7dc753e0baa86675 |     


-- 
http://autobuild.buildroot.net
