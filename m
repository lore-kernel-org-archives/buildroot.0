From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-23
Message-ID: <20160624063031.6824D104646@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-23
===============================

        success : 194
       failures : 117
       timeouts : 0  
          TOTAL : 311

Classification of failures by reason
====================================

              e2fsprogs-1.43.1 | 18
                busybox-1.25.0 | 14
                   efivar-0.23 | 10
             bluez_utils-4.101 | 8 
              host-libxcb-1.12 | 5 
                  boost-1.61.0 | 4 
                     vlc-2.2.4 | 3 
                 gflags-v2.1.2 | 3 
                    cups-2.1.2 | 3 
                  autofs-5.1.2 | 3 
              libdvdread-5.0.3 | 2 
                flannel-v0.5.5 | 2 
                    lftp-4.7.2 | 2 
                directfb-1.7.7 | 2 
                cifs-utils-6.5 | 2 
                 lvm2-2.02.156 | 2 
               libsigsegv-2.10 | 2 
          libmicrohttpd-0.9.50 | 2 
                 weston-1.11.0 | 2 
                  cairo-1.14.6 | 1 
                   libxcb-1.12 | 1 
           libvncserver-0.9.10 | 1 
                 rpcbind-0.2.3 | 1 
                    mpv-0.17.0 | 1 
                openmpi-1.10.2 | 1 
                 ipkg-0.99.163 | 1 
                blktrace-1.1.0 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
                grantlee-0.5.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
           libfastjson-v0.99.2 | 1 
                rt-tests-v0.89 | 1 
                       unknown | 1 
               trousers-0.3.13 | 1 
                      qt-4.8.7 | 1 
                  connman-1.32 | 1 
                   ncurses-5.9 | 1 
               libgcrypt-1.6.5 | 1 
              libarchive-3.2.1 | 1 
                    gdb-7.10.1 | 1 
              gnuradio-3.7.9.1 | 1 
                mono-4.4.0.182 | 1 
                     gmp-6.1.1 | 1 
                    pppd-2.4.7 | 1 
               libcap-ng-0.7.7 | 1 
                   perl-5.22.2 | 1 
              libarchive-3.2.0 | 1 

