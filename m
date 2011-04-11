From: Michael Burghart <mb@michaelburghart.de>
Date: Mon, 11 Apr 2011 10:08:58 +0200
Subject: [Buildroot] Strange behaviour with cramfs
Message-ID: <4DA2B71A.3090407@michaelburghart.de>
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

iQEcBAEBAgAGBQJNorcaAAoJEEMkp/gkis19PHwIAJ3eVahawrAji4laXgcdOdWI
jdgd0fNfnbQeiQcVqwbDWZFeYvT0w2NmwfWpYJWUUwSkYjAP9q/B4/q53ONW47XB
bGLzMbcnEfmou6BizSct/P7WsJVNTajCe+P+gebyNj6/az5lZgDrIiGOaiuR5iZi
6frScszt8lyoVXLkWvec5XDBabGwtPTcHc8qzZZJxNzGIIrDmfNt1JaJJbQCnO3c
cZYi8rq58KNSk3zq/1dYjfn8p+fMlP6eGt0jrlNNNR3cByHUCRGp6XqC/HmpPxIW
/NRLIzL7T7mT1xx2BXO9NrcVcq6ZDOaviO81Ci57FFxVfGaUoD35gYQUUL5JkQ4=
=Xs2k
-----END PGP SIGNATURE-----
