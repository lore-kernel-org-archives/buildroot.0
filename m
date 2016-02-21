From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 20 Feb 2016 23:07:39 -0300
Subject: [Buildroot] [PATCH 2/2] package/vim: add optional support for
	gmp
Message-ID: <56c91beb3ec34_2b3e3fd8cc6dbf34848f7@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Sorry the e-mail without subject,
I did something wrong and my mail client did not understand the subject line.
Resending to go to patchwork.
If this e-mail still don't work I will give up to avoid spam.

On Sat, 20 Feb 2016 23:45:42 +0100, Bernd Kuhls wrote:
> Sub ject: [Buildroot] [PATCH 2/2] package/vim: add optional support for
> 	gmp

Typo: s/gmp/gpm/g

> 
> When gmp was compiled before, vim will use it as optional dependency:

Typo: s/gmp/gpm/g

It seems silly because these are only typos, but we have both packages
(gmp and gpm) in buildroot.

> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vim | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libacl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libgpm.so.2]

Regards,
Ricardo
