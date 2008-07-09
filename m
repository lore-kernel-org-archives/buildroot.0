From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 09 Jul 2008 16:40:16 +0200
Subject: [Buildroot] built without large file support
In-Reply-To: <4874BD76.5030207@valcom.com>
References: <4874BD76.5030207@valcom.com>
Message-ID: <4874CDD0.809@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert B. Williams skrev:
> Am trying to compile grub and it is complaining that large file support 
> is turned off and that _FILE_OFFSET_BITS=64.  I guess one of these 
> things needs to change....
> 
>  From menuconfig I tried to enable large file support in the toolchain 
> area....no affect.

ONce you have changed a toolchain option, you will have to
rebuild the toolchain.
It is problaby best to start with a fresh buildroot tree,
and use your old .config.

BR
Ulf Samuelsson

> 
> Please help...
> 
> 2nd:
> What do I need to do to boot linux with root filesystem in flash?
> 
> So far I created a cpio image and well that runs off of a ramdisk.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIdM3QAyRRH5cXxqwRAmVEAJ9RZ8LoaDU10H1HAPjiBQM2aI9rgQCgsKSR
bxz31cC7l/U/QWW0IYXgMLY=
=oDwY
-----END PGP SIGNATURE-----
