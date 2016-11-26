From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 08:30:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-25
Message-ID: <20161126073005.DBD5620B4F@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-25
================================

      successes : 185
       failures : 31 
       timeouts : 0  
          TOTAL : 216

Classification of failures by reason
====================================

qextserialport-ada321a9ee46... | 4 
                    mpv-0.20.0 | 3 
                     vlc-2.2.4 | 3 
                 libnss-3.27.1 | 2 
                bind-9.11.0-P1 | 1 
          chocolate-doom-2.2.1 | 1 
                    cups-2.1.4 | 1 
                     exim-4.87 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  lcdapi-v0.10 | 1 
libasplib-f7219142e790a329b... | 1 
               libdvbcsa-1.1.0 | 1 
                 opencv-2.4.13 | 1 
                    php-7.0.12 | 1 
                poppler-0.48.0 | 1 
             qt5location-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   taskd-1.1.0 | 1 
               tcpreplay-4.1.1 | 1 
               trousers-0.3.13 | 1 
               wireshark-2.2.2 | 1 
                xfsprogs-4.7.0 | 1 
             xscreensaver-5.32 | 1 


Detail of failures
===================

 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/dc898122a43669ebb0bebe9ed031fc4c3ba37c26
 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/de368a6e69d78f047645afb97cb37b59f1c46460
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/c0ca0e96a3d3e55f2ef0f61a2fdb5810d7c3cc12
 powerpc64le |                      exim-4.87 | NOK | http://autobuild.buildroot.net/results/19039760b802d0d4432a94cea41ec54319157b8f
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/b5e5f25cd31f5613278d39e1e6d8f470caec605f
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/3481d16e35b1213c7b1a2f68600cce350f06f2ee
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/dfd278c8d8919140a679c5ff9e7d48bcd3d2a424
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/bf83ab384d42816226ecacd44214a2857558ef36
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/98e50f209cfdea2f06aaa3ee261343c292c7b656
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/e5eb0a6f82183591e13abab4ed7672a7d79bc513
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5ae511510f344880dc09205495271193c511ad06
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/6bdcaa7b3e8a85674a538935547a841bb157232c
   powerpc64 |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/c62a805ed00296ba1ebde4db1229c9a733b5823b
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/0d053dcefbcf53e9e2f48c7f0b9ba44633115ae4
      xtensa |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/f6c1134dbef240ef833d6b6c2464da2b501f935e
         arm |                 poppler-0.48.0 | NOK | http://autobuild.buildroot.net/results/4f406ccd000350928ad3760071115f41cb65f0d3
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/7f1031c75606fcf058d8aa71e8eb21afbf96c65c
     aarch64 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/254e8553ca99708325715d8354beb0c2ad11b455
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/074d379e4d491dd454726bed666a7e1028333ef7
      mipsel | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/443c3493e8c3fbe6e1fdfdb47f102a14a60f9bdb
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/f94c46b7ca1193b752c3320e264b95f4c42ab673
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/7086698a176efdd53b7c0617e7596b30d11987e6
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/cb5ea871812651025722d42508d4f37702088800
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/c74754a196bb5d3e1ccd442e8c454e73aa7dafbb
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/1e730465c79f50143b0ca2366a3c07ea5e8648b1
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/206e7089df46f3b6a182fdf1063539f2edc17cf9
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8eb48e963fb454481a377acfc953952f805a25e4
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/faf4e305deb1f60f4f8ddbda7ed712b46b7ed69e
         arm |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/3cdac0b79634c7f4dd46bafca40b8718c0db73d6
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/9b6360c9df9d0a8fda37cbce21f20329645372b7
     powerpc |              xscreensaver-5.32 | NOK | http://autobuild.buildroot.net/results/f33fd3953d954fcbaf791c71723e8600c8a4b82d

-- 
http://autobuild.buildroot.net
