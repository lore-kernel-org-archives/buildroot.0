From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Oct 2012 12:29:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-09
In-Reply-To: <878vbeabds.fsf@macbook.be.48ers.dk>
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
 <878vbeabds.fsf@macbook.be.48ers.dk>
Message-ID: <20121010122914.0685ae62@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, 10 Oct 2012 12:07:27 +0200, Peter Korsgaard wrote:

> The problem here is that alioth uses a debian (spi-inc.org) signed ssl
> certificate. The wget version on my Debian machine doesn't complain as
> that CA is known, but non-Debian machines do.
> 
> We could either:
> - 1: Change download URL to http://
> - 2: Hardcode --no-check-certificate wget argument
> - 3: Do nothing, as sources.buildroot.net now has a copy
> 
> I would prefer option 1. Anybody disagrees?

We do all of our downloads using http://, so I think it makes sense to
do it as well for this package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
