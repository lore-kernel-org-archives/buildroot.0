From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Dec 2019 11:31:12 -0300
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <20191222142421.13cd522c@windsurf>
References: <20191218130429.847805-1-juju@cotds.org>
 <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
 <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
 <CAOMZO5CTpqORMwjZi5681X7h1pngWZJzF-VZHvaVHkEe4CYq1g@mail.gmail.com>
 <bb1e9dbdd73a1e0b8fead464ddf9fa83@cotds.org>
 <20191222142421.13cd522c@windsurf>
Message-ID: <CAOMZO5DY2haaYR9nF1BcZwYM9hVgm-q+bu_bAfDsYXwdegjS+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 22, 2019 at 10:24 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> One question is: how does it work if one wants to use the upstream
> Linux kernel?

I have been successfully using the NXP components from 4.19.35_1.1.0
NXP BSP (sc-firmware, AT-F, linux-firmware) with mainline kernel.

I plan to generate targets to boot  i.mx8 boards with mainline U-Boot
and mainline kernel.

Thanks
