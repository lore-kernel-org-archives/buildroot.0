From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-28
Message-ID: <20171129070009.BC0F72037D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  11 |   0 |   0 |  11 |
      master | 176 |   4 |   0 | 180 |
        next |  43 |   8 |   0 |  51 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               asterisk-14.5.0 | 1 
                   jamvm-2.0.0 | 1 
             lttng-tools-2.9.5 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/2b8c810bd8775413fd4567b2f8495be70b7bb808 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/ed88a03eda6bf40634534578e6e870a25ed66261 | ORPH
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/624f2db9baad4f1d6c41ff74dc6310a4228679f2 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/e09731abe257ee187e20aa0e75beee22004bd3e2 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

dvb-apps-3d43b280298c39a67d... | 2 
                     avahi-0.7 | 1 
                  fwup-v0.15.4 | 1 
             lttng-tools-2.9.5 | 1 
                   mp4v2-2.0.0 | 1 
           oracle-mysql-5.1.73 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
------------------

     aarch64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/8d9e1e6f2ff38666471be74445b2c6dcdfcb20f6 | ORPH
         arc | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/38e89e51fffe5693a12f6338e269faf7d9468081 |     
      xtensa | dvb-apps-3d43b280298c39a67d... | NOK | http://autobuild.buildroot.net/results/e496e4ca3c6062f9e88e4e7ddf271635a2bff71c |     
         arc |                   fwup-v0.15.4 | NOK | http://autobuild.buildroot.net/results/14dc3e9de265923f3dda65164b72fe91b47a0c09 |     
      x86_64 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/8b24616e21f54e6cc73c1c4fecaa49db49ed2aa0 |     
         arc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/6e7c0487d4463d616ce227973eaec30562e71e0d |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/6269f39fa73d2e1f83b20b4e3cfdca106ee22a27 | ORPH
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/e03281e1d929745c1799324c6f750c7449719b26 |     


-- 
http://autobuild.buildroot.net
