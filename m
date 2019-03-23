From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Mar 2019 07:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-22
Message-ID: <20190323070042.41CC4875F5@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   0 |   0 |  23 |
   2018.11.x |  28 |   3 |   2 |  33 |
   2019.02.x |  13 |   3 |   0 |  16 |
      master | 228 |  69 |   4 | 301 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 2 
                qt5base-5.11.2 | 2 
                libsquish-1.15 | 1 


Detail of failures
------------------

         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/bb2d9d44b584efad2f90aab0783bbc664cd06fda |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/98c148a78e72e45933b7ab759814e9eb44515849 |     
        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/bab365d78dc2dcf81c3a7af0aa65312642b8530b |     
      x86_64 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/aedebaa4aebc9828dded6b30debb9dda2ca1ba52 |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/d3cd8ae49db41d42da3d179b4fa7d998db037242 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    uftp-4.9.9 | 19
            optee-client-3.4.0 | 8 
           uboot-tools-2019.01 | 6 
          wpebackend-fdo-1.0.1 | 5 
                   netsnmp-5.8 | 4 
          openjdk-jdk-11.0.2+9 | 4 
                host-go-1.12.1 | 3 
      host-uboot-tools-2019.01 | 3 
                   netsurf-3.8 | 3 
               domoticz-4.9700 | 2 
                   glm-0.9.8.4 | 2 
                      gzip-1.9 | 2 
                       netsurf | 2 
              fetchmail-6.3.26 | 1 
                        glibmm | 1 
                  gqrx-v2.11.4 | 1 
                grantlee-5.1.0 | 1 
                host-libsodium | 1 
             keepalived-2.0.13 | 1 
          libcdaudio-0.99.12p2 | 1 
           python-numpy-1.16.2 | 1 
                qt5base-5.12.2 | 1 
          qt5multimedia-5.12.2 | 1 


