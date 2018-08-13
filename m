From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-12
Message-ID: <20180813060016.426352084E@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-12
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   3 |   0 |  27 |
   2018.05.x |  25 |   0 |   0 |  25 |
      master | 164 |  26 |   1 | 191 |
        next |  59 |  18 |   2 |  79 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.3.6 | 1 
                 mplayer-1.3.0 | 1 
                        zip-30 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/f039ce88047123b11a3d797993dfd1ec5d95f38b |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d5e609068958bffa9cf4eaba9d0b116ee8dcafae |     
         arm |                         zip-30 | NOK | http://autobuild.buildroot.net/results/583a6025d4768a9448593b9b97db8e87ea217ee1 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 9 
          openpowerlink-V2.7.0 | 3 
              mjpegtools-2.1.0 | 2 
                    ncmpc-0.30 | 2 
              python-pyqt5-5.7 | 2 
                  zeromq-4.2.5 | 2 
                    brltty-5.5 | 1 
                    f2fs-tools | 1 
           host-libselinux-2.7 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                  mender-1.4.0 | 1 
            micropython-v1.9.3 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/50852d0c12f3dc85a5e0258ef89da04538557483 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ebf97937533862da607127ac140b4033ec323e12 |     
      xtensa |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d00b87e473ba717e8800478fa8127b861ea55618 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/13bd7a71169a13283c1e2ff2530a97fc119fb3b8 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/679ef3664bab2e08841149913607e157e02b7502 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fdb36817a31785948129553d08dc1cc681aec63b |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1f65fbeed8fc1546ac4186e8b5f60dd4292ab460 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/797df56707d45c39f640ea84de24348f22183511 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a05d27f921b693ef421163e34001fcb08f1cc3ee |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8553d920ade80a1e9fb53e45b0f3a61597bebc1c |     
     aarch64 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/517e1c5544f7c7bbf10ef04199c3f7352e91cb87 |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e98789785a03e238e7cdca0ad07526d70fcfa30b |     
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/3211c3c362a965229ac77dd0d97d5b9274a70d5a | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/9a565c4c4cfd3684fae42fa4656f420c6c69dfef |     
         arm |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/2cd30e831be83d36272dc2795ff769e5c9fbf470 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/5288601a188558cef63698a1e977a9b9f6ce5ab4 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/41df102743f988d6a75d8089dd99b3d5c94f7fb8 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/7d18f6d8db8e01e8e3f58a9cd1cbb8e465637722 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/24fcb122c56df3693e0a86f54b3c5d89626d1376 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/f36c5d4678bb5dd3c589c1c5da6412469775e21a |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/baf124d18bda21864c9c666fcd530447c22ac638 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/1ba6242a1f542859cdde4ac313809d9544e64171 |     
      x86_64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/77eb5f012da31bbb94d225bd99b77fe6f8b7f031 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/9a02bd7621420afb5509df37d78c26b9e14ce50b |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a43fed89a8b7a7059643ea62662a625c38b4d68f | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/46e0f657c95cc81a916d4882cfbdf8bec477b10a |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2bfdf6a92d978a780abfaac0ec30fac4cf4af1e2 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 5 
           host-libselinux-2.7 | 3 
                    ncmpc-0.30 | 3 
               azure-iot-sdk-c | 1 
               domoticz-4.9700 | 1 
              glibc-glibc-2.28 | 1 
         host-cryptsetup-2.0.3 | 1 
                host-libsodium | 1 
                 host-rauc-0.4 | 1 
          openpowerlink-V2.7.0 | 1 
                  samba4-4.8.3 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

      mipsel |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/117e5e658292477c82b385d88053c98916c480e5 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5652bd645c2d2d837fbcb19937f4a40771545edf |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a98d502b7a6427c6dab468df190cc47a968daedd |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0cdbb22995fcea96ea18b5978939f27807260acb |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/54143c9f24424867e2fd9d1f596b476a14a07255 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/95165e2c5db15f77964ccd1f56bff0c2dbd1186f |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/0874d311f129414fae235cfeaaa8763e60a6b48d |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/a2a619dee9ed3690f25e9a60e7f035cad2d5d318 | ORPH
    mips64el |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/a5eb82991de5fa820212eb9489bd359ef949624b |     
       sparc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d28c0673eab56f8e37ae8021f5c09f6ab6fea3be |     
microblazeel |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/01388d2cf38b599c60604763e3ac37769db58b94 |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/233888b32704aa14a5172c7fc9c908ff0468f5b1 |     
     sparc64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/7c4bae40d9bc70e5c60beb1a399f3de0b767158e |     
    mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/e81f0b77b6a155f4e639cb66e6b52900a2a4e411 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/4156ef7090119d300adf37087b6b80fc05b14de9 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/db0d0b6c483994765de864a14f99795feccdb01a |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/43057cbe2b924c793f626706b9122b71655c506e |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/98a667e13399fc7d85b4db3c1834e48615f637ee |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/342ba7a4f1155cb0b3b62f05b59c92b011cfddfa |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/42ec654cfc0414faa9e88f828c26c67e59b5eebc |     


-- 
http://autobuild.buildroot.net
