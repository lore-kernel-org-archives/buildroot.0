From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-10
Message-ID: <20150411063020.722671014D2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-10
===============================

        success : 190
       failures : 70 
       timeouts : 3  
          TOTAL : 263

Classification of failures by reason
====================================

              procps-ng-3.3.10 | 14
                  boost-1.57.0 | 5 
                libtirpc-0.2.4 | 5 
                     gdb-7.8.2 | 5 
make: *** [qt5xmlpatterns-l... | 4 
freerdp-770c67d340d5f0a7b48... | 4 
               libecore-1.7.10 | 2 
           libmemcached-1.0.18 | 2 
                 leveldb-v1.18 | 2 
                elfutils-0.161 | 2 
                host-gdb-7.8.2 | 2 
         network-manager-1.0.0 | 2 
                  dhcpcd-6.7.1 | 1 
               libcap-ng-0.7.4 | 1 
                  libevdev-1.4 | 1 
make: *** [qt5multimedia-le... | 1 
           aircrack-ng-1.2-rc1 | 1 
                libvips-7.42.2 | 1 
               arptables-0.0.4 | 1 
                      qt-4.8.6 | 1 
                   ncurses-5.9 | 1 
            host-omniorb-4.2.0 | 1 
                   squid-3.5.3 | 1 
                    fftw-3.3.4 | 1 
                 empty-0.6.19b | 1 
      host-gdb-arc-2014.12-gdb | 1 
                 python3-3.4.2 | 1 
                    webp-0.4.3 | 1 
                      gd-2.1.1 | 1 
               qt5webkit-5.4.1 | 1 
                libevas-1.7.10 | 1 
                     vlc-2.2.0 | 1 
                xapp_xfs-1.1.4 | 1 
                 opencv-2.4.10 | 1 
                   zmqpp-3.2.0 | 1 
rpi-userland-8f542a1647e6f8... | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/ef3851d9dc4b3172b2a8f774f3bf94a35baf0632/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/9a58d2aeb535b85bc4f9b95da741b791a197fe7a/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/ecd45a25b54f20baa2e0c3f4ed67dfc2a6b0d102/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/85391ba9722bb049779e87b8aaf4a04b7ddd7b10/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/73b93bb26023c9da329ac64de1f8f4835c74cac1/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/26a19f9253df40dc72bb7922cf3db80df14d8019/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e437d005a1e3aa86dbb7f3861e883d43e9f990c1/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/339f85ed5f88d44e4aef88dd464e85b4ea3b7bbe/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/1546d909e606daefd41b87dece94d642c0fdeba4/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/bfab78c4cc2249cf2e26384c93ac9fba4c8b68ed/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/ce39eb9b9ece0968563641fb2207099d1a37b191/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/39640801c74ab02fcfc7df281ba5a5876543b9f2/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/acb2617049b753495079f2a3acda42ad74ea31ac/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/5a5f5290571d031ad90e909fc2dc3bfe2cc6c4b2/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/189411ec4068baf371d71f8d6ae1e5d4883e3e26/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/bb65d9a1f8d58109b06bfbee17d5c5c45dd595ef/
        i686 |                       gd-2.1.1 | NOK | http://autobuild.buildroot.net/results/046dd505feb5e92bdee3d0993366be162da1223a/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/19e9cc9031ed366e9cec332775985a91c6c9906b/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/c75f4dba6e1eab45b9f40c95ad98711e100ca6a9/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9e4df085319e346803c26c65478accb27eb950ae/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/41b9b4134a4e35d32988c7c97f17ab08dca698ce/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/8ad533d61d729fa91c4928db4cebd43c6d9d14c4/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/cb80494c0eafd2cfd650778853d59b932858e121/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/e61c3684acd6e003cada0c5478a7decb8ec9d0b3/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/9c6bae33b42e6276a97d7162d192fb6b24d7d28e/
         arc |             host-omniorb-4.2.0 | TIM | http://autobuild.buildroot.net/results/8cb0e7fe94191f87b947d4f481e1cce377fa8a9e/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/36925febef115f2582d4081726fc31b44ee59500/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/ab92401dfb239bd3449c69221e9bef6eefae2445/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/436dd8b2f953a9dd40141adafc58857eb5678246/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/8e2ad18a5c1e300aa918d3534e11e58a9c302bb8/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/1d382529a7e645d8e82bde9443b4d1a33cc87688/
     aarch64 |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/c088fd89538c22a420605fa64001b4ca8c52ca4e/
         arc |                   libevdev-1.4 | NOK | http://autobuild.buildroot.net/results/e4debb11c971596ae33ea7a87fc863d645911f56/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/52a9ac498396b16db93e965c2e1614c0fe1aba28/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/bfa654210fd7000ed1527a49da8b53cebce620d1/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/dd7e9ef1dbbf448d3d0c7360a6f3a9d484025dfb/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/74de66a3efd9120f96c6da61f062b5bb9cf59986/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/6e00c2f4f9ef01c4b567dee36c6a1edcbd791da7/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5dd4260ea6935983ce3f59a3931208aea735b8ff/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/63a0f9956853c5fe6b0e2651514b57b452c4ac64/
        mips |                 libvips-7.42.2 | TIM | http://autobuild.buildroot.net/results/ab562b90f3f3729b723859d56f674a3d3a1f74f8/
      x86_64 | make: *** [qt5multimedia-le... | NOK | http://autobuild.buildroot.net/results/533c1d8529e2006379fb8eacb5ea1c23f240f724/
         arm | make: *** [qt5xmlpatterns-l... | NOK | http://autobuild.buildroot.net/results/85335cddd123cae5a5b99d715c179c26ed9d6009/
    mips64el | make: *** [qt5xmlpatterns-l... | NOK | http://autobuild.buildroot.net/results/0970e3d663da687f9bcdf0136584eaa5629f4216/
      x86_64 | make: *** [qt5xmlpatterns-l... | NOK | http://autobuild.buildroot.net/results/c62eef5e5b8add138cdab34e64103d974d0a510b/
         arm | make: *** [qt5xmlpatterns-l... | NOK | http://autobuild.buildroot.net/results/8b22985cc4a3ed3ced5900931dc6ec3b4c2f36c6/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/2d0e47e0c7d73942ab20dcfc382e0f9be7657b6f/
      xtensa |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/2e25dfdff935a902a92ae4cfdba86f2d08d1cfe8/
      x86_64 |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/6fc493e80ec2dc04aa12fd6f6f95f0c616239091/
         arm |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/c2528bee0f91acab0fc4e9eb174e83f9832c4df4/
     powerpc |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/8deedcdbe1c02bdf8d2153a62d68804f71c5ba3d/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/e2afe3dee50cee7d72bafa3a9991d5f464e4a01a/
      x86_64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/90401cdb471f9e9582e2ca2ad07fb3db148420d7/
     powerpc |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/d7f9a216fc6fb4fdf1d8c1adf24de7d3ca7fc53f/
        mips |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/e59202af0ecac4045cad83021d7121c584b6c053/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/27a7bdc0782d1ffaa3aa34c976663e2c01c6b54c/
      x86_64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/6151f73a6a84fcf42b6a1698e4a32fdd7953be0f/
        mips |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/8375ead79978f0a2ba885b48958a588cf88ef3aa/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/890d675644fd3f372b4446485a71205c811762ae/
      x86_64 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/81720490bca323c8e4f70da458de8a831e2811c7/
        i686 |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/c7da433d1ccb12f22f17303cc7d08901d9b6af0c/
    mips64el |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/577975db1fdc52cdbe282f154ae47d2adbbca80e/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/1984e9c0f3bac6f8dd2f9b07a26d9335471f3986/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/4dcb06f4ed31c749572591b696384616b516d1b1/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/9b962f4612b6788b0b30585b2be80a65e22a5e8f/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/5b1a29fdfa8ecceb87abbb618719de94d0a674c6/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/616c5a5752f28779a33c877eacbe7f944f9f0b78/
         arm | rpi-userland-8f542a1647e6f8... | NOK | http://autobuild.buildroot.net/results/e9ea569b5fe6fd875b3fa8f4eee82e3fddd95e90/
      mipsel |                    squid-3.5.3 | TIM | http://autobuild.buildroot.net/results/29fdb061dedee8d0cfb3b699f12df6c83f928fc6/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/3879d8cc1a9ee6e53950e7a52baefc90b0c687b0/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/a9a675c29895a512d528d55b658e260b9407a082/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/75c676b1baed6f39657578caf7fc213ce71c1089/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/98e4afe5bac6f34681543eb6e1d89e9a87117fc5/


-- 
http://autobuild.buildroot.net
