From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  4 Feb 2019 07:00:37 +0000 (UTC)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-03
Message-ID: <20190204070037.DA0D786879@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   0 |   0 |  18 |
   2018.11.x |  29 |   1 |   0 |  30 |
      master | 212 |  13 |   1 | 226 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.4 | 1 


Detail of failures
------------------

         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/04d3527e3967010fb49a40385799b03a7409cc24 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

   libtorrent-rasterbar-1.1.11 | 2 
                  brotli-1.0.7 | 1 
                clamav-0.101.1 | 1 
                  ffmpeg-3.4.5 | 1 
                        jasper | 1 
                 libdrm-2.4.97 | 1 
        opentracing-cpp-v1.5.1 | 1 
             qt5location-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
          shairport-sync-3.2.1 | 1 
               skalibs-2.6.4.0 | 1 
             stress-ng-0.09.47 | 1 
                   systemd-240 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/01d0ae9a6c02f3f907fc770a871b3ea7b1e34ae2 |     
     powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/e81718de021c8729b13bb40ca5c454e4a8659ee5 |     
     riscv32 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/8ce9711bf67bde5d3e7e61618bd018b1f4bfca94 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/37e916b576acd212d967be4eb7075fc041008509 |     
         arm |                  libdrm-2.4.97 | NOK | http://autobuild.buildroot.net/results/11645d4166f27ace9fce0ccf8daf80dfb42baecd |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/a0a72a23d91f185b3fc997a15f11254a3024aac3 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/dabf165e3f658788f6d166a001c13e09a32b8be4 |     
         arm |         opentracing-cpp-v1.5.1 | NOK | http://autobuild.buildroot.net/results/121a9f2aacf9e7b1f5d0b3f2c55bc1da36c7cfb6 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/e5d98efb269fd11b12f91c69c8a78a70bb23e825 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b8b5ccde83e1976ab0a64a35f1bdcc75c28e3df5 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/fec13ba0bc48d1091bcaa1f2497f653ad0e30875 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/f32981e3e9dc818c799a8cdb48a848f163d9eded |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/fb0c91346827928e1189958b61fdcebec03be909 |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/970b09e1d49b53dff12a07ca4ad424ef9dd29a69 |     


-- 
http://autobuild.buildroot.net
