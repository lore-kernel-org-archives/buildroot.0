From: Michael Burghart <mb@michaelburghart.de>
Date: Sun, 10 Apr 2011 00:48:19 +0200
Subject: [Buildroot] init not PID 1
In-Reply-To: <4DA0AB5E.7090005@arcor.de>
References: <4DA08A90.2020708@michaelburghart.de> <4DA0AB5E.7090005@arcor.de>
Message-ID: <4DA0E233.5000109@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 09.04.2011 20:54, schrieb Jason Curl:
> 
> (which is correct).
> But why is it not 1?
>> Did you not start it from the kernel, but perhaps from a shell script?

I have a look. Normally I start my kernel and thought the kernel keeps
track of the init process.


>> The first process the kernel starts is PID 1.

sure, but that normally is init. Don't know why it's not here.

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNoOIzAAoJEEMkp/gkis19OGMH/1wbC6T+EZTwIJI+Zp8lkyP+
yiOhlYyXz1DEDDDSMcYWW11DvWAtRW/ATCXgXB1pP2aBLzlJEFM6nCma06unWpCH
pNQSNuYtPHg77jMx7JhX89ovtq1XH9VZv9a/nzqomfyqAswXaGWIKhPl02R7yapj
k/R3H9iIpr4Y2vpO9trBPApYyHBJy3Ww8v3rS3vchDbSAq9bY26/F/m7ueXFJ2oY
+7Z3+ZGcU7pSExSSf/H7bAi937QYgpwc10HMng/Nwh8l1PJRhzbrXsXqRjtjPf05
veL1UqE+ka+DPfd1KMkpa8Utf0rZ6U1Z/5x5X6ybyo4FJVpL5WYS39pD1ebgLpI=
=iZ0t
-----END PGP SIGNATURE-----
