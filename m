From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-10
Message-ID: <20180811060010.B732F207AB@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   1 |   0 |  14 |
   2018.05.x |  16 |   3 |   0 |  19 |
      master | 137 |  22 |   0 | 159 |
        next |  25 |   6 |   2 |  33 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  samba4-4.7.6 | 1 


Detail of failures
------------------

    mips64el |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/63daa9e3e94426cc4007e279bd4e531fdc711439 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 
                      qt-4.8.7 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

    mips64el |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/114d534168908cef0e84c8727aaf21e304fef73d |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ae2996a3b1543794b2925c1c1e96e29736f0dce5 | ORPH
         arc |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/8beb0f535bb80e02ab1bc85e089bb67f95a67242 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           host-libselinux-2.7 | 4 
                  boost-1.67.0 | 3 
                    ncmpc-0.30 | 3 
                qt5base-5.11.1 | 3 
              mjpegtools-2.1.0 | 2 
               aircrack-ng-1.3 | 1 
                    brltty-5.5 | 1 
                 host-rauc-0.4 | 1 
            micropython-v1.9.3 | 1 
              python-pyqt5-5.7 | 1 
              wireshark-2.2.16 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/882c75ba2825b3b45dbc8d4a73403106de31d3a4 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8b6d55ddb003741203e898217538a65c29c0c200 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d8d2b89f9412a99065e43fb414403a45f13a0dbe |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/b2517e3f6736798826bacfabacd5050c0955f672 |     
       sparc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/c9b1a8c8ab7a5502e94a260577ad60dc04d427f2 |     
      xtensa |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/0c85a9a3effd541ca03d1d86ec42a8054c434aeb |     
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/50280d31eb4291dd993ab772a4b8af07b5a24293 |     
     powerpc |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/1fa49b8447650d1ec4580213fe183a7537302bbf |     
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/d5ce6f38433759e2324fa89e6decb19af9e3ee8a |     
        i686 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/eabfa15e1d7f84e2b7a9540f0b639b900942848c |     
     aarch64 |             micropython-v1.9.3 | NOK | http://autobuild.buildroot.net/results/fd1cc5f2bcb7b6110a93a00dddeb96e19fa7489f |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/f92da0a4e5d07f0887ebee087eaa551735fb19aa |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/8882f441e44bc5808e2ef91cde8a54fb8e776649 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/cb708ecfaa9444c480071dfc174510fe06b7a5a9 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/952e9a5c51d439481b014a4bfcde41cfa35bff6e |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/c8e94b94dc6455d8dc38e08733b63173d1bf8baf |     
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/19718603e70ea4fd7ffbfe4110dfb6704f5f2ded |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/b53ff039a13f5a340c852bbde61ed971f98160da |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/be91a83d6458c8a77c2bcb293e319d03dc4406b8 |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/052ce15b6892e218a3b7878e279a8b66671282b6 |     
      mipsel |               wireshark-2.2.16 | NOK | http://autobuild.buildroot.net/results/cb36b07407f4b12df14a2800db098810217290c0 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1960ea5b8b3a393d993a647fc498abdbe811c821 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 3 
               azure-iot-sdk-c | 1 
              glibc-glibc-2.28 | 1 
         host-cryptsetup-2.0.3 | 1 
                linux-firmware | 1 
            micropython-v1.9.4 | 1 


Detail of failures
------------------

     sparc64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/8333fdf5972757e0e3b8370aee59d28f14546cdb |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/d3dfad8b666273a97c11aa7f6fab0cdbd1b2cb96 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7c4229ca8e2edda580bb9ceed9466bf23b61dabc |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ad38c4640969a3617d64700c123baca355037757 |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/414c0f859ea69a3689c73daed4e2b4f3a936dd32 | ORPH
        m68k |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/bb169559adfc0f9966a3378781222700ed59b278 |     
      xtensa |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/d103b662c009e284afe8afcf10e06d434cd236c6 |     
         sh4 |             micropython-v1.9.4 | NOK | http://autobuild.buildroot.net/results/79d14b71a3a66434bf004f32a215b7e62a167c85 |     


-- 
http://autobuild.buildroot.net
