From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 22:08:50 +0100
Subject: [Buildroot] preferred procedure to get new packages included
In-Reply-To: <1232028479.6759.2.camel@sven>
References: <1231932008.6465.7.camel@sven>
	<87zlhuazqj.fsf@macbook.be.48ers.dk>  <1232028479.6759.2.camel@sven>
Message-ID: <1232053730.4757.39.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 15:07 +0100 skrev Sven Neumann:
> Hi,
> 
> On Wed, 2009-01-14 at 12:33 +0100, Peter Korsgaard wrote:
> 
> > I've seen your patch, but haven't had time for a closer review yet.
> > We're trying to stabilize the tree and get a release out by February,
> > so it won't get committed until then.
> 
> That's of course sad as it would like to see these packages included in
> that release if possible. I have now attached an updated patch with some
> cleanups and fixes to the bug report. Perhaps it is useful for anyone.
> 
> https://bugs.busybox.net/show_bug.cgi?id=35

I looked at the patch, and there are still some issues.
"libsoup" has version 2.4.1 but is downloaded
from a version "2.2" subdirectory.

Anything uPnP related should IMO be in the Networking 
part of Config.

I can fix issues like that.

At the moment, glib does not build for me, since 
I built libiconv which will stop glib from building
but I will start from scratch and test again
and try to get glib to build.


BR
Ulf Samuelsson


> 
> 
> Sven
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
