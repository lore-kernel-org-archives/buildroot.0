From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Nov 2018 08:00:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-11-13
Message-ID: <20181114070023.5E2C520D83@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-11-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   2 |   0 |  17 |
   2018.08.x |  13 |   0 |   0 |  13 |
      master | 190 |  21 |   1 | 212 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  giflib-5.1.4 | 1 
                     gpsd-3.17 | 1 


Detail of failures
------------------

         arc |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/f910362137e93b3c2b02e57d2612d8e2209fc3a5 |     
         arm |                      gpsd-3.17 | NOK | http://autobuild.buildroot.net/results/fe2d92861b4e272eaaf466352ce5183c3f911081 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  libnspr-4.20 | 3 
             gstreamer-0.10.36 | 2 
               boa-0.94.14rc21 | 1 
                   dante-1.4.1 | 1 
      docker-containerd-v1.1.3 | 1 
           dt-utils-v2018.05.0 | 1 
          host-libsemanage-2.8 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
               libsigsegv-2.12 | 1 
                 libv4l-1.16.1 | 1 
                  mender-1.4.0 | 1 
                qt5base-5.11.2 | 1 
               qt5webkit-5.9.1 | 1 
runc-69663f0bd4b60df09991c0... | 1 
       shadowsocks-libev-3.2.0 | 1 
          shairport-sync-3.2.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
               wireshark-2.6.4 | 1 


Detail of failures
------------------

     riscv64 |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/a4a06cb0e6c5cc2c6c4591195697476fbf55ddae | ORPH
       sparc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/94cec46391d61e4f9bef7612ce36ccebbf433e85 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/1391bc99e43d20680d5b6823f00e08debb1ccd8b |     
         arm |            dt-utils-v2018.05.0 | NOK | http://autobuild.buildroot.net/results/c6c8ede30623cc20011916cc95dbdae34dcc0344 |     
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/faa886a86c5b396d528615fbfc545c17bfb03b63 | ORPH
     riscv64 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/2cb18c71a1849f6094a7ef34df10a29c0296bb8a | ORPH
         arm |           host-libsemanage-2.8 | NOK | http://autobuild.buildroot.net/results/fe1facc3b87f4ceb91ab3d3bc0fec05184b3f616 |     
        i686 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d8ae78dcab4e08cf487e3a17617708c46d32fced |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c94703d9c77a125c354b19a54026236d9d0640c0 | ORPH
       nios2 |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/2d1288e98a6459d84c2599c99b5617a2fde81f62 | ORPH
microblazeel |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/68eb583968e80a320847544f0d45f2b8bc6389d8 | ORPH
       nios2 |                   libnspr-4.20 | NOK | http://autobuild.buildroot.net/results/a9ab137e6c24767fc48f9e3282dac1c145255296 | ORPH
     riscv64 |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/bd12cb3db3b46860a4ab8fb91052319dce75202a |     
         arm |                  libv4l-1.16.1 | NOK | http://autobuild.buildroot.net/results/32b8f63e84616f91b645230e889eb1518972a398 |     
      x86_64 |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/7cd819f88194958dc8c2b2bd1d65d5dd4269ac14 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/81866fae8273082dfbcb7bac3a60f014aaf5cf07 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/60037177ee3f0956753fc4b007bd616fafcd5dd2 |     
      x86_64 | runc-69663f0bd4b60df09991c0... | NOK | http://autobuild.buildroot.net/results/17d8c9e40b2f71dda4b2a5526c92bdf0bd1a34fd |     
     riscv64 |        shadowsocks-libev-3.2.0 | NOK | http://autobuild.buildroot.net/results/c5406206190b46e15d35d05c5ed026ee7632f5b1 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/18eb50a4420f477fb77470ce66a1ccd8e9568fee |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/7838e04dbf415260f3207743af715c07eeaf300a |     
         arm |                wireshark-2.6.4 | NOK | http://autobuild.buildroot.net/results/1700534671c47f7d2bdcf2ae7c88e04474cd97d1 | ORPH


-- 
http://autobuild.buildroot.net
