From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Oct 2019 16:53:58 -0300
Subject: [Buildroot] imx-drm not getting installed
In-Reply-To: <20191008213931.1409bd7f@gmx.net>
References: <CAOMZO5CLskrZpdWAeL98fgW8A4CcfHLY6=AfoKgamAAyDDDOYw@mail.gmail.com>
 <20191008213931.1409bd7f@gmx.net>
Message-ID: <CAOMZO5Bu4cxZ6n5ceTwP5DqXwaH-23xVOxQAGaEwDWufB9dB9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Oct 8, 2019 at 4:39 PM Peter Seiderer <ps.report@gmx.net> wrote:

> Enabling 'BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y' enables the
> missing drivers...

Excellent, thanks!

Should BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y be automatically
selected when a gallium driver is selected?

Otherwise we will need to patch the existing defconfig files to avoid
a regression.

Thanks
