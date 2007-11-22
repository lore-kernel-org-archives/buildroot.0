From: Jean-Claude Gervais <jc.gervais@videotron.ca>
Date: Thu, 22 Nov 2007 15:18:53 -0500
Subject: [Buildroot] arm build failing - 'fakeroot: preload library not
	found'
Message-ID: <1195762733.20822.11.camel@mercury.sprymusic>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting a build error:

>> /home/jgervais/Desktop/crossdev/arm/buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
chmod a
+x /home/jgervais/Desktop/crossdev/arm/buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
/home/jgervais/Desktop/crossdev/arm/buildroot/build_arm/staging_dir/usr/bin/fakeroot -- /home/jgervais/Desktop/crossdev/arm/buildroot/project_build_arm/uclibc/_fakeroot.rootfs.arm.jffs2
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
<stdin>:1385:2: warning: #warning syscall fallocate not implemented
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
<stdin>:1385:2: warning: #warning syscall fallocate not implemented
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
<stdin>:1385:2: warning: #warning syscall fallocate not implemented
compr_lzo.c: In function 'jffs2_lzo_cmpr':
compr_lzo.c:54: warning: passing argument 4 of 'lzo1x_999_compress' from
incompatible pointer type
compr_lzo.c: In function 'jffs2_lzo_decompress':
compr_lzo.c:74: warning: passing argument 4 of 'lzo1x_decompress_safe'
from incompatible pointer type
fakeroot: preload library not found, aborting.
make: ***
[/home/jgervais/Desktop/crossdev/arm/buildroot/binaries/uclibc/rootfs.arm.jffs2] Error 1

What does the error message mean?
Which library is it looking for?
