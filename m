From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 16:35:42 +0200
Subject: [Buildroot] [PATCH] Reduce need for
 BR2_HOSTARCH_NEEDS_IA32_COMPILER
In-Reply-To: <5539010B.50307@licor.com>
References: <536cdd7b.ATs+iKVatjmU5yNL%chris.lesiak@licor.com>
 <20150422234548.2281a752@free-electrons.com>
 <5539010B.50307@licor.com>
Message-ID: <20150423163542.0a0fee71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Thu, 23 Apr 2015 09:26:19 -0500, Chris Lesiak wrote:

> Thank you for reviewing this patch.  I'm sorry for having missed the problem
> with syslinux.  I do agree that adjusting the syslinux build process is not
> worth the effort because installing the 32-bit libraries on the host is 
> easy.

Yes indeed.

> However, if you want, I can repost with only the changes for grub.

Sure!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
