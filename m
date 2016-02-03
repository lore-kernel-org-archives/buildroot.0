From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-02
Message-ID: <20160203073022.6AA38101FCA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-02
===============================

        success : 226
       failures : 106
       timeouts : 1  
          TOTAL : 333

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 14
                  boost-1.60.0 | 10
              gstreamer1-1.6.3 | 9 
                  lshw-B.02.17 | 5 
              libraw1394-2.1.1 | 5 
                      icu-56.1 | 4 
                   qhull-7.2.0 | 4 
iputils-c8ff6feaf0442f8efd9... | 4 
              gst1-libav-1.6.3 | 3 
                      qt-4.8.7 | 3 
freerdp-17834af7bb378f85a3b... | 2 
               pax-utils-1.1.4 | 2 
                 opencv-2.4.10 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                 mesa3d-11.1.1 | 2 
canfestival-7740ac6fdedc23e... | 2 
               libcap-ng-0.7.4 | 2 
                  stunnel-5.29 | 2 
                  prboom-2.5.0 | 1 
             host-nodejs-5.3.0 | 1 
       openpgm-release-5-2-122 | 1 
                rtorrent-0.9.6 | 1 
                    cups-2.1.2 | 1 
                  apitrace-7.0 | 1 
                   mpd-0.19.12 | 1 
             util-linux-2.27.1 | 1 
                  psmisc-22.21 | 1 
                  connman-1.31 | 1 
          sane-backends-1.0.25 | 1 
                   mplayer-1.2 | 1 
                    ruby-2.3.0 | 1 
                     vlc-2.2.1 | 1 
                 lvm2-2.02.138 | 1 
                    sox-14.4.2 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
               openipmi-2.0.21 | 1 
                 igmpproxy-0.1 | 1 
                   slang-2.3.0 | 1 
                 libraw-0.17.1 | 1 
