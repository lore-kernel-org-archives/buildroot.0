From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-18
Message-ID: <20150219073013.4E0921016CE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-18
===============================

        success : 293
       failures : 12 
       timeouts : 4  
          TOTAL : 309

Classification of failures by reason
====================================

                  zeromq-4.0.5 | 2 
               libecore-1.7.10 | 1 
               host-qemu-2.1.2 | 1 
               alsa-lib-1.0.28 | 1 
                     vlc-2.1.5 | 1 
                   zxing-2.3.0 | 1 
make: *** Waiting for unfin... | 1 
make: *** wait: No child pr... | 1 
        gst1-plugins-bad-1.4.5 | 1 
               sdl_sound-1.0.3 | 1 
                libevas-1.7.10 | 1 
                xapp_xfs-1.1.4 | 1 
                       unknown | 1 
                    qemu-2.1.2 | 1 
                 qt5base-5.4.0 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/5c47354bb123c7e2b140f4935331ad9a1c48d2e3/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/ebf07f72c6799f15c33519e03fa4de43015e0136/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/85a9f3d72bc01f5949b6ae6d42367ea0a44e6afd/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/175e807d5ffa4a43c71d620427be2a261f95135e/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/2729ceb20e822cd2d9e367b32220704c73474763/
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/0b6420f4e9794bb18d4d90c3cde8ef80a6632fe8/
        i686 | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/fa90cf8f044e393c9e577c16c271ec1379ebe89f/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/08f8c8678c67a6827ecd32ad8cea791ae9e3bdf0/
        sh4a |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/354bae2337703ad8bfb9d33c79538df3017b7fe9/
     aarch64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/b977f4e0c4f22512ec017dd3b543fef1ac9710fa/
        sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/207972cccdaa0b49cfca71a285a3100e08f20bc5/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/f53556e215abbe3839c83bc4fa8348cfcd5eded2/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/b5e7599ba33dc43a8f7e81bfa6d7ad9cb0ac68a1/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/12643bae480b2c310be310afa4b418d9a1ab8fbe/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/b6429cffdeda508271e4d51bee786f3f97b1a2de/
        sh4a |                    zxing-2.3.0 | TIM | http://autobuild.buildroot.net/results/f255e1db4c399e2fb8f2d7e9719bd69277494013/


-- 
http://autobuild.buildroot.net
