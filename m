From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 3 Feb 2009 10:22:00 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/package
In-Reply-To: <87ocxlgxt6.fsf@macbook.be.48ers.dk>
References: <20090202003915.BE2397653E@busybox.osuosl.org>
	<87ocxlgxt6.fsf@macbook.be.48ers.dk>
Message-ID: <20090202232200.GA30540@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 02, 2009 at 07:25:25AM +0100, Peter Korsgaard wrote:
> >>>>> "hamish" == hamish  <hamish@uclibc.org> writes:
> 
>  hamish> Author: hamish
>  hamish> Date: 2009-02-02 00:39:14 +0000 (Mon, 02 Feb 2009)
>  hamish> New Revision: 25212
> 
>  hamish> Log:
>  hamish> Remove empty directory left after dbus/libxml2 cleanup
> 
> Ah yes, thanks - git-svn messes those up and don't show them in my
> local tree.
> 
> I wonder why Ulf added it in the first place.

It previously contained a 0-run-first.mk or something like that that
just defined some variable with libxml2 deps. That stuff would probably
have better been added to whatever included package/*/*.mk.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
