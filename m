From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 16 Jan 2009 10:37:36 +0100
Subject: [Buildroot] preferred procedure to get new packages included
In-Reply-To: <1232053730.4757.39.camel@aeglos.sweden.atmel.com>
References: <1231932008.6465.7.camel@sven>
	<87zlhuazqj.fsf@macbook.be.48ers.dk>  <1232028479.6759.2.camel@sven>
	<1232053730.4757.39.camel@aeglos.sweden.atmel.com>
Message-ID: <1232098656.6639.6.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-01-15 at 22:08 +0100, Ulf Samuelsson wrote:

> > https://bugs.busybox.net/show_bug.cgi?id=35
> 
> I looked at the patch, and there are still some issues.
> "libsoup" has version 2.4.1 but is downloaded
> from a version "2.2" subdirectory.

You are right, that should be changed to
http://ftp.gnome.org/pub/gnome/sources/libsoup/2.4/

> Anything uPnP related should IMO be in the Networking 
> part of Config.

OK, I wasn't certain where I should put it. I will attach a patch later
that addresses this.


Sven
