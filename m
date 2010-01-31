From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 31 Jan 2010 15:36:01 -0600
Subject: [Buildroot] BE: Buildroot How-To for QEMU/ARM (Jim Thomas)
In-Reply-To: <hk4kaq$l50$1@ger.gmane.org>
References: <mailman.7759.1264608677.5110.buildroot@busybox.net>
	<411591.91959.qm@web44811.mail.sp1.yahoo.com>
	<hk4kaq$l50$1@ger.gmane.org>
Message-ID: <201001311536.04491.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun January 31 2010, Grant Edwards wrote:
> On 2010-01-31, Jim Thomas <jimthomasembedded@yahoo.com> wrote:
> 
> > I think the Buildroot adoption rate might be higher if there
> > were a documented, streamlined way to build the kernel/RFS and
> > execute it under QEMU, with an end-to-end Buildroot build
> > process triggered by a single 'some_arm_defconfig'.  It might
> > serve as a very useful hardware independent reference
> > platform.
> 
> I think that would be usefull as well.  Building for ARM boards
> and then running on Qemu is how I got up to speed on the
> Buildroot "environment", but it was harder than it could have
> been because the tutorials for buildroot/ARM/Qemu were out of
> date and the default configs for the two platforms I tried were
> broken (wouldn't build).
> 
> Keeping a tutorial up-to-date would take some effort. It might
> be easier if it were in a Wiki format that didn't require
> wrestling with the bug-tracker and the submissions and approval
> of patches.
> 
> If the default configs aren't going to be kept up to date, it
> would be nice if there was something to indicate which
> version(s) of Buildroot they did work with.
> 

depends on Broken
At the appropriate places would do that trick.

But don't ask for that - you'll probably get one of those:
"That requires the purchase of a commercial support contract."
answers since it involves the function of what is actually
produced by the build system, not the build system itself.

Mike
> It would be easy enough to set up an automated test to check
> that all of the default configs build, but checking to see if
> they work is obviously a lot harder.
> 
