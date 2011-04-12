From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 12 Apr 2011 19:53:41 +0200
Subject: [Buildroot] mySQL Server for buildroot
In-Reply-To: <4DA467C1.7080107@daccii.it>
References: <4DA45B59.10309@michaelburghart.de> <4DA467C1.7080107@daccii.it>
Message-ID: <4DA491A5.1020500@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Am 12.04.2011 16:54, schrieb Daniele Salvatore Albano:
> Take a look at this package (quite simple, but uses conf end and conf
> optio for configure) to create mysql package
> http://git.buildroot.net/buildroot/tree/package/iperf/iperf.mk
> 
> Put your package in
> package/mysql

I already tried creating an Apache module; which did basically compile.
So I think I can do the same with mysql.

> and change package/Config.in to add your Config.in package to the list

And if it works I can check it in; perhaps somebody else needs it.
> 
> PS: are you using an hdd on alix? i'm asking because an entire db like
> mysql does a lot of I/O and a compact flash could be killed really
> fastly by this work load

I know but thanks for the hint.
The customer already has a box which does all this but the Linux system
is quite big and he wanted it to become smaller (and more up to date).
They use cramfs and mysql and apache and perl. All really "small" and
"tinxy" packages :))

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNpJGlAAoJEEMkp/gkis19/2YIAMU0FLdHs8F0gZQVXyo8g4/6
/ldXKjtxjnIN7gnmRWhfa080xz7hcBc08DG4ZYSfjGONNw5hvT/JX8HVQJZyZXfo
z6Ll/6/3KK6dFzlkVxdo3soBSlviD0iALWscjAtyN7RugwbFvFQQyBEdhwRxjGBJ
oBH/dOr2Gn8UyhL3Y4LFvVv4LmTTah+nG8zRZt6Lo1+IfSzAKwyD0RJVcQRET8Bl
+O7N3CcGzp3Z5v+YuT8XiEaestarHyYOiiPBt+crCpj3l1z9vq641iM11d0RKeE5
fajq2Zfvhb4chVIQLFfCJNbvtUPLbQY569MlqIsuXgLUm7srymbEkXRe0exsFsU=
=cwIN
-----END PGP SIGNATURE-----
