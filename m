From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Nov 2017 08:00:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-09
Message-ID: <20171110070005.AD40920DCC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-09
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |   7 |   0 |   0 |   7 |
      master |  88 |  19 |   1 | 108 |
        next |   2 |   0 |   0 |   2 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 4 
host-vboot-utils-bbdd62f9b0... | 3 
                  boost-1.65.1 | 1 
                  ffmpeg-3.3.5 | 1 
             freerdp-2.0.0-rc0 | 1 
       host-erlang-rebar-2.6.4 | 1 
host-google-breakpad-7515ab... | 1 
           imagemagick-7.0.7-1 | 1 
               libcap-ng-0.7.8 | 1 
                   mp4v2-2.0.0 | 1 
           oracle-mysql-5.1.73 | 1 
                python-mad-0.6 | 1 
             python-spidev-3.2 | 1 
qtuio-abe4973ff60654aad9df7... | 1 
               w_scan-20170107 | 1 


Detail of failures
------------------

      mipsel |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/aadda887e2bbe9ab8581efbf1f592d70a51e74d9 |     
         arc |                   ffmpeg-3.3.5 | NOK | http://autobuild.buildroot.net/results/13d4bedbb9d47bc28d2402ed78432972fd76e490 |     
      xtensa |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/8f7ce20dfd5df6e9416b10c6b30662ddc21773a7 |     
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/3b709e8967d077d3ac92f27198f3c3e47fe2a4ec |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/fe8ae40d189102222530327fcffdcc14cf29b5b2 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a2ab722be3010a7ae1f8683ee122d4ea8aab62d0 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/8a9a1863dba9666454a0789804134eb027bbd7e9 |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/92619518b55bbbe2281c5fec6224236ab74e2885 |     
         arm |            imagemagick-7.0.7-1 | NOK | http://autobuild.buildroot.net/results/9074de46947aea2c307370c998c1df8cf746897f | ORPH
         arm |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/2782cd0da261095437b3eb8ec001c3d90641dcc8 | ORPH
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/50953819090a3eb63b25e23630a740b9e275611a |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cb77f21cb85f041e4fcc4c1448684e1b028d9f97 | ORPH
         arm |                 python-mad-0.6 | NOK | http://autobuild.buildroot.net/results/cc4e27e9312ca4ad1fa662fa3d1d1fa1cbf86dc0 |     
    mips64el |              python-spidev-3.2 | NOK | http://autobuild.buildroot.net/results/9add54bd3a3e8321e8b5ac8a07aec46b51d13156 |     
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/25e0bfda8217bed5cf1728d774c0329645f0ae7c | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f0259f1f55dae00ade69effd3684b39f1b0e47f3 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ec3b9252a33781ff3dd740e218352bc01ca231f4 | ORPH
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/573a251cbf1cb15c587e6a3df9d0b3c89090a2f9 | ORPH
        i586 | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/62ebde7686a7300f289ac0d89abdadc734bc78b3 |     
     powerpc |                w_scan-20170107 | NOK | http://autobuild.buildroot.net/results/77a5ce016ab6b7ed798b8fd3c699423b00c494ba |     


-- 
http://autobuild.buildroot.net
