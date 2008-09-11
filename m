From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 11 Sep 2008 23:06:30 +1000
Subject: [Buildroot] [PATCH v2 1/1] openssl: convert
	to	Makefile.autotools.in and bump version to 0.9.8g
In-Reply-To: <20080911135843.2c66d713@atmel.com>
References: <1218542611-21908-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<20080813032408.GA1773@cloud.net.au>
	<1218605958.12416.6.camel@localhost>
	<20080911135843.2c66d713@atmel.com>
Message-ID: <20080911130630.GA29167@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 11, 2008 at 01:58:43PM +0200, Hans-Christian Egtvedt wrote:
> On Wed, 13 Aug 2008 07:39:18 +0200
> Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:
> > I though the autotools was not purely for autotools stuff, but a way
> > to make every package simpler to read and install in a more general
> > way?
> 
> No other comments for using Makefile.autotools.in for not autotools
> packages? I still find Makefile.autotools.in much smoother than the old
> style package.mk. To generalize packages must be a win-win?

I guess if it works then it's ok to use it for now. If it breaks in the
future we can fix it then. I suppose the OpenSSL developers have
deliberately chosen to mimic the autoconf configure interface given how
well known it is, so it fits Makefile.autotools.in too.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
