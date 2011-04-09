From: Michael Burghart <mb@michaelburghart.de>
Date: Sun, 10 Apr 2011 01:49:01 +0200
Subject: [Buildroot] Apache CrossCompile recipe
In-Reply-To: <BANLkTikZ-2ZYWUqbXeNrCp1-5wahHBO8MA@mail.gmail.com>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>	<4D9D5B9D.8090508@michaelburghart.de>	<4D9D6EDE.7050004@daccii.it>	<4D9D6F6B.6000801@michaelburghart.de>	<4D9D7131.3090705@itechcon.it>	<4D9D73C1.1070408@michaelburghart.de>	<4D9D75DB.2010005@itechcon.it>	<4D9D775A.5010506@michaelburghart.de>	<4D9D7EE5.6060200@itechcon.it>	<4D9DE9B2.1000100@michaelburghart.de>	<4D9DFE83.3080602@itechcon.it>	<4D9E5FAD.8020408@michaelburghart.de>	<4D9EFFBE.70308@itechcon.it>	<4D9FF8CF.6020005@michaelburghart.de>
	<BANLkTikZ-2ZYWUqbXeNrCp1-5wahHBO8MA@mail.gmail.com>
Message-ID: <4DA0F06D.7000907@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 10.04.2011 01:20, schrieb bruce bushby:
> Have you tried implicitly addding zlib to your conf options?
> 
> Something like:
> HTTP_CONF_OPT += --with-zlib=$(STAGING_DIR)/usr

ok, thanks. Will try. Up to now I have used only the option presented in
menuconfig and there was no possibility to select (or deselect) zlib.

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNoPBtAAoJEEMkp/gkis19aZMH/A5xBj+xZhqK27Uv7zSiVane
cXM6t161GEcCwqBI9vRb+Jh0TfTs6ej/GcYaq1Dm+saWwm0RB/6AOQhJuC9SNslB
aMNjJkhlLQHMkNjYuoCDfy+N6rHkg+YnthO23IpjEwQDVgFIWG/bCt+pqQfcF9zC
A4oSqYRI0VuIb7HjxYOYBuG670k8AVkLUSQGQkm4rKS/yenYHoUfTt32/6BGiMSB
4LuzQTNGqJp3dhEG8RqhIetWI64Py9QQtoVrSk3X4KTJ4wD3dMEQgwZbpVT9Xdu2
KY7KkTcy6Ko0sV6mA19f/3gSLWWoFvSM+n0zCywwm/U8/yzdghFuhBdBAFkbMr0=
=mkhA
-----END PGP SIGNATURE-----
