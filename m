From: Michael Burghart <mb@michaelburghart.de>
Date: Sat, 09 Apr 2011 08:12:31 +0200
Subject: [Buildroot] Apache CrossCompile recipe
In-Reply-To: <4D9EFFBE.70308@itechcon.it>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>
	<4D9D5B9D.8090508@michaelburghart.de> <4D9D6EDE.7050004@daccii.it>
	<4D9D6F6B.6000801@michaelburghart.de>
	<4D9D7131.3090705@itechcon.it>
	<4D9D73C1.1070408@michaelburghart.de>
	<4D9D75DB.2010005@itechcon.it>
	<4D9D775A.5010506@michaelburghart.de>
	<4D9D7EE5.6060200@itechcon.it>
	<4D9DE9B2.1000100@michaelburghart.de>
	<4D9DFE83.3080602@itechcon.it>
	<4D9E5FAD.8020408@michaelburghart.de> <4D9EFFBE.70308@itechcon.it>
Message-ID: <4D9FF8CF.6020005@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Good morning Daniele,


its getting better :)
Now it complains about missing zlib. Unfortunately  I cannot enable zlib
in menuconfig. There is no hook to activate.
Does this depend on another point somewhere which I don't know?!

Output:
./configure: error: the HTTP gzip module requires the zlib library.
You can either disable the module by using --without-http_gzip_module
option, or install the zlib library into the system, or build the zlib
library
statically from the source with nginx by using --with-zlib=<path> option.

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNn/jPAAoJEEMkp/gkis192XgIAIefdHBU74wc7+xee9VLGfQE
4W/zYxbmsRsCBmMSQ5T81yIKhVsmDDFoM6OfMxWTKqYNDBsp6lttvLlwwnSXr8yT
a/RTvyLRh+an19BNaJJUEWYbf9NVtw32aahI3hOfNsygMOkxStUyr/tQjdHkr3jz
zvnZqTa0ZUrYOlTFgM4AJlhzKFHMj9qrguciYvFvcxP4sVnoqqmE3OUoO+AlS8dv
t7THNL4Lx7ugnEtOz0ifB/o5Zl9xImoRkD/NV03G/jqJVXQ6m3cwbZZz5eBJh4Hs
awFfXwavVXdIS0teVYVc6Kn/Dg+xP48/KVrKdKvLo+YJPJlv6rOdr3oajxmZfdo=
=70Lk
-----END PGP SIGNATURE-----
