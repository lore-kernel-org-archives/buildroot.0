From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Dec 2017 08:00:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-04
Message-ID: <20171205070032.3907420741@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-04
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 206 |   9 |   1 | 216 |
   2017.08.x |  14 |   0 |   0 |  14 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-erlang-20.0 | 2 
                     avahi-0.7 | 1 
                     axel-2.16 | 1 
        host-xlib_libX11-1.6.5 | 1 
                 mesa3d-17.2.6 | 1 
                    mpv-0.27.0 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                      qt-4.8.7 | 1 
             qt5location-5.9.3 | 1 


Detail of failures
------------------

     powerpc |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/15909e1f7b5b6d68e8478dde1e4e11c4c146c3c4 | ORPH
         arm |                      axel-2.16 | NOK | http://autobuild.buildroot.net/results/7edb3756a07bbac27f852332b81677feb6156a48 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/9a0ee2382c243527a0be914ebfa206973f2bea3b |     
      mipsel |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/94d297c45d211c20302757be1ee3d182c10f73dc |     
        mips |         host-xlib_libX11-1.6.5 | TIM | http://autobuild.buildroot.net/results/1f89e3b822d4e8c563a637fa72a490bf4f40e5e3 |     
     powerpc |                  mesa3d-17.2.6 | NOK | http://autobuild.buildroot.net/results/173107075a3a8a67d5b4c422fdeb910f5da5f324 |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/ce7035757ca934e687aca9b2f040369c9372fbd2 | ORPH
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/598782dc78c770961f1fea185e089fcc4c7cf0e9 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/171c5421e7ee0edc977ae5a3c69c1741b1c975cc | ORPH
         arm |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/bd42c543b1e60ff62089291dc3558c912b69a753 |     


-- 
http://autobuild.buildroot.net
