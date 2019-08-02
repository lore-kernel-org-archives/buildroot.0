From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:46:48 +0200
Subject: [Buildroot] [PATCH V7] configs/qemu_cskyXXX_virt: new defconfig
In-Reply-To: <1560438870-25124-1-git-send-email-guoren@kernel.org>
References: <1560438870-25124-1-git-send-email-guoren@kernel.org>
Message-ID: <20190802234648.3adfa316@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jun 2019 23:14:30 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add C-SKY defconfig for QEMU virt machine.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y

I dropped these lines from each of the defconfigs, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
