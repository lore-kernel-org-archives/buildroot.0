From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:25:37 +0200
Subject: [Buildroot] [PATCH 1/1] qemu_arm_vexpress: Linux kernel update
 to 4.16.7
In-Reply-To: <20180506200344.7991-1-Florian.LaRoche@googlemail.com>
References: <20180506200344.7991-1-Florian.LaRoche@googlemail.com>
Message-ID: <20180508152537.26db0dd9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 May 2018 22:03:44 +0200, Florian La Roche wrote:
> Update qemu_arm_vexpress target to Linux kernel 4.16.7.
> 
> 
> Signed-off-by: Florian La Roche <Florian.LaRoche@googlemail.com>
> ---
>  configs/qemu_arm_vexpress_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Are you interested by Qemu defconfigs in general ? They used to be
maintained by Gustavo Zacarias, but now that Gustavo is no longer
active, we lack a maintainer for those defconfigs.

It would be nice to have someone who regularly updates those
defconfigs, checking along the way that they work fine under Qemu.

Would you be interested in doing this ? It would be very useful for the
Buildroot project.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
