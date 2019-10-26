From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 06:18:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-25
Message-ID: <20191026061809.A486287BFE@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 30  |  2  |  0  | 32  |
  2019.08.x  | 16  |  3  |  0  | 19  |
    master   | 136 | 149 |  0  | 285 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 46
   jitterentropy-library-2.1.2 | 13
                    bird-2.0.7 | 10
                    brltty-6.0 | 10
   jitterentropy-library-2.2.0 | 8 
        host-dbus-python-1.2.8 | 7 
           host-libselinux-2.9 | 5 
                       kmod-26 | 5 
python-libconfig-b271c3d9da... | 5 
                host-lld-8.0.0 | 4 
                   libnss-3.47 | 3 
        ltp-testsuite-20190930 | 3 
            host-mfgtools-0.02 | 2 
             libopenh264-2.0.0 | 2 
          python-uvloop-0.13.0 | 2 
                 rng-tools-6.7 | 2 
              spandsp-20180108 | 2 
             dbus-python-1.2.8 | 1 
                  gmpc-11.8.16 | 1 
                   grpc-1.23.0 | 1 
                 haproxy-2.0.5 | 1 
                host-go-1.13.1 | 1 
              host-grpc-1.23.0 | 1 
          host-libsemanage-2.9 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                  hwloc-1.11.7 | 1 
                      icu-64-2 | 1 
                libdrm-2.4.100 | 1 
              libgeotiff-1.5.1 | 1 
                 mesa3d-19.2.2 | 1 
                   mimic-1.1.0 | 1 
mobile-broadband-provider-i... | 1 
              openlayers-6.0.1 | 1 
              python-pyqt5-5.7 | 1 
                    strace-5.3 | 1 
                   sudo-1.8.28 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/48ab71694939d097d7d9e850c4057612b6cc79b6 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/bd3338762b05878e4d14cb8f9f69d6899847d53b |     
microblazeel |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/6ad7173b95235e77d20d1a46cfc6e16d612b49f9 |     
  riscv64    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/872f04ea24d278f5ed8843432253da598b6cf545 |     
   nios2     |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/239846223dc4f580c4e9f2ded9af2f9706def55b |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/2a0a1025b7ec9d46d9b62d2d32da3614df748826 |     
  mips64el   |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/3ea39c7ac3124dc3a53f43247a5f8808c11ce0f9 |     
 aarch64_be  |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/c5961108c649ac946ee4012aa09c391f29e66354 |     
