From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Feb 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-27
Message-ID: <20190228070048.49BF086B2B@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   1 |   0 |  30 |
   2018.11.x |  17 |   1 |   0 |  18 |
      master | 167 |  32 |   2 | 201 |
        next |  45 |  19 |   0 |  64 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/a204743aa4e8a642549ff5fcdf1178dc10e99ef5 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/fb6f8c08fa7b1b7e13c422c9796d2aabb60822cd |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 6 
                gerbera-v1.3.0 | 4 
               runc-v1.0.0-rc6 | 4 
       gst-plugins-bad-0.10.23 | 3 
                mongodb-r4.0.6 | 3 
                   glm-0.9.8.4 | 2 
                qt5base-5.11.3 | 2 
                   dvblast-3.4 | 1 
                    efl-1.21.1 | 1 
               fftw-quad-3.3.8 | 1 
          host-libsemanage-2.8 | 1 
                  linuxptp-2.0 | 1 
                       mongodb | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
                 python3-3.7.2 | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/5f0c855fd7ff5831e8887afa6ef73a4000bfb7e1 |     
        i586 |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/62ca120f1e54e8c3ae445f98b2624b526569f007 |     
        i686 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/bfe729568a04c2d195658fe267a9d5dce14e7309 | ORPH
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/00a60cdbdad0387b4bf70586b6b5bebe1f2c5a0e |     
       nios2 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/2565a0607294880118f09e126479a0d7c7dc1c35 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/5a3fdedf6ffdaf8b5a7c1807473418a74da6ce0d |     
     powerpc |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/db53df48ffa62bea02f4b94e23009c33f818e2f9 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/8f38a81373960809c87091bcc64014ca213b69ae | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/36ae2c58a49e47281b9e28e7933c301997f89f40 | ORPH
     powerpc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/f3b73f03208000c03b45a80232199afb903ea58d | ORPH
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/0ac9fa28695d025a3c68684a35ed17f0bd34dc6f | ORPH
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/71b49d3aeb1ffb6270739c7b05578da9ff065711 | ORPH
     powerpc |           host-libsemanage-2.8 | NOK | http://autobuild.buildroot.net/results/ebf452d5ba873295bcbe5dca62d869a8f74c1db0 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/124bada92bc478aaaa354d1291d08d5c47040eaa |     
     aarch64 |                        mongodb | TIM | http://autobuild.buildroot.net/results/2cc57a06a2af5a1e5ea515625bbccb7f66ff9204 |     
         arm |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/407ac1dc42a5693f101384cd5123fca871980dc1 |     
         arm |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/fede2aebc25909e788c93c51670b3d87e18e68a4 |     
         arm |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/e1303aad5c107dde776855491b97fa9d59e79774 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/7cfd61f0c75098c025f84320a9ff3e6aa1dd4339 | ORPH
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/372256df1e0d118fa9a24b0ecf29690e310a3e77 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/0c5844282da8365519db220295c0e4405376071a |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/c979dc75321e5e65e4d1530bda2c2ef58281d726 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/199aed9684d803cd781e6ae1bb29e8751d0dc37b |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/1e2727f6715b9baa932e36ae79e9eee14ccdf345 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/24b548685d17ad99ea4a89a89b3e1b70010c3e3a |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/db989c3d50bbc2e23c22666fa2205021c09fe456 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/52029c0826fa68b090bee1f0cc571f4db449f9cc |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/751fafd97898be07017842ea29698380ffeae21d |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/56846a42435579410db9b43bc093722a6251efd5 |     
microblazeel |             qt5location-5.11.3 | NOK | http://autobuild.buildroot.net/results/36226eecabad4b39bd86e6566c93d4d283a1fd6c |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d0dd8d5d79c005d63b8de08ed49bef95df545898 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/7ef42263e8d2c5d484ae9c5629e124259c347541 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/401f65d3fdc4e478aa6a221afdf4280edbe8d6c1 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/df9541976bc5241c6c94b6009e36fee9d39984ee |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

host-imx-mkimage-rel_imx_4.... | 6 
          imagemagick-7.0.8-27 | 6 
            optee-client-3.4.0 | 4 
              freeswitch-1.8.5 | 1 
                   netsurf-3.8 | 1 
           uboot-tools-2019.01 | 1 


Detail of failures
------------------

      x86_64 |               freeswitch-1.8.5 | NOK | http://autobuild.buildroot.net/results/38c8f6691d8443911ea080073c8d924e5be0f403 |     
         arc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/852a48461b7cdda4f5f1a9ed55ed21d748783593 |     
 powerpc64le | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/c65bdb5ba3ca3fece6fa2a71efe0a0c10b9d80c4 |     
      mipsel | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/d28df6ed3aa6cf30eef7d5f99c373e43aaf9228b |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/2d455c33b4e979b84cb3191c38e9fa277af46af7 |     
        or1k | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/358d1c11b6beb09f64a8796c50bac23fc801cd91 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/afb6ab6e4d5b2b901104caa8ae9ea3d75ab4d56b |     
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7230a154daba47034d160bc6c9909d3311d898af | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e40de19935f38b121c80ddb7fde8ae44523bbc43 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6a0309bd307fe3ce667fd7cdc4a99cee4bb9264b | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/47b557cabb24814cc9e8eab1b4df87e6a0e9cac2 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/da059541328ef4bb944d4cbaf9c5812c215a33a7 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/cda6ab761ee469036eec060f3de8117c9fc11b25 | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ba0a7e593936435162a2104b28b11b776e7d1823 |     
    mips64el |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/09fc3baa9eddebc05f5429efbd1d81caa01fd811 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7d65a723233e433924729b005e1e6525ead180b2 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/59dca9bd873a8e5441e5593954cea65470ac217e |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/15373438738644f3b0a12545fbe78aa9f167f707 |     
      mipsel |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/b6223623f6f20f3478bbfe69749fcc8b3ed795e2 |     


-- 
http://autobuild.buildroot.net
