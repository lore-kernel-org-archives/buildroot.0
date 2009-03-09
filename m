From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 09 Mar 2009 21:09:34 +0100
Subject: [Buildroot] Question about Buildroot concepts and strategies
In-Reply-To: <49B17D64.50707@hq.tensilica.com> (Maxim Grigoriev's message of
	"Fri\, 06 Mar 2009 11\:45\:40 -0800")
References: <49B17D64.50707@hq.tensilica.com>
Message-ID: <87ocwabgqp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Grigoriev <maxim@tensilica.com> writes:

 Maxim> Hello Peter and BUILDROOT maintainers,
 Maxim> I understand you are busy individuals, and I'm sorry
 Maxim> for bothering you. An excuse could be I'm trying to
 Maxim> understand what BUILDROOT project is all about. Is it
 Maxim> similar to other open source projects or somewhat different ?

It's similar to the other source based embedded rootfs projects
(Openembedded, ptxdist, openwrt, ..). We do have a bit more focus on
busybox/uclibc than the others because of our tighter connection to
those projects.

 Maxim> Are BUILDROOT maintainers interested in adding new
 Maxim> architectures to the project ?

Yes, if someone is willing to keep it working.

Thanks for adding the bug report, I will get around to looking at it
soonish.

-- 
Bye, Peter Korsgaard
