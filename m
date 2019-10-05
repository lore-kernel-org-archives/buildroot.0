From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:50:28 +0200
Subject: [Buildroot] [git commit] package/unscd: bump version to 0.53
Message-ID: <20191005214958.E5B6A89121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2de12892820ae2613ed102d27b2af61fd6bff6fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.53 has a fix for INVALIDATE and SHUTDOWN requests being
ignored.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
