From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Feb 2018 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-23
Message-ID: <20180224070012.58C8B20883@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-23
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 168 |  21 |   0 | 189 |
   2017.11.x |  18 |   0 |   0 |  18 |
        next |  38 |  11 |   0 |  49 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 4 
                 hiawatha-10.6 | 4 
         libcpprestsdk-v2.10.1 | 2 
                     php-7.2.2 | 2 
tvheadend-e06ffd87beff16103... | 2 
             bluez5_utils-5.48 | 1 
               host-efl-1.20.6 | 1 
            libunistring-0.9.7 | 1 
               skalibs-2.6.3.1 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
                  zeromq-4.1.6 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/e84e369c2f9b61f0b0fa10a9ee682ee351c53361 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/fb0c35a8c976c1be07d0a2696e1d88214b9e9dc1 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/013f139fd21eff4c61135dd517b0c955c7bbed09 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/218b4a8868d53613aeb0ff826b5ab8fc37e28d75 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ba41551486034d3a21b5de98ed543b8cc190a63c |     
 powerpc64le |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/0f3c812e2d21dbeda45dfcc133128806f4acb4c6 |     
        i686 |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/8206794b8c53dac6120923f5e928c6e1e28604f4 |     
         arm |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/4bbf5dd155836da35af76fb424874bcdc7f3ef20 |     
        i586 |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/91d99447ae8e92e7121221f0bb12b212535d77a1 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/920efca939be85d6b2a361d7130f2083f070a2f4 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/16c751e2bb83173ac364e857b8dba2a28dc4e1bc |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/74dfd3afbdfaf2296331335016f97a157b99e025 |     
         arm |             libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/1cc928d1fc0b6c6239558ae74f5cb710df7cc5b1 |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/47f8cdfe4c9d22bee6b7b68c9369b3bb95b77930 | ORPH
      x86_64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/454c800557c3409994628ff16a79c5237a31f1c1 | ORPH
       sparc |                skalibs-2.6.3.1 | NOK | http://autobuild.buildroot.net/results/3dd1efc3e418d23c7607905a0e6d176e41dc2abd |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/9c8fed74caeb5c29ed37fbc5711e5b178085cb1c |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/7dd743f1960fe9bd23b9f8348a19e1292e3c70e3 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/488029aa9fb353f144b4858255613543603a6830 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/aed01a55da550870e543e12cac9353afd3353956 |     
         arm |                   zeromq-4.1.6 | NOK | http://autobuild.buildroot.net/results/e14a985c9f65a0f6152f37e930712681f931400e | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    liblo-0.29 | 2 
                  autofs-5.1.4 | 1 
             bluez5_utils-5.48 | 1 
          host-rust-bin-1.23.0 | 1 
                    htop-2.1.0 | 1 
                iptables-1.6.2 | 1 
              keepalived-1.4.1 | 1 
                     php-7.2.2 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

        i586 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/ed8bc0fd29efbc3cf75dc0ed2a3876ca5632d15f |     
   powerpc64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ae066e67ce528ca6af7d3f0361a9e72202ae6021 |     
         arm |           host-rust-bin-1.23.0 | NOK | http://autobuild.buildroot.net/results/08ef76a9862f927a2f4cb5f34adf7f64d51da60f |     
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/56b53ecb4d099e4924b842d636e878bb062b0013 | ORPH
microblazeel |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/f0d6b5b229cf6f8b672f897326f7416c2667fb87 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/5332f87df1b265cee4be93628ba70fa950fea5d4 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/673638d2caa68d38e81298cec6b04c3abfad2509 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/788e75d555df2ecbe871ac9e546572aad61862a5 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4a6054647c69e916fb8129bb1c5c3df11d7d1d5a | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b9e41ef16a55d45d24bb5b8e5077380f82a24715 | ORPH
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/52b9a8207988b3e1146f5e9db1ed94f5bb78a098 |     


-- 
http://autobuild.buildroot.net
