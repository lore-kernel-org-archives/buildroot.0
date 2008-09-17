From: Flemming Madsen <madsenco@gmail.com>
Date: Wed, 17 Sep 2008 12:55:35 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <1221648506.30276.10.camel@chip.lis.inpg.fr>
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
	<873ak07x9m.fsf@macbook.be.48ers.dk>
	<1221648506.30276.10.camel@chip.lis.inpg.fr>
Message-ID: <97e646690809170355y35ac8777p301dca834270a8b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

How about a debug line in /etc/inittab:

   ::sysinit:/sbin/strace /bin/sh

/Flemming


On Wed, Sep 17, 2008 at 12:48 PM, St?phane Mancini <
stephane.mancini@grenoble-inp.fr> wrote:

> Thanks Peter,
> Yes, you're right the driver works correctly.
>
> The behavior of busybox is very strange :
> the main of appletlib.c sometime stops before doing anything. The prompt
> I've inserted don't appear : they could be not reached or never
> displayed ...
> Is there a way to trace the shell running ?
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080917/19d8ad9d/attachment.htm 
