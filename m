From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Jun 2018 08:00:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-21
Message-ID: <20180622060009.DB4CC20834@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-21
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   0 |   0 |  11 |
   2018.05.x |  10 |   0 |   0 |  10 |
      master | 104 |  10 |   0 | 114 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-erlang-21.0 | 3 
            qt5base-legal-info | 2 
                    host-rustc | 1 
                 libnss-3.37.3 | 1 
            qt5location-5.11.0 | 1 
              wireshark-2.2.15 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

     powerpc |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/059baeb9a30d112a57ffef84630c21123890c83a |     
      x86_64 |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/1c0daa4bfa7aea49559debb1bf73e53f32e2287a |     
         arm |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/a8e3eb651931702ff8caafa0afb5e63ed728adf6 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/b06de6e153c902f90b9074bf43c9f0f683930e45 |     
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/267e327301af3b36687f99c9149863a621a4798a |     
      mipsel |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/138a55ee373d3bb49b34255015705cce21bfbec2 |     
         arm |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/6e8bc2b2927b752d24e32e2f7a2a855615e66707 |     
         arm |             qt5location-5.11.0 | NOK | http://autobuild.buildroot.net/results/ab5c7200b7fccfba815d703f2e86c454edb36fa2 |     
         arc |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/76c08f5564bc61240bb57eef4f9d40a70cec0a75 | ORPH
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/2e306a16737e67a0011a3efaba9a2c76bdbacb1d |     


-- 
http://autobuild.buildroot.net
