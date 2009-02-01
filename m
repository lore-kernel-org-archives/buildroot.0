From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 01 Feb 2009 11:58:06 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <87zlh6is7q.fsf@macbook.be.48ers.dk>
References: <20090131225336.4E3377621A@busybox.osuosl.org>
	<20090201055814.GA8215@cloud.net.au>
	<87zlh6is7q.fsf@macbook.be.48ers.dk>
Message-ID: <1233485886.5742.4.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-02-01 klockan 07:31 +0100 skrev Peter Korsgaard:
> >>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
> 
>  >> dbus: revert r25194 (Unbreak Peters 'fixes' to dbus for a second time)
>  >> 
>  >> It was a bogus revert.
> 
>  Hamish> Are we having fun yet?
> 
> Yeah, I know it's silly.
> 
> I know it's mainly a social problem, but to me it again shows the need
> from moving from the svn code ghetto approach to git's approach with
> patches to the list and finally pull requests to the maintainer.
> 
> E.G. get the code reviewed BEFORE it gets into the tree, and not
> afterwards.

?As long as you allow a commit to the main tree without
testing by others you will have a problem.

I have proposed to go to git, but that was not of interest
until the uclibc project did so.

I also proposed a method allowing commits which 
does not interfere with the main build, but that was also shot down,
I seem to remember that you claimed that this functionality
can be handled by svn and tags.

BR
Ulf Samuelsson

> 
> But let's discuss this after the release.
> 
