From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 17:44:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-17
In-Reply-To: <20180318070012.9EC0A2071E@mail.bootlin.com> (Thomas Petazzoni's
 message of "Sun, 18 Mar 2018 08:00:12 +0100 (CET)")
References: <20180318070012.9EC0A2071E@mail.bootlin.com>
Message-ID: <87a7v5fi46.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > Build statistics for 2018-03-17
 > ===============================

 >       branch |  OK | NOK | TIM | TOT |
 >    2018.02.x |  27 |   6 |   0 |  33 |
 >       master | 195 |  54 |   0 | 249 |

 > Results for branch '2018.02.x'
 > ==============================

 > Classification of failures by reason
 > ------------------------------------

 >               sdl_mixer-1.2.12 | 2 
 >                   cc-tool-0.26 | 1 
 >                 libcoap-v4.1.2 | 1 
 >                 libshout-2.4.1 | 1 
 >                  mplayer-1.3.0 | 1 


 > Detail of failures
 > ------------------

 >         m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c1eb516de33cb0a37ecf19f4825bd8b6b34073f0 |     
 > microblazeel |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/905f122213ad9623ea5dd9d32c352efd151319f3 |     
 >          arm |                 libshout-2.4.1 | NOK | http://autobuild.buildroot.net/results/de30f2f77f1b7f138a02c082f9fe4d6024bfd491 |     
 >         i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6362535455d02c8aeee137981c7294631cd97179 |     
 >  powerpc64le |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/905808b5175c58683f8613ad9c3d1c571984e3eb | ORPH
 >         m68k |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/4ff7a0c1c8a5d9ce09c41f55dd0120c6d95f8e76 | ORPH

Sorry, the gcc20 failures were caused by the machine running out of disk
space.

-- 
Bye, Peter Korsgaard
