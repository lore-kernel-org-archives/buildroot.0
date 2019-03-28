From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 28 Mar 2019 20:02:42 -0300
Subject: [Buildroot] [PATCH 1/1] configs/imx8mpico: new defconfig
In-Reply-To: <20190310163043.4217-1-juju@cotds.org>
References: <20190310163043.4217-1-juju@cotds.org>
Message-ID: <CAOMZO5AzzARDLvwtELZnAzPeMz6uGx+zKy=YdQpgtN7KHK2O+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Sun, Mar 10, 2019 at 1:31 PM Julien Olivain <juju@cotds.org> wrote:

> +In case the board was flashed with a wrong u-boot, or the eMMC is
> +erased, u-boot can be loaded by USB Serial Download boot mode, using
> +imx-usb-loader. See [3] and [4].

I am curious about this: have you managed to test loading U-Boot on
i.MX8 via imx-usb-loader?

If so, care to provide more details?

Thanks
