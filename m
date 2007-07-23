From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Sun, 22 Jul 2007 21:55:29 -0500
Subject: [Buildroot] svn commit: trunk/buildroot:
	packagetarget/device/Atmel
In-Reply-To: <013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
References: <20070722171703.79776A4756@busybox.net>
	<46A3B766.2000808@realitydiluted.com>
	<013701c7ccb3$1a92a960$dcc4af0a@atmel.com>
Message-ID: <46A418A1.30808@realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ulf Samuelsson wrote:
> 
> While it is used for target/device/Atmel files, it is also needed
> to download binutils/gcc/gdb tarballs for AVR32 architecture support.
> If it is defined in target/device/Atmel, then it is not defined during
> the toolchain build. causing this to fail.
> 
Honestly, I would rather see the directives in each of the toolchain/*/*.mk
files. The top-level files should be kept clean of architecture/platform
directives.

- -Steve
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGpBihgyK5H2Ic36cRAhfHAJ0fZeaDN+VRtDPeVDNnQcXAxHU1uQCfcLYc
+ZR60lZxpiiLQ63kWdLGwo0=
=o3sy
-----END PGP SIGNATURE-----
