From: Piotr Grudzinski <piotr@powersmiths.com>
Date: Mon, 7 Jan 2008 17:52:48 -0500
Subject: [Buildroot] Buildroot fails at libstdc++
References: <36163.1199717483@powersmiths.com><200801071709.25722.atle@nissestad.no><00ed01c8514b$4c1a53d0$7b01a8c0@Piotr><54064.127.0.0.1.1199727378.squirrel@localhost><014b01c85159$d58e4870$7b01a8c0@Piotr>
	<47828F43.2080009@nissestad.no>
Message-ID: <017901c85180$06b13680$7b01a8c0@Piotr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The buildroot process finished with some error (see below - and I wouldn't 
mind to know what it means) but the toolchain seems to be all in place.

make[2]: Leaving directory `/home/piotr/buildroot/build_arm/genext2fs-1.4'
make[1]: Leaving directory `/home/piotr/buildroot/build_arm/genext2fs-1.4'
touch -c /home/piotr/buildroot/build_arm/genext2fs-1.4/genext2fs
test -x 
/home/piotr/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ldconfig 
&& 
/home/piotr/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ldconfig 
 -r /home/piotr/buildroot/project_build_arm/uclibc/root 2>/dev/null
make: *** [/home/piotr/buildroot/binaries/uclibc/rootfs.arm.ext2] Error 1


Thanks for the excellent support,

Piotr
