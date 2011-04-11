From: Michael Burghart <mb@michaelburghart.de>
Date: Mon, 11 Apr 2011 22:52:10 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <4DA36046.2040606@michaelburghart.de>
References: <4DA36046.2040606@michaelburghart.de>
Message-ID: <4DA369FA.8050505@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi once again,

Am 11.04.2011 22:10, schrieb Michael Burghart:
> Hi,
> 
> I want to design my own templates for directories and files (fstab etc).
> Where do I set this? I thought it's in ./fs/skeleton. But obviously not
> for every file..
> 
> Why this?

I set this in .config:

BR2_ROOTFS_SKELETON_CUSTOM=y
BR2_ROOTFS_SKELETON_CUSTOM_PATH="/Save/buildroot-2011.02/fs/skeleton"


but it's not used! I made special directories and files in the
fs/skeleton but they are nowhere to be seen. What do I have to do to
make them visible??

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNo2n6AAoJEEMkp/gkis19o90IAKcfTK+P4CAQKMiCPobd2UmU
3T3qYQA+EylLG7ZP1rSkj/2BwopdiAfy+yp6Jftl9qjpJDt5n4xlGqi9F6BZV6wP
Xda00VwVR0yChT8E1lVF63YZPAF6L5gtpav3vP0EoYdLTfwRqBFoXvF7VPjZ0VCE
72MGenaH19GDLCLU5ukWFiwh0bDnBgywX6HVoIFkTC3vLVQvMlij61FZ+FEHsUEs
S3bPXdZwV5Z+WHSmOTgVgHGCmkf5KvfmtrzdwT7kCAyNEqxA4KwDV/v/PRVQ+PfR
9r/Bphr4G1g4pdI/imViCuX6TGbRVtoSRG7hfHL+tMaQIiq+MzvzcDLSVd1R1Qo=
=cCdh
-----END PGP SIGNATURE-----
