From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 11:37:10 +0100
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
References: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
Message-ID: <20121129113710.63d5676c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David Collier,

On Thu, 29 Nov 2012 10:20 +0000 (GMT Standard Time), David Collier
wrote:

> Hi - we have a design based on the AVR32.

Aaah great!

> Historically Atmel provided a "special-buildroot-for-AVR32". Trouble is
> their only AVR32 that ran Linux is now end-of-life, and I'm not sure they
> have any interest.
> 
> The last version of it I can find is based on a buildroot that is 2 years
> out of date.
> 
> So the question is - should I be able to use "standard buildroot" with an
> AVR32 - or was Atmel adding some magic of their own that has not been
> back-ported to the main trunk?

Good to see someone using AVR32. We've been wondering what to do with
our AVR32 support, because not many people have been using it.

Normally, we have a working AVR32 setup, with certainly old versions of
uClibc, binutils and gdb. I was told by AVR32 people that upgrading to
uClibc 0.9.33 should work, but there are a few missing system calls in
the AVR32 upstream kernel. If you are interested, we can look at this
together, as I lack AVR32 hardware to dive into this.

So, I would definitely be interested if you could try out the mainline
Buildroot, and report what the problems are (if any), and we'll see how
to move from here.

Of course, if you are aware of the availability for AVR32 of a more
recent gcc than the 4.2.x we're using and a more recent binutils than
the 2.18 we're using, we're interested as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
