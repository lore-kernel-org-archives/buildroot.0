From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Mar 2019 07:00:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-29
Message-ID: <20190330070040.E96C12EC4F@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   1 |   0 |  22 |
      master | 195 |  53 |   2 | 250 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                busybox-1.30.1 | 22
      host-uboot-tools-2019.01 | 8 
                host-mtd-2.1.0 | 6 
           uboot-tools-2019.01 | 4 
                host-go-1.12.1 | 2 
                   netsurf-3.8 | 2 
                  ffmpeg-4.1.2 | 1 
             gst1-libav-1.14.4 | 1 
                      gzip-1.9 | 1 
lua-gd-e60b13b7977bb3424d70... | 1 
                   mimic-1.1.0 | 1 
                   netsnmp-5.8 | 1 
                       netsurf | 1 
             openjdk-jdk-12+33 | 1 
               openldap-2.4.47 | 1 
                          opus | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/28e21d38ed20a58c45ee957457dce1c842d5bb70 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/68006492884a616c0d8a068d7ffc8cbd4d1c1068 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/97e066c556eae8f76155ae8cad17eba4013e9f46 |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/0f233c694788a4ccfc6c582a156b3704b569c592 |     
        i686 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/42aa6b43cbcf6daa714a3d55c576303bf6cafb84 |     
     sparc64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/4cb988b925250b861cddeca352e40bd13760f980 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/e2c4924effe8d071c5f3d1f17586209447ebf53c |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/5e7becd5565acbc223f93751d7c516064b0ec86b |     
  aarch64_be |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/040318338c883df02b375db04ea184fc55c74f34 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/7a531c22205ea5b2b7d8576e5937cd4b5c3552c1 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/90cbd0c7a28e03753e176cbb0bc47703cbce0a37 |     
        or1k |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/67198b15e72832c8e1797d553649156e8df43f5a |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/2134737f6ab9b184aeb9a5666679c88fab1948f8 |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/a43d887799ad24ca0925c1bcce74a5352de568f5 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/1e547cedac35a83526dc67eb68ddb67529b83b28 |     
 powerpc64le |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6d42da59843fee5f706c946aed0c73e4d9908562 |     
 powerpc64le |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/dbbeb5e449986b8893d6eeed5ab5f005f2a0f83e |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/d67e4cf441e55d93236530547d4b51994d0c5f8b |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/59d0609ca3a9e985e099f60549c18e6faa8c85c0 |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/ab45ab9de3b29acf540ecbae4340272669227001 |     
     sparc64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/e19594832f21621b996ea51b6f3f1a4240403ae2 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/74eb7c9465fd6af99435b6fddfa964f6986eeafb |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/b8903e3bc99ea7fef86abc22726dc6d10b6d1c00 |     
   powerpc64 |              gst1-libav-1.14.4 | NOK | http://autobuild.buildroot.net/results/6710e72452fe70788d75191b8b735f90beff9361 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/b9b72a27856f87fc5249ffe8a0e11030e71e25d8 | ORPH
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/1f98a1364b17733c885f99e01062a7c29ccdc792 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/396ac8a080c389827d58b76a556f5ba4cc230fd6 |     
      x86_64 |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/ede17d68948fd478c366673b7d22f07cee3bd09a |     
      xtensa |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/ed82ef6c15d7f59c9b93d237f53fc09513ed5c4f |     
      xtensa |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/a78544def5c17edccdf5db821318b8efa3fc7b8f |     
      xtensa |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/c985bdb633a4567213b478c3b108dd1bc28440cd |     
         arc |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/61104c198fd52cbc6faaaa9f850197e05880cf51 |     
microblazeel |                 host-mtd-2.1.0 | NOK | http://autobuild.buildroot.net/results/3046a543f6a5080c765c785e5d7a4df3e61a2b10 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7ac8c862e3c67fa1001819bed04126581d5803e4 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/227559e17a01e1c6805b40df833f571954129896 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/af5a2804fc7c4a5a757d1e8f1df822cd98985102 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6c4bd8144c239c05257a119ce421576938c9b5f1 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fa66763984dc35f59befc3e16843996aa4572ae6 |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/42c895baaa7b4a9f68a265c5bb1fc00911a17544 |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e3e9a57e495391ccbe9baf2f523025183f3b8002 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d345cfc35144c025ccacd944a3fcdd277a7183cb |     
     riscv64 | lua-gd-e60b13b7977bb3424d70... | NOK | http://autobuild.buildroot.net/results/d9735d1f9476690eb611296ccf83b8f41bf9d32e |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/c87f56d9f8c8c700bedb82d5a6cfd21054ca6bd7 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/d0b967b104667d8e52e7d0f77a7a003ed41807f4 | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/bec4a459650c083fdcea6dd5c45741825770d3fa |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e0baf53f9c000dce4b925755504dac6765affd3d |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/52cee48819cb7ae431c20c2f2f140db153a199fa |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/a7e592978b4321816a19c92b733c98f5cc88c40e |     
      xtensa |                openldap-2.4.47 | NOK | http://autobuild.buildroot.net/results/e1b9961e67259529306512dd14abd6b69b324d84 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/cc5562504960de220892faa7ac6b6be5bbb9c1b9 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/197f1558968452c529ffb237e54589efbadbe8be |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c278d691a1d54b2aaed8160b2f97bd364fb0457c |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5beefd1089bc559d09735362cd2634f36e16f897 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/445c2b63f1cd9e01f7252b467253ff816adedf4c |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ea3a42917665e214be6212a9905e94b40d8dd1f9 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 1 


Detail of failures
------------------

         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/31170a61ffdbaa587160ebf1b362d048711b4697 |     


-- 
http://autobuild.buildroot.net
