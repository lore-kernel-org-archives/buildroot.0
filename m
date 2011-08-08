From: Heiko Helmle <helman@gmx.net>
Date: Mon, 08 Aug 2011 21:18:27 +0200
Subject: [Buildroot] Problems with udev buildroot
Message-ID: <20110808191827.101280@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

Hit the send button too early :)

it seems like /dev/null is missing and the generated image isn't able to mount anything...

> ----- Urspr?ngliche Nachricht -----
> Von: Heiko Helmle
> Gesendet: 08.08.11 21:15 Uhr
> An: buildroot at busybox.net
> Betreff: [Buildroot] Problems with udev buildroot
> 
> Hello List,
> 
> I'm a bit new and I'm trying to build a small x86 buildroot with udev.
> 
> So far I just enabled building a pretty default .config (just enabled a kernel with i386 defconfig and set udev for /dev management).
> 
> Unfortunately on 2011.8rc1 and the latest git this doesn't work right:
> 
> ---
> unable to access '/sys//devices/platform/i8042/serio1/input/input2
> /sbin/modprobe: invalid option -- b
> --
> then comes the busybox help for modprobe 
> --
> unable to access 'sys//devices/platform/i8042/serio1/input/input2/mouse0
> unable to access 'sys//devices/platform/i8042/serio1/input/input2/event2
> can't open /dev/tty1: No such file or directory
> can't open /dev/tty1: No such file or directory
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
