From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 00:37:00 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <877ibxzfh4.fsf@macbook.be.48ers.dk>
References: <20080706073442.174E03C67A@busybox.net>	<20080707124143.GB15840@mx.loc>
	<4872169E.2010102@atmel.com>	<20080707132334.GD15840@mx.loc>
	<48721B90.5070905@atmel.com>	<87mykt4v47.fsf@macbook.be.48ers.dk>	<AAFCB58EA8634B0CADEDE37957685CEC@aeglos>
	<877ibxzfh4.fsf@macbook.be.48ers.dk>
Message-ID: <48729A8C.4070303@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Peter Korsgaard skrev:
>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> That would be silly. The standard location for stuff is /usr, and we
>  >> don't provide settings for all our other packages.
>  >> 

Then, those packages does not have a broken build.

> 
>  Ulf> So you think that the situation we have now, when libgtk2 will
>  Ulf> not compile when gnome is installed in "/opt/gnome2 on the host  is a
>  Ulf> good one?
> 
> No, not particular good, but better than the other way around as /usr
> is standard, /opt/gnome2 isn't.
> 

You can't be serious...

Why is it better to have a broken gnome build
than installing gnome in /opt/gnome?

Anyone with gnome installed in "/usr" will of course
use "/usr" on the target as well.

You can of course install symlinks from /usr/bin to
/opt/gnome/bin, but use of "sudo" in buildroot
has been frowned on before.


> How does openembedded handle it?
> 

Did not check.

BR
Ulf Samuelsson

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIcpqMAyRRH5cXxqwRAt9KAKC05Prf9nHqLTX9vztFQdYfUpmtJwCgrCYo
vs3Meb2y1X/DSTK9bkkqT1c=
=z52i
-----END PGP SIGNATURE-----
