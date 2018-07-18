From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Jul 2018 10:03:20 -0300
Subject: [Buildroot] [PATCH v2 2/2] configs/imx7d-sdb: Add new defconfig
In-Reply-To: <20180718145146.10793a31@windsurf>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
 <1531084579-7949-2-git-send-email-festevam@gmail.com>
 <20180718120128.2454a930@windsurf>
 <CAOMZO5AnV9edLKrhTwchdghONU7=5CONndAjgXLreTkdN1vj8Q@mail.gmail.com>
 <20180718145146.10793a31@windsurf>
Message-ID: <CAOMZO5A_feHYFg4Y83bzDv4k-XF8xYoao9AvxFXY-Czj00RWeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 18, 2018 at 9:51 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> That makes sense. So I guess the DT name in the vendor kernel is
> different, and that's why our defconfigs have a different name between
> the vendor and mainline variants for a given board ?

Actually the dts name in the vendor kernel is the same.

We could just add a "freescale" prefix to make clear that it refers to
a defconfig that uses the vendor U-Boot and kernel.

For example:

imx7d-sdb_defconfig: this Buildroot defconfig uses mainline U-Boot/kernel
freescale_imx7d-sdb_defconfig: this Buildroot defconfig uses the
vendor provided U-Boot/kernel.

If you agree I can try to adopt such naming scheme.

Thanks
