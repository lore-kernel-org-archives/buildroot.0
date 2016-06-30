From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jun 2016 09:58:00 +0200
Subject: [Buildroot] [PATCH 1/2] package: add Odroid BL bootloader
 binaries
In-Reply-To: <20160627155236.GI424@jack.zhora.eu>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-2-git-send-email-andi@etezian.org>
 <20160626221048.02818b93@free-electrons.com>
 <20160627155236.GI424@jack.zhora.eu>
Message-ID: <20160630095800.7288a44b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Jun 2016 00:52:36 +0900, Andi Shyti wrote:

> It is indeed annoying: I don't like the idea of
> 
>  1. downloading two u-boot
>  2. download u-boot for just two files.
> 
> But, on the other hand, I don't like the hardkernel u-boot
> either. I think it's old, ugly and too hacky; as a buildroot
> user, I would like as much as I can to use mainline software.
> Besides, the cool thing of this board is that it is well
> supported both from the Linux Kernel and u-boot.

OK. Indeed, I can understand the value of using a mainline U-Boot, even
if you have to use the binary blobs for the first stage bootloader.

> How about creating a new repository with just these three files?
> If it sounds good, I will check with the licensing, even though I
> don't thing it will be a problem.

No, we generally don't like to create repositories just for Buildroot.
So please keep your new package, possibly with an explanation in the
Config.in help text as to why it exists (kind of summarizing the
discussion we had).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
