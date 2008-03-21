From: John Voltz <john.voltz@gmail.com>
Date: Fri, 21 Mar 2008 08:47:13 -0400
Subject: [Buildroot] avr32 patches vs. x86 breakage
In-Reply-To: <20080321121113.GA10632@mx.loc>
References: <1206079232.2562.60.camel@nigel-x60>
	<87k5jw34gp.fsf@macbook.be.48ers.dk> <20080321085200.GB8894@mx.loc>
	<87hcf01m0r.fsf@macbook.be.48ers.dk>
	<87wsnwzakv.fsf@macbook.be.48ers.dk>
	<46a136670803210436s6f464029jb6f48b6319aa765a@mail.gmail.com>
	<20080321121113.GA10632@mx.loc>
Message-ID: <46a136670803210547yaee66b4reecd55d403b69839@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> buildroot is not ment to be a patch-sink.
> The _proper_ thing to do is to add your arch to the upstream packages.
>

This is absolutely true. The reason the gcc patches haven't gone upstream is
because Atmel's legal department hasn't filed the copyright paperwork with
the FSF yet. And obviously we should all be glad that they haven't, because
the breakage would be widespread. I've asked the Atmel developers about the
status of upstream patches and it goes something like this:

gcc (and binutils?), waiting on legal documents for FSF

uClibc, in svn, will appear on 0.9.30 release.

Linux kernel, all upstream (in -mm, I think) except for some peripherals
that are still under testing.


John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/3251f89f/attachment.htm 
