From: Mircha Emanuel `ryuujin` D'Angelo <ryuujin@olografix.org>
Date: Wed, 08 Nov 2006 15:23:03 +0100
Subject: [Buildroot] using the buildroot toolchain
Message-ID: <4551E847.60606@olografix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,
this is my first post here :)

I built a rootfs using buildroot and it works fine :).

Now, I have to build my own applications and I'm wondering how can I use
the toolchain created with buildroot.

I know I have the toolchain in {$BUILDROOT}/build_{$arch}/staging_dir/
but I don't know how I can compile other applications with uClibc.

For example, if I wanna build A-0.0. I export the toolchain path, then I
go in A-0.0 directory.

And now? I would have to do ./configure, but there is bad cause the
script is looking on my host and not on my toolchain. I can't chroot in
toolchain path cause I don't have make and other utility.

I hope someone could explain me... :)

thanks all
mircha

PS: sorry for my english
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.7 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFFUehH0CI10whGevwRAmgHAJwLfEstwIbypDPD0hJrYimzxLb2/gCdGdWr
jfsqkcduyj0cSQS7/TGu6bQ=
=+TyE
-----END PGP SIGNATURE-----
