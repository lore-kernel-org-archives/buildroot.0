From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:57:56 +0100
Subject: [Buildroot] [git commit] libtirpc: remove patch numbers from patch
	titles
Message-ID: <20121114220319.2AEF399FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9346b1b979edc6444ca8539aec9e1bac585e001f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch numbers in [PATCH x/y] are quite useless within the context
of Buildroot, and generate noise when patches are re-ordered.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |    4 ++--
 ...out-RPC-support-does-not-install-rpcent.h.patch |    4 ++--
 ...btirpc-0003-Add-missing-INET6-conditional.patch |    4 ++--
 .../libtirpc-0004-Make-IPv6-support-optional.patch |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
index bdbe021..7caccc2 100644
--- a/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
+++ b/package/libtirpc/libtirpc-0001-Disable-parts-of-TIRPC-requiring-NIS-support.patch
@@ -1,7 +1,7 @@
-From f4c022c526ce061dfdd3c46f544a9495a3a3a97e Mon Sep 17 00:00:00 2001
+From cc4ec3294cb06724c83d4c4e1ea9fc2e38923c98 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:57:39 +0200
-Subject: [PATCH 1/4] Disable parts of TIRPC requiring NIS support
+Subject: [PATCH] Disable parts of TIRPC requiring NIS support
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
diff --git a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
index 0798c34..b950cb3 100644
--- a/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
+++ b/package/libtirpc/libtirpc-0002-uClibc-without-RPC-support-does-not-install-rpcent.h.patch
@@ -1,7 +1,7 @@
-From c91721dc289397dfe38fdae175f4ee37e824667c Mon Sep 17 00:00:00 2001
+From c2e96bdc453334f10faf8db0eb06e41ab3ca4fe9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:58:07 +0200
-Subject: [PATCH 2/4] uClibc without RPC support does not install rpcent.h
+Subject: [PATCH] uClibc without RPC support does not install rpcent.h
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
diff --git a/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch b/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
index 64d3da8..a05d7ad 100644
--- a/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
+++ b/package/libtirpc/libtirpc-0003-Add-missing-INET6-conditional.patch
@@ -1,7 +1,7 @@
-From a4852bd653ac917165de1d41b60168cd88dc6672 Mon Sep 17 00:00:00 2001
+From a40e00a16cf43245953ad6d43a4f260a47e6d198 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 23 Jun 2012 21:58:36 +0200
-Subject: [PATCH 3/4] Add missing INET6 conditional
+Subject: [PATCH] Add missing INET6 conditional
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
diff --git a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch b/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
index 455ad74..c93fea2 100644
--- a/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
+++ b/package/libtirpc/libtirpc-0004-Make-IPv6-support-optional.patch
@@ -1,7 +1,7 @@
-From 1f36736733eac5080f3a4f3abd1c3a04ac42f1dd Mon Sep 17 00:00:00 2001
+From 5ce585bed328fafc99800effb5e9d1b07dbac2b7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sun, 24 Jun 2012 21:40:21 +0200
-Subject: [PATCH 4/4] Make IPv6 support optional
+Subject: [PATCH] Make IPv6 support optional
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
