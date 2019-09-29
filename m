From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Sep 2019 19:08:09 +0200
Subject: [Buildroot] [PATCH] package/unscd: bump version
Message-ID: <20190929170809.22598-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 0.53 has a fix for INVALIDATE and SHUTDOWN requests being
ignored.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Doug Kehn <rdkehn@yahoo.com>
---
 package/unscd/unscd.hash | 2 +-
 package/unscd/unscd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unscd/unscd.hash b/package/unscd/unscd.hash
index ab8ffdc0cf..671149fda2 100644
--- a/package/unscd/unscd.hash
+++ b/package/unscd/unscd.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	4c1f83dcd120469fceef749050cb29fa666fa4666bd308dfe92e933a4c200d55	nscd-0.52.c
+sha256  9078255b2b9c344d9a0c3333ce23dda9d745f158dde0ea2244a8c56ba93f7a40  nscd-0.53.c
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
index 36f2de271b..c79ec44000 100644
--- a/package/unscd/unscd.mk
+++ b/package/unscd/unscd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNSCD_VERSION = 0.52
+UNSCD_VERSION = 0.53
 UNSCD_SOURCE = nscd-$(UNSCD_VERSION).c
 UNSCD_SITE = http://busybox.net/~vda/unscd
 UNSCD_LICENSE = GPL-2.0
-- 
2.20.1