Detail of failures
------------------

      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/6618fa781ac0753b446ae7d27560ec1b015fd1aa |     
      xtensa |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/d41aae8a448c316187f9fbde40f1d077182bb244 |     
       sparc |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/58e5aa7c6ba8fe7474071d7a3cba6ed3a1b4cff4 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/bf7ee865ceed848ed0708af2af3260dbf9d29f54 |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/e7d00d5054c8b3aa8b3691bc25175fda79d4ea61 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/6ad1963c92ac927a1d19255e1989c5ec5bb275ec | ORPH
         arm |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/82331bf721506780d551928c055293c67bf53f9d |     
         arm |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/a5a5959a5708d29c659bda7fb1b6c6f4b3723131 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/ad00b851a676f5e266adb9d6c070da3f6e389598 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/8dc1fb80b77d3c5ae905188eb22cbb3e4d9b548d | ORPH
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/f170bb8cca2d49b243da76f46a18517148df648b |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/047d608e7d784d73159c5650d6d027c86ab627f1 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/6f3e2bce14403ac784b376aa36bca3ef96e933c5 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/2ea18ab64fb4a62c70d5c04d40bad5fac04c4b26 |     
       sparc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3085ec98faf9231a300c81c7247ff8a0b8191d34 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e8b8e8c52ef6b095396f39a8d8243a3c8e9e63da |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/e1c8d6337f5d1821e5ff86e426460a8962257125 |     
         arm |              keepalived-2.0.13 | NOK | http://autobuild.buildroot.net/results/a33433abeb122cfb15f7f21ab777e84040bdcb8b |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/69e70d920a871a691d24dc080c1ea2bd5a42e510 | ORPH
        or1k |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b87b31c74dac18c8df368a5c01d417dad08e90aa | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/6106406ed29ee66f5ff3e7e3cf36507f42d1bbb6 | ORPH
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/baaaa5268d285fcdc1cad602351d7d32acc38ed1 | ORPH
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/d865ea4a8b40d446ede8972469c557efb9c07000 | ORPH
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/51a3d9b34746a4b70f2e4aa728067dffb08cc6de |     
    mips64el |                        netsurf | TIM | http://autobuild.buildroot.net/results/270e8611b5ae09efb60b6d0374c11181894a13de |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/146c684dd94c844f18d16761725efeb3e0eb6aa6 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/fd494cccd4a415982e3cb0d1fa6df503ecfd1fc7 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/28da322b0a0d40ad89ddfec481931ff703026b6e |     
 powerpc64le |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/2a9a463405a54a9b16b61347f5caba26b468bf04 |     
     riscv32 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/8437ebe0fd228c2d8856255411026f30e39778e3 |     
 powerpc64le |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/3439b2da895c0cd39efed5e42bbf091f98716474 |     
         arc |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/c5782d6b52516d07469adf6600d4fc69c4016157 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/263f3fb6769785cee9be323605c014a52d7c2016 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2aab1b1030715c1e787f49c09c2e86f0c9bb6aa7 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e86762c83ba1680bc49cc2e98e9f78372c4de92d |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b7b7d6a410b526ff67048092d5371f85e6d24d17 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2c309aff1484eb1f3214ca3bdbbb98e391125260 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/2e6141e8ff24c73b66ac481ad7383b774c0d21dc |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d8513a4bdf23af8c112b9bbd90c00be10935dec9 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/8fa60c96c4cf397924b7d108075f12f15e7e3605 |     
     aarch64 |            python-numpy-1.16.2 | NOK | http://autobuild.buildroot.net/results/127a71b1642b708246299999789ad13ed0eb17f0 |     
     riscv32 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/194c27859637b29afbd30836e7e8bb2389a0f441 |     
 powerpc64le |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/4f1a9a91392f39e9d8b707458407177ac5ee6ffe |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4cf00a30b8f85b73e086e565febb6b07e39cd8d9 |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9dba362c65ab9bab55dcbb7176b3e13e2e75b19a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/eb44a99e798bf67df5b9fde12f9ce8c506686333 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c51f69cd70c5206660a599672dbd7a477508ba8d |     
     riscv32 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d2cfa5defb22e75e1ba1993dd56e3d1770f6b606 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/048c799f6027026e5ad85188de85bde89e08cd25 |     
      x86_64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/1a829b402d95d7deaffd95d8b5f61aa2eb836b21 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d4d257467531ec4113a137e846b36dad2155f963 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/347481901162896b6242c3037b749cf48b10de39 |     
    mips64el |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/1ec1a2e7421e4c375593a876251cbb1bc3fd4668 |     
 powerpc64le |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/118f440a416366091d0e9882d3e4cd7623e9be8f |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/2ac0a6165a10d8bf8e2c55203320022174719ca6 |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6f6c9e468c50dc1f0cd380fa35237d0e698466cd |     
microblazeel |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/08a549db2c282302db45e04de2087d8eb761359d |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/b42f191ebdf38e6d47d4b30d7f04d4eed46c4e2c |     
        or1k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6b141a551d7af19ba9536df10a4580d7b9e2e8e1 |     
       sparc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/c838f2525d109257aeb28892a0c4456d4433f98c |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/ecd640ec227fedeaa6dd2fa29ae69553aaa6c96b |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/6ffb42123c853042930079261ed1be1f55da1eeb |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/38b797f47059bbfa2eb5f5145bb217aea07f6224 |     
      mipsel |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/7741dcb970db8c18ae7200f3cebea70c8b0539fe |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/42958b448afeda846708605c7543aecbc7bcb969 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4518d94a332252c285553d18cbf4b2838f81037f |     
      mipsel |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/cf19704296c9690fb157eba3c011a2e9421b5ac4 |     
  aarch64_be |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/d260e270c26a54494c2e22f5c2a000cea69e2847 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/5c0388866e1edd1e6cf3555bb2018bda37512837 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/cfce17806d7c8ea6dea4e73e23e2a81ad6ebf75b |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/105e76454f68a17f5051c41cd2233116b3dc7e8a |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/b3798161ab6492e9ed3a3b259754246e741336c9 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/0d568a42239a008f1ccf8bf34c32b22e0d3fc428 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                gerbera-v1.3.0 | 1 
                gnuchess-6.2.5 | 1 
                   netsnmp-5.8 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/caaa30dbd296f55df3f5d63fc6844beeac36df40 |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/dacfcdf0421e5ad69d71a67ae3758ddeb26aed9c | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b101843694dda0262e04124853f9193d5c6f24f7 | ORPH


-- 
http://autobuild.buildroot.net
