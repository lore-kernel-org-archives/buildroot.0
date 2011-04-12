From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 12 Apr 2011 22:49:43 +0200
Subject: [Buildroot] nginx
In-Reply-To: <4DA46698.8020004@daccii.it>
References: <4DA41D20.6000001@michaelburghart.de> <4DA44715.1020006@daccii.it>
	<4DA44D8D.8030205@michaelburghart.de> <4DA46698.8020004@daccii.it>
Message-ID: <4DA4BAE7.8000604@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Am 12.04.2011 16:50, schrieb Daniele Salvatore Albano:
> 
> While i can't change the mind of your customer, but consider that apache
> is "heavy" and, more important, i really don't know if mod_perl works
> with the "microperl" package present in buildroot.

exactly :-(
> 
> Cross compile apache should not be so hard, just try to set up a simple
> apache package with semi-default values ... the main problem is to add
> mod_perl: if microperl package doesn'tsupport mod_perl i think that will
> be REALLY hard support it.
> 
> Use perl in fastcgi instead of mod_perl should be really a lot simpler
> ...  just need to add a package to microperl, nothing more.

the problem is that they already have all web stuff set up and use it.
They only want to have a new base Linux system. The one they use right
now is a Debian the shrunk manually. So I offered them a  reproducable
system. Well, but they still need to support the "old platform". And
that consists of Apache, Perl and mySQL..:-(

That's my problem. I could as well create a LFS system but thats just to
big!

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNpLrnAAoJEEMkp/gkis19paQH/0L9SBBvH1Gc4jZSW6qWLVDH
nZtPkHFBukK/26EXUuZQJpsiphQRcnSREMnTq4ua3ZenyRLwfE9IosPClMsD+Ldl
dFgv3EHBl8HLud6xcQAzuRmHhbGJUgHx2T0OMG+ViVc2GSOMHop83kx3YZfiBIrF
KwgwGhfRj+2RISXO2/VpO/J2AjI/8T9vZ2NFRTGTpr9erHsi8Z4TfkKVtJilqSvw
Awr+KrNAxWrJV4qIiEUxJKWtcb8lBbfdYW3MZrTzgGnvI/l9Zad5iDEvXqJoZ0hY
rHPAGTY9laIJaUqbscTLoz6lp0QflNd9aGVPgsytxpTU75zsA86xgmnpxgSVJrc=
=SPCU
-----END PGP SIGNATURE-----
