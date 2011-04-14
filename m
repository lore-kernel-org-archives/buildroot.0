From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Thu, 14 Apr 2011 09:35:47 +0200
Subject: [Buildroot] mounting a cramfs
In-Reply-To: <4DA6A1B8.4030005@michaelburghart.de>
References: <4DA5D4E5.7020603@michaelburghart.de> <4DA69E75.1020506@free.fr>
	<4DA6A1B8.4030005@michaelburghart.de>
Message-ID: <4DA6A3D3.90703@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le 14/04/2011 09:26, Michael Burghart a ?crit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Am 14.04.2011 09:12, schrieb Guillaume Gardet:
>> Hi,
>>
>> have you a loop device : /dev/loop0 ?
> yes of course :-)
And enable it in the kernel? (Something like CONFIG_BLK_DEV_LOOP)
