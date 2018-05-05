From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 00:26:48 +0200
Subject: [Buildroot] [PATCH] package/busybox: disable setfattr when attr
 package is enabled
In-Reply-To: <20180505155853.GD14524@scaer> (Yann E. MORIN's message of "Sat, 
 5 May 2018 17:58:53 +0200")
References: <20180504203726.19657-1-yann.morin.1998@free.fr>
 <87tvrmuxvw.fsf@dell.be.48ers.dk> <20180505155853.GD14524@scaer>
Message-ID: <878t8xvivr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> It would be nicer to instead fix the attr build system. I took a quick
 >> look, and the problem seems to be that installation is done with their
 >> own install-sh script which uses cp (and no --remove-destination).
 >> 
 >> I *THINK* a fix would just be to change the 'INSTALL =' line in
 >> include/buildmacros to use normal install instead of this install-sh
 >> script.
 >> 
 >> Could you give that a try?

 > I'm first going to bump to the latest version, 2.4.48 (from 2.4.47),
 > because 2.4.48 has had a complete overhaul of its buildsystem.

 > If that gets too comples, then I'll try to fix the current attr code.

Ok, thanks!

-- 
Bye, Peter Korsgaard
