From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Wed, 13 Apr 2011 12:38:56 -0500
Subject: [Buildroot] mysql Server
In-Reply-To: <4DA5DBCF.4020408@michaelburghart.de>
References: <4DA5DBCF.4020408@michaelburghart.de>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1FA8E805@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Michael Burghart
> Sent: Wednesday, April 13, 2011 12:22 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] mysql Server
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> just wanted to start building a mysql_server package. Thought
> creating a
> packages/mysql_server directory with two files :Config.in and
> mysql_server.mk should be sufficient so that the appear in
> menuconfig.
> 
> Obviously I was wrong.. Anything else I need to take into
> consideration?!

It has to be inserted into the Config.in file under packages.

> 
> - --
> - --
> cheers
> - -micha-
> - --
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.16 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
> 
> iQEcBAEBAgAGBQJNpdvPAAoJEEMkp/gkis192NcIAIvg8KNeTQa1EJfdNFTcxDYZ
> je0aGl0Lb15qweb4nBWg3rCK7mr5XGDUob1mRwsJ5qcAYY8qgnh6V8qCfPw9K6dj
> C15JXRkHal9fS8g87ISBtEQxsgNqEK7ZunGXQtAZ3ge4dkGhWXWVGb/6372nlefy
> MzzaGNwuUEgMclHVIp/vOf+ILzHDH7ykzk8ul0y83osu6UtcIvFfWjiN9J0pwiCK
> Ddqv7Slub1lKzNjLdK8hcK9MbquVRMoO1KZcpgB0Ilrag5Qoq0L673oGPxCU7+dz
> fT4xwphVE7UsOhGgjbEgqSqWfhskIroH/SMuIVhzWbJ7oTLJm4xCZoUn66dAyrg=
> =wonU
> -----END PGP SIGNATURE-----
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
