From: =?iso-8859-1?q?=D8yvind_Repvik?= <repvik@kynisk.com>
Date: Mon, 30 Apr 2007 03:07:58 +0200
Subject: [Buildroot] [PATCH] e2fsprogs symlinking
Message-ID: <200704300307.58865.repvik@kynisk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

	When e2fsprogs is installed, it duplicates several binaries, which isn't 
really very space efficient. This patch removes these duplicate binaries and 
replaces them with symlinks pointing to the original binary.
This saves 448kb on an uncompressed rootfs.

Regards,
?yvind Repvik
-------------- next part --------------
A non-text attachment was scrubbed...
Name: e2fsprogs_symlinks.diff
Type: text/x-diff
Size: 1020 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070430/cf849f11/attachment.bin 
