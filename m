From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  2 Sep 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-01
Message-ID: <20180902060016.0253C2071E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   0 |   0 |  10 |
   2018.05.x |  16 |   0 |   0 |  16 |
      master | 158 |   4 |   1 | 163 |
        next |  16 |  37 |   0 |  53 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 
               domoticz-4.9700 | 1 
                host-libsodium | 1 
                     php-7.2.9 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/808d1690240a4395cb0d953b77425fe31a85aeaf |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/9428b0aaae95288cf1d1cce0ca2492ae06b77960 |     
      x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/83ece99f846bbb6398b9f2cf6a4cccbae595e86e |     
        m68k |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/fcf04ffdc27bb73fdeca0cc70a0dc09bcf3ec0d5 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               target-finalize | 9 
                rtorrent-0.9.6 | 6 
                libsoup-2.62.3 | 4 
                  boost-1.68.0 | 3 
                    brltty-5.5 | 2 
         host-e2fsprogs-1.44.2 | 2 
                 lvm2-2.02.180 | 2 
                    ncmpc-0.30 | 2 
                  acpid-2.0.30 | 1 
                   botan-2.7.0 | 1 
               domoticz-4.9700 | 1 
                   netsnmp-5.8 | 1 
              ptpd2-ptpd-2.3.1 | 1 
           python-numpy-1.13.3 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

        m68k |                   acpid-2.0.30 | NOK | http://autobuild.buildroot.net/results/76de6e042301a3ee0cee0fe465034ac3e1e50ab7 | ORPH
       sparc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a16f521e9773f9dba3848f8b5e9942200aa3783f |     
     powerpc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/0633541ac9ebb2c3ee304aaddd8e1ed863913e9c |     
         arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/52a556cddc51cd58fc2f9b5755e773263cc3c919 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/ec47674cd5de4ff0fac818a0e8f62bf5b90ebeff |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/eb25cc93cfd038a0939f0d9c6b826d39beaafee7 |     
         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/9b206482c60575e6198ac703d26b9425f9c2eb2a |     
         arc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/cd9d3cea54de151ab1245721aca361654e56dcd3 |     
         arm |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/916e6d2f2b5cbc5d573aa686ba3b23fd4c23c9f5 | ORPH
      x86_64 |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/910101e564de14838c7e484036ba38d02e3da947 | ORPH
    mips64el |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/d73a946685617ec39a6feb434640d7366161823c |     
      x86_64 |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/67f66ce30b780168d3269037414048937ded1c45 |     
      xtensa |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/55ae64af558bb13404ff121d431e72e44d539863 |     
         arm |                 libsoup-2.62.3 | NOK | http://autobuild.buildroot.net/results/caf7c2b1ba0ff0536b00cf82c2527c0d549106d2 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/4cbca89a74ed728492e05104598da375ddeb043e | ORPH
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/77640ff80ab35fc9c7d6d2ea486cbb2dd2f8815c | ORPH
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/011b607650e482953c3b4466e9a0f550153ef047 |     
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/7a42a36a6c9194bba1ff81b206706633fdcd26c1 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/d02afc174ac4c9888f0a2cf725820cc1f05fc4bf | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5f1f4004d7a674ea7a5b6fabc705f8ea949b978c | ORPH
      mipsel |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/848ae4814ac96e5abb4fea7206e67408a8e711b5 |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/3f1b3f58dd167dcd71cff9b6e8bf2424fc76224c | ORPH
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/dfcdc0d88ca2e03fff8f4467dbbf4698b8b245ad | ORPH
         arc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/0c478e224c72b24a86cb042fbcc027f47973357b | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/09f0edd66525f89fa5b2a2f22b02fe95e2bf2a0d | ORPH
     powerpc |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/6baf94fc5080a1de93c8f8d297bcc6814fc4fa18 | ORPH
      x86_64 |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/b4ee260f1391cac055544fb2c0b2d0a4e686787d | ORPH
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/cde6b200ddd4c7af247078caa2883021ac445d6b |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/c3cdac59543eb723d536772dbec261b09fb62291 |     
     sparc64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6688d6437168327aca0f6fa12b39e8d2b3b87421 |     
      mipsel |                target-finalize | NOK | http://autobuild.buildroot.net/results/3c7307900f98020055b0fe74d1d7960e3f610674 |     
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/10fa4df8ead3246f6e297f107defb1f75d5fc74d |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/a4aa6c90a88bb4b55964284c5bb09f6a045350c8 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/4e0c7de94e4a6a4210d15ae15dadcbbdb36a7c7c |     
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/555f3ead640bf990014ca5b3f10008e8a7cf0f7e |     
         sh4 |                target-finalize | NOK | http://autobuild.buildroot.net/results/3688076a1518944e2c1d6dffa5c4647e467dda21 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/1b66854cee24f4c251a1dfb06e28dbd2af7ad163 |     


-- 
http://autobuild.buildroot.net
