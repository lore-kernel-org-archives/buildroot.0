From: F.Roch <f.roch@ibsdisplay.de>
Date: Tue, 20 Feb 2007 15:38:52 +0100
Subject: [Buildroot] Xorg.
In-Reply-To: <20070220134253.GA24769@zelow.no>
References: <20070220134253.GA24769@zelow.no>
Message-ID: <45DB07FC.7060100@ibsdisplay.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
> cc -I../../../exports/include -o xkbcomp  xkbcomp.o xkbscan.o expr.o vmod.o indicators.o misc.o alias.o                keymap.o keycodes.o keytypes.o compat.o action.o                symbols.o geometry.o xkbpath.o listing.o              xkbparse.o parseutils.o utils.o -L/usr/X11R6/lib -lxkbfile -lX11
>
> /usr/bin/ld: cannot find -lxkbfile
>
> collect2: ld returned 1 exit status
>   
you have to provide the xkbfile library on your build system.
do this by installing a xorg on your build machine.

see: http://busybox.net/bugs/view.php?id=1218
