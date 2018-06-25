From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 08:00:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-24
Message-ID: <20180625060050.BECC320834@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   3 |   0 |  30 |
   2018.05.x |  26 |   0 |   0 |  26 |
      master | 133 |  45 |   0 | 178 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                dos2unix-7.4.0 | 1 
                 mplayer-1.3.0 | 1 
              procps-ng-3.3.15 | 1 


Detail of failures
------------------

         arm |                 dos2unix-7.4.0 | NOK | http://autobuild.buildroot.net/results/a5a64bc3ff5a91a8680ac52f3505362491923b26 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c0a068b0d1bf8a87127dfba06552e8721f7edb72 |     
      x86_64 |               procps-ng-3.3.15 | NOK | http://autobuild.buildroot.net/results/baac54b934d5ac07d3604ae3c6016595e4d7014a | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        host-protobuf-c-v1.3.0 | 14
           host-protobuf-3.6.0 | 4 
                  boost-1.67.0 | 3 
                   libnss-3.38 | 3 
               mono-5.12.0.226 | 3 
               gnuradio-3.7.11 | 2 
                  mender-1.4.0 | 2 
                      x265-2.8 | 2 
                   cmake-3.8.2 | 1 
                   erlang-21.0 | 1 
                    host-rustc | 1 
              mjpegtools-2.1.0 | 1 
                    mosh-1.3.2 | 1 
package/qt5/qt5base/qt5base... | 1 
python-libconfig-b271c3d9da... | 1 
              python-pyqt5-5.7 | 1 
qt-webkit-kiosk-a7720e50f2b... | 1 
            qt5base-legal-info | 1 
                  samba4-4.8.2 | 1 
triggerhappy-b8228880661293... | 1 


Detail of failures
------------------

        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a3dd35cfa50a1862c585a648298351c0aba257db |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a6d7100019b7c6012ffce20e6409d5519f30c76c |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1cd42dd65fac6b8c581197b41f4c620d50d8be8f |     
     powerpc |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/1bb2e62bc27ca8b920e5e330b6fb0832c70a1a8d |     
         arm |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/656ac5d95932dcebdfb14700989ef07313bac7c7 |     
     aarch64 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/ca3b01a13cb0c580266aae5f3673b2c0a19ac6a4 |     
        mips |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/bb746c020545dcd3931278c7cc9bd008ea25b689 |     
         arm |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/4f8f546bd6e0a84f1d2adfdc56939a8e817a9fad |     
    mips64el |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/99365eb93689b1a1b71dbd85ec9a39ab4aab5dac |     
        i586 |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/5db03bb01d39b50a049ab14b024ff31cfc93b54f |     
         arc |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/5c05b072561395e471d01fc6cc00eb4a2eb619e0 |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/bb2ff8f7a57a8cb02661b7392d9bd968f9b24f8f |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/3647417d3a2cb31e7953cbf1ae61693fc1362dff |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/8502d63134958279ce74a90d2be3ff299fe539fc |     
microblazeel |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/04a9c7e563bce2438bdf1d744f0186e25a4f678d |     
     powerpc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/be98a62305fc1482d993fb52a3eb680b573f52e6 |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/71ed8ec3bad4fac7888298d3b7fbc069f55b64c4 |     
        i586 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/7fe12457ccac7e8c95b1d4c1fa20d6753599742d |     
       sparc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/902cc9bb2b734d1baa9c98b9a099ee0d9ca7d9fb |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/42129ded795ed9f005fdddbc1e6241f6db2f59b7 |     
 powerpc64le |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/96f8200a33aa644168190171ca391e0bee0794e0 |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/c4b6a7547afe4d27c5faec98c522ed425ea68bc2 |     
    mips64el |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/4dcfc6ac71949b78bd5bfcc62bd84772be197b7b |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/e53a4377909fa9002e6dac8a4884ba0c9d130f03 |     
       sparc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/87ebbfaaebb50fd93e88f5147aa7ec7d3f2f1d3c |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/3d1c52e66e429f4145ec7210db68ae48578245b2 |     
         arm |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/e7e4ba5633af462e669c1882398c7f6cc23e639c |     
         arm |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/4c9a3c83390e2207d1d198a3f6dc41baa12650fa |     
         arm |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/335bee755fbec45a6d5336c2501dc2687859ec0e |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/d618b936b5cc588bb01820f5cd1cb2ef665b3222 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/bd9a2901e7eb70b6efe2ebbbb5397ad88705462b |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/893305609150b654bb0ccd7f70bca8b4afce6f66 |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/092021151d7a320cc4b3eb1283d6d4cb476590ea |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/23f844c5d09e1460ebecf5ef9706618ac1f8884b |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/4df80663de0f101151ce38a269abe5aad97c279f |     
        mips |                     mosh-1.3.2 | NOK | http://autobuild.buildroot.net/results/5adace7807c1f11c047b584e061aeb7a442ec574 |     
         sh4 | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/c9449473bf992d0626567a32917b1690474e728b |     
         sh4 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/6f973f2945727b302409405288ef0b9808c7317b |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ae93f55a2e3ac466e8cf2eaf7d918e261b46d176 |     
         arm | qt-webkit-kiosk-a7720e50f2b... | NOK | http://autobuild.buildroot.net/results/ae5d28a8036e47b2bafc4a2725079b91b4989aeb |     
         arm |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/c57475f95b94f61559e6154cd7fd5aff58b3b74b |     
    mips64el |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/18f3719b9ab26bf945d88c3d3cd3716e70b6d653 |     
        m68k | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/7da5604cd8e4c9c9b235a7209cc9f665b89e5a59 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/1a29d62b8ccc66fb7d58b84f2e2f370f45154152 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/f664f89d5158350a4bb4a55ff19bcc895b8054ba |     


-- 
http://autobuild.buildroot.net
