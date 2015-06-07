From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 07 Jun 2015 13:17:12 +0200
Subject: [Buildroot] [PATCH 1/1] eudev: add cxx dependency
References: <1433616116-30527-1-git-send-email-tomasz.gorochowik@gmail.com>
 <20150606210404.GH3581@free.fr>
 <CAJ4oOgypx858taa1cef4uivge-jyS07WZ=5R2=g-w_MaVWjxMQ@mail.gmail.com>
Message-ID: <XnsA4B2872B0D9DEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tomasz Gorochowik <tomasz.gorochowik@gmail.com> 
wrote in news:CAJ4oOgypx858taa1cef4uivge-jyS07WZ=5R2=g-
w_MaVWjxMQ at mail.gmail.com:

> Mininal config changes I make to reproduce the error:
> 
> Target architecture: ARM (little endian)
> Architecture variant: cortex-A9
> Toolchain -> Enable WCHAR support
> Target -> /dev management: eudev

Hi,

building eudev with this defconfig, without c++, works:

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y

Please post the content of your defconfig file:

make savedefconfig DEFCONFIG=some_defconfig

Regards, Bernd
