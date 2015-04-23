From: Chris Lesiak <chris.lesiak@licor.com>
Date: Thu, 23 Apr 2015 09:26:19 -0500
Subject: [Buildroot] [PATCH] Reduce need for
	BR2_HOSTARCH_NEEDS_IA32_COMPILER
In-Reply-To: <20150422234548.2281a752@free-electrons.com>
References: <536cdd7b.ATs+iKVatjmU5yNL%chris.lesiak@licor.com>
 <20150422234548.2281a752@free-electrons.com>
Message-ID: <5539010B.50307@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 04/22/2015 04:45 PM, Thomas Petazzoni wrote:
> <Thomas explains why the patch fails for syslinux>
>
> There is probably a way to adjust the syslinux build process to avoid
> this, but I don't know if it's really worth the effort.
>
> I've marked your patch as "Changes Requested". Do not hesitate to
> repost an updated version that fixes this problem.
>
> Thanks for your contribution,
>
> Thomas

Thank you for reviewing this patch.  I'm sorry for having missed the problem
with syslinux.  I do agree that adjusting the syslinux build process is not
worth the effort because installing the 32-bit libraries on the host is 
easy.

However, if you want, I can repost with only the changes for grub.

-- 
Chris Lesiak
Principal Design Engineer, Software
LI-COR, Inc.
chris.lesiak at licor.com

Any opinions expressed are those of the author and
do not necessarily represent those of his employer.
