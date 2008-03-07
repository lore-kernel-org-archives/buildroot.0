From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 7 Mar 2008 11:01:04 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
In-Reply-To: <041901c87fe5$b1503080$030514ac@atmel.com>
References: <20080306175611.EB4541201CA@busybox.net>
	<20080306234746.GC26530@cloud.net.au>
	<041901c87fe5$b1503080$030514ac@atmel.com>
Message-ID: <20080307000104.GA28350@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 07, 2008 at 12:56:09AM +0100, Ulf Samuelsson wrote:
> ----- Original Message ----- 
> From: "Hamish Moffatt" <hamish@cloud.net.au>
> To: <buildroot@uclibc.org>
> Sent: Friday, March 07, 2008 12:47 AM
> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/bzip2
> 
> > Why move libbz2 from /lib to /usr/lib?
> 
> 
> I think that this has been the trend for the last year.
> A lot of packages has had this change.

I think some sort of policy document would be useful here. If libbz2 is
in /usr/lib, that means no binaries in /bin or /sbin should use it
really.

Is /usr really irrelevant on a buildroot-sized system anyway? Should we
just put everything in /lib, /bin and /sbin and forget it? (Perhaps even
bin and sbin should merge.)

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
