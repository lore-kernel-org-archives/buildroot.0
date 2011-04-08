From: Michael Burghart <mb@michaelburghart.de>
Date: Fri, 08 Apr 2011 09:32:11 +0200
Subject: [Buildroot] Making kernel?
In-Reply-To: <4D9EB897.4050507@michaelburghart.de>
References: <1302088845-15193-1-git-send-email-a@awn.dk>	<20110406153502.13c6affd@surf>	<4D9D5B9D.8090508@michaelburghart.de>	<4D9D6EDE.7050004@daccii.it>	<4D9D6F6B.6000801@michaelburghart.de>	<4D9D7131.3090705@itechcon.it>	<4D9D73C1.1070408@michaelburghart.de>	<4D9D75DB.2010005@itechcon.it>	<4D9D775A.5010506@michaelburghart.de>	<4D9D7EE5.6060200@itechcon.it>	<4D9DE9B2.1000100@michaelburghart.de>	<4D9DFE83.3080602@itechcon.it>	<4D9EA40C.2020208@michaelburghart.de>
	<4D9EB897.4050507@michaelburghart.de>
Message-ID: <4D9EB9FB.2060909@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Apparently it doesn't find an own kernel defconfig file. The default
ones are found... Strange...



Am 08.04.2011 09:26, schrieb Michael Burghart:
> Hi again,
> 
> where the hell is it looking for its defconfig files???? I manually
> copied it across the whole filesystem but the script doesn't find it.
> What can I do??
> 
> 
> Am 08.04.2011 07:58, schrieb Michael Burghart:
>> Good morning Daniele, good morning list,
> 
>> I wanted to generate my own kernel but I get a bit confused.
>> What does
> 
>> linux/linux.mk:197: *** No kernel configuration file specified, check
>> your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.
> 
>> mean? There is an .config file. I even refuses a "make linux-menuconfig"
>> It doesn't give me the chance of building my own kernel. What do I do wrong?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
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

iQEcBAEBAgAGBQJNnrn7AAoJEEMkp/gkis19w1sH/R5Bs4Tx64KUv0pUZqu0t3D2
bWK5WIj17V44Qf5jJgBuQEstTMDlHgpz/JJfmLk4mGdjOjaTiK80ylXROyYzJmlT
ExJZzXIHoK/tAzODrgkkehvs07H0A9FgFSIZ+WARfhIXCVsXbHyrkxbia5k7QgUk
QfYI8Rx+Z1fu0wtb6TPy9WMXeV0Dym059k+99Uuf0Cn2NrIen2pOXdyvRgW4mDhE
eFJ9NTzjpPDLWDEYrjmpVrTMxHwZn/4CJP0EGEA6/0oGW1Jrs/ED/bvWFVmregn4
oBgeHZj6Gnm69nyjKhGhd14kVLhcfycWYbDXV7mcAaUJxoI2ZaKe284vei0FGxI=
=LloO
-----END PGP SIGNATURE-----
