From: Alexey Neyman <stilor@att.net>
Date: Mon, 19 Jul 2021 14:51:01 -0700
Subject: [Buildroot] [PATCH] package/nmap: fix ncat on Unix socket
References: <dfa77faa-b620-5981-1761-812886af29fc.ref@att.net>
Message-ID: <dfa77faa-b620-5981-1761-812886af29fc@att.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Starting with nmap 7.91, ncat segfaults on an attempt to use it for a
Unix-domain socket (`ncat -U path`). The fix has been committed to nmap
in r38121.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 ?package/nmap/0002-ncat-unix-socket.patch | 28 ++++++++++++++++++++++++
 ?1 file changed, 28 insertions(+)
 ?create mode 100644 package/nmap/0002-ncat-unix-socket.patch

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-nmap-fix-ncat-on-Unix-socket.patch
Type: text/x-patch
Size: 1828 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210719/e7ae5d0d/attachment-0001.bin>
