From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 22:46:43 +0200
Subject: [Buildroot] [PATCH v3 2/5] arm-trusted-firmware: generate
 atf-uboot.ub image of bl31.bin
In-Reply-To: <1525364617-23633-3-git-send-email-luca@lucaceresoli.net>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180528224643.02da5bd4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 18:23:34 +0200, Luca Ceresoli wrote:
> U-Boot SPL for the Xilinx ZynqMP SoCs needs ATF in this format to load
> it.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v2 -> v3 (Thomas):
>  - Make the option not ZynqMP-specific
>  - Simplify the grep+sed expression to extract the entry point address
>  - Rather than hooks, just use directly BUILD_CMDS and INSTALL_IMAGES_CMDS
>  - Use $(INSTALL), not install

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
