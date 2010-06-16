From: Ossy <ossy1980@gmx.net>
Date: Thu, 17 Jun 2010 00:10:26 +0200
Subject: [Buildroot] squashfs-tools do not compile
Message-ID: <4C194BD2.3060600@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildrootmailinglist,

The squashfs-tools do not compile. I use arm926t as build target.
I haven't found a bug in the database.

Kind regards,
Marcus


/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
-L/home/ossy/buildroot/buildroot-dev/output/st
aging/lib -L/home/ossy/buildroot/buildroot-dev/output/staging/usr/lib 
--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging/ mksquashf
s.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o mksquashfs
mksquashfs.o: In function `initialise_threads':
mksquashfs.c:(.text+0x1d74): undefined reference to `get_nprocs'
collect2: ld returned 1 exit status
make[1]: *** [mksquashfs] Fehler 1
make[1]: Leaving directory 
`/home/ossy/buildroot/buildroot-dev/output/build/squashfs-4.0/squashfs-tools'
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/squashfs-4.0/.stamp_built] 
Fehler 2
ossy at debian-virtual:~/buildroot/buildroot-dev$

ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .git/FETCH_HEAD
5fd095b3748115d7cbe89524332e4b310550b7c3                branch 'master' 
of http://git.buildroot.net/buildroot
ossy at debian-virtual:~/buildroot/buildroot-dev$
