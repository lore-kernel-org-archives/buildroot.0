From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Mar 2014 11:46:06 +0200
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.7.
In-Reply-To: <20140331094057.GA28812@pc-eric>
References: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20140329093520.5318ada7@skate> <20140329093208.GA3227@free.fr>
 <20140331094057.GA28812@pc-eric>
Message-ID: <20140331114606.38dd7d5a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Mon, 31 Mar 2014 11:40:57 +0200, Eric Le Bihan wrote:

> BTW, why is it only possible to use an external toolchain for AArch64, and not
> a Buildroot one? I've also noticied that the recently released Linaro 14.03
> still uses Linux headers 3.7...

Because when I added AArch64 support in Buildroot, the support for it
was not yet in mainline gcc/binutils/gdb/glibc. It was still in the
process of being merged.

Now that it has been done, it should be possible to add AArch64 support
in the internal toolchain backend, without too much troubles, hopefully.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
