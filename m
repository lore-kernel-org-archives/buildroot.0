From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 8 Apr 2021 23:42:04 +0200
Subject: [Buildroot] Smart pi touch problems
In-Reply-To: <1617885845138-0.post@n4.nabble.com>
References: <1617885845138-0.post@n4.nabble.com>
Message-ID: <20210408234204.767594ae@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aziz,

On Thu, 8 Apr 2021 07:44:05 -0500 (CDT), dzeko1234 via buildroot <buildroot@busybox.net> wrote:

> Hello , I am deploying a Qt app on RPI3 target using buildroot toolchain .
> Also i generated Rpi image from Buildroot . So i would like to use the Pi
> touchscreen but I don't know how to configure it . Currently my App appears
> on rpi but the touchscreen doesn't work .
> Any helps please
> thank you

Did you enable/configure the appropriate device tree overlay for
your touchscreen (see [1], [2])?

Regards,
Peter

[1] https://www.raspberrypi.org/documentation/configuration/device-tree.md
[2] https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README

>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
