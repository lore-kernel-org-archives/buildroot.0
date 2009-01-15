From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 15 Jan 2009 21:05:11 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/mrouted
In-Reply-To: <20090115003601.GA21518@cloud.net.au>
References: <20090114220521.1DD0176C8E@busybox.osuosl.org>
	<20090115003601.GA21518@cloud.net.au>
Message-ID: <1232049911.4757.10.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2009-01-15 klockan 11:36 +1100 skrev Hamish Moffatt:
> On Wed, Jan 14, 2009 at 10:05:20PM +0000, ulf at uclibc.org wrote:
> > Author: ulf
> > Date: 2009-01-14 22:05:19 +0000 (Wed, 14 Jan 2009)
> > New Revision: 24842
> > 
> > Log:
> > Add mrouted-unpacked target
> 
> Any reason?
> 
> <pkg>-unpacked targets seem to be provided inconsistently. I guess this
> is not harmful. If it's useful we should standardise it.
> 

The main reason for this, is if you want to create a patch for a package
which includes the current patches.
THen you just make xxx-dirclean and the xxx-unpacked,
copy the source tree and then you can create the patch.
BR
Ulf

> 
> Hamish
