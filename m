From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 16:11:41 +0100
Subject: [Buildroot] busybox login problem on AT91SAM9263
In-Reply-To: <5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
	(Robin ActeSE Stridh's message of "Thu\,
	22 Jan 2009 15\:52\:09 +0100")
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
	<8763k8uacw.fsf@macbook.be.48ers.dk>
	<1232559369.11888.20.camel@elrond.atmel.com>
	<5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
	<877i4no5n7.fsf@macbook.be.48ers.dk>
	<5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
Message-ID: <87zlhjml3m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robin" == Stridh, Robin ActeSE <robin.stridh@acteembedded.se> writes:

Hi,

 Peter> Could you do little binary search between those 2 revisions to
 Peter> close in on the problem commit (E.G. try 24872, if that works
 Peter> then 897, else 847 and so on)?

 Robin> Well, I could do that, but the build time is quite long for a
 Robin> complete buildroot.  I could try with external toolchain, but
 Robin> if the problem comes from uClibc it won't show.

You don't have to trace it completely down to a single commit, but if
you could do it 1 or 2 times it would make it a lot easier to track
down.

 Robin> Has anyone else experienced the problem?

I for one haven't seen it (I'm normally using powerpc though).

-- 
Bye, Peter Korsgaard
