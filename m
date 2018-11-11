From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Nov 2018 21:37:57 +0100
Subject: [Buildroot] [PATCH v2] uboot: add support for bundling ATF BL31
 in ELF format into U-Boot
In-Reply-To: <20181111164532.12185-1-michal.lyszczek@bofc.pl>
References: <20181111164532.12185-1-michal.lyszczek@bofc.pl>
Message-ID: <20181111213757.0823d68e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Nov 2018 17:45:32 +0100, Micha? ?yszczek wrote:
> Rockchip's rk3328 encapsulates the BL31 part of ATP but it needs
> image in ELF format. This is extension to
> 2c4809e6088660dc71de9de8cee0bba312aafbe4
> 
> This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF variable
> to achieve this.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> Tested-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

Another small comment: there is no need to have your own Tested-by.
Indeed, when you send a patch, we expect that you have tested it :-)

Tested-by are useful when other people than the patch author give their
Tested-by.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
