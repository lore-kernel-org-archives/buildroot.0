From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Aug 2015 10:17:31 +0200
Subject: [Buildroot] [PATCH] fs: cpio: uImage depends on U-Boot
In-Reply-To: <55C9A3A2.5040300@green-communications.fr>
References: <1439237106-18033-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <55C9A3A2.5040300@green-communications.fr>
Message-ID: <20150811101731.150c1b7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Tue, 11 Aug 2015 09:26:26 +0200, Nicolas Cavallari wrote:
> On 10/08/2015 22:05, Vivien Didelot wrote:
> > Even though some bootloaders such as Barebox can boot uImage, this
> > format is quite U-Boot specific. So make BR2_TARGET_ROOTFS_CPIO_UIMAGE
> > depends on BR2_TARGET_UBOOT.
> 
> What if you already have a U-Boot binary compiled by your board vendor ?

Agreed. Even if uImage is indeed mainly U-Boot specific, I agree that
you may not be building U-Boot with Buildroot, or it might be used in
other contexts.

I'll mark Vivien's patch as Rejected in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
