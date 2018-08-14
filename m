From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 08:00:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-13
Message-ID: <20180814060013.3890D20802@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  14 |   1 |   0 |  15 |
   2018.05.x |  17 |   0 |   0 |  17 |
      master | 163 |  16 |   1 | 180 |
        next |  50 |  12 |   3 |  65 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  samba4-4.7.6 | 1 


Detail of failures
------------------

         arm |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/b08cb30c030c4670003a5ca0ec05302f010729a2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 8 
           python-numpy-1.13.3 | 2 
               azure-iot-sdk-c | 1 
                    brltty-5.5 | 1 
gst1-interpipe-10dba89eecc2... | 1 
           host-libselinux-2.7 | 1 
          openpowerlink-V2.7.0 | 1 
                      qt-4.8.7 | 1 
           qt5serialbus-5.11.1 | 1 


Detail of failures
------------------

         arc |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/4ca53f6dfb5652b91fe3f0290a7aa1f0798f793b |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/b2d1f93c8b815673c13e966a976852a3916b014b |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8783e803a8ddcbc39551db689e002511da1f65c6 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e596f92114c82ae74e14b406a6dfdee228351980 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5292bc1964380d577a17af0c4c84b8946764a246 |     
 powerpc64le |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/b26dc1cfa2a85a47317019250909c068a9196393 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/171c447420341ba56fcd4690024b16016afcd3aa |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fd22a3e026f8b8695625d8647a81254accdc499a |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9440f57178477138a8bdb990da7761ae56ee98ed |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/49e3bbe7f157ce24efe0fcfbadd5840bfa193a81 |     
      x86_64 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/1f256d70c237846a97694af4008ee988a0b3372c |     
        i686 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/3d3ecf63236bb41abca7d1996619ba697a7cbdb8 |     
        i586 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/d452f66c77b08941da4272d858f511aab1e6f80b |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/7cad2754a1d9243566865993a25208086483eb0a |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/72c63d23812e03f330138b2506392d8200e650bb |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dba957fd9aafbb4f204e687a4325b9882428b03a | ORPH
    mips64el |            qt5serialbus-5.11.1 | NOK | http://autobuild.buildroot.net/results/147809b5f8758af935bee48c0fc83fd86a8509e9 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               azure-iot-sdk-c | 2 
                  boost-1.67.0 | 2 
                libmpeg2-0.5.1 | 2 
              python-pyqt5-5.7 | 2 
                    f2fs-tools | 1 
              glibc-glibc-2.28 | 1 
gst1-interpipe-10dba89eecc2... | 1 
                 midori-0.5.11 | 1 
                    ncmpc-0.30 | 1 
           python-numpy-1.13.3 | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

      x86_64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/52ab4ff3d0410ddd4fef524302cd8b81920d9093 |     
      xtensa |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/ac62ba40356cd286756c39461c6815d7144fec62 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7e990b82c7b9fa2c4d607f6af76f1726ab4a2ddb |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8e6011d23c41c004cdf07dc9f0e411e9a3918f3c |     
    mips64el |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/75256a56088b09adeb602e549af7ecc68057b0c9 |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/a6bef24383ccd6fbb63396db0b682b2f46038607 | ORPH
         arm | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/59a38ceb50d4bf564e93596efd5d3c307d035280 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/a7128c0d4c789ed7e8eb25ed35cdb5b96f8915ab | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/6597743ca04c8d472c3ea68950975099d80ce36c | ORPH
      x86_64 |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/038be1fcc545f90e178a996ca7bb33c6eb69478a | ORPH
        mips |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/a713aa0c68a17685393de8d6f4be2e7c0a3ea80e |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/ba134c8fab296dee36031d7666d5882a520079ec |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/f71c068d0eac3ddd70ab63ccaff093a0191ef5df |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/761ec3a26ed913a0f45a3f3185c74d4adc56646a |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/9e2ce0228075af2bdc2faa3f23d32d9ca8fe6a36 |     


-- 
http://autobuild.buildroot.net
