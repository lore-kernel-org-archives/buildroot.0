From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Jan 2019 08:01:04 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-23
Message-ID: <20190124070104.5ADF9209B6@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   0 |  26 |
   2018.11.x |  20 |   1 |   0 |  21 |
      master | 157 |  42 |   0 | 199 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 
              swupdate-2018.11 | 1 


Detail of failures
------------------

      x86_64 | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/add7ca2ec545f3e85a56bc0a8d627aaab8a4e8e4 |     
         arm |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/8952e35396bcf2e82c7d057b6753bf826a0273a5 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 


Detail of failures
------------------

   powerpc64 |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/b8fb4cc6e3b1d27189263e6c65920429f07775af |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  iperf-2.0.13 | 14
             libva-utils-2.3.0 | 6 
                  ffmpeg-3.4.5 | 4 
             host-grpc-v1.16.1 | 3 
               curlftpfs-0.9.2 | 2 
zbar-b3b4e32b55f570372fc3af... | 2 
                  daemon-0.6.4 | 1 
        glib-networking-2.58.0 | 1 
                libnice-0.1.14 | 1 
                     lua-5.3.5 | 1 
               musl-legal-info | 1 
                  ntp-4.2.8p12 | 1 
                p11-kit-0.23.2 | 1 
                     pcre-8.42 | 1 
           python-numpy-1.15.1 | 1 
             stress-ng-0.09.47 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/fa43752e94cd733d273e39b51f2d3df5348875d2 |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/ca3e41de849297ab5fca717122e29e80bfef0428 |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/ddf694b9f19f68025a6b6aecb4a9e85b3abe1079 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/9ce579056e7cb676cea0fe3624abae3a8ff65f89 |     
     powerpc |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c2ff643fb7b9dd3fd93b5a85ba46df402e838956 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/d18dbbee6959db2f6226d72135d1fff1c8cf3fe3 |     
         arm |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/34e9859c12c6ec2077ea6934b7bae4e377576bca |     
       sparc |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/411ff5332040750df72e2574736b487218db0475 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e1e9f34f6b4423099f51109fa3ba821c0fce41cb |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/e67f0a706a194264f296f5730e2418601f259c17 |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/31757b89e749a8a9ea3c9cc5452a4b13544a691f |     
      x86_64 |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/14d6601dc5a3f15091237ae801545547d42a80e4 |     
    mips64el |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/ea4bb76a26e67efc41d1a0e5720d399fb7c07b3a |     
     sparc64 |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/3a7afff49c5939179baf20e4da0563f630b8eb7b |     
   powerpc64 |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/c157c9402acc10d9df656bc243906ab24764edf0 |     
    mips64el |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/e861a4d84e20b9f1b02247ff7cc1724821d6a4f8 |     
      mipsel |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/29ebe9febcdddcaf769fa7842336ac3ecb4cf667 |     
    mips64el |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/ce18ee41c0113d119458b1c3a568cc9c42201c99 |     
         arc |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/1acf173d5ca213ccbc64a6d088955d71cf3d09ea |     
      mipsel |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/73a25d9c301301410709a9abd71cf02876b5e387 |     
     sparc64 |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/039a7b76e7d362979cc7c7f28801c6d5da027eac |     
        i686 |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/b48f65d80e0cb3ac7e9eb7f1889753391183d947 |     
         arc |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/81c8c50a6628eaf642c8561875eeb35bf1d70668 |     
         arm |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/f0767b5827df121a3d12b86af301a60b39b82921 |     
      xtensa |                   iperf-2.0.13 | NOK | http://autobuild.buildroot.net/results/b7d83ec4e38ece43514dd28a2098ca29cf84c472 |     
       sparc |                 libnice-0.1.14 | NOK | http://autobuild.buildroot.net/results/5deee1b171d1a3184c1834844f0fb136417b0bcc |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/fd279d147527cc5574b71e98b1e0238f903dd92f |     
        i686 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/10a6fb21ced43f698173208a837626c816423b6f |     
    mips64el |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/81169f7aad7e23e21a8f30578e4a409dbc10e2ff |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/3687d1e0e1b2f6e9cf19795ae0443ab81f5c7784 |     
      x86_64 |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/dc7bab168bf689e6c69b31ed1dee5d4ec6e6951d |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/d72cf9caed7a94003c1af4f030376324bc465432 |     
     riscv32 |                      lua-5.3.5 | NOK | http://autobuild.buildroot.net/results/0828a080f4f032cb84c9031549afa5ea9f679984 |     
         arm |                musl-legal-info | NOK | http://autobuild.buildroot.net/results/8cfa70b906221442c9e6dfd46b64011c987d24bf |     
      x86_64 |                   ntp-4.2.8p12 | NOK | http://autobuild.buildroot.net/results/46a6b5b56c4aba898950bf5e52c3d754c04f5b74 | ORPH
     riscv32 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/864645072341d68eb60dbcd81f76afa3fcefb428 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/0a799b129c0f9978fe5f6ea8f1695eba644e427f | ORPH
     aarch64 |            python-numpy-1.15.1 | NOK | http://autobuild.buildroot.net/results/2e0ca7d5ea319d299cda57ab49b283e2dad36ad4 |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/feda2131dba628a30623a2b5a5ef0520a671a4e2 |     
         arm |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/cb942d3c5f68959d6cbc85535ccff4a275369f91 |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/7f06ff762acef67ca594ccd955491be38118fa60 |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/af3fa3de837ce3eaa293a31fff33977cb3085825 |     


-- 
http://autobuild.buildroot.net
