From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 16 Jul 2012 17:57:45 +0200
Subject: [Buildroot] X11
In-Reply-To: <1342430946.70457.YahooMailNeo@web160701.mail.bf1.yahoo.com>
References: <1342430946.70457.YahooMailNeo@web160701.mail.bf1.yahoo.com>
Message-ID: <CAGm1_ktg3+Qp+cPnckXfG2i2P6zeX-LNmXURJUuCi4FL0Xr0wA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 16, 2012 at 11:29 AM, Zoran Djordjevic <djdjdjole@yahoo.com> wrote:
> Hello
>
> I am trying to build XOrg server for ARM based board, using Buildroot .
> When starting it, I received error:
> FBDEV(0): FBIOPUT_VSCREENINFO: Invalid argument;
> Fatal server error:Addscreen/ScreenInit failed for driver 0-  and later:
> xinit: giving up
> xinit: unable to connect to X server - no such file or directory
> xinit: server error
>
>  File /usr/bin/X -exists on my device (ie. at NFS).
> Attached is my Buildroot .config file and xorg.conf that I created in
> etc/X11 folder.
> Kernel is build independently ie. out of Buildroot.
> Any help ?

Please try the earlier version from February. I had issues with the
latest git version.

Yegor
