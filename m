From: Fathi Boudra <fboudra@gmail.com>
Date: Sat, 28 Jun 2008 09:01:52 +0200
Subject: [Buildroot] Fwd: [PATCH] fix gdb-6.7.1 (bug 0002824)
Message-ID: <200806280901.53712.fboudra@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

* Remove patches:
  - 100-uclibc-conf.patch
  - 700-nios2-6.6.patch

* Use 600-fix-compile-flag-mismatch.patch attached.

An extra patch is added to add --disable-werror to gdb on host.
It fixes build failure when gcc >= 4.3 is used:
symtab.c:2252: error: 'exact' may be used uninitialized in this function

cheers,

Fathi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: disable_werror_gdb_on_host_gcc-4.3.diff
Type: text/x-diff
Size: 214 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080628/1c980cd4/attachment.diff 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 600-fix-compile-flag-mismatch.patch
Type: text/x-diff
Size: 920 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080628/1c980cd4/attachment.patch 
