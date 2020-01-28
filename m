From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 28 Jan 2020 08:29:25 +0100
Subject: [Buildroot] Requirements for QML in RPi4
In-Reply-To: <CAPmASevGW-0BY78ETy=p+c3p_cOnWG0DO3d8FV=+U6ij9DynpQ@mail.gmail.com>
References: <CAPmASevs=kKKCspFM0M_ydbeSzNJLGEEiGmrgb6Ap-RqUtE-Ag@mail.gmail.com>
 <20200127164125.1ec2b7ff@gmx.net>
 <CAPmASevGW-0BY78ETy=p+c3p_cOnWG0DO3d8FV=+U6ij9DynpQ@mail.gmail.com>
Message-ID: <20200128082925.7c9b4145@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-add CC: buildroot at busybox.net

On Mon, 27 Jan 2020 17:38:25 +0100, Andrea Simeoni <andreasimeoni73@gmail.com> wrote:

> > You seem to have a RPi4-64bit config, trying to run
> > mesa vc4?
> >
>
> IIRC it was needed to get accelerated GPU.
>
>
>
> > dtoverlay=vc4-fkms-v3d
> >
>
> Unfortunately it doesn't work. I read the links, and the situation seems a
> bit confusing.
>
>
> Alternatively your can try RPi4-32bit and enable
> > rpi-userland/BR2_PACKAGE_RPI_USERLAND
> > instead of mesa...
> >
>
> I don't need 64-bit but I need QML+GPU. I'm going to try RPi4+32bit w/
> userland.
> I hope it will works! I will report the results.
