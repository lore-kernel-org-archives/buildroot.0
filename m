From: Michael Burghart <mb@michaelburghart.de>
Date: Mon, 11 Apr 2011 10:01:17 +0200
Subject: [Buildroot] Strange behaviour with cramfs
Message-ID: <4DA2B54D.8030102@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

as I need to be able to replace the rootfs regularly I decided to build
it as a cramfs (if there is a better option, please let me know).

Unfortunately it does not work. The cramfs gets loaded and the kernel
tells me:

[    2.883952] VFS: Mounted root (cramfs filesystem) readonly on device
1:0.

which is ok.
But then:

can't open /dev/proc: No such file or directory

and so on on end.. what did I forget to include?! Anybody experienced
this before?

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNorVNAAoJEEMkp/gkis19PykIAJHR4AWuJG2qmn8F9pp0kZMV
nkjQtO2LUo/txuCKgFk6q0gxkOOqqajko5Br8Wu0zw6IEDNgvhn/s1CP+w1Ra6oN
1uZITMhZdxkk1yV6jeh34jG3nbhBnHpM370KxFAn7MYb9kh4TlP6/hLzvycSr4Hs
wBntxX+/JoMlVvwQADgyytUmdD4PxVgfWMQFS/KpYSCTpyeEa90T74AnYK0krCG5
/l0QHOu4/Ru/Iug2rNv+2XdGcw24ZsHpm9yhT6UGFiW9SO3AqAzDuxTF/Q0ahnwL
bvufzguE+lJfGfKRnbvIj5GIv858V7Hhav2ZSHaD72P/lnCJngjc6cKXUwkOPfs=
=1b1Q
-----END PGP SIGNATURE-----
