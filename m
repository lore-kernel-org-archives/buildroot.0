From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 5 Nov 2016 13:05:43 -0200
Subject: [Buildroot] freescale_imx31_3stack_defconfig fails to build
In-Reply-To: <20161105143516.00291507@free-electrons.com>
References: <20161105143516.00291507@free-electrons.com>
Message-ID: <CAOMZO5Dv5=_x2y-_WtgW3G2Ox8TQpREwJkGhOx5cK5Fpk5uxfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Nov 5, 2016 at 11:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Fabio, Vincent,
>
> The freescale_imx31_3stack_defconfig in Buildroot no longer builds,
> because the Linux kernel version used in this defconfig is too old, and
> doesn't build with gcc 5.x.
>
> Has one of you access to this platform, and be willing to update this
> defconfig?

I think we should be able to use the latest mainline on mx31pdk.

I will try to get access to a mx31pdk and will give it a try with
latest mainline.

Thanks
