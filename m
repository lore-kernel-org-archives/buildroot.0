From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  6 May 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-05
Message-ID: <20180506060017.BA31E2072C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   0 |   0 |  29 |
      master | 209 |  53 |   1 | 263 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           libfreeimage-3.17.0 | 17
                     lxc-3.0.0 | 12
                  host-go-1.10 | 3 
                 host-rauc-0.4 | 3 
                cifs-utils-6.7 | 2 
                  udftools-2.0 | 2 
                clamav-0.100.0 | 1 
             expect-2014-05-02 | 1 
              ghostscript-9.23 | 1 
      gst1-plugins-ugly-1.12.4 | 1 
             host-gauche-0.9.5 | 1 
                host-libsodium | 1 
                libkcapi-1.1.0 | 1 
               libupnpp-0.16.1 | 1 
               log4cplus-1.1.2 | 1 
              lynx-2.8.9dev.16 | 1 
                 mesa3d-18.0.2 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                qt5base-5.10.1 | 1 
                  qt5cinex-1.0 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/e4d065b866ab1199a7eabe33a033715e976c48c0 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/9ef55bab3dc44ee22872d8cf1b9f3c97980de027 |     
         arm |                 clamav-0.100.0 | NOK | http://autobuild.buildroot.net/results/7cca3a5929ae9ca895a5296d0e8bb4945fb125ef |     
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/ed88c5ff845fc6e9f4d31835137ccf455d0c4be8 | ORPH
         arm |               ghostscript-9.23 | NOK | http://autobuild.buildroot.net/results/c0c23f884bf52df0b97a944b665c7332ba86319c |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/180d13ffe1e91d44f53365fa5ab28e8615a9fa68 |     
 powerpc64le |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/562bf50464b34320a201d717cac601cfc08f10da |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/55d7b8803713369d2068364579ad1dfd001957bc | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e3b5f0d04aa75533119d7f6498e44a2973f4e0e0 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/25790dca7e19527bb360d7dfb325cd9cfc3b56cc | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/9e0bd764c4160be94099348079e4639425ccb4f4 |     
         arc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/e2b41dc4449f3c42d020653821c6866ebbb5ac39 |     
microblazeel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/7a3f7414d0396a6b6e0b3d23f711f1db45addaa9 |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/787322a4363ba89c5b457f6fce26f37f560ced98 |     
        m68k |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/4e19ba4ccf3ace219066c7c62357032c3ba1d11b |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fb0f3de93fd46fc6ddd761ce810d9b94711eef0f |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0d14193af5343ba8251230c4bdb6a9f524b56127 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3fbc805ee6770d79998fd0a2bd28c24118d795c1 |     
      xtensa |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d7e431214cd7bea899b048b5bde710fd93b20d2b |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/319627ac0f4b0c37fe14f7bb640c71c952ab00ad |     
        i586 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0dff6440fd679310a1b0685e27e7e213b2ed7527 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e7f3e36ed4a2fb94ab5afd4ba6bda36196169687 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0c787ba11188abc75dee170bbf090dc8a5932f47 |     
      x86_64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b8c7b115b9f2e8ad7e7e712edead7d2518c62899 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/cac3e38b9f7598fa8d23b2486c2e29a73fb45fc6 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/38abdb72f3ee2e785de1fe97a771d521a7fb2010 |     
      mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/5c08c6e0fb9fc36f9f26a5006555cb338c0c47ed |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/96bd361fe29a48782151ee4be3ae050db4f26dc1 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/55736ef3a8ddc3185f8d123aa0366fa7ba193976 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/23bd72698d7ebb1273f8f48ccbf197b4d940ecca |     
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/dc7acf3de7026698d9defebbfa9941c83b6235fc |     
         arm |                 libkcapi-1.1.0 | NOK | http://autobuild.buildroot.net/results/7c57f3025030eff41a5cde52759821249859caf1 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/bcbcb722da1716508d7e52d660ed0106e7499060 |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/10c4eea44a09755088264f820b170c5db05d777c |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d7aa0e050ac9cd2c11326ee272ecce1b04077b29 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fcc223125c9130ba3eae4daaeb054f38370e457d |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/de2151c7bc74fdb25567ece30b52e2610cbf215e |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/82a3b9ef64b815389733f529c592e9f431b2257d |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a92ecbdeb8279c81e911964cc63032672b2c8f5a |     
        m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/22868d0316b96d40c9d78f06b62f7958db829e8e |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fa65b974550103b295c93cf640be255fcc265904 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5836d2ac5c991c2586c2b7e55281e38eeb624bf4 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d3502c0c1f15f3fe20beb5b24d38db6a7c4f2e1d |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/c9bf299abbff42e43d5438314b69d82e4ab584a8 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2b8edfb3f5d3216903387db04c4a91018ec99226 |     
         sh4 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/74c16dc449c5b85ae677797c209d7336ca225930 |     
    mips64el |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/43307317a980d8c2a31744a1cb80518a73d383cc |     
     powerpc |                  mesa3d-18.0.2 | NOK | http://autobuild.buildroot.net/results/d13dbcb1beffdb68aea289520fe44fc5b778c10c |     
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/ee1abc5d1f53e2a48c2975b5f17951e1ec06a68b |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/2c674a3d13c51c372631fde4ace1ff1d2910e405 |     
         arm |                   qt5cinex-1.0 | NOK | http://autobuild.buildroot.net/results/207551ea945fe566ef39b4d8e826c29040b363a5 | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/f5dbd5173f613156ab05807529c7b3fa85479e30 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/8fb75c6538ec08248182a102fce7ed1d24e17ecd |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/3e3e414fd7f207ccac64a76f375554e97f9a77b4 |     


-- 
http://autobuild.buildroot.net
