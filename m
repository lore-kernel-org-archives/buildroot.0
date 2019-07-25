From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jul 2019 06:00:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-24
Message-ID: <20190725060050.D2DA72037D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   1 |   0 |  14 |
   2019.05.x |  14 |   0 |   0 |  14 |
      master |  92 |  29 |   0 | 121 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 9 
                       unknown | 5 
              iputils-20190709 | 2 
          qt5multimedia-5.12.4 | 2 
tvheadend-8f1de1621d78c9143... | 2 
           can-utils-2018.02.0 | 1 
                  dnsmasq-2.80 | 1 
                  flashrom-1.1 | 1 
               host-efl-1.22.2 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                 python3-3.7.4 | 1 
                qt5base-5.12.4 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

         arc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/e02ba4e360e616e7f983ebaf52b8b3815cda5daf |     
         arc |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/b725b8ff1a5783f8b5ad302c001a27c2310d6574 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/6085756fcde7d0ebd8846b7b28e8c14ea154fcae |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/6f2b2a4ed56f19e1828d753c46f4aada8b213b0d |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/a2a447752412a14ca4a0ea018ff4b52bc861c7c5 |     
      x86_64 |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/7c762df7b666108b710d8f49c803329f41fd444f |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/1124a06982d9b1dc3b3f90a886e5f3824c37d662 |     
         arc |                log4cplus-2.0.4 | NOK | http://autobuild.buildroot.net/results/de0fab7adc8bf2d17f9a5cd5fa08d61299f82481 |     
microblazeel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/400541b08ec4a8595da9c1c569dd240a82df6037 |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/c083f219296cd0dde9645273d374cb3ecd06bde1 |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/2ea76be2a508787920fa4abdd0d6b8277a026a74 |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/741597864b0b6104c9fd561facdf5e4727117eec |     
       sparc |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/1db01ecae66ab819b666706579ede61ecdfd4488 |     
        m68k |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/a074fb0f7c5dba9ec5124df1e3be07dcea9f1690 |     
 powerpc64le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/665409955a3b63bbd5251f09052caa4b2e8e667b |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/23b817d841f2d1726586a7ae7b7f8fc5b7d16588 |     
     nds32le |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/94f31f880569c6221b02c2ccf82d05f65e885676 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/f474c695398f3a9539913cdf368731c271b0c8ad |     
  aarch64_be |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/f53a8ab5a39a52ff5c7a80c7925a732ebf69ff63 |     
    mips64el |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/0250000c9b6cf469f25deeec9a9523998851c3be |     
        mips |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/f5138fa7621651c5a65c106f2a51fac32b600cc7 |     
      xtensa |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/b170d3d714f4813adf6065a500cb765dda3ebffe |     
         sh4 | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/06e54be74e91ff3c06f6ee5c9288bc1de4bd4533 |     
microblazeel | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/106b715a2cde264a8ba2c6f9cb04cf15e68dba37 |     
  aarch64_be |                        unknown | NOK | http://autobuild.buildroot.net/results/85196afc944ab9697c49d880f543c3fc02009c30 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/8ca07b96292b4518d2bfbfaaeb57a2375005b879 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/1adc89487aef30734fba9ee7a2f77c03f0d6a152 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/bb5f5835146a24aa3f619f6a29e97a4943b75560 |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/af7713b7412d4b008a91dd0b0bf718337647a0f9 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 


Detail of failures
------------------

         arm |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/85eda72caeab1d9fe019a25f17653fc0cb01c750 |     


-- 
http://autobuild.buildroot.net
