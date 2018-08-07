From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  7 Aug 2018 08:00:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-06
Message-ID: <20180807060014.AD46420799@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   2 |   0 |  14 |
   2018.05.x |  15 |   2 |   0 |  17 |
      master | 132 |  24 |   3 | 159 |
        next |  44 |   8 |   0 |  52 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-guile-2.0.14 | 1 
                 mesa3d-17.3.6 | 1 


Detail of failures
------------------

    mips64el |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/f89f3a7af7b7ac4b3666732048f580dbd123c47b | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/ab70e9dfbce7e9ad6320b9481addc30b2a450e00 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 2 


Detail of failures
------------------

         arm |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/81cde860cae10f21a2412bbf51de1d6a8895cbbd |     
      x86_64 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/a7d8b8f3aa9edef84a7ffb8871f73c6c9ba950e7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 12
               aircrack-ng-1.3 | 2 
                  mender-1.4.0 | 2 
                    ncmpc-0.30 | 2 
           uboot-tools-2018.07 | 2 
               azure-iot-sdk-c | 1 
                    f2fs-tools | 1 
gst1-interpipe-10dba89eecc2... | 1 
                 host-rauc-0.4 | 1 
                linux-firmware | 1 
                qt5base-5.11.1 | 1 
                  samba4-4.8.3 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/b1db7ab13f619444bd0d65e037e8ed58e0295dc8 |     
     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/89db73d7a57909654afd4ae11f0a290fd393de56 |     
microblazeel |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/3723abfad0917fc50f54f9394c1a6c23e96e49e9 |     
 powerpc64le |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/b0b66511c839db08e1b2a0c72846d5b21b5a8e55 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/02da29cb1e8746eaf191bb25229352843a494945 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/313b0a551e64b4c296a04f7404240e0b4c6a73d3 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e240d0ac183d2b403648693af978345a95ec554c |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/777695acdd51927a9e88328f3df3917551760c3e |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d5f0cf270ed731a11d8b6de9f2f39f0ec71a7bd7 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/abaf7ba1ea497d5a812e04cfdb635714c145d2be |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/20ec6ec1355749e43b54fda332c844b346ab493a |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bb7ea88e6304c5aaa313652d4d5fe1fcd57c2e5e |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ca9a8922eaafa0955da1a22d0b0a0e5dfb27d268 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a4a91c722710870488582d67c661ebbfc917195c |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5adf21217422c1de1a857248c62dd444c31a1ddd |     
   powerpc64 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/eba88a52d24899cf936937c22b48777566cf492d |     
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/8346a9f7b340e5fdf7c5e0610d9109df25a69417 |     
     powerpc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/c35d7bb9bb77243cc5dc79668679416ed3d1b3ef |     
       sparc |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/76a924e3e11144d766d93fa4d9a617b644697591 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/841abec44a6837289713848fd287f93dc789ee88 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/be8caa703482a5aa8a5220a0613784e3314d35d5 |     
         arm |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/e8110aaf390fd8c04c19fb1dd338a6d848ac15e9 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/7590754ed3c6cd1a2fe584882fe10bcb72f879fb |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/a3ed98e8a58ae80643e02238e448054663464ec0 |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/31d69190ea74d35db1e114b54a03b23b713fba0d |     
     powerpc |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/ea09b614a3c10d494939d9551c0c3bfca4626ece |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/f8efd9af4d86c51fe4f5afe44db9abf9adc5718f |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 4 
           host-libselinux-2.7 | 1 
                 host-rauc-0.4 | 1 
                libmpeg2-0.5.1 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6e1be7545d29a4670523c29767af3f3eea7a5779 |     
 powerpc64le |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1b41378ae89f7a8c5d7a04ee89cd5e26b58adee1 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/3e71b789008a9432dee9ba8163f62dc705a4d6e9 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4719e103e0699289b467ea01e92a4d3a36087cc6 |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/fca0fccd9385aa697a754feac8ee3419604b1f41 |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/de7e7e60670969d7cb06576a1813afe84e604278 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e9084d16c17bdbc4e6a632b59d52dd889b326b3a | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0d6e15da05585ca58a79c12aa89ddb26968ec2a5 | ORPH


-- 
http://autobuild.buildroot.net
