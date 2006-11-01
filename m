From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 1 Nov 2006 16:05:32 +0000 (UTC)
Subject: [Buildroot] Buildroot for ARM (big endian) and glibc support
References: <4534A1EB.4080208@iis.fhg.de>
	<000201c6f1ef$144287a0$fc5d910a@atmel.com>
Message-ID: <loom.20061101T170333-545@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson <ulf@...> writes:

> You are better of with a distribution which supports glibc from the start like
ptxdist..
> www.pengutronix.com
> 
> Best Regards
> Ulf Samuelsson
> 

I said that uclibc was not supported by PTXdist due to the following:

->>>
From: Robert Schwebel <r.schwebel@...>
Subject: Re: ucblic toolchain build
Newsgroups: gmane.comp.embedded.ptxdist.devel
Date: 2006-07-12 05:41:27 GMT (16 weeks, 10 hours and 13 minutes ago)

On Tue, Jul 11, 2006 at 08:31:04PM +0200, Alessandro Budai wrote:
> I'm trying to build a toolchain with uclibc but I've run into trouble,
> made small changes to rules/crosstool.make but stuck at a certain
> point

Note that uclibc is currently unsupported by PTXdist. We didn't manage
to port that old patches forward to the latest crosstool versions. 
-<<<

Regards,
MikeW
