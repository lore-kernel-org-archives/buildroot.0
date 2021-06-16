From: C Larbi <pkl2000us@gmail.com>
Date: Wed, 16 Jun 2021 10:56:07 +0000
Subject: [Buildroot] [webkitgtk / cairo] Accelerated rendering on
 raspberry pi 4
In-Reply-To: <CANVomh-dtsmg-oDwP8=uMmPWqcKA9hm7ReZ=wMiZoEn=-pOmWw@mail.gmail.com>
References: <CANVomh-dtsmg-oDwP8=uMmPWqcKA9hm7ReZ=wMiZoEn=-pOmWw@mail.gmail.com>
Message-ID: <CANVomh874jMUysBOf5QqJPzf-Ct1u6zCuTYA8d7W9GxAe2GpTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to add that i am using the 2021.02 stable release of buildroot

On Wed, 16 Jun 2021 at 10:54, C Larbi <pkl2000us@gmail.com> wrote:

> Hello
> I am working on a personal project to build a digital kiosk on a pi 4
> I am using webkitgtk on a wayland compositor.
>
> So far I have got the system up and running.
>
> But css and javascript effects produce poor performance (high latency and
> probably low FPS)
>
> I get garbled output on the display when I try to enforce hardware
> acceleration through WebKitSettings or using environment variables.
>
> This has left me suspecting an issue with cairo, open egl and es
>
> I did some research and found out cairo has an --enable-egl configuration
> parameter (which is not in the cairo.mk file).
>
> I applied this but still garbled output.
>
> I have tried different combinations of vc4-fkms-v3d, vc4-kms-v3-pi4, but
> still get the garbled output.
>
> Will appreciate it if anyone can give me some pointers to a possible
> solution.
>
> NB: I was advised to switch to wpewebkit, but i had the same results when
> i used cog to load my web page
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210616/79e0eacf/attachment.html>
