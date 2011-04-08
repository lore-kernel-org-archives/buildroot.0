From: Michael Burghart <mb@michaelburghart.de>
Date: Fri, 08 Apr 2011 07:58:36 +0200
Subject: [Buildroot] Making kernel?
In-Reply-To: <4D9DFE83.3080602@itechcon.it>
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
Message-ID: <4D9EA40C.2020208@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Good morning Daniele, good morning list,

I wanted to generate my own kernel but I get a bit confused.
What does

linux/linux.mk:197: *** No kernel configuration file specified, check
your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.

mean? There is an .config file. I even refuses a "make linux-menuconfig"
It doesn't give me the chance of building my own kernel. What do I do wrong?

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNnqQMAAoJEEMkp/gkis1992sH/RWNr6hvNnffeZNHNL+6xXD5
iPuqzsj9k1CkPUaX/AHYiSN1EBKvGTxJlHVnUW4Zo3XyFQuz1tCpXx33wvmNW5NO
qXAsuKJ0lKjZu0G8SzIoCiLATDGpSsWoFjOWrDRsXjL3CeXQSO0icp150xekQGyN
DF7mvqYymDJYQVxjwZ/P2qSJ30H7TWaPglFIhlsGB7VDvNnLC63T+hzAi27aitae
qR/mWKESifCTEr3G60/UMZBSvTTE8NqRYWkh/sOXqytsMY8pFSwlH5AccEx/WQS2
bn9IfQIrz4zooAOYUR4VW/x8SEHzKuk4bNDRzqRwWQosoCzuGlAacKnE+fY6p3I=
=QyjC
-----END PGP SIGNATURE-----
