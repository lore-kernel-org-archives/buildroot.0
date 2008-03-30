From: Hamish Moffatt <hamish@cloud.net.au>
Date: Mon, 31 Mar 2008 10:39:15 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
In-Reply-To: <87wsnk2wkz.fsf@macbook.be.48ers.dk>
References: <20080329231048.1533A3C48B@busybox.net>
	<87wsnk2wkz.fsf@macbook.be.48ers.dk>
Message-ID: <20080330233915.GA22016@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 30, 2008 at 03:03:08PM +0200, Peter Korsgaard wrote:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2008-03-29 16:10:47 -0700 (Sat, 29 Mar 2008)
>  ulf> New Revision: 21568
> 
>  ulf> Log:
>  ulf> Force use of bash for patching
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/toolchain/patch-kernel.sh
> 
> Please close the bug report (2674) as well.

It would be better to make patch-kernel.sh work with a posix shell (eg
dash) rather than forcing bash.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
