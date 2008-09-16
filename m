From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2008 22:42:30 +0200
Subject: [Buildroot] Missing binaries
In-Reply-To: <1221137619.9222.1.camel@tim-desktop> (maleadt@gmail.com's
	message of "Thu\, 11 Sep 2008 14\:53\:39 +0200")
References: <1221137619.9222.1.camel@tim-desktop>
Message-ID: <8763ov6cw9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "MALEADt" == MALEADt  <maleadt@gmail.com> writes:

 MALEADt> Hi,
 MALEADt> I have been working with buildroot lately, and every time I created a
 MALEADt> toolchain, several binaries seemed to be missing. These binaries
 MALEADt> included: tar, xargs, sed, mount & umount.

 MALEADt> As it seems, these binaries all get properly compiled, but just not
 MALEADt> included in the final filesystem. I only needed to copy them from the
 MALEADt> somewhere in the build_xxx folder, to the toolchain.

 MALEADt> Is this a problem of mine, or is anybody else experiencing
 MALEADt> this problem?

I cannot seem to reproduce this - Are you by any chance using Ubuntu
and/or using dash as shell? Maybe it has issues with the shell tests
(E.G. findutils.mk:58)

-- 
Bye, Peter Korsgaard
