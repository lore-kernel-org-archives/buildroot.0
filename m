From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 08:00:52 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-10
Message-ID: <20180511060052.6B11C208B6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  32 |   1 |   0 |  33 |
      master | 193 |  34 |   1 | 228 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

open-plc-utils-1be781d1ea81... | 1 


Detail of failures
------------------

         arm | open-plc-utils-1be781d1ea81... | NOK | http://autobuild.buildroot.net/results/f9b69d8408deebc9ca91fd8fe6f73c5b2af7184a |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               log4cplus-2.0.0 | 4 
               xfsprogs-4.15.1 | 4 
                 host-rauc-0.4 | 3 
              traceroute-2.1.0 | 3 
                     znc-1.7.0 | 3 
                cifs-utils-6.7 | 2 
                  host-go-1.10 | 2 
                qt5base-5.10.1 | 2 
                apr-util-1.6.1 | 1 
           bash-completion-2.8 | 1 
                  boost-1.66.0 | 1 
           cups-filters-1.20.3 | 1 
                    efl-1.20.7 | 1 
                host-libsodium | 1 
             libgphoto2-2.5.17 | 1 
              lynx-2.8.9dev.16 | 1 
                mongodb-r3.3.4 | 1 
                      qt-4.8.7 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
                 qt5base-5.6.3 | 1 


Detail of failures
------------------

         arm |                 apr-util-1.6.1 | NOK | http://autobuild.buildroot.net/results/6004d079f2d5b768ca15fcb910317414777afca8 |     
        m68k |            bash-completion-2.8 | NOK | http://autobuild.buildroot.net/results/3fecef72d7e54cb409fda2903c7d27e09cad18ea | ORPH
    mips64el |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/171a53f6d58792a26e327c43d8eb46ad74cd9702 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/a0547f0e9b6689c488d928da7a2b164599a4a9c5 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/91caac777facf4c73bb1088586276a33d5ad6073 |     
       nios2 |            cups-filters-1.20.3 | NOK | http://autobuild.buildroot.net/results/5c326bb56199000eb0e53a4d0f3c6c13be71cda0 |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/4888d56c1d104fdd642839814af4fa9a55f72e6d |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ff113a6e7ef05e2fefcfd7e80805480a7b2c5399 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/69ee449a3d1a096773c91e341a4362b642936032 | ORPH
    mips64el |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/b05a29951dd298ca6c789a6ddbe1598bb72dcaa6 |     
        i686 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/0de9bc4889732b8260ac9eddcdbb56cecfe7d0fe |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/6bb46109e053d3a767df825b853bbbc52f8ec4f7 |     
      x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/da4ad77146249bd1cbce7afb2355b700b93b3f0f |     
     aarch64 |              libgphoto2-2.5.17 | NOK | http://autobuild.buildroot.net/results/21044a75e5f54c71426c7d972da5c59b6accddcd |     
        m68k |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/862e12be413c2e21c92a2ace847a138d5de556fe |     
       sparc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/8eba6d1ef70c3487f599e5897bdbfa44f2014409 |     
       nios2 |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/5001f5007c01e7887a7be67150e0c2965065dc1c |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/9d55ea65f085be19dec79bc9d3707f88e8a1139b |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/200b2410ff083b18ef734e85de391c78cc5cd387 |     
      x86_64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/8290d1c7354d214eee1b8f4c832a6abf92ce16a6 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3c18b7fc834fe5ed39de69b73417970f156425e7 | ORPH
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/f2fbb1ae4bc3d7c4fe200fe877e7973af2163228 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/3985c4c1bf181087741008f39294140317453de4 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/8d90e870fd2859802478021c77b6d23ef5bb3ee2 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c1ad598fe3d8b9a0e6c1490983963b9f46804bac |     
    mips64el |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/91173e3c873aaabba18d7d55dd4f51dae07d2561 |     
     aarch64 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/f379f05f5bc5b021eed08f35139256af24ece7b1 |     
        i686 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/3224649f31d4ed6dc912fda14838b2a379297b7a |     
     aarch64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/fca52a8ad6900650b2df8cbdb0c8868d2a5401ab | ORPH
        i686 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/f5276b04b0aa2ab9e96f10c0032ff97d8b343d24 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e2a1d5ff88f750bd60f41e36dc1c6fb41c66293b | ORPH
     powerpc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/db7dd6c07a77be4792680ba6f8b116090b470259 | ORPH
         arm |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/798e0841728df4d33a4fd80a6e3c0b20c0fe6839 |     
microblazeel |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/3c77eafeaa665bc29293c44b9b34e376b301425d |     
         arm |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/206c50bb3a637e0f57208782f39f3fdbad764e14 |     


-- 
http://autobuild.buildroot.net
