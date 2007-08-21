From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 21:10:46 +0200
Subject: [Buildroot] recently added lot of .PHONY targets in
	package/*/*.mk
In-Reply-To: <20070821184136.GC19089@aon.at>
References: <20070814061610.2E279A6811@busybox.net>
	<20070821184136.GC19089@aon.at>
Message-ID: <1187723446.6145.24.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-08-21 klockan 20:41 +0200 skrev Bernhard Fischer:
> On Mon, Aug 13, 2007 at 11:16:10PM -0700, ulf at uclibc.org wrote:
> >Author: ulf
> >Date: 2007-08-13 23:16:08 -0700 (Mon, 13 Aug 2007)
> >New Revision: 19497
> >
> >Log:
> >Change udev target from udev to udevd. Add .PHONY targets. Rearrange targets
> 
> What's the deal with all those phony targets? Please explain

Should not all targets like "*-clean", "*-dirclean" etc. be declared 
PHONY?


-- 
Best Regards,
Ulf Samuelsson