powerpc64le  |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/d2b4b9f03d20ed85cde24e19b9bef03f449a9f19 |     
    arm      |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/8d2499a5a6468a52b5895640e2f0feb94f8d07d2 |     
  riscv64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1cf891c7b9ac89a8a23efd77f7f8343636ad561a |     
  aarch64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7c6e7c9844c67fce5ed46360f9260597821372cc |     
  sparc64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/65e75ed2e03a9613a2883e2a23e23d732b881c75 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/81ac110afea95ddaf9162239d94c34ecceab25c6 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8525c8eb12d1c6c4f77246338595ba3540d7f78b |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3efc489c236a3fce0a6faa3a3306c55343fbc002 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/175683b60dcfcfc7a3689337a7aa601af77a8bfd |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2dc4c65837980c713cb7893ee2750b3aa4461207 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fa5ff179d15b627fba64ef608bccf5aae4bb02b1 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0d442649cb4a34ea852b11619d0247f0a05b3cb4 |     
  mips64el   |       dbus-python-1.2.8        | NOK | http://autobuild.buildroot.net/results/5c6150e86da0d07399d140d846b91905d213f3bf | ORPH
   nios2     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/5978beebfeeec75b4b90094f2d5ba97642071e11 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/b51c5d5cff95927806a5529ff9421075c52c0f5c |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/35730f0a423b66d4b1ff70ea472894508d5fb4cc |     
    arc      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/a4808f3f928be5122b7d221c44ec6b9d19cd6e20 | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/41c47347591c3dfc66b0945c6f54894bcc115584 | ORPH
  powerpc    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/89d65b5534ca53ffac5b29d6bac6f7e3b495d08f | ORPH
    arc      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/2d771edef68f5cf64be7d2df612ad91ebf7af19c | ORPH
    arm      |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/c1f5e3ba1973bca7b08c4e490d14575208989b3f | ORPH
  sparc64    |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/2db8b8de6f9867e4d02f7c849d3f2cb00e1340e9 | ORPH
  mips64el   |     host-dbus-python-1.2.8     | NOK | http://autobuild.buildroot.net/results/3a2b7d990e193bfabfd5962f1125bd3992a1d720 | ORPH
    arm      |         host-go-1.13.1         | NOK | http://autobuild.buildroot.net/results/073f70101620a6c39c303f92622fe1cf8014c933 |     
   nios2     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/4bea084422d2bfabc3554a500f2765d108a68483 |     
   sparc     |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/a66500697f5eb91b7f205b40bc2ed38c36a69853 |     
  riscv64    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/91e1c4f635dfe5e97f907731aac2a9cceb6c84c9 |     
  mips64el   |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/ef57da81502960dba9ef0e6c42449019bfd38533 |     
    arm      |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/f3364d7f031d9cd478505d4bdac337e81bff6353 |     
  riscv32    |      host-libselinux-2.9       | NOK | http://autobuild.buildroot.net/results/c8691cf25e38fb38892d99dbb7f09a8629f15276 |     
    arm      |      host-libsemanage-2.9      | NOK | http://autobuild.buildroot.net/results/0081042cf078b73d449d5330a2295abf6352b627 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/10c9f6fee97d88cb25a211ee9497ac2e1d1a7491 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/89f7cea99946a1997ad069095244fab87fb84382 |     
  aarch64    |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/46d1f75a42ba78f5ef48dd4f8fa0b674c9a39270 |     
    arm      |         host-lld-8.0.0         | NOK | http://autobuild.buildroot.net/results/bf85177110a45e3e56e4102b82d81322b2e27a2e |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/8b8542c4d1dbcc056d4ce5469c848295997e08ef |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/cdc96153c4418c039013a061af1024cb5f094003 |     
    arm      |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/185e0ef8c1fb1f11f55b2c2038224ca997f39b2a |     
    arm      |          hwloc-1.11.7          | NOK | http://autobuild.buildroot.net/results/f100191acef41d42582ab2a35e1b6f264594f074 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/de72a82c39451b4c81afb1a48f47f4a4c17dd50f | ORPH
    m68k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/53a4673eb2565e9f7be6b966c326f7ff9812d57a |     
   mipsel    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/8fe5b48405f01f47b068bf5654a32433466ee1d1 |     
   x86_64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/33aa58172b86e48e500dc5056efe0214f194fe75 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/ff25f75041d7b9aa0e0f6235bc1dbe67c70cd888 |     
   x86_64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/79313327df56829a91e9636ac6efaf2db8e5923b |     
    or1k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/c80af3e5ad25c696ba7655eb82a4e29faff56ed7 |     
microblazeel |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/d0e3d2dbdb7834bb0cb1e3d540dee45294c93059 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/ab4be8d5e1533bb46c77b98ffb862cc1b977088d |     
  riscv64    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/1c3ff3391c49c96f364c2900c8789b6833e4c124 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/6c63242fe626a768a7d1a883af1a0fe5098e08c4 |     
    arm      |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/b8142a25b458189cf4f26d6f8ab8e61fb2ce1ffb |     
    or1k     |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/80ad509a1ee0e23ba2940494acea562b23dc5dcc |     
   mipsel    |  jitterentropy-library-2.1.2   | NOK | http://autobuild.buildroot.net/results/180b1232e5742718aa22f7a0758f8f67a00657b7 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/0cd821dbe5628165ead629dba92c8c98ff845d4b |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/34c068e66714af251368ed43bc751fc6186cc439 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/948a4ace97b045622e3863d52baca7a9d862dd48 |     
