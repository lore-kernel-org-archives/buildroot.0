From: Ben Widawsky <ben@bwidawsk.net>
Date: Tue, 29 Jul 2014 10:21:10 -0700
Subject: [Buildroot] Clarify the Intel driver related patches in
	patchwork
In-Reply-To: <20140729092214.539f130e@free-electrons.com>
References: <20140729092214.539f130e@free-electrons.com>
Message-ID: <20140729172109.GA1263@bwidawsk.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 29, 2014 at 09:22:14AM +0200, Thomas Petazzoni wrote:
> Ben, Bernd,
> 
> There are quite a few X.org intel driver related patches in patchwork,
> but it is not clear which one both of you agree with, and therefore
> which ones should be applied. Could you give me an update on:
> 
>  http://patchwork.ozlabs.org/patch/373074/ (this patch doesn't have a
>  proper commit log)
> 
>  http://patchwork.ozlabs.org/patch/371342/
> 
>  http://patchwork.ozlabs.org/patch/371343/
> 
>  http://patchwork.ozlabs.org/patch/370975/
> 
> Thanks,
> 
> Thomas

A patch (not in that list) to bump to .913 would solve all problems for
me. It seems like Bernd would be okay with this as well, though he sent
that mail only to me, "So updating buildroot to 2.99.914 is ok for me
now." I presume he meant .913.

Feel free to mark all of mine obsolete, and let's see what Bernd's
response to this is. I'd vote for marking them all obsolete and doing
the .913 bump.

I'd be happy to do the .913 package, but I don't want to step on Bernd's
toes. Just let me know if you want it. It will take a day or two for me
to actually test it.

-- 
Ben Widawsky, Intel Open Source Technology Center
