From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Mar 2009 14:11:56 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090324123710.GW27893@whatever.nu>
References: <20090318114711.GA19956@buzzloop.caiaq.de>
	<20090318122515.GB27893@whatever.nu>
	<20090318123004.GE18723@buzzloop.caiaq.de>
	<20090318131349.GD27893@whatever.nu>
	<20090318132530.GF18723@buzzloop.caiaq.de>
	<20090318142514.GE27893@whatever.nu>
	<20090318144657.GC19956@buzzloop.caiaq.de>
	<20090318155323.GG27893@whatever.nu>
	<20090319083953.GE30293@buzzloop.caiaq.de>
	<20090324123710.GW27893@whatever.nu>
Message-ID: <20090324131156.GA22599@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 24, 2009 at 01:37:10PM +0100, Per-Henrik Lundblom wrote:
> > I attached my config - if that works, you can diff it against your local
> > one to find the root cause.
> 
> Thanks for that one! Of course I found some small discrepances between
> your config and mine. I merged the two configs and everything built OK.

Fine :)

> Unfortunately my board don't wan't to boot the resulting kernel. It
> unpacks OK, then I don't get any more output on the console and the
> system doesn't come up. Guess I have to leave the EABI for now even
> though I really want to have it working.

So you don't see the kernel booting at all? That sounds like a problem
unrelated to OABI/EABI issues. I suggest you ask at the ARM Linux kernel
mailing list.

Daniel
