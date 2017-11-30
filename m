From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 08:00:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-29
Message-ID: <20171130070013.C441020810@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  15 |   0 |   0 |  15 |
      master | 182 |   6 |   1 | 189 |
        next |  36 |   6 |   1 |  43 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 2 
                      qt-4.8.7 | 2 
           host-mono-5.4.0.201 | 1 
make[6]: *** [profile-do--b... | 1 
qtuio-abe4973ff60654aad9df7... | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e3c8e424b6f716a1264cdc708bef197e33760554 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/43299be7790ec45c726c25be9b1574d77edf2a0f |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/c33a97455f9377f35fc49d003c2ff01b034ec3ef |     
         arm | make[6]: *** [profile-do--b... | TIM | http://autobuild.buildroot.net/results/c5f8a62154ef03323f336d1b7b7d094bfc2d8a2a |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c8e6797abb98c723288ff2a560fd5cd793edd9e6 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a1090f15e6a1929da970370c51d841a946c2b2e2 | ORPH
    mips64el | qtuio-abe4973ff60654aad9df7... | NOK | http://autobuild.buildroot.net/results/7a07a41913e7504f2ce20a476be3f30bba368916 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     avahi-0.7 | 3 
               gst1-imx-0.13.0 | 1 
                linphone-3.6.1 | 1 
make[1]: *** wait: No child... | 1 
                   mp4v2-2.0.0 | 1 


Detail of failures
------------------

      xtensa |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/07ecf0171b9962db129cfbff95081a81e7306b29 | ORPH
      x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/077b38109e40c67c2460504cb0763ff8a81d226f | ORPH
         arc |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/91e8728ed86f13ece6d6964583886b04cd251086 | ORPH
         arm |                gst1-imx-0.13.0 | NOK | http://autobuild.buildroot.net/results/f970c782b5bfbcf66ff3ba200b060d3653ff2630 |     
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/e07b0cfb07ad9feef123c9cc357a04a7c2b78858 | ORPH
      x86_64 | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/9908247c352141b327da35bb50e9a94b4c9f12c0 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/a2b946938decddf09f34867ac25955412a374411 |     


-- 
http://autobuild.buildroot.net
