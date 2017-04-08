From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:54:49 +0200
Subject: [Buildroot] [git commit] autofs: fix Git formatting of patch
Message-ID: <20170408135543.4615E8267F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6510f55d42f7f75007c00ce5de83a8e1be852c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0001-include-linux-nfs.h-directly-in-rpc_sub.patch was Git
formatted, except that a Upstream status statement was added above the
patch, which makes it unapplicable by "git am". So fix this by putting
the Upstream status statement where it should be.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch b/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
index 26e86c3..26f2265 100644
--- a/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
+++ b/package/autofs/0001-include-linux-nfs.h-directly-in-rpc_sub.patch
@@ -1,5 +1,3 @@
-Upstream-Status: Pending
-
 From 44bdce8c6ed9b30c1643e5981172a4f9025f013c Mon Sep 17 00:00:00 2001
 From: Andreas Oberritter <obi@opendreambox.org>
 Date: Wed, 13 Mar 2013 16:17:08 +0100
@@ -11,6 +9,7 @@ other linux/nfs*.h files directly.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-Status: Pending
 ---
  include/rpc_subs.h |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
