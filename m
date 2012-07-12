From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 00:11:38 +0200
Subject: [Buildroot] qt question
In-Reply-To: <CALo-6+iNSrRe3um7v5ym6SBwtQtDDrkS2pAbDastOuBdWBbz2w@mail.gmail.com>
References: <CALo-6+iopeMOhiWNnYFa8SVA-EsUj2A7BN3=pFZX+D2StVrKfg@mail.gmail.com>
 <20120711214037.5a2d24fe@jl-desk-LL>
 <CALo-6+iNSrRe3um7v5ym6SBwtQtDDrkS2pAbDastOuBdWBbz2w@mail.gmail.com>
Message-ID: <20120713001138.5680f85c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 13:33:16 -0700,
Charles Krinke <charles.krinke@gmail.com> a ?crit :

> Well, I had build a complete root file system for this new arm (TI
> AM3517) and booted from it. Then, I got tricky and clicked the button
> for "Qt" and things went downhill from there. So, I guess I am
> searching for where in the buildroot scripts things went awry. I
> believe that since the rest of a modest root file system built, that
> CXX was defined, but maybe not.

Maybe you have enabled C++ support in the toolchain without doing a
complete "make clean && make" cycle.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
