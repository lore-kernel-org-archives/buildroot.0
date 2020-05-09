From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:01:03 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add support for bundling OpenSBI
 FW_DYNAMIC into U-Boot
In-Reply-To: <20200506100845.4356-1-jagan@amarulasolutions.com>
References: <20200506100845.4356-1-jagan@amarulasolutions.com>
Message-ID: <20200509220103.380c57a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

On Wed,  6 May 2020 15:38:44 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> Some RISC-V platforms (such as SiFive FU540) have a boot process
> where U-Boot encapsulates the FW_DYNAMIC part of the ARM trusted
> firmware. For such platforms, we need to build OpenSBI before U-Boot,
> and pass a OPENSBI variable pointing to OpenSBI bl31.bin to the
> U-Boot build process.
> 
> This commit introduces a BR2_TARGET_UBOOT_NEEDS_OPENSBI_FW_DYNAMIC
> variable to achieve this.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  boot/uboot/Config.in | 15 +++++++++++++++
>  boot/uboot/uboot.mk  |  5 +++++
>  2 files changed, 20 insertions(+)

Since you had comments from Alistair Francis on both patches, I mark
these as Changes Requested in patchwork. Could you please take into
account the feedback from Alistair, and send a new iteration?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
