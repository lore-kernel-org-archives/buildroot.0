From: Michael Burghart <mb@michaelburghart.de>
Date: Wed, 13 Apr 2011 16:53:45 +0200
Subject: [Buildroot] Apache CrossCompile recipe
In-Reply-To: <4D9F0A6C.2050104@daccii.it>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>	<4D9D5B9D.8090508@michaelburghart.de>	<4D9D6EDE.7050004@daccii.it>	<4D9D6F6B.6000801@michaelburghart.de>	<4D9D7131.3090705@itechcon.it>	<4D9D73C1.1070408@michaelburghart.de>	<4D9D75DB.2010005@itechcon.it>	<4D9D775A.5010506@michaelburghart.de>	<4D9D7EE5.6060200@itechcon.it>	<4D9DE9B2.1000100@michaelburghart.de>	<4D9DFE83.3080602@itechcon.it>	<4D9E5FAD.8020408@michaelburghart.de>	<4D9EFFBE.70308@itechcon.it>
	<4D9F0483.7000001@michaelburghart.de> <4D9F0A6C.2050104@daccii.it>
Message-ID: <4DA5B8F9.7010903@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Daniele,

Am 08.04.2011 15:15, schrieb Daniele Salvatore Albano:
> In any case, you can try to edit auto/types/sizeof and add there
> u_int64_t size (well, it should be 8)

in an normal environment I would just edit the .c file. But how do I do
this with buildroot?

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNpbj4AAoJEEMkp/gkis19EH4H/RXhP23HH24PG8c5XHWB5rRU
5riB01xUOO8XIjqdhOxMT2SHbxFfaImjdfQrJKLxj62aCM9h2dWNoFGKEmGxdeD1
gawM8ES3f0lAEsvD8DCILoazlj+FRu62vU0m6VtdxiQX0HVE8n3+fR8HYS7uDlbO
VqJ+gdvdl+QpwvlbyoPxC5XUp4A/5LhQl13yNMGPpaUvOKLAecCoZ4ibwg+beG0y
9F9zTOkSIn3hbBjr2BPOcvqyL3kDauo1iWZHAKKC2I4YFkGHRbG5eYSwFfJw48nU
AKO3rhW+u50Ek8Q+Gb4Z83xDZzFCAFNHDT0D8os7L7kTcHxTiDGOczyKA7xH07M=
=Q6D7
-----END PGP SIGNATURE-----
