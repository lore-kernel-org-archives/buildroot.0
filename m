From: Michael Burghart <mb@michaelburghart.de>
Date: Mon, 11 Apr 2011 17:37:16 +0200
Subject: [Buildroot] Double cramfs mount
Message-ID: <4DA3202C.9030507@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

how come that / is mounted once rw and ro at the same time!?
Anybod seen that before?

Or did I just miss something?

 # mount

rootfs on / type rootfs (rw)

/dev/root.old on / type cramfs (ro,relatime)


proc on /proc type proc (rw,relatime)

devpts on /dev/pts type devpts (rw,relatime,mode=600)

tmpfs on /tmp type tmpfs (rw,relatime)

sysfs on /sys type sysfs (rw,relatime)

udev on /dev type ramfs (rw,relatime)
- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNoyAsAAoJEEMkp/gkis199ecH/AnpKvBhNlMFrJSvIQ6wARb4
jbgtfEOKWety125KX8bxxJU/vgMlZpNeb1ee1xcP79j31FUpGxLnhTDKf9Hymbq+
PONfJ1YdeEXCXPqlp27LIT+5DXB6+IymEGcy22WIIqBbwQnRZyYNkszXSoDWJXeZ
oM9qAXr4v4Wmqsz5CQ/mJcWEJJ3I9SqxW3Nq3YuNBPueppNMc5Lcdt7KmLlaNj78
6eVMcdsUTwtwDsYzuQm8NDHx6TwCD89ozXs4vmrpUct4MGqgSByl6gt/wIGTk6PE
QwaLzYGoueRtM+TFfUudKV2ryxeyWx0y+17LQZNZGJ2hnNwasGTXNaWrCYACMP8=
=YUyR
-----END PGP SIGNATURE-----
