From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Dec 2017 08:00:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-09
Message-ID: <20171210070005.3A90020850@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-09
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 211 |  14 |   1 | 226 |
   2017.08.x |  19 |   0 |   1 |  20 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mpd-0.20.12 | 3 
                     gpsd-3.16 | 2 
                 mplayer-1.3.0 | 2 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
make[1]: *** Waiting for un... | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                    php-7.1.12 | 1 
                 qt5base-5.9.3 | 1 
               qt5webkit-5.9.1 | 1 
              wireshark-2.2.10 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/375b348cea8aa1a1ebfa56810d46e61e30e55645 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/5729b9cbc68eaec94781514105ce6b1fb1b3d5b6 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6ae69cd0fbcd32f6ebce4258af6863e288057966 | ORPH
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/24492d71ba0a50243245abbadb9ea064a7f2d61c | ORPH
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/ccdce64a995b23f2fd228bb6923c2272a55e3286 |     
        m68k |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/4904f2b7892e36dccddb1fa99ad96e5344626d12 |     
      xtensa |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/13cbb7c872cf42809497b8b780aa4aa58f779825 |     
      xtensa |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/b8adde747a30a505dd164c7e21f6aa3aa7388490 |     
      xtensa |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7c017409d99778823631e37b5ab82bb35a08e30e |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fc7ecdf88741b57d7abcda945f8bc74f68cff288 |     
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/237a57d29e5076c262a2d1dc08729ba4e5c4d707 |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/a181f35413d987b36cbc83af3b871fd2881fd4fd | ORPH
    mips64el |                  qt5base-5.9.3 | NOK | http://autobuild.buildroot.net/results/69c4385b2fd484d16f749b4cde6967f5cabea8b2 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/d8637c760f91eeab03557a5955c2b659d0865cb6 |     
    mips64el |               wireshark-2.2.10 | NOK | http://autobuild.buildroot.net/results/c239be3dd1c4dd75983631fcfc4e1e9b11b030b9 | ORPH

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

make[1]: *** Waiting for un... | 1 


Detail of failures
------------------

microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/3584ac6b69a835c2aa0356a8342db847b4b8a661 |     


-- 
http://autobuild.buildroot.net
