From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 16:27:42 +0200
Subject: [Buildroot] [PATCH 0/5] grub2: add support for arm and aarch64
In-Reply-To: <20160913041548.10290-1-nunes.erico@gmail.com>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
Message-ID: <20160917162742.42f0ff27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 06:15:43 +0200, Erico Nunes wrote:

> Erico Nunes (5):
>   grub2: bump up version
>   grub2-tools: new package
>   grub2: use grub2-tools as a host package
>   grub2: enable support for arm and aarch64 targets
>   grub2: introduce BR2_TARGET_GRUB2_CFG

Thanks for this work. Following all the comments received, I've marked
the patch series as Changes Requested in patchwork. Could you resend an
updated patch series that takes into account the comments?

Also, if you can post somewhere (in the new readme.txt file? or at
least in the commit log) how to test grub2 on ARM/AArch64, it would be
good.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
