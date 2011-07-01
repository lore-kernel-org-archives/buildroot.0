From: Wolfram Gloger <wg@malloc.de>
Date: Fri, 01 Jul 2011 18:32:02 +0200
Subject: [Buildroot] [PATCH] new package: minidlna
Message-ID: <0MKxYi-1QcgdO2zs8-00018x@mrelayeu.kundenserver.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MiniDLNA is server software with the aim of being fully compliant with
DLNA/UPnP-AV clients.

This new package depends on libav (see my other patch) as I could not
get it to work with the current ffmpeg package in buildroot.

Signed-off-by: Wolfram Gloger <wg@malloc.de>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2011.05-minidlna.diff
Type: application/octet-stream
Size: 12435 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110701/39f6cadb/attachment.obj>
