From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Feb 2019 21:30:58 -0300
Subject: [Buildroot] U-Boot update needed in imx23evk_defconfig
In-Reply-To: <20190222221713.4d05d16f@windsurf>
References: <20190208124718.650e4d42@windsurf>
 <CAOMZO5Ceka8LQQr76UVScyTXNB8DemsRZ3UQQg8aYc5N4pwNBQ@mail.gmail.com>
 <20190222221713.4d05d16f@windsurf>
Message-ID: <CAOMZO5DwjNDAsFXrHS4smKY3uj-HwWrc=FGx=gzEO0SiCU=+5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Feb 22, 2019 at 6:17 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Do you have some news about the imx23evk U-Boot version bump ? It is
> still failing to build on current master.

Sorry for the delay. Just sent a patch that bumps U-Boot to the latest
2019.01 version.

Tried to also bump the kernel, but I noticed a mmc/pinctrl regression
with 4.19 and I will need to investigate it later.

Regards,

Fabio Estevam
