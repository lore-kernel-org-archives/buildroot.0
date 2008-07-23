From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 23 Jul 2008 23:37:43 +1000
Subject: [Buildroot] [buildroot 0004264]: MTD utils and LZO are out
	of	date (fix this)
In-Reply-To: <21710cfefdd94f2d2cae2f7766684047@bugs.uclibc.org>
References: <21710cfefdd94f2d2cae2f7766684047@bugs.uclibc.org>
Message-ID: <20080723133743.GB27147@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2008 at 02:45:28AM -0700, bugs at busybox.net wrote:
> Summary:                    MTD utils and LZO are out of date (fix this)
> Description: 
> Update MTD utils to be 1.2.0.  This requires an update to lzo-2.03 which
> now uses buildroot autotools
> makefile. 
> MTD-utils 1.2.0 means that there is no longer a need for mtd-utils.git.  

That's true for now, but it may be needed again in the future. So I
would suggest not removing it, if anyone is going to work on this.

> MTD-utils 1.2.0 has a  patch that means if you select no UBI targets then
> it will stop the compilation
> of UBI tools.  This stops older kernels breaking (<2.6.25 i think)
> If you select UBI targets then patch is not applied.

I'm not sure what you mean about UBI targets?

Although I think I worked on mtd-utils most recently, I don't have time
to work on the package again in the next few days at least.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
