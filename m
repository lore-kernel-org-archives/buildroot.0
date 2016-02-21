From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 20 Feb 2016 23:58:42 -0200
Subject: [Buildroot] (no subject)
Message-ID: <56c919d2e4721_2b3e164487084615@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls,

On Sat, 20 Feb 2016 23:45:42 +0100, Bernd Kuhls wrote:
> Subject: [Buildroot] [PATCH 2/2] package/vim: add optional support for
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