microblazeel |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/7ea8fee7221f6a19424ea04580a03f86255d5bf6 |     
    arm      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/b308062bae8de0f9cfdeacdd5742f58d2bbea33c |     
    arc      |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/532cb8f05bd9bc0cf150315d6db1fb212a150bbc |     
    or1k     |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/01fcfafe3610efed29c85daf88c56884b86d9d72 |     
   mipsel    |  jitterentropy-library-2.2.0   | NOK | http://autobuild.buildroot.net/results/36ad3ff787285d0050d0382eb8a9a10177ee89b0 |     
    m68k     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/84455dbc892865b9748bedeecb1d3b0bdc15704d |     
    arc      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/78b1e5e1217a2ab1016233018cce79eddcd66ccf |     
    arm      |            kmod-26             | NOK | http://autobuild.buildroot.net/results/8f1a4fcbc19d3b24316b7e66dee183e0bbc6b05b |     
  powerpc    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/93f3239ff3a4e3affcd2ff4e43992d6ca7e61804 |     
  aarch64    |            kmod-26             | NOK | http://autobuild.buildroot.net/results/34944ce6efad256f969579d79dfb5d48d5b61f12 |     
    arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/129fdcc842385cbc21269413f11534f86d3e9e20 |     
    m68k     |        libgeotiff-1.5.1        | NOK | http://autobuild.buildroot.net/results/661e19d1b865a199ec9f7056a8bf671cd4343be6 |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/17091a16b08a4d9db8b6084a05c0bfbd867c478a |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/79d51510f08b5c8d307906e74c85ca440b2cbb2c |     
    arm      |          libnss-3.47           | NOK | http://autobuild.buildroot.net/results/8c06694899500a54cbeabac130cc349412d28337 |     
    mips     |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/18b34b6cdf1169907629885703b35a3a2b1c5716 |     
  mips64el   |       libopenh264-2.0.0        | NOK | http://autobuild.buildroot.net/results/621df3a111676b35fbc4b758c6e861519e5e000a |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a8a59759401bd3fc4b7ea88cd63eafc906fbf475 |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ecb18075e3c4e65776f6b8b4ad5205976fd79b79 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/42f77a03bfccdaa9dca2bd247added710fa34e0c |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f94ac7ecf14828ec50678e52aee1c606b7dfc24b |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/97ae0a3f3ebed70a1817bb62a1bfc5326be9a742 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/dae0cc8ace03ee67aa073d038f7554e1e8a4c52d |     
    mips     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/4085320b2bf2e7fb62c0f0f759c0fec12311efcc |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6e7b3a25e54c6c4f5037892f206d67e6ba5a5f1d |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/64f48fad2804735b40ea2ad82c46cb41d208ebb5 |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/039e61bc5dc380d5f0657e028d0de3fc41c8307e |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a3a6eaf7174c71cfe84dd34252d50c5d855d5d47 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/aeb58de7ad674b980258e6ed30c7da3949a04452 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2291db6aa1d82573e493acb36877b189ef32ed45 |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6789746c9dd9ae6ebc1a8ad0c5d5136b45de4e25 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/279668012bfc97a1555bddb6ae7bb5ca416ee932 |     
 aarch64_be  |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/3af52e731feebc957038634f3e74fa61d22d24b8 |     
    m68k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c74edaaf911f977ea108066b9f5d209acdd763e9 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f49bc4137e7eb604416f1f379b4d5f568a88fe8b |     
  aarch64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/6c039aa7a4f6b62e9921fe9096b47a4c6ddfe970 |     
    sh4      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/62eec8c2a1bd4a92d3cd6e15c187173fbce029b6 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e7c33d3eae5040f3100280f7274f31a50e8700b4 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/f806fe589b83d8d6d41881f3a840fbcbe9aff831 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/88bd90a4aa10a30e4c0f1e9b8fbb651866cdd404 |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/45516dc9d87a449d6ccd55ea50cfd03fa4889e0f |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d445f531e73d57d588370bc849170f6328f8521d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/eb046034551ee2144ccf9cd6f2c6f3de08a35cdd |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/94ad99cdf0593328dc08eb03c65a1e2335208c93 |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c40e2a98dcddcff6c69aae283d69b1862cc9006d |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/87fe08f291188a0e71d4586553c805cd7986f9fb |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7a261ae646c98c69f3e20ed26ba1298e39c3b703 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/b244136ff089e33c2827525c50569eee732a77b3 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ea91932bded9bf561ec5a0fdc11e68eff3b26b9f |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ee9e7629ce6d415d3d29121c848080b1ff561cfb |     
   nios2     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2fccc8b953274d6609daf90edf7596b724d0753f |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/cc0b19d525afff03d52c795d094a65cc660d0af6 |     
   sparc     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/55de05018668bd2bbc353abca868c26bdc4f35b0 |     
  riscv64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/8326902b4e3f429d1d9b51d6ea8909f4d73e6f0a |     
 powerpc64   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d1cbb333196115a7f970f18c6b62a7527ae29293 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/869c0eeffd5ce7cd2b0305c51b35ff48cb679cac |     
  mips64el   |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9388b71e50ba5417d4a05ca8919523daeea27f7a |     
  sparc64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/70ae7cd1eb031f80a322dafaf2ffa9a8a6349b34 |     
   x86_64    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/919ada22695e7275deddc7c8960faaecb00ab928 |     
