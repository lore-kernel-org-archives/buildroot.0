From: Michael Burghart <mb@michaelburghart.de>
Date: Fri, 08 Apr 2011 14:50:11 +0200
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
Message-ID: <4D9F0483.7000001@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Daniele,

Am 08.04.2011 14:29, schrieb Daniele Salvatore Albano:
> 
> are you using a x86/x32 or a x64 system? I've tested nginx compilation
> only on x86 bit toolchains (compiled for i586 specifically).

the build host is a x64 system

Linux einstein 2.6.37.1-1.2-desktop #1 SMP PREEMPT 2011-02-21 10:34:10
+0100 x86_64 x86_64 x86_64 GNU/Linux

I am about to compile it for GeodeLX Arch.
> 
> Relatively to AIO, i think that uclibc support isn't complete or doesn't
> fully support the standard because i got some errors trying to use
> uclibc ... but, for my needs, i used eglibc as libc and all works
> perfectly ... in any case you don't really need aio for control panels
> or similar stuff

jupp  I could just skip it... lets give it a try.
As soon as I figured out how to put all the images on my CF card..
Doesn't work yet.

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNnwSDAAoJEEMkp/gkis19AD8H/j5URNYZy1uip+TxQqVPfPx6
ao75LRzOORF1eBHKYNBwYj/5UfmVbUTQAKxJAj3W+Cln1BfluTW5DLV3gcpjTqcp
NprgW5s8sgkN+Nyx0u/JOwFHW8HKeBeA5oaeQxS2T0j0L1qtgLvnza8S87i0n3GS
09t6RWdq9vMC4A81g+jdHGeBwXSW3YQG+6bqLceN/+0PphlpV7vaHIz3F0PVGb/+
rCiejs4N98xw5ozvQYw56zxwHWwV/yx5m+XmUTomr9n7VftCrfS0a6OySTuVY/Qx
zjkn4DK0tw7mBZ+IoFJ8pF8M5GvFtijOhUn8+WBJ6OZuyHN+ucDqeiX1SBo/BGg=
=c16R
-----END PGP SIGNATURE-----
