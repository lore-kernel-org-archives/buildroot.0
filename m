From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 16:56:05 +0100
Subject: [Buildroot] [PATCH v3] uboot: add support for bundling ATF BL31
 in ELF format into U-Boot
In-Reply-To: <20181111213942.3833-1-michal.lyszczek@bofc.pl>
References: <20181111213942.3833-1-michal.lyszczek@bofc.pl>
Message-ID: <20190206165605.4cc9c43c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micha?,

On Sun, 11 Nov 2018 22:39:42 +0100
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> Rockchip's rk3328 encapsulates the BL31 part of ATP but it needs
> image in ELF format. This is extension to
> 2c4809e6088660dc71de9de8cee0bba312aafbe4
> 
> This commit introduces a BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF variable
> to achieve this.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
> 
> ---
> Changes v2 -> v3:
>   - change 'config' to 'choice' in uboot/Config.in

Applied to master, thanks. Could you please add a new test case in
support/testing/tests/boot/test_atf.py to test this additional
situation ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
