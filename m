From: Michael Burghart <mb@michaelburghart.de>
Date: Thu, 07 Apr 2011 20:22:14 +0200
Subject: [Buildroot] Apache CrossCompile recipe
In-Reply-To: <4D9DFE83.3080602@itechcon.it>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>
	<4D9D5B9D.8090508@michaelburghart.de> <4D9D6EDE.7050004@daccii.it>
	<4D9D6F6B.6000801@michaelburghart.de>
	<4D9D7131.3090705@itechcon.it>
	<4D9D73C1.1070408@michaelburghart.de>
	<4D9D75DB.2010005@itechcon.it>
	<4D9D775A.5010506@michaelburghart.de>
	<4D9D7EE5.6060200@itechcon.it>
	<4D9DE9B2.1000100@michaelburghart.de>
	<4D9DFE83.3080602@itechcon.it>
Message-ID: <4D9E00D6.60202@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Daniele,

Am 07.04.2011 20:12, schrieb Daniele Salvatore Albano:
> Well, it depends by your architecture:
> - if it's x86 (32/64bit), just compile it normally ... don't need cross
> toolchain

its a Geode LX Box; x86.
Want to have uclibc and adapted kernel. Want buildroot to create a
bootable image which I can dd to my CF card.

Did make menuconfig and set up everything I need.
What exactly is meant by kernel "defconfig"?
Then I should normally just invoke "make" and get the results after a
couple of hours. Or am I wrong?!


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNngDWAAoJEEMkp/gkis19oloH/RkXaC9nc+c1unGlbNlAw0h7
TwD0gIVywynb4/Lz4mz+ZvWJnF5VMbaA6eFniyh+8NKcVZKtpHVajNis9eK3NThI
MNORzmbQpKkfloxC9+tbLG7EhZ9/eiKiyhv+J/673aVrrDTrmnn5+ypBxpQCMm1K
oA3o5YohuLG7R59GBXjOWjqc6Tfp+8wHFaKENbmE1c+PnvJoIOfhfUmNAcojTF3S
6SRZsHeTvkv8+zciNCgyNlVvmDJK5mMNYLbt4RdBOnTt+B27jaESWN2mI3Vzvcgn
BZWMm2QSCA4eSUdRMXAtCsHtzFYu9uPaOwyFAseb0lriB3EzQyR4wnDiSSfYsRE=
=ZLim
-----END PGP SIGNATURE-----
