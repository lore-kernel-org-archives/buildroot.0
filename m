From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Nov 2008 15:51:03 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <873ahsfzzq.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Sat\, 15 Nov 2008 22\:20\:09 +0100")
References: <20081111183231.E74AC3C989@busybox.net>
	<873ahsfzzq.fsf@macbook.be.48ers.dk>
Message-ID: <87ej15t9ns.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "tpetazzoni" == tpetazzoni  <tpetazzoni@uclibc.org> writes:
 tpetazzoni> Author: tpetazzoni
 tpetazzoni> Date: 2008-11-11 10:32:31 -0800 (Tue, 11 Nov 2008)
 tpetazzoni> New Revision: 24000

 tpetazzoni> Log:
 tpetazzoni> Fix external toolchain build

 tpetazzoni> This new version fixes a problem encountered by hartleys
 tpetazzoni> <hartleys@visionengravers.com> when building the kernel. The problem
 tpetazzoni> was that the -Wl,--rpath-link options were added to LDFLAGS, while
 tpetazzoni> there are options for the C compiler, not the ld linker. Moving them
 tpetazzoni> to CFLAGS seems to fix the issue.

 Peter> But it makes gcc spit out a bunch of warnings, E.G. for busybox:

I'll revert r24000 for now until we find a proper fix as I didn't hear
anything back.

-- 
Bye, Peter Korsgaard