microblazeel |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/61f07bb09d6ce82f835dedf3a71fa652755479ea |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7e501f7bdda80f84a6da4fce6daffc2e05b566ff |     
    arc      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/02b21d80472cb85ca8c54a74a66b59689f03bf92 |     
    or1k     |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e9b03b3952ea474a5c9e47a61d092206e1aeecbe |     
   xtensa    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/ea712114cf0834ef48e15140629733930b81006a |     
  riscv64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/cf33cd479b92dac9a750006d370cd793e75eba2f |     
    arm      |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/fd15e1d1734e4e22465f6a1ce7e7e57a7afd06fe |     
   nios2     |         mesa3d-19.2.2          | NOK | http://autobuild.buildroot.net/results/34806124cb516dfb615425225cf86fec5a2e0138 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/b8463762ada236a7321dea221c52f970cfde7028 |     
  powerpc    | mobile-broadband-provider-i... | NOK | http://autobuild.buildroot.net/results/ca3bcfa6c7da22339092b439d5616233a7544447 | ORPH
 aarch64_be  |        openlayers-6.0.1        | NOK | http://autobuild.buildroot.net/results/b473c44ae953dec3e4f88c4e363fb1a84b5e0dc8 |     
    mips     | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/582248f438bffa4f1b3d85b659c02b3b43840d30 |     
  mips64el   | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/b7efcc97a61301bc5bd80cab7a98b37a86e0e52c |     
   sparc     | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/edf32c178b7912a987e119f776a51f464424dceb |     
   mipsel    | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3142af0e3eef9338fd6bf0983bfcf26ce4180663 |     
  sparc64    | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/384b7c10044d6d2abbe6e79e432fea066320032c |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/a6033b57f64891feec7f55b9bf6b754b09605b8c |     
    arc      |      python-uvloop-0.13.0      | NOK | http://autobuild.buildroot.net/results/5829b47fbb479da29ebd373bed69f0b0c5a57a3f |     
    arm      |      python-uvloop-0.13.0      | NOK | http://autobuild.buildroot.net/results/78524ad15320468cafcd988982a514d406b9cdab |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/b35328503724d82c47905c5451c17f47bd796668 |     
    arm      |         rng-tools-6.7          | NOK | http://autobuild.buildroot.net/results/938cecbd8dd6bb1674f5007f056d40be8b9b49b8 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/90cb3c104aead6479ea9df22e9a4ef574f952dbc |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/9bc12e29a5142fbf80de8483aa08d6dfeb9b7ae2 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/d1ba5029481b2fbed62b37c0c1f8e87ca0aa77d8 |     
   xtensa    |          sudo-1.8.28           | NOK | http://autobuild.buildroot.net/results/13c6b1bbbff4550c102349cd60665105c11b59d0 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e7dc6277e762995eb2e4a2c3e0580d44b545fb6b |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
   atmel_sama5d27_som1_ek_mmc_dev |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655760  |      
                       beaglebone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655787  |      
                   beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655788  |      
                   imx6-sabreauto |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655822  |      
                    licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655835  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655837  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332655940  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332656041  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/332656047  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             libopenssl-1.1.1d | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/ed5fe965a5e2cc8d5f63976f2114cd2cb77cc1b3 |     
microblazeel |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/07845fd7c786057fe695eac8a8791eb5de8dbc3b |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

           host-harfbuzz-2.5.3 | 1 
                   mimic-1.1.0 | 1 
         xlib_libxkbfile-1.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/5746d8df8b04a54fe1a5a93fe030eb0a10e49f00 | ORPH
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/94219778d8673b893b16ced5cd809b25b0ffd9d1 |     
    arc      |     xlib_libxkbfile-1.1.0      | NOK | http://autobuild.buildroot.net/results/fa4610f9c61826e0d65431279a498bed2c715759 |     



-- 
http://autobuild.buildroot.net
