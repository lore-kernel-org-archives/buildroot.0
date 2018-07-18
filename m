From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 15:12:11 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs/imx7d-sdb: Add new defconfig
In-Reply-To: <CAOMZO5A_feHYFg4Y83bzDv4k-XF8xYoao9AvxFXY-Czj00RWeA@mail.gmail.com>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
 <1531084579-7949-2-git-send-email-festevam@gmail.com>
 <20180718120128.2454a930@windsurf>
 <CAOMZO5AnV9edLKrhTwchdghONU7=5CONndAjgXLreTkdN1vj8Q@mail.gmail.com>
 <20180718145146.10793a31@windsurf>
 <CAOMZO5A_feHYFg4Y83bzDv4k-XF8xYoao9AvxFXY-Czj00RWeA@mail.gmail.com>
Message-ID: <20180718151211.73c5eb52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Jul 2018 10:03:20 -0300, Fabio Estevam wrote:

> Actually the dts name in the vendor kernel is the same.
> 
> We could just add a "freescale" prefix to make clear that it refers to
> a defconfig that uses the vendor U-Boot and kernel.
> 
> For example:
> 
> imx7d-sdb_defconfig: this Buildroot defconfig uses mainline U-Boot/kernel
> freescale_imx7d-sdb_defconfig: this Buildroot defconfig uses the
> vendor provided U-Boot/kernel.

To me, this is what would make the most sense.

So, is configs/freescale_imx7dsabresd_defconfig related to this same
board, or is it a completely different board ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
