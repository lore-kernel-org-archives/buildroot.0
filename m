From: p <pmeloy@shaw.ca>
Date: Sat, 26 Apr 2008 16:02:11 -0700
Subject: [Buildroot] Example .configs?
In-Reply-To: <326f33790804240814n15f862f2s9b3c64937ad04df0@mail.gmail.com>
References: <1209041724.6819.3.camel@rhodan.rho>
	<46a136670804240756y200cf080vacf8d18372177e9a@mail.gmail.com>
	<46a136670804240759o3f60813dx20f5d44ee1f63edf@mail.gmail.com>
	<326f33790804240814n15f862f2s9b3c64937ad04df0@mail.gmail.com>
Message-ID: <1209250931.29663.18.camel@rhodan.rho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-04-24 at 08:14 -0700, Arun Reddy wrote:
> P,
> 
> If you find that you are missing packages and the build aborts, you will be told which package you're missing.

Ok, so no "make clean" needed after a failure? Phew!

I should have been more descriptive about the defconfig part. I don't
mean for the kernel (I have a kernel built already, its just a rootfs
that I need). I meant for selecting packages.

For instance, I want to get a WIMP interface going it would be great if
I could do a make qtopia_defconfig and have that select the packages
required for a rootfs that includes qtopia. As it stands how I just tell
menuconfig to hide the busybox supplied bits then read each item's help
entry to see if it sounds like it is something I need to have. I know
this is more an issue of not knowing linux well enough than anything
else but it would sure be convenient.

On a related note, the help entries really need to be more verbose!
"libwhatsit - provides libwhatsit utilities" makes it rough on us poor
newbies - makes our brains hurt (worse than they already do!)
