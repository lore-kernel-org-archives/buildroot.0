From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Sep 2010 16:56:50 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <op.viny90lpsev97k@joachim-lappis>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
	<op.viny90lpsev97k@joachim-lappis>
Message-ID: <20100907165650.7cf10d65@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 07 Sep 2010 15:19:02 +0200
"Joachim Pihl" <joachim.pihl@sensordevelopments.com> wrote:

> >> Trying to build defconfig for ATNGW100 AVR32 card, and having this
> >> problem (after moving to uClibc 0.9.30 to avoid asm/unaligned.h
> >> problem):
> >
> > Ah, so the toolchain didn't build with uClibc 0.9.31 ? Strange, I
> > thought I tested this. Will try to reproduce.
> 
> Nope, it bombed out just like reported in December 2009. I have been  
> fiddling in-between other stuff today, so I may be that I am a bit  
> confused about what I did when for what reason, but the closest I
> have come to making it through a full build is with U-boot 2009.08
> and uClibc 0.9.30. Both were downgraded due to compile errors that I
> found fixes for on this list.

At what step exactly do you get the failure ?

The best is if you could provide a .config file for Buildroot 2010.08
that shows the failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
