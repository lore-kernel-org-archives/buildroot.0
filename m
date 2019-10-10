From: Johan Derycke <johanderycke@gmail.com>
Date: Thu, 10 Oct 2019 15:05:18 +0200
Subject: [Buildroot] imx-drm not getting installed
In-Reply-To: <CAOMZO5Bu4cxZ6n5ceTwP5DqXwaH-23xVOxQAGaEwDWufB9dB9A@mail.gmail.com>
References: <CAOMZO5CLskrZpdWAeL98fgW8A4CcfHLY6=AfoKgamAAyDDDOYw@mail.gmail.com>
 <20191008213931.1409bd7f@gmx.net>
 <CAOMZO5Bu4cxZ6n5ceTwP5DqXwaH-23xVOxQAGaEwDWufB9dB9A@mail.gmail.com>
Message-ID: <CAKHhJn3iFOTsB8HW2Mi6vVCYH94+o_2YHqoBJN5JpAaoe1QVog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

While testing this (it works :-)) I discovered that those .so files are all
identical files.
Shouldn't this be all symlinks? My rootfs image actually got to big to fit
my embedded device ...

Best regards,




Op di 8 okt. 2019 om 21:54 schreef Fabio Estevam <festevam@gmail.com>:

> Hi Peter,
>
> On Tue, Oct 8, 2019 at 4:39 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Enabling 'BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y' enables the
> > missing drivers...
>
> Excellent, thanks!
>
> Should BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y be automatically
> selected when a gallium driver is selected?
>
> Otherwise we will need to patch the existing defconfig files to avoid
> a regression.
>
> Thanks
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191010/924074eb/attachment.html>
