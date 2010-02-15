From: Cameron Hutchison <lists@xdna.net>
Date: Mon, 15 Feb 2010 21:56:42 -0000
Subject: [Buildroot] -sh: lrzsz: not found
References: <SNT129-W3519623AE8254A748FDB73B94A0@phx.gbl>
Message-ID: <19bf.4b79c31a.526aa@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tony Mozi <spooflinux@hotmail.fr> writes:

>I copy the new image rootfs in the board.
>The directory lrzsz is present in buildroot-2009.11/package/lrzsz.

>However, in serial console : 
># lrzsz
>-sh: lrzsz: not found

It appears to be installed as /usr/bin/sz and /usr/bin/rz.
