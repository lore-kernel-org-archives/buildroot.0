From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 19:20:32 +0100
Subject: [Buildroot] [PATCH 1/2] configs: qemu_arm_vexpress: enable vfp
In-Reply-To: <1454348735-6337-1-git-send-email-romain.naour@gmail.com>
References: <1454348735-6337-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160201192032.62ccf2fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon,  1 Feb 2016 18:45:34 +0100, Romain Naour wrote:
> In order to be abble to select BR2_ARM_FPU_VFPV3D16, BR2_ARM_ENABLE_VFP
> must be selected first.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  configs/qemu_arm_vexpress_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
