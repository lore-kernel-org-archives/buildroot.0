From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Sun, 22 Jul 2007 15:00:38 -0500
Subject: [Buildroot] svn commit: trunk/buildroot: package
	target/device/Atmel
In-Reply-To: <20070722171703.79776A4756@busybox.net>
References: <20070722171703.79776A4756@busybox.net>
Message-ID: <46A3B766.2000808@realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ulf at uclibc.org wrote:
> Author: ulf
> Date: 2007-07-22 10:17:03 -0700 (Sun, 22 Jul 2007)
> New Revision: 19194
> 
> Log:
> ATMEL_MIRROR needs to be available before toolchain is built
> 
> Modified:
>    trunk/buildroot/package/Makefile.in
>    trunk/buildroot/target/device/Atmel/Makefile.in
> 
Ulf,

Please do not put any platform dependent code in the 'package/Makefile.in'
file. It does not belong there. I will revert your change.

- -Steve
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGo7dmgyK5H2Ic36cRAu2iAKCdcOpB0Xwv+lWdW8SuSmcFuoZfTQCgikWJ
r4Y8vsk7v8Pj3yK/JivwQ+E=
=ev7a
-----END PGP SIGNATURE-----
