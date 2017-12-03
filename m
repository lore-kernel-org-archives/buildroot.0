From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 14:27:43 +0100
Subject: [Buildroot] [PATCH 3/8] odroidc2: add post build script.
In-Reply-To: <20171203125619.30919-3-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-3-daggs@gmx.com>
Message-ID: <20171203142743.357b5446@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 14:56:14 +0200, Dagg Stompler wrote:

> +# U-Boot script
> +${MKIMAGE} -C none -A arm -T script -d ${BOOT_CMD} ${BOOT_CMD_H}

This should be done using BR2_TARGET_UBOOT_BOOT_SCRIPT and
BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
