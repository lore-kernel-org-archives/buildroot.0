From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 09:27:41 +0100
Subject: [Buildroot] [PATCH 1/5] Makefile: add media image generation
In-Reply-To: <20150319000445.GD4578@free.fr>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1426632719-4807-2-git-send-email-vivien.didelot@savoirfairelinux.com>
 <20150319000445.GD4578@free.fr>
Message-ID: <20150319092741.31bddb93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 19 Mar 2015 01:04:45 +0100, Yann E. MORIN wrote:

> I've had a quick look at the examples you provide in later patches,
> especially the RPi ones. You laways only have a single rootfs partition,
> and there is no setup where you'd have (Rpi for example):
> 
>     /dev/mmcblk0p1  -->  fat       -->  -
>     /dev/mmcblk0p2  -->  squashfs  -->  /
>     /dev/mmcblk0p3  -->  ext4      -->  /usr/

Well, the examples are "defconfig" style examples, so in the spirit of
Buildroot, they should implement the simplest case possible. It's then
up to the user to further refine the configuration to adapt the
filesystem layout to his needs.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
