From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 08:00:31 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-16
Message-ID: <20181217070031.7A1922072F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
   2018.11.x |  24 |   2 |   0 |  26 |
   2018.08.x |  13 |   1 |   0 |  14 |
      master |  98 |  71 |   3 | 172 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

        i586 | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/7130daebfc264cec3b6ae5407912c120c50c4122 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                libmpeg2-0.5.1 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4002fcb779f9c6dfe196fdfb94f5929c12a9d4fb | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/08391d96c51c1aa064d3de9235ec6b4ae08fc02e |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7dcc30cb694f26e430c7f807927d7c7f4492d13b | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.50.0 | 19
                   netsurf-3.8 | 13
                 mesa3d-18.3.0 | 5 
                  ffmpeg-3.4.5 | 3 
             bluez5_utils-5.50 | 2 
            btrfs-progs-4.17.1 | 2 
                  dhcpdump-1.8 | 2 
                  libssh-0.8.5 | 2 
      libva-intel-driver-2.2.0 | 2 
                  linuxptp-2.0 | 2 
              swupdate-2018.11 | 2 
           xapp_xfontsel-1.0.6 | 2 
             bluez_utils-4.101 | 1 
                  connman-1.36 | 1 
                          core | 1 
              drbd-utils-9.2.0 | 1 
                  libftdi1-1.4 | 1 
            libostree-2018.9.1 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                         mimic | 1 
                          opus | 1 
              pcsc-lite-1.8.23 | 1 
                    postgresql | 1 
                qt5base-5.11.3 | 1 
             stress-ng-0.09.47 | 1 
               util-linux-2.33 | 1 
                xapp_xgc-1.0.5 | 1 
              xapp_xlogo-1.0.4 | 1 
              xapp_xmore-1.0.2 | 1 
  xfont_font-adobe-75dpi-1.0.3 | 1 


Detail of failures
------------------

      mipsel |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/80b5f84dbff16a36b10d4ad3d6428d61c04f0279 |     
         arm |              bluez5_utils-5.50 | NOK | http://autobuild.buildroot.net/results/7a74f984a23f9bedccffecd17ab9d1b05259a67e |     
   powerpc64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/20cbf79a34b6ae47b0527becc70d7e56e93a2e29 |     
       sparc |             btrfs-progs-4.17.1 | NOK | http://autobuild.buildroot.net/results/6c061b4af11a2d9b03873166f3b14bb5a241f7e5 | ORPH
      xtensa |             btrfs-progs-4.17.1 | NOK | http://autobuild.buildroot.net/results/655b57a361ab9a5b46d46bfb1cfcd501d1923325 | ORPH
         arm |                   connman-1.36 | NOK | http://autobuild.buildroot.net/results/6a13e6dfc58b2b3f8fbad6d6d6462370a75a8ad4 |     
        mips |                           core | NOK | http://autobuild.buildroot.net/results/72cdd52090dda7a3c57b04deeeea24073d4b9521 |     
    mips64el |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/ae0290bcb501396ce28c034c21e3ef122211414a | ORPH
        mips |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/6ea1f3e9a4d196e6aa2d52c0106c053754264f43 | ORPH
