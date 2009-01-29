From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 29 Jan 2009 23:06:14 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <87bptqq6ga.fsf@macbook.be.48ers.dk>
References: <20090129172116.F10B076D75@busybox.osuosl.org>
	<87bptqq6ga.fsf@macbook.be.48ers.dk>
Message-ID: <1233266774.4147.58.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-29 klockan 20:04 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-29 17:21:16 +0000 (Thu, 29 Jan 2009)
>  ulf> New Revision: 25124
> 
>  ulf> Log:
>  ulf> Remove unneeded ARM architecure patch, just a clone of SAM9260 support
> 
>  ulf> Removed:
>  ulf>    trunk/buildroot/target/device/ARM/
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/target/device/Config.in
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/target/device/Config.in
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/target/device/Config.in	2009-01-29 17:05:12 UTC (rev 25123)
>  ulf> +++ trunk/buildroot/target/device/Config.in	2009-01-29 17:21:16 UTC (rev 25124)
>  ulf> @@ -7,8 +7,6 @@
>  ulf>  source "target/device/AMD/Config.in"
>  ulf>  source "target/device/ARMLTD/Config.in"
>  ulf>  source "target/device/Atmel/Config.in"
>  ulf> -source "target/device/Hitachi/Config.in"
>  ulf> -source "target/device/jp/Config.in"
> 
> Huh? What does those have to do with $SUBJECT?
> 

I aborted the commit on one of those, 
and gotr out of sync, but
I think everything should be Hunky Dory by now.
BR
Ulf Samuelsson
