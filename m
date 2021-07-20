From: Alexey Neyman <stilor@att.net>
Date: Tue, 20 Jul 2021 15:40:55 -0700
Subject: [Buildroot] [PATCH] package/nmap: fix ncat on Unix socket
References: <94578b85-8388-1cf0-5c57-d970a092a712.ref@att.net>
Message-ID: <94578b85-8388-1cf0-5c57-d970a092a712@att.net>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210720224055.wiqLWKSTvQittGZFogkuD4DlicNl2Fc4Uuz0Ksv4eIo@z>

[For some reason, this email did not appear in buildroot list archive; 
resending]

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
Size: 1829 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210720/d8d3d14a/attachment.bin>
