From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 8 Jul 2008 17:14:18 +1000
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <878wwdvszs.fsf@macbook.be.48ers.dk>
References: <20080707232011.1D0473C608@busybox.net>
	<878wwdvszs.fsf@macbook.be.48ers.dk>
Message-ID: <20080708071418.GB23887@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 08, 2008 at 07:34:47AM +0200, Peter Korsgaard wrote:
> I'm still questioning how general this is. I could imagine other
> people wanting a different naming convention (E.G. perhaps something
> with the timestamp instead of just a number), and maybe store it
> together with the output files (binaries/<project>).

Maybe we need to a -include a Makefile.local which would allow Ulf and
others to customise the make without changing the master Makefile..

Personally I have some makefile mods in my local tree which aren't of
general interest, but I just merge in the stuff from the buildroot
repository with no major problems.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
