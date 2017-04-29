From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 16:02:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.5.8
Message-ID: <20170429140207.6142-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version bump includes a regression fix:
https://www.samba.org/samba/history/samba-4.5.8.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 71d24f7fe..0a2a548a1 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ac70f09af80639d8189e1b9bc0a554841ee44df2b1ef58e7e682ad5400fd9400	samba-4.5.7.tar.gz
+sha256 f63b656d8823a280c50c9dbd6b692816cd7a88adfe9b47997ce697fd75bf81f0  samba-4.5.8.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 130b661c6..4de69a0fa 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.5.7
+SAMBA4_VERSION = 4.5.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
