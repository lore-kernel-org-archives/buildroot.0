From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  9 Aug 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-08
Message-ID: <20180809060017.133E2207D4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   1 |   0 |  14 |
   2018.05.x |  15 |   1 |   0 |  16 |
      master | 104 |  25 |   1 | 130 |
        next |  27 |   9 |   1 |  37 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/4d41245001a5be095aa622f5bdb4d2723a10bd4f |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 


Detail of failures
------------------

       nios2 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/8da5680be01083b33c46d4a07201e74703633d6f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 4 
                  samba4-4.8.3 | 4 
            micropython-v1.9.3 | 3 
              python-pyqt5-5.7 | 3 
               azure-iot-sdk-c | 1 
                    brltty-5.5 | 1 
               domoticz-4.9700 | 1 
         host-cryptsetup-2.0.3 | 1 
           host-libselinux-2.7 | 1 
          host-waylandpp-0.2.3 | 1 
                libmpeg2-0.5.1 | 1 
                    ncmpc-0.30 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 
              webkitgtk-2.18.6 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     sparc64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/637f8e4192947dda6e5d5033443cacd5a7f98e69 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a8ce5e69729f9d77516c14311ec004cf60c99cfd |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/bab56f4015db40c2ff0e75bb470337d29f558782 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/6bea81d572236f35614be7a5c8891e59418c3a2d |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/352e10a16760c76360ccf300cf4a28ec56eadd06 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/335c89381fa39cdac054e26129dcb263f860b4f2 |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/f1db36beb4b617acdecc97d94cec74e25046e1fd |     
    mips64el |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/303b9bcdd0c87b0f5948d343ebaecfe3f8c8667b |     
    mips64el |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3452158f5dd1689b16bf31aaad72e1b319f749f6 |     
      xtensa |           host-waylandpp-0.2.3 | NOK | http://autobuild.buildroot.net/results/51afcd6d3c3c4839d8216b7b0dba35c8e38211f4 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/998d3e7dc9b6780bc8a64254fb01737a8683a21e | ORPH
         arm |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/418652054a14d8eed9205378b3d0a6a4b1b6ed87 |     
         arc |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/d02df159a457cf16d5e4dce47c8ca43db0d70945 |     
         arm |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/5056c547428f066b017bf073c8c3fa5e10efd7ca |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/f0dcecea2de0d5b550dd0bd0ceb6e8e2a4aaa336 |     
      x86_64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/67591d2ef60100a6f13321fea341f7cc3592a86f |     
     powerpc |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/7ae353350b67f2091995e2efa39b8c4687b9a7ec |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/c1a45deeca10939942526a7dd3127234e44b4374 |     
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6f5701e85d0ce1d45a35a6fb990ff0dce10ae3e0 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/ced71b23bb86a289c065564405c8fd917471be41 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/9b65d895f73cace88ffb41e846bb493c747c4019 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/e74b5668d1bbdb1b4b02828b80506eb062b87926 |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/d36a3be201a997f12613cbcae1481295135c4e41 |     
      x86_64 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/3f214cbb1fe2dc2c2cbfb630032e13eba81c1b5a |     
    mips64el |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/4683cbc6ced5a7eaa0d4330c744b20187f2c79c6 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/a33828fc5e44f2dd08270d82d3bf734dbeee0daa |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  mender-1.4.0 | 2 
                  boost-1.67.0 | 1 
     docker-engine-v17.05.0-ce | 1 
                    f2fs-tools | 1 
         host-cryptsetup-2.0.3 | 1 
                 host-rauc-0.4 | 1 
                libmpeg2-0.5.1 | 1 
              python-pyqt5-5.7 | 1 
           uboot-tools-2018.07 | 1 


Detail of failures
------------------

        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/dacfef233188868985bd9c072c453c514a27e002 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/12a3ceea8d80d034305f225e1726d113c2d0bc03 |     
     sparc64 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/a8e0fd9a7f0e895c604ff2d78f18ed17ced69ed8 |     
      mipsel |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/08708c0bd1216029a2595aa57d28facdd9f19ccf |     
       nios2 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/fd6b526ec4498870031a174961924be248daecc5 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4f43f4b966bb2156d2bf761a38ae7eed98579c57 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/3ac0d11a69c9a9dd21f41a3fb1a4fa82b1fc2629 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/40618e72d73a42555464c4f2e7fdee396a74cf09 |     
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/998e9cd0d10eb1aaa0ce7efc0d247fa6f1228af0 |     
microblazeel |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/f81916f7063d4c50d5dc1a11f6392a5b781447a0 |     


-- 
http://autobuild.buildroot.net
