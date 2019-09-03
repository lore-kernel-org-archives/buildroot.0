From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 2 Sep 2019 23:20:55 -0300
Subject: [Buildroot] [PATCH v11 00/13] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.5
In-Reply-To: <20190901123707.19342-1-bernd.kuhls@t-online.de>
References: <20190901123707.19342-1-bernd.kuhls@t-online.de>
Message-ID: <CAOMZO5D85qA26TSTa3Ni1WUdcjP-76nsVi=OGSk8Vp_hak2Hiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Sep 1, 2019 at 9:37 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Hi,
>
> changelog:
>
> v11: added "Gallium vdpau state tracker is only available..."
>      rebased on branch 'master'
> v10: bump version to 19.1.5
>      rebased "rename OSMesa option" for branch 'next'
> v9:  fixed x11 dependency for patch "add a new option to enable GLX
>      support"
>
> Regards, Bernd
>
> Bernd Kuhls (5):
>   package/mesa3d: Gallium vdpau state tracker is only available for
>     r300, r600, radeonsi and nouveau drivers
>   package/mesa3d: switch build system to meson
>   package/{mesa3d, mesa3d-headers}: bump version to 19.1.5
>   package/mesa3d: add support for gallium lima driver
>   package/mesa3d: add support for gallium panfrost driver
>
> Romain Naour (8):
>   package/python3-mako: new package
>   package/mesa3d: rename OSMesa option
>   package/mesa3d: add OSMesa classic needs dri swrast
>   package/mesa3d: Only one swrast provider can be built
>   package/mesa3d: add xvmc option
>   package/mesa3d: Gallium xa state tracker is only available for nouveau
>     and svga Gallium drivers
>   package/mesa3d: add a new option to enable GLX support
>   package/mesa3d: select kmsro for etnaviv

For the series:

Tested-by: Fabio Estevam <festevam@gmail.com>

I have a patch that adds freedreno gallium support that I will submit
after this series gets applied.

It allows me to run kmscube on a imx53-qsb board :-)

Thanks
