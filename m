From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 11 Jul 2008 06:50:23 +0200
Subject: [Buildroot] microcom
In-Reply-To: <4876CC77.1000308@acsatlanta.com>
References: <4876CC77.1000308@acsatlanta.com>
Message-ID: <4876E68F.1060408@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Joseph G. Boike skrev:
| I'm trying to use microcom (the busybox version) to test a gadget serial
| interface on an at91sam9260 board.
| gadget serial was compiled into the kernel w/ USE_ACM=1.  I can "cat
| some_text_file > /dev/ttygserial" and the contents of the text file show
| up on my laptop running hyperterm w/ windows xp.  So I think the link is
| ok.  But if I do "microcom /dev/ttygserial" the whole board seems to
| hang.  I haven't found anything short of cycling power to get the board
| responding.  (Granted I'm using a serial console so once the program
| starts I can't just kill it from another terminal window.)
| Any suggestions?


Recompile microcom with debugging info and debug with gdb.

| Thanks,
| Joe
|
| _______________________________________________
| buildroot mailing list
| buildroot at uclibc.org
| http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIduaPAyRRH5cXxqwRAsx8AJ4jPgLua0//0HHDOmq4ZUQYedbfwgCgjW38
pGhTFzzyz012sH3p28p19vc=
=Teqm
-----END PGP SIGNATURE-----