make[6]: *** [libavfilter/a... | 1 
                   hostapd-2.5 | 1 
                     rpm-5.2.0 | 1 
          shairport-sync-2.8.0 | 1 
                       unknown | 1 
                   erlang-17.5 | 1 
         qt5connectivity-5.5.0 | 1 
                    kbd-1.15.5 | 1 
                 rtptools-1.20 | 1 

Detail of failures
===================

      mipsel |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/0b5d8fb959b26e317a6f06ec3a240c244e99c311/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/83eeb6ff558e307934350b16391a565e56b494e2/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/43400e39e10752a17e4eed487bcd15b0f8fbcc47/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f81202fb3be9231e927e90f537cc53ef3e45a001/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3693d95cd7bba744c4dd079447df840166ca83d7/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/108b51c7c89ac8fb3e3615e37528002cffd64518/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3e7686fc062decb740375afd4c24daba24162785/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ddb8615c7acf0a6f3bd8d96430fe9873e5cf3374/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/39b2eb03e3c3dd19ec2c433291c67623620efc40/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/cb0e751f9ed46bc1f4ee81a63127155d6e4fe127/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7bae3fb3618d25156231c30164697d89f66c8bbd/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/9821828a8f59145a686e7281e9226489caf7b7a6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/5a3b7ca5d056a129e5ddc1465d74c7c0850c9d59/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d90497472db048ec1bc3cb8b63f04d8afbb1a644/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/9562e00c834bf79fd3dfcb0e55a849280ef197c2/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/a440b1adb3d1167b2ee0f889bc45039e44123891/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/c9705f3011d813f9bc77fb09326380830a9c9f1d/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/d40bd0000bb801f4fe0674e6ce31333dd0189609/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/7235bc9c02bd17d706e3b4ae1c0bacb5bf27f96a/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/875f829617bd74c7a79068462d0fd26a0ee01656/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/689c177b36e36d342a9ef2568fa47b6fe17612dd/
    mips64el |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/68aa8b49cb22d29cca5308c44bc9d82a6d97fd30/
     powerpc |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/6f8cc5d2a0833a9fa5f823c4848b4719ba89a553/
       nios2 |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/bcbae63c2b04fddc07b3bfeb91e41ad8279cf3ec/
    mips64el |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/d6535038133e7dfccabe3368814b1dad9d9d5ef8/
    mips64el |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/e853fe5c97181ec9e711d4c1951ec91a1bf00e58/
         arm |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/3ae368cfd0ecd7be4c7e864590ec5dbf79d576ac/
    mips64el |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/4c951f31984e0eff21fc165cb68065f527c237e6/
         arm |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/774b2f433946649579d421615415a216b620bfb6/
     powerpc |               gstreamer1-1.6.3 | NOK | http://autobuild.buildroot.net/results/52c695277ad71e02d97cbb4c93b69fbaeff97994/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/7a62c145f06f96ee23e3e7145cb8753e4dd2212e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/bedb8a0b65b1a97f652d02d7c41472a70a62a771/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/eb7092ac14060de51184d16b145c44f030c47766/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/397e833f4dd63be21670bfbd30be4242ec97a028/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/637a397dadb3344b628954cd58654db6f8ac0c25/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/0fa8b830597fd0a99a3c56e5d147d3c5580ee705/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/b8fdfee7f17f93ad892512848082b505e7380c96/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/51b060bbdecdcaac89f764026693bf711e7145d5/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/48e408d936b00ca8a0b80ac0d981cbd623cd06a7/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/0da3c05e6906ab7327250fb55e70037ad3d39f23/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/a8a1b886c19428fd00a68fdf6005816441edac94/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/2eb0eddcbb711d7d10e269a54f7743d585e6b20e/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/6a72c853830542ac317827dd7e85f46102a59836/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/282a7cd6df6bda8c3f52bb0228aeb07654ff607e/
      x86_64 |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/f3004d012c6a6e634c133302d9a3f6235d26ea19/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/c36295234f362af7975188cdc333f347ba5cfdd5/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4e74b1bc1ce45817a3b896014383444d1f4f462e/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/a11f7896bf8506cd3ee8ce9fc7b2f53926bb5e7a/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/3245997e3993bd5d5b787e532a14dbf7913a87f4/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/a1f61c955a12bed5c37b7c25c59f3e77f855341c/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/54e42ab139665e01c815a0df56bab040b0f59205/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/863b375662fff885955e89db834cf85e296dda73/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/d49e926fcf0d718b12cd7f5225049251ef594f32/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/7696452893a87d7e438e24b5660cf388e2c4d90f/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/7a6ad8e7400363f39e4738ee36c71cfbaf1f41ca/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/d2ddd01f6b37e96a1548c31d51f3ad386d825ace/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/912d52c0cb4476da52e8390c4c05e6839be0ca4f/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/932ad0762eaadc1b88979dae392b3a169ea86f3c/
         arm |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/a02da0e5862211d0aad926742ff3600b1f60f50c/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/f54986376c5b7162cda22309b5ec7763489ccd91/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/241284ad45768a81490806b4dc585c1ee2b3fbdb/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/ef8a20e450abc38e1489770ccd6033f2a396027e/
       sparc |                    mpd-0.19.12 | NOK | http://autobuild.buildroot.net/results/422c82c23cb06b94d1f46eb22279c0a693cf4982/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/11c02293da1fdbc530c4c82c361589d81d81e988/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/7571185f76d6b9fc083a7f8969a63797079b2e0e/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/7bb8b5e10315890923659a61c0cce66972446da7/
         arm |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/f21845c5a9be8edfdae2b1a42a53ea25f8c876b2/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/88f623c7e9a4dc9a2b5e8e8ce18ef57c3b9e656c/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/359da3be11a65a18694ce10e33fc8df91186b86b/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/03eb9eea31e02e6371cd2ba9ea01f5955e1213e0/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/c3dde321466c1d453eab8a22a44e7fb8e8fdfde4/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/7f44766728f1c1e0a8ed0a6e75a1b42a3de8b1e8/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/6e198002c288b7ee40b85769ebe6ee6754f94b12/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/3ff88cd81dd7142414d83b1f3fdcd367823f587a/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ad7876ca41cbec50cb43f3dbe4ca1eb90ecafa84/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/74b6761834fff5f8676c451e18c6b3396d4d34fb/
        i686 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b7589bdf91fae0bce8aa3a2a48a6e48179db3a5c/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/eda5284bd03206a0293d1a1bfa6b1294fe3286fc/
        i686 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/196f5bc624253e91fbba84849c094401263e629a/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/4326a5727268689b53205bd2035bb5fe49bbd6cd/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/97b5a6d7c0674eea0f2af264f3df9d4301ae329d/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/91d5a752bee44eb6606921815889ec16d60b6ac2/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/86acdd2cf6ac6c8c5b8350f392fe9097a3c4ac26/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1e6c4ea5b8c59f92fc634792e21e28c2ed12a5a7/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1ad678340da7fb99bbc25a2b5c35402e531727d7/
    mips64el |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/eb31a117d5852657486b7569d5261642a4701eb5/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/4640ff9c8f17e1ee0478cb453c421f0df52d5dba/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/3977d05e75290fc8c1a7dc7da0a210ff569384a9/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/d29b519efdb56df2139824e9e2e2db0475e6520a/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/d8ff345dbd54f97d8a7dc975c8f8357d3f712842/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d59fd88c1680838c0f583d8b7fa40aa9e7b49d72/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5f4e27108fff4625f5fbcb2a01f795cd8d22c6aa/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3a60cc1b4ae211a0154f779b0d89fe3feefca7e7/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/47b5d4455288212131d5566f9e2409a6ec788123/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/0fd7b7408360c0e6189fd678a183041cb9334a8f/
microblazeel |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/7f4c4d9af88a1a271d6d0a80e38b199a3a9ce4bb/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/7704a1be7765f4e16fbc91a02772944e95276a63/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/a99f5114fadf3fa78cbd3d315fa04b6d314dd1f5/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/b4fa614fc5d1ac485c92d70f5b3356a82c1df887/
         arm |           shairport-sync-2.8.0 | NOK | http://autobuild.buildroot.net/results/75afbec6ba4c4b0ae2c18423a0d7eccf098b2eaa/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/4c01345608a3f5d2adcf058847346f87afd8395c/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/c24056477d1a981b4a48832880a5315a82a7a143/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/e0ae03c3f7c89bc741172e3faf3b7704b26e10d5/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/17caf48848f9cb33679ecf7b6e29281a68360e74/
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/1c2beb178056c1f81f7bb9777eb57ed4a4074c7b/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/5dde1d25d30e0c97df353e418782b0c221f43700/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/8d1a576ae93afc593149ea9886b672a05524321a/


-- 
http://autobuild.buildroot.net
