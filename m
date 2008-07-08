From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 10:18:05 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20080708071418.GB23887@cloud.net.au> (Hamish Moffatt's message
	of "Tue\, 8 Jul 2008 17\:14\:18 +1000")
References: <20080707232011.1D0473C608@busybox.net>
	<878wwdvszs.fsf@macbook.be.48ers.dk>
	<20080708071418.GB23887@cloud.net.au>
Message-ID: <87r6a4ssaq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 Hamish> On Tue, Jul 08, 2008 at 07:34:47AM +0200, Peter Korsgaard wrote:
 >> I'm still questioning how general this is. I could imagine other
 >> people wanting a different naming convention (E.G. perhaps something
 >> with the timestamp instead of just a number), and maybe store it
 >> together with the output files (binaries/<project>).

 Hamish> Maybe we need to a -include a Makefile.local which would
 Hamish> allow Ulf and others to customise the make without changing
 Hamish> the master Makefile..

Yes, that might be an idea.

 Hamish> Personally I have some makefile mods in my local tree which
 Hamish> aren't of general interest, but I just merge in the stuff
 Hamish> from the buildroot repository with no major problems.

Me too.

-- 
Bye, Peter Korsgaard
