From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Jul 2018 10:18:40 -0300
Subject: [Buildroot] [PATCH v2 2/2] configs/imx7d-sdb: Add new defconfig
In-Reply-To: <20180718151211.73c5eb52@windsurf>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
 <1531084579-7949-2-git-send-email-festevam@gmail.com>
 <20180718120128.2454a930@windsurf>
 <CAOMZO5AnV9edLKrhTwchdghONU7=5CONndAjgXLreTkdN1vj8Q@mail.gmail.com>
 <20180718145146.10793a31@windsurf>
 <CAOMZO5A_feHYFg4Y83bzDv4k-XF8xYoao9AvxFXY-Czj00RWeA@mail.gmail.com>
 <20180718151211.73c5eb52@windsurf>
Message-ID: <CAOMZO5AUv8ry4OatFiM-QmXBQezwa_oP6sO05XJMPw_hCGWxWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 18, 2018 at 10:12 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 18 Jul 2018 10:03:20 -0300, Fabio Estevam wrote:
>
>> Actually the dts name in the vendor kernel is the same.
>>
>> We could just add a "freescale" prefix to make clear that it refers to
>> a defconfig that uses the vendor U-Boot and kernel.
>>
>> For example:
>>
>> imx7d-sdb_defconfig: this Buildroot defconfig uses mainline U-Boot/kernel
>> freescale_imx7d-sdb_defconfig: this Buildroot defconfig uses the
>> vendor provided U-Boot/kernel.
>
> To me, this is what would make the most sense.
>
> So, is configs/freescale_imx7dsabresd_defconfig related to this same
> board, or is it a completely different board ?

It is the same board.

From a Buildroot perspective the only difference between
freescale_imx7dsabresd_defconfig and imx7d-sdb_defconfig is that the
one with "freescale" uses the vendor U-Boot and kernel.

I will try to improve the board names as per the suggestion above.

Thanks
