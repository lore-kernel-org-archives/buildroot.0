From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 10 Jul 2008 23:35:15 +0200
Subject: [Buildroot] build failure mbstate_t not declared
In-Reply-To: <487659AF.8090904@acsatlanta.com>
References: <487659AF.8090904@acsatlanta.com>
Message-ID: <48768093.8000201@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Joseph G. Boike skrev:
| Hi,
| I checked out the latest buildroot and tried to build it but keep
| getting errors regarding mbstate_t not being declared.
| Here's a section of the output (there are many more lines with the same
| error, but I wanted to keep the post short.)
| Any suggestions?

Try building an existing board which is known to work.

$ make at91sam9260dfc_defconfig
$ make

BR
Ulf Samuelsson.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIdoCTAyRRH5cXxqwRAgMtAKCuPTXcUEcKMhemlv94qQC7P3ubTACfd2xo
Bk5agvqg6UaAf/3Fj2D34wQ=
=po97
-----END PGP SIGNATURE-----
