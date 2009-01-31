From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 31 Jan 2009 11:26:12 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <87wscdm3rf.fsf@macbook.be.48ers.dk>
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk>
	<1233309685.6293.17.camel@sven> <1233310475.6293.20.camel@sven>
	<8763jxnldm.fsf@macbook.be.48ers.dk>
	<1233314708.6293.26.camel@sven>
	<87wscdm3rf.fsf@macbook.be.48ers.dk>
Message-ID: <20090131102612.GA6794@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 30, 2009 at 12:28:52PM +0100, Peter Korsgaard wrote:
>>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:
>
> Sven> Hi,
> Sven> On Fri, 2009-01-30 at 11:23 +0100, Peter Korsgaard wrote:
>
> Sven> BR2_GCC_TARGET_ABI="aapcs" seems to be accepted. I will try to compile
> Sven> my tree with this option now and also check if I can build a recent
> Sven> kernel using the compiler that results from this build...
> >> 
> >> Ok, thanks, otherwise I'll take the gcc patch so aapcs-linux works.
>
> Sven> I've successfully built the system, booted it and run some tests. I also
> Sven> verified that I can build 2.6.29-rc3 using the kernel created by this
> Sven> build. Attached is a patch with the change.
>
>Thanks, but I think the correct thing is to use aapcs-linux (E.G. so
>it also works with older toolchains), and patch gcc 4.3.2 to accept
>that (like Bernhard already did).

I think this is/will be fixed in gcc-4.4.0 and 4.3.3
>
>I've checked in that patch already and will fix up the stuff in
>Config.in.arch now.

As already mentioned several times somewhere else, you should synch
(these parts of) your tree against improvements that went into my
tree. This poor guy wouldn't have been bitten by this issue, fwiw.
