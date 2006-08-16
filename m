From: Matteo Basso - kraba <teo@kraba.org>
Date: Wed, 16 Aug 2006 12:25:43 +0200
Subject: [Buildroot] Installing MySQL Problem - Help
Message-ID: <44E2F2A7.4050900@kraba.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,
I'm developing a distribution with buldroot similar to AstLinux to
manage a PBX apparatus supporting amportal/FreePBX.

Reading the documentation I discovered that PostgreSQL is not supported
by FreePBX and installing MySQL 5.x.x I get the following error:
checking "return type of sprintf"... configure: error: cannot run test
program while cross compiling

I found out that I need to install build libraries, not from the source.
Anybody was able to install MySQL succesfully in buildroot?
I'd like to use SQLite but it's bugged/unsupported by FreePBX.

Thanks in advance for any help.
Ciao Matteo Basso
- --
Una guerra, una morte, grande corsa verso la morte
tutti felici, tutti contenti, state morendo
tutti pazzi, tutti pazzi, tutti morti. (Negazione - Tutti Pazzi)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFE4vKne+Z+epWztLQRAle+AKCeu2CrocB0F0zfg5lApSFSRbgptACeKCSM
U1vHpvZAMYL2+30WdOLd00k=
=ILWE
-----END PGP SIGNATURE-----
