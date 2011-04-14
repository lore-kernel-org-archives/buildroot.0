From: Michael Burghart <mb@michaelburghart.de>
Date: Thu, 14 Apr 2011 09:42:32 +0200
Subject: [Buildroot] mounting a cramfs
In-Reply-To: <4DA6A3D3.90703@free.fr>
References: <4DA5D4E5.7020603@michaelburghart.de> <4DA69E75.1020506@free.fr>
	<4DA6A1B8.4030005@michaelburghart.de> <4DA6A3D3.90703@free.fr>
Message-ID: <4DA6A568.3010804@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 14.04.2011 09:35, schrieb Guillaume Gardet:
> 
> 
> Le 14/04/2011 09:26, Michael Burghart a ?crit :
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Am 14.04.2011 09:12, schrieb Guillaume Gardet:
>>> Hi,
>>>
>>> have you a loop device : /dev/loop0 ?
>> yes of course :-)
> And enable it in the kernel? (Something like CONFIG_BLK_DEV_LOOP)

yes. The fact is that I can mount my root cramfs on /dev/loop0 and it
works. I need to add further cramfs into fstab to mount them. There is
the problem.


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNpqVoAAoJEEMkp/gkis19HGAH/AwdURwQSgDOoD/REN9FP6us
xOUMLkbKCIZqjsVhHpfUEimB4lhHKIs+wUlKlhyNihvsurBl75a2MWKal/kJznPa
V4nDLCyFHDVP7pnKk+DhHz718BePKxYaeasQZqqZiGGd0bTqNo6BNm/q0M9g0hQ2
fU+Oh7ZR7XI+THlZQEwXieWH7nx34ky7//LaecuS7xwxgyOxAoNvc0zYmUMDqMcD
FkuBUwMlx0JNoaKcptArlHV1HVC3tLw5uZHde96GThVlTMN+GIRfqexaUxr1O3hV
CY9ZbNtZiZiqy1gJYfijGwhMjA+L5oHacD4NL/YwTklWdkCNAaDYVXj89a8p7b8=
=W2Mv
-----END PGP SIGNATURE-----
