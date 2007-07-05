From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Fri, 6 Jul 2007 02:41:45 +0700
Subject: [Buildroot] util-linux patch
Message-ID: <5d75f4610707051241o59e47ae5u8f5943840a568556@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attached is a patch to make util-linux build.
This is against subversion version 19003.
It adds one patch for dealing with header file changes,
and then the util-linux.mk has been tweaked to handle the
case where we do not want NFS (RPC is off).
-------------- next part --------------
A non-text attachment was scrubbed...
Name: util-linux.patch
Type: application/octet-stream
Size: 12131 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070706/1e9c388a/attachment.obj 
