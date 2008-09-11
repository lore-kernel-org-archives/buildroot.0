From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 11 Sep 2008 13:58:43 +0200
Subject: [Buildroot] [PATCH v2 1/1] openssl: convert	to
 Makefile.autotools.in and bump version to 0.9.8g
In-Reply-To: <1218605958.12416.6.camel@localhost>
References: <1218542611-21908-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<20080813032408.GA1773@cloud.net.au>
	<1218605958.12416.6.camel@localhost>
Message-ID: <20080911135843.2c66d713@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Aug 2008 07:39:18 +0200
Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> wrote:

> On Wed, 2008-08-13 at 13:24 +1000, Hamish Moffatt wrote:
> > On Tue, Aug 12, 2008 at 02:03:31PM +0200, Hans-Christian Egtvedt
> > wrote:
> > > This patch converts building of OpenSSL to use
> > > Makefile.autotools.in and bumps
> > 
> > OpenSSL doesn't use autotools though, so is this a good idea?
> > 

<snipp override of configure rule>

> > Once you've overriden the CONFIGURE stage, is there much benefit
> > left in using Makefile.autotools.in?
> > 
> 
> The Makefile is smaller now, and IMHO easier to read.
> 
> Installation of man pages, info pages and header/development works
> better now.
> 
> I though the autotools was not purely for autotools stuff, but a way
> to make every package simpler to read and install in a more general
> way?
> 

No other comments for using Makefile.autotools.in for not autotools
packages? I still find Makefile.autotools.in much smoother than the old
style package.mk. To generalize packages must be a win-win?

-- 
Best regards,
Hans-Christian Egtvedt
