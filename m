From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Dec 2009 19:40:22 +0100
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
	OS X
In-Reply-To: <4B168E68.1060003@usask.ca> (Nicholas Kinar's message of "Wed, 02
	Dec 2009 09:57:28 -0600")
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
	<873a3ulncz.fsf@macbook.be.48ers.dk> <4B15C71D.8020106@usask.ca>
	<4B168E68.1060003@usask.ca>
Message-ID: <87tyw9te21.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicholas" == Nicholas Kinar <n.kinar@usask.ca> writes:

 Nicholas> In buildroot, how do I set the host system for the configuration of
 Nicholas> gcc?  This is trivial for a command-line compile of gcc, but how would
 Nicholas> I do this within Buildroot, so that the appropriate options are passed
 Nicholas> to ./configure for gcc?

 Nicholas> Perhaps changing this would allow for gcc to more properly compile.

BR2_GNU_BUILD_SUFFIX (Build options->GNU build hostname suffix)

-- 
Bye, Peter Korsgaard
