From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Dec 2019 20:50:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/emlog: bump to version 0.70
Message-ID: <20191207195005.653558-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/emlog/emlog.hash | 3 ++-
 package/emlog/emlog.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
index ba0a201acb..ddc61a88e8 100644
--- a/package/emlog/emlog.hash
+++ b/package/emlog/emlog.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-0.60.tar.gz
+sha256 76082cf981b0865c8a1b300d4641c790a6556461901bbb63700df38300277271  emlog-0.70.tar.gz
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index 42e3c9dd7b..8759f82c7c 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMLOG_VERSION = 0.60
+EMLOG_VERSION = 0.70
 EMLOG_SITE = $(call github,nicupavel,emlog,emlog-$(EMLOG_VERSION))
 EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
-- 
2.24.0
