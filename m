From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  3 Mar 2016 22:12:44 +0100
Subject: [Buildroot] [PATCH 1/3] copas: bump to version 2.0.1
Message-ID: <1457039566-3326-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/copas/copas.hash | 2 +-
 package/copas/copas.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/copas/copas.hash b/package/copas/copas.hash
index 35dff2f..27e3316 100644
--- a/package/copas/copas.hash
+++ b/package/copas/copas.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	05be032ac2f3a32eb2eb536d41d2f5af620dded6e158c54d1ab0f73d2957dc68  copas-2.0.0-1.src.rock
+sha256  c94890bdc8899d05163ca963dadf4b74b2ad7a5795ea3923a792b6e928ec142a  copas-2.0.1-1.src.rock
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index b3f97c7..132b5d9 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COPAS_VERSION = 2.0.0-1
-COPAS_SUBDIR = copas-2_0_0
+COPAS_VERSION = 2.0.1-1
+COPAS_SUBDIR = copas-2_0_1
 COPAS_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.5.0
