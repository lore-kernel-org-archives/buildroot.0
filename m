From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 07:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-13
Message-ID: <20190314070052.86D2487EE4@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  29 |   1 |   0 |  30 |
   2018.11.x |  21 |   1 |   0 |  22 |
      master | 199 |  50 |   3 | 252 |
   2019.02.x |  19 |   2 |   0 |  21 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/e7f66548a2b5734bdfcaa040241fdd6168ca6808 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/cd3c0d4bf7c19ff419f66e723771effe6a70cb30 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 16
      host-uboot-tools-2019.01 | 6 
            optee-client-3.4.0 | 6 
                gerbera-v1.3.0 | 3 
                   glm-0.9.8.4 | 2 
                      gzip-1.9 | 2 
                   netsnmp-5.8 | 2 
                    postgresql | 2 
                qt5base-5.12.1 | 2 
           uboot-tools-2019.01 | 2 
            host-autoconf-2.69 | 1 
                        kismet | 1 
                  linuxptp-2.0 | 1 
                   netsurf-3.8 | 1 
               openldap-2.4.47 | 1 
                 python3-3.7.2 | 1 
 qt5virtualkeyboard-legal-info | 1 
               qt5webkit-5.9.1 | 1 
              spandsp-20180108 | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/088344b5ed8709241d5ec89d44a671dd081e3042 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/c1c649fa4cd367494ec89230f92634869c66e7b9 |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/227760625fa66b04535c9a99fbbb46502ffae847 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/795df084cba2afee37ae0ebdd2462cf138a687ab | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/37511ff1f1d022fb97478a53de71d8728143e9d3 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/bc2a4684ab76316da06339ed02cc58e4793b4a6f | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/ea4f5e7195aa67fd6747a5df1d917dfa976fd16f | ORPH
        i686 |             host-autoconf-2.69 | NOK | http://autobuild.buildroot.net/results/5803426effbc81e005b1b72515f3d2547e7a9ff7 | ORPH
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1a58ee39c21714df2e7bff7e4d83690419a62d30 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/b50cd9cd9d886f0dfdad4bc31dd7f4d42f2054bd |     
  aarch64_be |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e9aabb2c7445be8b677b911e9989b590445f8f71 |     
 powerpc64le |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4131d1c9dadf2fda0ba83758aba1db66233ac68f |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/44fdf67e39ba2c87d7db32f11380e77bf62035e3 |     
        i686 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c59865318c1418a919c2456d5d23263d524c9ba8 |     
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/5962d09098c4d9ae268737b99c2aa7b4336a2571 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/67c805167419e0a698b6a2edcdc817c1ff548591 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e4d9d56c7738b89691112dc10dcb680983bff713 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/56ff6d2015712885b3a2781d873734d8694a5814 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/143bf9820096a690cdf88875ad0c0afb4411b718 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/3cb1dc6c94d05132cb4692088a5116ff5c4970b2 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/8b8740c54a785e8a8d1d202e460cb6b08dceb9d4 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6ffd20a926a7100369394502b31bb66f8e3c9a06 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/2ecff89c6ddd97867a575b272107674590a6264b | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7fc7c1f72789f8f76aa51facac398547bf719455 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/525d3aa0b46ec50e421098c2cb3a5ce60d491516 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/25bb0f0fd2c6b78a8509f6f8c429ea3585718b9b | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d1aa2c68cf1057d56b3a58bc1629dd41488789e8 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/35625b12844d6d897b49ef05d5e00c67b2d8efba | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b2b6633247f656cbfaab2eac59198d549d2bfe48 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/de1872ed18e5f2d0c1d2d9fcd7407b4af74dae11 | ORPH
microblazeel |                         kismet | TIM | http://autobuild.buildroot.net/results/02f6e616631f05a4f15f31f2b2e67d65ba7afcb0 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/885a4d6ec728266c882f172bbc3f53f5cd4c8bf2 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/9095d569b15d185a3e16a9a07fda2e42c037e4d7 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/30ca88bc849be9d27bd049cb3ec7c2676b0f29b0 | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e49f64cf5bdac070e8b490b3f3da2607e4daac20 |     
        m68k |                openldap-2.4.47 | NOK | http://autobuild.buildroot.net/results/7d837fa76e45f2ae9efc740c6971993f4f86e52a |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/397b55738335f683dab875270f666f4caac90203 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f91fc49cbc0c1259e3e07c2a1fd678703b470bff |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1ca61d2c6179677682c37c118ceee84b308b3fb5 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/797c9f33ccf7801c359301b3b9ad3cc3452c73c7 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7fe4831fb6e2182ff76e6e555636e505e208ec10 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/fe8e8140161838be7bd5d5abdfad2370b5b30e2e |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/6647107bb7d42cfc4f3a2316ee78ae5dfa4c2cc0 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/31eb91b0a5e2ff32a74f75a1529592f287631d80 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/b0eb1d52e3217d2514fe11c12533de0a9a6e3fb1 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/ac1df1b4e9ad58737503518572cb08decca4d1c0 |     
        or1k |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/97d0dac2381c51185a8e1b48c9f18e6bc929fc35 |     
     aarch64 |  qt5virtualkeyboard-legal-info | NOK | http://autobuild.buildroot.net/results/ca258322792406873848153ee5be2f367f763b3c |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/599180c95e3e2dde913d438c57101ff8de15e920 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/118a6c53f246805bc5317cbd20c51ac5f171a4d4 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/17f75b64bf2f65ede00af895f8f5ded6ca92b902 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/03259380b73441bd5ce9ae4291838690ed0c90c2 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/acd4cd897fc9cb41318917c155bd77854210ed8f |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                gerbera-v1.3.0 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/b2b16036aeb22fc867feccd09c215f59d40f4e00 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0191616e1b1bf08556960388ed04815a68b8f636 |     


-- 
http://autobuild.buildroot.net
