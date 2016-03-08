From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  8 Mar 2016 20:56:20 -0300
Subject: [Buildroot] [PATCH] hiawatha: bump to version 10.1
Message-ID: <1457481380-8395-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index af59e9f..5709076 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a39d1f771d818025538bd1231f42001bf29a1ebf55ce3d82afb7305cc251dd0e	hiawatha-10.0.tar.gz
+sha256	3892e0a1836661c8dcc649f9ae965289f701640a618baf2c2287da9b78e36cf1	hiawatha-10.1.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 411853b..d30b1a1 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.0
+HIAWATHA_VERSION = 10.1
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPLv2
-- 
2.4.10
