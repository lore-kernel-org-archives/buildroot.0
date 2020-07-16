From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 Jul 2020 18:04:32 -0300
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx: Add helper to
 generate fw binary
In-Reply-To: <20200427211638.6047-1-xroumegue@gmail.com>
References: <20200427211638.6047-1-xroumegue@gmail.com>
Message-ID: <CAOMZO5AK3-1iVNvW3RKZyhVgbYNptm81xsy0z7auMeCoxmbn3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

On Mon, Apr 27, 2020 at 6:16 PM Xavier Roumegue <xroumegue@gmail.com> wrote:
>
> This script aims to create an imx compatible boot image embedding
> mainline components, using only upstream uboot mkimage tool, avoiding
> dependencies on proprietary imx mkimage.
>
> Mainline u-boot can generate a bootable image, but SPL soc proprietary
> firmware dependencies have to be copied on uboot root dir.
>
> This script prevents additional buildroot uboot recipe hacking to handle
> custom SoC uboot build process.
>
> The script actions summary is:
> - Append DDR4 firmware to uboot spl binary
> - Generate imx mkimage configuration file, extracting entry points from
>   relevant elf files on the fly.
> - Generate imx boot image using uboot upstream mkimage tool
>
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>

Do you plan to resubmit this patch?

I am looking forward to being able to use a Buildroot generated image
with U-Boot and kernel mainline on i.MX8 boards :-)
