From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  2 Jun 2018 08:00:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-01
Message-ID: <20180602060024.3FC7C2073C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   1 |   0 |  14 |
      master | 165 |   2 |   0 | 167 |
        next |  29 |  10 |   2 |  41 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 


Detail of failures
------------------

         arc |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/e7f300ee8df330f7f1b7797c5a6e2fb57ec82c50 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           uboot-tools-2018.03 | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/46ca42c9964329b80c1b5e359ec3ec2f8bea939b |     
       nios2 |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/d8cc21a50085e6ece35ad33a351a63d7e6a444c7 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 3 
host-imx-mkimage-rel_imx_4.... | 2 
                  autofs-5.1.4 | 1 
                  flare-engine | 1 
                    gst-ffmpeg | 1 
          host-faketime-v0.9.6 | 1 
                 host-rauc-0.4 | 1 
               log4cplus-2.0.0 | 1 
                  samba4-4.8.1 | 1 


Detail of failures
------------------

    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/fee727c3d3417d2cb292c24d5953c8cecba034ea |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/04c6b05828254f1395a5b58ec45d1afb306feb23 |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/2463d76af144bfda7fdbe60dc188df67bda317fb |     
     sparc64 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/2a85cf24fed3e4429e73e4432979749f8b3785d1 | ORPH
microblazeel | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/41f91a20ec731a701a47bd1f4282a5eb1d1db996 |     
         arc | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/3d52269892d08c2dee60030f57b7263a7a140119 |     
     sparc64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/15acd34e9a3928958d6d8933ded46afd59d7d52a |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/9fac910ed83e0784483e647699f55396dfb92a5a |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/abaf773c10391cbf0b8c68828ab8a5e13be8e640 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/83f4e59325ad3aaffed72600020e23f5980603fd |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/310553869e69546fc7ff02522be31307b4e681ef |     
         arc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/7d3137e1e0611348ce67a434c21a4c5c798db269 |     


-- 
http://autobuild.buildroot.net
