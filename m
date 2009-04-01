From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Apr 2009 10:04:26 +0200
Subject: [Buildroot] Qtopia4 build issue
In-Reply-To: <20090401013116.1b9ba88c@surf> (Thomas Petazzoni's message of
	"Wed\, 1 Apr 2009 01\:31\:16 +0200")
References: <20090226122205.390e848a@surf> <20090226162124.2d78cfa4@surf>
	<20090227152717.5cefcd92@surf> <874ox98ijk.fsf@macbook.be.48ers.dk>
	<20090401013116.1b9ba88c@surf>
Message-ID: <87vdpo7qb9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I worked on Qt build issues on Sunday, but didn't had the
 Thomas> time to reach a submitable state before the end of
 Thomas> day. Definitely, on Sunday, quite a few modifications were
 Thomas> needed to get Qtopia4 to build properly (with an external
 Thomas> toolchain, or on a x86). But I suspect that your recent
 Thomas> changes fix at least part of these issues. I'll have a try at
 Thomas> them soonish and I'll let you know.

It first built here for my host (x86_64) (by accident because of the
bug in qtopia4.mk), and after the fixes it now builds for ppc as well,
so hopefully it should work for you as well.

 Thomas> Thanks for the improvements!

You're welcome.

-- 
Bye, Peter Korsgaard
