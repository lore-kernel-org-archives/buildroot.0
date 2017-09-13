From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 13:32:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/newt: bump version to 0.52.20
Message-ID: <20170913113250.5718-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/newt/newt.hash | 2 +-
 package/newt/newt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index fe5870b062..b6fd317ce3 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	08c0db56c21996af6a7cbab99491b774c6c09cef91cd9b03903c84634bff2e80  newt-0.52.19.tar.gz
+sha256 8d66ba6beffc3f786d4ccfee9d2b43d93484680ef8db9397a4fb70b5adbb6dbc  newt-0.52.20.tar.gz
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 456dd699c9..b6d973af75 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.19
+NEWT_VERSION = 0.52.20
 NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
-- 
2.11.0
