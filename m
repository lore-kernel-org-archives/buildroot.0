From: Michael Burghart <mb@michaelburghart.de>
Date: Wed, 13 Apr 2011 18:52:53 +0200
Subject: [Buildroot] mounting a cramfs
Message-ID: <4DA5D4E5.7020603@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi again,

hope this is not too silly a question:

already mounted the rootfs via grub and it works.
Now I need to mount other cramfs to a tmpfs directory (/var/language)

Tried:
mount /etc/language /var/language or explicitly with:
mount -t cramfs -o loop /etc/language /var/language

Neither of them worked.. don't know why. The system does not return back
to the prompt... Any idea?

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNpdTlAAoJEEMkp/gkis199aEIAMfPmyplfI2j0ghm3vl/rgLu
6vv181oKQApG4vVnTUV8W3rTrz9JMRhOJnGU5gWszYFz7oS0qAaqJc3qdVjnZb+t
IPTS/g70CUMFriAiufJ7yEBs68l3hYb62uFtBaqqbok5ML3prJVf4YizONIGne+V
EQDRnzuw2IwD3M6bo9eLX3sqiUzRi4HCPUp0RffxUHDaucLE1rapArVvBwZ0cFYW
QhHoFjJe1JXs1P1zxnwdZFL3PNdfi1xHqTmMtj2TwCHb7FYicu+csYup6RAWYGae
o/fJ488wdTLQUCL0NdeEoNrUfQdlvmoXiQneMwfNt9XI/f9fGmsbO+D98PCo1LI=
=WqM0
-----END PGP SIGNATURE-----
