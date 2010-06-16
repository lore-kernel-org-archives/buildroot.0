From: Ossy <ossy1980@gmx.net>
Date: Wed, 16 Jun 2010 23:53:14 +0200
Subject: [Buildroot] rsync does not compile
Message-ID: <4C1947CA.70405@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildrootmailinglist,

The rsync package does not compile. I use arm926t as build target.
Is it a known issue? I haven't found it in bugzilla.

Please find below the output.

Kind regards,
Marcus


configure.sh: WARNING: unrecognized options: --disable-gtk-doc, 
--disable-nls

     rsync 3.0.7 configuration successful

 >>> rsync 3.0.7 Building
PATH="/home/ossy/buildroot/buildroot-dev/output/toolchain/bin:/home/ossy/buildroot/buildroot-dev/output/host/bin:/home/ossy/buildroot/buildr
oot-dev/output/host/usr/bin:/home/ossy/buildroot/buildroot-dev/output/host/usr/sbin/:/home/ossy/buildroot/buildroot-dev/output/staging/bin:/
home/ossy/buildroot/buildroot-dev/output/staging/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/games" 
PERLLIB="/home/ossy/buildroot/buildroot-de
v/output/host/usr/lib/perl"  /usr/bin/make -j1  -C 
/home/ossy/buildroot/buildroot-dev/output/build/rsync-3.0.7/
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/rsync-3.0.7'
perl ./mkproto.pl ./*.c ./lib/compat.c
In file included from ./rsync.h:887,
                  from ./rounding.c:20:
./lib/addrinfo.h:141: error: redefinition of 'struct sockaddr_storage'
Failed to create rounding.h!
make[1]: *** [rounding.h] Fehler 1
make[1]: Leaving directory 
`/home/ossy/buildroot/buildroot-dev/output/build/rsync-3.0.7'
make: *** 
[/home/ossy/buildroot/buildroot-dev/output/build/rsync-3.0.7/.stamp_built] 
Fehler 2
ossy at debian-virtual:~/buildroot/buildroot-dev$


ossy at debian-virtual:~/buildroot/buildroot-dev$ cat .git/FETCH_HEAD
5fd095b3748115d7cbe89524332e4b310550b7c3                branch 'master' 
of http://git.buildroot.net/buildroot
ossy at debian-virtual:~/buildroot/buildroot-dev$