Detail of failures
===================

        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/bf76e1a60853e925a94c3799ffa3aa1e649b06a4/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/c55d09a0aeb6bcd72bb6a099d6981aa0ffaa2235/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/5863ebed4e9e8f42e04740a272b2ee83f7df921c/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/fe5c9f8008b8270b2abc9a23940d52370a638a34/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/ad166197c1725fd984c871078b2465ef8cc9c99d/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d24b3d386d90f60b5877aafddac7c038c5f95bb7/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/a6634f85778e32492bdb18cf94ea3284cdf4f321/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d80d4fae53bf744797686f54eb8702ce9b00ad18/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/5e1ee2f75f28d59d9e3f1f7d0817ff9bf5407003/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/93854d3296cf6c3be909bc00c08c903408aebcf2/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b029cd64ff985b3c80ac4a5c9a43bee2ce7a584b/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/10a982df0a7a4cea70b4656d2bf120b63d1b20db/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/eca14566b02f517dbe676e2674a3f1d5462ca4d9/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/5074ab7caa6f5be071c20529c4405559bf4981ac/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/d19693917e55af4bdfbe2bdc5f7348aba239810c/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/690ffcc129a24b7d706db889b2ad6fe5211d24ec/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/35e2ebc98aa832ca861f5a17a66338efdbe33007/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/d6418807e378f83ae0ae68f5c700a92e9ca3730c/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/914a5acdeaef61426ab077905ff2674090450153/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/813ba463c5cb795b6bbdb047ba6cdd3b2b234a73/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/ef69e09eeb26cab5394a1568806750e0800434be/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/393c59679fb6803b12816656d059d16056940467/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/6dbdbeb069074ce5099d05534c9069c7eb071a80/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/daefb5b5df3a77db0dfbf68d210fd8df8b535461/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/dc84282b88162477cd07b0f72ce3c3e424db1114/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/32474df7348cacdb3e18e658273b08bf65e7e9d2/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/fb54ae7f6eb1e1656adac5bbb6e765ac3a2e743c/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/eea8a8e58b117c64bab8c4a4b3e95580ea46b969/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/9a670b70891e73d6f249a2bd2e1a456904439627/
        bfin |                 busybox-1.25.0 | NOK | http://autobuild.buildroot.net/results/8fd84e72c363001d073dd28e15f25ec4dd558363/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/387f1dcdaceaacf3c38a1e023bfc56e88466616b/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/5f9d51df0d4d51016dde59a9a5175578ff5849cd/
         arc |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/339e247e48279503894ac591e4bc81724210a789/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/ccb7a32562ef9d259823d540bb30d39569c5b101/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0a5be395d7949b143abb87d767217459c535bd85/
      x86_64 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/951c9da01cada855abf9ca5788075dc793b97a8d/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/408575305ab27e8656311bc282b3816e8b4c294b/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/71ff7ed22d591d94812d96cd2949f22a81893b28/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/27a21104a0a6929c984f78d61302a07fb049db6e/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/aa494f7259b89045d6ae2c664267a9704afb9a6f/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/969b1e71129c84461abc4aaa4c6d7b858fb25198/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/aa64218d01ad72bf89e293879ca307bcaf6cd0e9/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/a1f26b501c1b7bf90b4b7a3195cadf40f13525dc/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/da3aa5130756d8e5d0ebabae43dbb877cabf3379/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/270e83792bba57fa8daaecf19ea438134c6149b3/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/ab5c5b0e234f3d9db78c968334a61a7aef206b7a/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/a67abfcb62c6cf88394c7c6b0c37786fa1b93656/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/4e99744ce58246b37b41be8b1ff6cf86016bdc26/
         sh4 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/3a0b96454c647fb02d953fad15d83c06f8dd3d45/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/09d46ff806bd02a8b607333c665d21169f589964/
         sh4 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/4812a879c95b92ef615c0c8e6301898344bcd9dd/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/0eff88b1bbea3f5cec88fcdae7e0204e0954694e/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/7915f762b9c09df78caa39ad52af0cbb8a9aa296/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/2bdeabbc8f40a3f1d22e2deb4315b738bd35f9c4/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/307c9e090e6a2313939e89bf02df1733739bfaaf/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/5dde2cb3442a0c7b8e70514486d00db04e64a348/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6151fcc4967d3dffe0cb1b2051708179140e9d21/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2c7355d674d88de09606545351eaa76e31e6b1df/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/26ca4c993e2671806789719494dbc11ce56298ca/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/da32067f63033be38eac6caa4074cd08b64dfada/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/cd3bf6b1f5b0425c9dc4621c8de11d7a3a03c1e0/
      mipsel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f211759adb04c57addcc50cbe62f11aee7aa77bf/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4dabd62ead6917b10f36780b2b9bc8a497b73439/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/ec133f77c5e75f652786bc636c4bab43ec2851e5/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1319c62c17d292f200d430eb72dac2ca45e2dc60/
     powerpc |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/84915a12faac7748a88ca653f2b108b5e4f64813/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f6dec73bced504fad1c8ee8801cc6345a9944102/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c92a2e142ad66b765577a62fd69fffc0c301b88d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/f3e02b8a7ac73d7c21f732bc01a7f4fb0127fd30/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/8f59f506c57eb186908cadb5f11b36dfb85fcff1/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/e3df854a4b90e97b16f71ea208e59cd51533a783/
     aarch64 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/c9fd8a14849f47cf6403761ffc503d5296ee3df1/
         arm |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/73fec1f1fa23ea484073ee92094f0b9347eff759/
         arm |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/e1ecd7072d52d2076654b771a6dae2b4fa058ff0/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/a3d2a73d88367ebff2363da56ad97b56aa1a8cb8/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/ec1d39b6d925fe17538749f17b4612c979f49283/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/6f913389da885c0547db8d932a341314ea61b59f/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/4a3c5dd3ad02cf6e971147c35a5d7e7c74b4bbaa/
        mips |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/fb73771013e618ba80afba0f6fabf5698769f429/
     powerpc |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/aba64f7106977cbcc1c3eba205f07376da39b6fc/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/70595cdd0b719db283327daaf0130bf8ea3f32f9/
        m68k |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/ef09b90a0a19de2767aea1655c85e6587212bbf0/
     powerpc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/16ba0415cf4644152edc8b93ccf06ff5d933cab9/
         arc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/fc0c084a3142374f9068ec7a8022a160fa5aade2/
         arm |               libarchive-3.2.0 | NOK | http://autobuild.buildroot.net/results/1372175fc841b852671f6d4d872a65c55d67527e/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/35bcd26331b8407a1d4403bc759eadc595ccf5f0/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/14220643f50b7b9d532abf3d0b794853cc654ecf/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/54659ab66c2ae3c5d47f8849fb00ef3f73efcc97/
        m68k |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/c84c0962356f284c0efb3ba7474fb34d9298425f/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/3e10853b8170dd1a7d73ebda39458f325abda819/
        m68k |                libgcrypt-1.6.5 | NOK | http://autobuild.buildroot.net/results/ce857ac98e80cc020e143a995f8ab111b3ccb72c/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c76ce0dc8ae73ea66d598c013a47c0a99af1e922/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/3bd9abd8001da1a33f6ad2e9b854a46d810d2590/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b32f45fa6cd48d966bc6fcb4f20f81541d79e7ce/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/8c9e88efbd4c7b9f6173055e81fc1e367b93e02a/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/d5ff1701f6ae0bb1b13bc1a9e68e0eab6f849de7/
     powerpc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/d7cfee87d5fb3d4a1f6f2dc76b03572bbea883c5/
        m68k |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/57098907e8c622c2b9427c5f5e3d9bd82274a3ec/
        m68k |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/0fce60568288bc090d28b9565da26bbb1a72d6f7/
      x86_64 |                 mono-4.4.0.182 | NOK | http://autobuild.buildroot.net/results/beced92f3ef81f201c0dc9178c7ff6fad0bc45e7/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/2dd31dea6b515357aa378c41030b46377d850648/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/c1bf09341cc1da8452412e4d430014ca897c5111/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/060b993a8ee2071320aee3500582af25ad344b8f/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/bb97b58567bcaa4243367a18f7dba45a50002496/
      x86_64 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/ec3e529082b20ed69091e278173ede113a776ec3/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d3f2959aa2d77cc1a664243e7410665e5383c1fe/
        i686 | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/60764db3a35ab188f27b031e22461f124a8131c9/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fde9befc0058e9f52e267be4a36f7d1b8b65fac8/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/3e5b3d0ce973db113316885a0cda4879e7c0938a/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/71c1f45cbfa3cc2c2b58140c26fb98eed3525e31/
      x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/de7699e8eba7532b9e4cfc24b5ddb4c48d932fdf/
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/557edf3cddd91efcaeea4215ec926de84f0410f1/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/30651d60b96e63b6dd49738899eee3539d0d0926/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3b4f000ae3c52d90b6f61a90e0a15b04240eade2/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/51b148110c975d8fd844751919c575217d7e499b/
         arm |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/88137ec722a896e89ad45000d92e9806f04af4a8/
       nios2 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/2734970f0b0fb7b4d490171e39c87873c4ebb5f7/


-- 
http://autobuild.buildroot.net
