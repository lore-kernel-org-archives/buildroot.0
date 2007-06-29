From: Alex Stewart <alex@foogod.com>
Date: Thu, 28 Jun 2007 18:42:06 -0700
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <20070628230131.GJ4096@aon.at>
References: <002a01c7b9be$22a79000$7100a8c0@SDW> <20070628230131.GJ4096@aon.at>
Message-ID: <20070629014206.GL24520@foogod.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Umm, I don't really know anything about Buildroot on ARM or EABI, but reading
through this discussion I did feel compelled to point out one thing I noticed:

On Fri, Jun 29, 2007 at 01:01:31AM +0200, Bernhard Fischer wrote:
> >work for libc, have you tried? (PS: Even if it did, bug #1406 is 
> >probably the better fix, in particular as buildroot users might use its 
> 
> bug #1406 is completely crap. Let me cite:
> <quote>
>  Reporter  	 bjdooks
>  Summary  	 0001403: printf and anything using vfprintf() hangs
>  system

As noted in the "Summary" line, the bug you quoted is 1403, not 1406.
Bug 1406 does appear to have a clear description of the issue and a proposed
patch to fix it, so while I can't comment on the merit of the patch contents,
the bug report itself, at least, does not appear to be "completely crap"..

-alex
