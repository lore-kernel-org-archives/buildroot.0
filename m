From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Dec 2010 01:36:41 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/martin-packages
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 12 Dec 2010 22:53:46 +0100")
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hbehi412.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a set of patches that merges most of Martin Banky's pending
 Thomas> patches. I've taken Martin patches for input-tools, mii-diag, mrouted,
 Thomas> sysklogd, sysinit, lsof, lvm2, memtester, alsa-utils, netplug and
 Thomas> l2tp. I tested all of them, and fixed various issues.

 Thomas> I also include some other patches to :
 Thomas>  * remove deprecated packages
 Thomas>  * bump mplayer and add many more options to mplayer
 Thomas>  * bump libtheora
 Thomas>  * fix libaio on AVR32

Thanks (both) - Committed with a few fixes.

-- 
Bye, Peter Korsgaard
