From: Will Buik <willbuik@gmail.com>
Date: Thu, 20 Mar 2008 21:38:04 -0400
Subject: [Buildroot] Compilation Error
Message-ID: <1d09f8b80803201838p2fa47bdcgcece859532c48be5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting this error with a default configuration of buildroot:

`/XXX/buildroot/dl/busybox-snapshot.tar.bz2' saved [2989276/2989276]

bzcat /XXX/buildroot/dl/busybox-snapshot.tar.bz2 | tar -C
/XXX/buildroot/project_build_i686/uclibc   -xf -
# Allow busybox patches.
toolchain/patch-kernel.sh /XXX/buildroot/project_build_i686/uclibc/busybox
package/busybox busybox.\*.patch
touch /XXX/buildroot/project_build_i686/uclibc/busybox/.unpacked
make: *** No rule to make target `package/busybox/busybox-1.9.0.config',
needed by `/XXX/buildroot/project_build_i686/uclibc/busybox/.configured'.
Stop.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080320/a4cae2f4/attachment.htm 