microblazeel |               drbd-utils-9.2.0 | NOK | http://autobuild.buildroot.net/results/7a33de36ce2c2d2a4d3d33f45faaec41807f4322 |     
        i586 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/fe01aa473fb9fec03d64ae2c392b73e08a63b790 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/3aa08b64b531baeb9fe95fe5e0b6a2d3778c255e |     
        i586 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2a27e1906629286637034fa6e02aaf5f8af8c512 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5cc246eb8f2ddb82a8ff745e4f27a81591d4c134 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/ec6ea39a1971027005dd08259c5187b54fd9b0ea |     
       nios2 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/6425d52e5588be29c3d5681b746a6311e13ed483 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/5788e5bc094eaf55d081d2035a8d855fcffe653e |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/888f6f1639b7e02e8904a2a296768642c8f6a775 |     
     aarch64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/86bedb662983098b62baf9040e016979de9fbac1 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/3cc337bf4e7906eafe29bf7e2e231eb3634cde61 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/69b2e4cb78e13d4044f54dddeca99cf557f01592 |     
     powerpc |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/e43dcf9cb3420e1875e10a132a7b6fe9b07b4e70 |     
      mipsel |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/4c4128d7eb2ceb270a04338e098cce2f4dc90088 |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/89df5a8e7153f90aaa53335c1795c5ef4bbaf445 |     
     riscv64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/17c9f7a1d6e35a4690cec0aa70c7bca0f971517f |     
    mips64el |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/d6c8ae65403e8d200c968f7337c61acd7243d671 |     
      xtensa |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/9f65afe52cf815f07e8a3e8079b04f4073a30414 |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/b2c1cdad7bbb6e85f165cba8c9572be4b600dda7 |     
 powerpc64le |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/f5fc1732f39d3fee41b5fdcf26d6d58b2da4622d |     
  aarch64_be |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/854a80e8b8ed6e696cec9debb06ec3bedc942c1f |     
         arm |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/88cfc392343c975ca46af786aa939f91cd66bcf7 |     
      x86_64 |         glib-networking-2.50.0 | NOK | http://autobuild.buildroot.net/results/55b813394f659dfe626bf2283b6fc15c3cdb0145 |     
     powerpc |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/5a94dfb6dafc880f628295cb51e47a9d6955d67a |     
         arm |             libostree-2018.9.1 | NOK | http://autobuild.buildroot.net/results/9a919a330e1cb68011df47a1dedd4a98cf025111 |     
       nios2 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/37cc2f1edb0f214cb9e6d6184288dd401253fcbf |     
     sparc64 |                   libssh-0.8.5 | NOK | http://autobuild.buildroot.net/results/bfc5cf11af2a461721a64564676031d630c996a3 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c310030cdf026804f5422a628305b7662016d527 |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/ec068877fedfea5ac5354155b02548ae300a72e8 |     
      x86_64 |       libva-intel-driver-2.2.0 | NOK | http://autobuild.buildroot.net/results/3d7c532d92e9a1231fcddf9783147b318886221a |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/26f48405f2e9bb0e82a93de454e269023a85978d |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/fb2cc883c49ab8dcf6f17930f15d2f422ae597a8 |     
      mipsel |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/18b18cfbfe2da3a0b4fdd2ba7b8bf14e7ebf79d0 |     
       nios2 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/f86ab494d242ccaa8aa7d6d983d2a54cc0d5d7bb |     
      xtensa |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/f7e3d2fe6ad8b65ec8c375af9b3dce6e84d79374 |     
         arc |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/49350adf909cd0aa8217524ef22162a9715382c9 |     
     aarch64 |                  mesa3d-18.3.0 | NOK | http://autobuild.buildroot.net/results/c40b52db25b2bc8efaeb76221e9706c0ecaab742 |     
    mips64el |                          mimic | TIM | http://autobuild.buildroot.net/results/5fc5c9eb0af5d2e5a9d439d91a6b9c119450acf5 |     
  aarch64_be |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/777d8f4ff0992a68892d5b6745a0bb12e21cb409 |     
     aarch64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f62505137dfa049bf3e2cfefeae2b118e4ef2f0b |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/696062be3a21aee6303b258c03065ffe42fda736 |     
  aarch64_be |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/983d16f8e93b82ee4868591efa2aea28401a07a9 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6af2022605a6f475f7d303a117abe2f672688eed |     
     aarch64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a92dd30f42e0fd0601a4cd5964d63243cf71a844 |     
    mips64el |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/9078447f36d88547fa483890d5e48e2ed2553f85 |     
     sparc64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d70b44f60f2672f5e8df676f6bd5a58412561a2e |     
       nios2 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5ad906b9a5d63db63ea15a56a51d9b295ffcd496 |     
  aarch64_be |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cd91fe6d01200d5db216d4944101cd32fcbb0686 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/22ad83c1cc87fce6cd8b665e0aba790c61ff1665 |     
       nios2 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6c16d4c68f0b8a5960925d1692e7ac3091017b18 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e7e40540720bf6202e65ffa286a109ca43f4d368 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/75ea57cdd7371fbcc1565bd381cab6f2e2bb4bd9 |     
      mipsel |               pcsc-lite-1.8.23 | NOK | http://autobuild.buildroot.net/results/c7267ca66ec0e3ff93de4c53e065e776714824b9 | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/698959cdaba83e82c93790269bea6798c1ce4ed4 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0fb5d632304b853af25101b3396fbbb4ca8a57f8 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/254076897f70ce61a65a5b40b49755805cf0a716 |     
     aarch64 |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe |     
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7 |     
         arm |                util-linux-2.33 | NOK | http://autobuild.buildroot.net/results/2a9d12bb5e0d1955ee78e875e355396dcc8c0f11 |     
        i686 |            xapp_xfontsel-1.0.6 | NOK | http://autobuild.buildroot.net/results/2d66d0c18bd004c7410d9e29163d567776dfa4cd |     
        mips |            xapp_xfontsel-1.0.6 | NOK | http://autobuild.buildroot.net/results/377224e6642861c6451391b9c0a1116e59a4c8e2 |     
    mips64el |                 xapp_xgc-1.0.5 | NOK | http://autobuild.buildroot.net/results/65d593df70d5004b1f11af064dcd750ba2e30c03 |     
      xtensa |               xapp_xlogo-1.0.4 | NOK | http://autobuild.buildroot.net/results/38266772639efa01c8b24a4a660b10ce05b4da75 |     
         arc |               xapp_xmore-1.0.2 | NOK | http://autobuild.buildroot.net/results/9c18f21fac1ff3af22cf6e1a4fac59ab34391964 |     
         arm |   xfont_font-adobe-75dpi-1.0.3 | NOK | http://autobuild.buildroot.net/results/2fe3e3f15169edc13bee0e3fc9576aab4fb9fa3f |     


-- 
http://autobuild.buildroot.net
