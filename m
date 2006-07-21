From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 16:44:33 2006
Subject: [Buildroot] [PATCH] cpio+gzip root filesystem target
Message-ID: <c1bf1cf0607211644u377dc097n5eb9a744d690e77e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Newer Linux kernels can populate a ramfs-based root filesystem
(initramfs) from a gzipped cpio archive, which can be more memory
efficient than a traditional ramdisk, as files are kept in the page
cache itself.

The attached patch adds support for a cpio+gzip root filesystem target
to buildroot.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-cpio-gz-target.patch
Type: text/x-patch
Size: 2082 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/53845d20/buildroot-cpio-gz-target.bin
