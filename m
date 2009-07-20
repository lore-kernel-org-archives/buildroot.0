From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Mon, 20 Jul 2009 09:28:07 -0000 (Europe/London)
Subject: [Buildroot] 64bit build error Mesa
Message-ID: <53496.172.16.221.10.1248082087.squirrel@172.16.0.251>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




Will give it a go later today, thanks

>>>>>> "nfrench" == nfrench 
<nfrench@xtale.biz> writes:
> 
>  nfrench> Have a
64 bit build system and have now added XORG but get the
>
following
>  nfrench> /bin/sh: makedepend: command not found
>  nfrench> make[4]: *** No rule to make target `depend', needed
by
> `default'.  Stop.
>  nfrench> make[4]: Leaving
directory
>
`/mnt/wd/buildroot-2009.05/build_x86_64/Mesa-7.2/src
> 
nfrench> /glx/x11.'
> 
>  nfrench> any pointers
please.
> 
> Could you try updating your git tree (you'll
need d0f902e82) and try
> again without having makedepend
installed on the host?
> 
> --
> Bye, Peter
Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090720/d416a601/attachment.htm>
