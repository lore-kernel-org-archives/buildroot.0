From: Maxim Cournoyer <maxim.cournoyer@savoirfairelinux.com>
Date: Thu, 25 Jun 2020 14:11:38 -0400 (EDT)
Subject: [Buildroot] [PATCH] packages/pkg-download.mk: fix file locking over
 NFS
Message-ID: <1993147260.30143.1593108698133.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The attached patch fixes the NFS lock mechanism not working.

Tested using NFS 4.2 and multiple build machines caching the same source artifacts in parallel to an empty NFS directory.

Thank you,

Maxim
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-packages-pkg-download.mk-fix-file-locking-over-NFS.patch
Type: text/x-patch
Size: 1274 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200625/7ed64a2c/attachment.bin>
