From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Dec 2017 08:00:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-20
Message-ID: <20171221070011.B121F209CA@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-20
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 196 |  25 |   3 | 224 |
   2017.08.x |  15 |   0 |   0 |  15 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-5.5 | 13
                    php-7.1.12 | 2 
                  boost-1.65.1 | 1 
                     gpsd-3.16 | 1 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
                   jamvm-2.0.0 | 1 
             libostree-2017.14 | 1 
             libostree-2017.15 | 1 
              lynx-2.8.9dev.16 | 1 
make[6]: *** [profile-do--b... | 1 
                oprofile-1.1.0 | 1 
                      qt-4.8.7 | 1 
                qt5scxml-5.9.3 | 1 
          sphinxbase-5prealpha | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/513b17bf92164598c1e3cb00190bb162b9fd65af |     
         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/32528cef403884cf4e5fb8476da490e539510d72 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/c92eb820d8bfa1b5df6707b1e235ce8b2996897a |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1e0660a15f64966e71ea6c357bdef66c652a76f3 |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1be493ce38ff3880adacef38fb2cbf23a2fcc89f |     
        or1k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/04da52b419e61deb81402c54ec0c3739e6a26bb0 |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/cf0823f26288c3fceb8b9c211be2334936d7a912 |     
microblazeel |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/9db0ed9cd38d48947d6d75c0d9a01cfb1be55493 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/79fba1b0c8bd6ee5e4b0158f7ccc7a36a95d08f9 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5191cb1009f09c4b157ff2140ba6d6dc7d00245a |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/2d3e83792f5e4cab0c960d82c9fa8393116ffa3b |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5373083b32bb13ddd42e0d18803c402390c0bde1 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/322653c4409096098e69e2dd8a98909dc8e5f1a9 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/da49d8977e74861d336a5f9eae542c4d995311eb |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/eadd705b0266129542f258f7dd679f185b4e7f16 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/359e7054fea6031a2273c2f51c57f0d7b007f5e2 |     
         arm |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/c007d7aaf4cd6915b41ec3ff3acd148df9028499 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/078381dced56f530f23fcd207005a5c9fb0b8174 | ORPH
         arm |              libostree-2017.14 | NOK | http://autobuild.buildroot.net/results/1edfb60add17945eabc557e1dbfb08a0ba466df9 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/3fc91565cb2d0fabe566c109257a616bd57cb08c |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/9de060fc87127a71423400e2e8e027821d311fec |     
         arm | make[6]: *** [profile-do--b... | TIM | http://autobuild.buildroot.net/results/47d29df652c74c4d1642c1ed08c028c8a98d8634 |     
        i586 |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/54ee9ca5b9a3c80e0fcb36881eb14b7da4570a3f | ORPH
      xtensa |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/fe7d8a2542742e6592025bf12e28afae1eafd1a2 | ORPH
         arc |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/1dad3f68379727b00773de910450af5021053a13 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a72012c602ab2b2aa4eb0f5daa41ccf67b4ba552 | ORPH
         sh4 |                 qt5scxml-5.9.3 | NOK | http://autobuild.buildroot.net/results/2f0d6d0fcc93dc12d952913f31210ff4be93b7ef |     
         arc |           sphinxbase-5prealpha | TIM | http://autobuild.buildroot.net/results/4014bba2ca801138e58315c9f09b84e5e0498ed4 |     


-- 
http://autobuild.buildroot.net
