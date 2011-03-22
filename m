From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 22 Mar 2011 21:00:06 +0100
Subject: [Buildroot] Compiling Apache
In-Reply-To: <20110322195502.GA8662@tarshish>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
	<4D88F97B.4060605@michaelburghart.de>
	<20110322195502.GA8662@tarshish>
Message-ID: <4D88FFC6.1010404@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Baruch,

Am 22.03.2011 20:55, schrieb Baruch Siach:
> Quoting the execve(2) man page:
> 
>        ENOENT The  file  filename  or  a script or ELF interpreter does not exist, or a
>               shared library needed for file or interpreter cannot be found.
> 
> This means that the format of the executable is wrong. What is the output of 
> 'file dftables'?

./dftables: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
dynamically linked (uses shared libs), not stripped

But what is wrong?!

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNiP/GAAoJEEMkp/gkis19b1kH/R0dw7EVzJzeohj+5sv2MA09
B1ustR+KqY3+gnrPjCZdfWyv3sl9I6RJVcNLB4Eb5g0XUnNMiZ9bgvY/eVbQLvrW
yYqFgIXS41z+GUmuSsalClol/mXKWtNG1EekBBUdakLbEzjNX9xGD+0endcGiWgI
AvzrWps1guUpRo+OMol1P6R8OOEBeAvrS2kfC+pnfOaXfLybNnnqQOHIqSmDEvVT
fB+06226wTQXlv94c9jfiwZ4GWR182WvtBqOu/5+5Lep5yzIitKZdlxYbcDJxu7z
5aiW8ec/spo4WdhyIRXf6U7nz7/Sd4tvHWLDrQFV5mcJJk0tYc0A0ddeh/vX2Lo=
=9Tzl
-----END PGP SIGNATURE-----
