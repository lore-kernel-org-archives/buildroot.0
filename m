From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 23:53:17 +0100
Subject: [Buildroot] [PATCH] configs/microchip_sam9x60ek: new defconfigs
In-Reply-To: <20201124111934.83357-1-eugen.hristev@microchip.com>
References: <20201124111934.83357-1-eugen.hristev@microchip.com>
Message-ID: <20210102235317.192b1449@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Nov 2020 13:19:34 +0200
Eugen Hristev via buildroot <buildroot@busybox.net> wrote:

> Add the new SAM9X60 Evaluation Kit with linux4sam_2020.04
> components.  Update README file with new defconfigs.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  DEVELOPERS                                    |  1 +
>  board/atmel/readme.txt                        |  2 +
>  board/microchip/sam9x60ek_mmc/genimage.cfg    | 31 ++++++++
>  configs/microchip_sam9x60ek_mmc_defconfig     | 27 +++++++
>  configs/microchip_sam9x60ek_mmc_dev_defconfig | 77 +++++++++++++++++++
>  5 files changed, 138 insertions(+)
>  create mode 100644 board/microchip/sam9x60ek_mmc/genimage.cfg
>  create mode 100644 configs/microchip_sam9x60ek_mmc_defconfig
>  create mode 100644 configs/microchip_sam9x60ek_mmc_dev_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
