From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 06 Jan 2009 16:20:37 +0100
Subject: [Buildroot] svn
	commit:	trunk/buildroot/target/u-boot/2009.01-rc1
In-Reply-To: <87iqosqz0z.fsf@macbook.be.48ers.dk>
References: <20090103000456.97D1E769FA@busybox.osuosl.org>
	<87iqosqz0z.fsf@macbook.be.48ers.dk>
Message-ID: <1231255237.32308.111.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2009-01-06 klockan 15:39 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-03 00:04:55 +0000 (Sat, 03 Jan 2009)
>  ulf> New Revision: 24656
> 
>  ulf> Log:
>  ulf> Provide factory default command to u-boot, using Buildroot variables
> 
>  ulf> Added:
>  ulf>    trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch
> 
> Do we really need this? What's the upstream status of it?

I find that this patch reduces maintenance A LOT.
If someone calls in with a problem loading linux,
then you tell them to do "factory"  and then 
everything is SO much easier.

Since it depends heavily on buildroot configuration, 
it makes little sense for this to propagate to upstream.

> 
> I would very much like to limit the number of patches to the minimum
> (E.G. bugfixes, needed hardware support), and this doesn't look like
> either to those.
> 
