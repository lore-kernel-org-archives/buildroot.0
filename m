From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 16 Jul 2008 08:34:05 +0200
Subject: [Buildroot] Target Architecture for AT91SAM9RL64
In-Reply-To: <c38932520807152325s77214abcu197c495bdc2332a7@mail.gmail.com>
References: <c38932520807152325s77214abcu197c495bdc2332a7@mail.gmail.com>
Message-ID: <487D965D.2040103@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hien Pham skrev:
| Hi all,
| I'm using AT91SAM9RL64 (ARM926EJ-S processor, v5TEJ).
|
| Which architecture (arm926t or generic arm) I have to choose at Target
| Architecture selection step in menuconfig.
|
| Thanks and best regards,

You can select either of them.
If you compile with generic_arm, you will not get all
the optimizations you get with arm926t.
With generic_arm, the toolchain will work with any ARM processor.

If you are only going to use ARM926EJ-S, then you
will not be hurt by selecting arm926t.

BR
Ulf Samuelsson


|
|
|
| ------------------------------------------------------------------------
|
| _______________________________________________
| buildroot mailing list
| buildroot at uclibc.org
| http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIfZZdAyRRH5cXxqwRAgzEAKCm4sjRL669tf5TksnDNXTsL+QRdgCfYl8W
tp6B+rOi3a5bcGfXpPZfXMU=
=UFIn
-----END PGP SIGNATURE-----
