From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Jul 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-08
Message-ID: <20140709063011.9F3D3101299@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-08
===============================

        success : 120
       failures : 28 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

             host-python-2.7.8 | 10
                directfb-1.6.3 | 3 
             lttng-tools-2.4.1 | 3 
dvb-apps-3d43b280298c39a67d... | 2 
make: *** wait: No child pr... | 2 
                 pixman-0.32.4 | 1 
             xlib_libXft-2.3.1 | 1 
                 libraw-0.13.4 | 1 
                  libplist-1.6 | 1 
make: *** [core-dependencie... | 1 
                 webkit-1.11.5 | 1 
                    sdl-1.2.15 | 1 
                 libnss-3.16.3 | 1 

Detail of failures
===================

    xtensa |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/cecfa36163803dd86c47f4e0bc5972178497b2c3/
   powerpc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/7d3e3f4647a2712b9f30eefcb4c55b9a1b87638c/
   powerpc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/b1e6e5a3a941f3703c81791f6aa13dda3f8e264f/
      bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/3dbfa7b692d4b123b3ba6b55c84df12818273554/
      bfin | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/7a381f9d88e527b3f281fd1b6fac24a0b71fbe7e/
    mipsel |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/f52aa0267b0d97924fe9001343c3eb466b4ce844/
   powerpc |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/40058b47724a29637c88f985d72b6cfe6da995e2/
   powerpc |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/b5cc75202810b839f108410948be58a729ada899/
    mipsel |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/987eccd62f7b1f9f6b9557440c4e286322349ac4/
   powerpc |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/ffbed72ad85d03885d4dda8f20662047123b18b3/
       arm |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/fc2ffd756f7f8be8bfa1264b17f020579bfc8ae4/
    xtensa |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/c55068dd9133ef667eaa18bac63350ee0be9e6c6/
   powerpc |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/da2309a4faed1a1c2d611e0978a733830b5adb84/
   powerpc |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/25aa17d3555879655fdfb3fd5b4edfe088236b38/
    mipsel |              host-python-2.7.8 | NOK | http://autobuild.buildroot.net/results/b688f162c937c41b75d72ddadb0db84f865a82b5/
       arm |                  libnss-3.16.3 | NOK | http://autobuild.buildroot.net/results/930e2463149d2482c744bfd77a408a5f21cdc0e6/
      bfin |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/c076b9c2eb4c11e7094499957972cffc6049e3bf/
       arm |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/dca0028de39fbe045fbabffa9ccd43dccab1ef72/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/b597fa5f47dea036aaf7d43bab7d5bf4266aa02b/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/480c05c2475d15740a1ce4b33aac1c5a52a3d072/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/d485a259a8687dbe8ebd416983375a9ecfb2d220/
       arm | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/dd4369f697289a766836a859f323594dfd271202/
  mips64el | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/678b1e04c3467d8a72a4a976fc4e0da89fb73fd3/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/b6e33e9963006719fe3ff4bf73171a2af3daca4e/
   aarch64 |                  pixman-0.32.4 | NOK | http://autobuild.buildroot.net/results/b1347ec1445fdeb1d80df0912740d75e86516c1f/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/74dabdfc6924bac710938ccc26ca9b86f7d54520/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/6ce5b0f23c002cef408571a565c46aabe4082045/
   powerpc |              xlib_libXft-2.3.1 | NOK | http://autobuild.buildroot.net/results/987d939495ddea6f5b8ffad7c899463e0b6753ed/


-- 
http://autobuild.buildroot.net
