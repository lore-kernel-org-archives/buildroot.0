From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Jan 2014 11:05:05 +0100
Subject: [Buildroot] [PATCH] libpfm4: disable when pthreads barrier
	support in missing
In-Reply-To: <5362ef85438d1b221bae6d02434d54d2a486d973.1388912760.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 5 Jan 2014 11:06:00 +0200")
References: <5362ef85438d1b221bae6d02434d54d2a486d973.1388912760.git.baruch@tkos.co.il>
Message-ID: <87bnzq7nhq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The old linuxthreads pthreads implementation does not support barriers.
 > Disable libpfm4 for arches that don't have either NPTL or new linuxthreads
 > pthreads implementation.

 > Fixes
 > http://autobuild.buildroot.net/results/ea5/ea594807b891cbe1f0eddad7f89d34af160636c4/.

 > Also, add missing comment arches dependency.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
