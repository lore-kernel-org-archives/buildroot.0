From: Michael Burghart <mb@michaelburghart.de>
Date: Wed, 13 Apr 2011 19:48:20 +0200
Subject: [Buildroot] mysql Server
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E805@EXV1.corp.adtran.com>
References: <4DA5DBCF.4020408@michaelburghart.de>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E805@EXV1.corp.adtran.com>
Message-ID: <4DA5E1E4.3030105@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 13.04.2011 19:38, schrieb ANDY KENNEDY:

> Obviously I was wrong.. Anything else I need to take into
> consideration?!
> 
>> It has to be inserted into the Config.in file under packages.

thats exactly what I did:

config BR2_PACKAGE_MYSQL_SERVER
        bool "mySQL Server"
        help
          mySQL Server

just a very basic thing.. No way.. :( does not work

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNpeHkAAoJEEMkp/gkis19KxgIAOFMAkDYP1UgUqzM746APVvp
a5SbLg+IllVLcafBkKSIAVhCEoGV76rbY9pjc/dsZMtGZbjFdpVcAaqmWiBD/rTb
pPlIpVdcRXV1whh25FfcHudmVNON9VhwmmF0wSyKIAJKP7mIHDlRZTgNdJInmc1I
tdwEL+T1hUQiwN6OvRNzg1cRvf+Ji3pCt6xu3yCYk83kQIj+ny5gdkS7coDjEiHc
2N5Je8EWGTqk0Gce+Kef3YEva55IhbebRrshC9od+crCQiOF/Zs1D+pIsOHzY2ra
NzhBhtUFMb1fGN9p2jOD0hPHuI0+o1PgcVONaXLUa7WHJ6b2cT3UYDZ+thO7+8Y=
=c8u1
-----END PGP SIGNATURE-----
