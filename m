From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Thu, 08 Dec 2011 18:34:02 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <201112080827.03828.minimod@morethan.org>
References: <4EDE32C3.7020400@neotion.com>
 <87pqfzbaq9.fsf@macbook.be.48ers.dk> <4EE09ED3.5060102@neotion.com>
 <201112080827.03828.minimod@morethan.org>
Message-ID: <4EE0F50A.4070401@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/08/2011 03:27 PM, Michael S. Zick wrote:

> You do not have to put your entire run-time file system in the initramfs,
> only what you need to establish the full run-time file system.
> I.E: Your full run-time file system can remain as a squashfs file.
> You just have to provide the "init" scripting to get it loaded and
> mounted while in the early user space of the initramfs.
> 
> See: EarlyUserSpace in the kernel documentation tree;
> and maybe look at how some "LiveCD" systems handle the setup.

I'll take a look at that, thank you!

-- 
Emmanuel
