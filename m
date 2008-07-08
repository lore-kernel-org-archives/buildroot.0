From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 12:01:19 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/docker
In-Reply-To: <877ibwr9d4.fsf@macbook.be.48ers.dk>
References: <20080708054144.507E03C67C@busybox.net>	<877ibwvpxk.fsf@macbook.be.48ers.dk>
	<4873328E.5050001@atmel.com> <877ibwr9d4.fsf@macbook.be.48ers.dk>
Message-ID: <48733AEF.7020703@atmel.com>
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
>  >> Is all of this needed? And shouldn't it be PKG_CONFIG_SYSROOT_DIR
>  >> instead? We don't use the pkgconfig wrapper anymore.
>  >> 
>  Ulf> I tried building both ARM and AVR32 and without this,
>  Ulf> and both are broken.
>  Ulf> docker will use host pkgconfigs instead of target pkgconfigs.
> 
> And with PKG_CONFIG_SYSROOT_DIR?
> 

I do not mind that you update as long as it builds for ARM & AVR32.

BR
Ulf Samuelsson
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIczrvAyRRH5cXxqwRAosuAKCAldFYwOJ0Dz6iMlzecXyvhHUc8ACfa3cf
GfvocmwugLh+dHDKTSZ0kG4=
=Jou7
-----END PGP SIGNATURE-----
