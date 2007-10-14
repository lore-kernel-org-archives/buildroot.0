From: Rex Luscus <sinestado@gmail.com>
Date: Sun, 14 Oct 2007 12:11:33 -0300
Subject: [Buildroot] lockfile-progs Don't compile [PATCH]
Message-ID: <471231A5.3020304@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lockfile-progs 0.1.10 breaks with this error:

undefined reference to `*rindex*'

This patch update the package to 0.1.11 and add a patch to solve this.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-lockfile-progs.patch
Type: text/x-patch
Size: 1855 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071014/343dd5c8/attachment.bin 
