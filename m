From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 23:02:04 +0200
Subject: [Buildroot] [PATCH 5/8] configs/aarch64_efi_defconfig: build
 the EDK2 firmware from source
In-Reply-To: <20200719180727.28202-6-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200719180727.28202-6-hi@senzilla.io>
Message-ID: <20200720230204.2d45c284@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Erico in Cc.

On Sun, 19 Jul 2020 18:10:21 +0000
Dick Olsson <hi@senzilla.io> wrote:

> Prior to this patch, you had to manually download a pre-built EDK2 flash device
> image (QEMU_EFI.fd) in order to boot this configuration with QEMU. With this
> patch, the configuration is now building EDK2 from source as a stand-alone
> flash device file.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>

Erico: since you are the maintainer for the aarch64_efi defconfig, it
would be nice to have your review/feedback on this patch.

> +# EDK2 firmware
> +BR2_TARGET_EDK2=y

Which platform is selected then ? The default,
BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
