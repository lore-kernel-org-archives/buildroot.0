From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 12:23:13 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87y6wybnd9.fsf@macbook.be.48ers.dk>
References: <20090125230123.541D376D28@busybox.osuosl.org>
	<87y6wybnd9.fsf@macbook.be.48ers.dk>
Message-ID: <1232968993.2298.63.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 07:19 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-25 23:01:22 +0000 (Sun, 25 Jan 2009)
>  ulf> New Revision: 25026
> 
>  ulf> Log:
>  ulf> Flush configuration cache, needed if config has changed
> 
> It would be good if we could get the system to automatically detect
> this instead of using a manual make target.
> 
> What is the use case for this? If someone changes the toolchain
> config, or is it simply adding/removing packages?


If you build crashes, and you add /delete targets, then
several packages will fail to build because the current
configuration is different from the contents of the cache.

BR
Ulf Samuelsson
