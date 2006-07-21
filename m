From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 17:27:58 2006
Subject: [Buildroot] [PATCH] build Linux 2.6 kernel
Message-ID: <c1bf1cf0607211727s5b8f1334x48670099698fc2b3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The attached patch adds a Linux 2.6 kernel package to buildroot. I've
only used it to build for a PowerPC, but it should be sufficiently
parameterized to support any architecture.

I understand that the preferred way of building a kernel with
buildroot is to set up a target device tree, but for me this would
just add extra work, as I already provide all the target
device-specific parameters (UCLIBC_CONFIG_FILE, BUSYBOX_CONFIG_FILE,
TARGET_SKELETON, etc.) on the command line when making buildroot.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-linux-package.patch
Type: text/x-patch
Size: 4011 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/6f249bc7/buildroot-linux-package.bin
