From: James J. Dines <jdines@jdines.net>
Date: Tue, 07 Sep 2010 09:23:41 -0400
Subject: [Buildroot] Why is extfs filesystem mandatory?
Message-ID: <4C863CDD.8020805@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

While trying to build a large system I keep getting an error stating
that there is no room left on the device during the generation of the
ext2 filesystem.  It is my understanding that this is due to a hard
upper limit imposed by the genext2fs utility.

This would not be an issue for me if I could simply disable said step,
however there seems to be no way to disable generation of the ext2
filesystem in the menuconfig.

Is there a reason why this cannot be disabled?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMhjzbAAoJECSpOhdQESq64l8H/3+Plqt92ABJfCB+JJy93mfo
PXxYko6l37BtYcbFOWFxZ8H1yvrTzXvB86Wz2ffXtAfU+n1HqOMp0Z7P7puZplJ1
ppDbXTIyu2cS+EKLIFnLoSLX6Tr0jNdoUMP2vfU6/SsSDZzmutuudMU6RrdULbPG
YXUChySFxUjXfhnFZxHCUPcdbsxk9CVFZIn1CJjslSsnLDBOtdqAE5F6N/HL8IxF
NeLkwk2T/wkB47e9KIDeTWc05CMMeeZKYIbqvs6LX3WecP7gYiU+vEZxIea3ezL5
pruS596+ntpM4u8n1xppzvMvPE4CLRQpgo8oVnZZaFiBjBsbVIOoiP5go++8tZ8=
=8cMM
-----END PGP SIGNATURE-----
