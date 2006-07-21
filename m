From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 16:51:13 2006
Subject: [Buildroot] [PATCH] cross mod-init-tools target
Message-ID: <c1bf1cf0607211651k12cbd900n63ca0e791cccd026@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building a modular Linux 2.6 kernel requires a cross version of
mod-init-tools, just as Linux 2.4 requires modutils. The attached
patch adds a cross target to mod-init-tools.mk.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-cross-module-init-tools.patch
Type: text/x-patch
Size: 3392 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/93f56bd1/buildroot-cross-module-init-tools.bin
