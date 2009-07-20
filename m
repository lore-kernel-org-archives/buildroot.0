From: nfrench at xtale.biz <nfrench@xtale.biz>
Date: Mon, 20 Jul 2009 09:33:05 -0000 (Europe/London)
Subject: [Buildroot] standard libc libm support
Message-ID: <58243.172.16.221.10.1248082385.squirrel@172.16.0.251>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



?ldd /usr/lib64/libGL.so.185.18.14 
??????? linux-vdso.so.1 =>?
(0x00007fff789a1000)
???????
libGLcore.so.1 => /usr/lib64/libGLcore.so.1 (0x00007f3e9d1e0000)
??????? libnvidia-tls.so.1 =>
/usr/lib64/tls/libnvidia-tls.so.1 (0x00007f3e9d0de000)
??????? libm.so.6 =>
/lib/libm.so.6 (0x00007f3e9cf5e000)
??????? libXext.so.6 =>
/usr/XORG/lib/libXext.so.6 (0x00007f3e9ce4c000)
??????? libX11.so.6 =>
/usr/XORG/lib/libX11.so.6 (0x00007f3e9cc3c000)
??????? libdl.so.2 =>
/lib/libdl.so.2 (0x00007f3e9cb38000)
??????? libc.so.6 =>
/lib/libc.so.6 (0x00007f3e9c90e000)
??????? libXau.so.6 =>
/usr/XORG/lib/libXau.so.6 (0x00007f3e9c80b000)
??????? libXdmcp.so.6 =>
/usr/XORG/lib/libXdmcp.so.6 (0x00007f3e9c706000)
??????? /lib/ld-linux-x86-64.so.2
(0x00007f3e9e6eb000)

says it all really, Unfortunately I have
no control over NVIDIA :-)

>>>>>>
"nfrench" == nfrench  <nfrench@xtale.biz> writes:
> 
>  nfrench> Will there be any chance of libm and libc
support /
>  nfrench> options. NVIDIA OpenGL drivers a bit of a
problem at the
>  nfrench> moment. ( I know its due to them
being closed source but
>  nfrench> they are fast and with the
ION chip very good).
> 
> What exactly are you missing
regarding math support?
> 
> --
> Bye, Peter
Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090720/5e9f78fc/attachment.htm>
