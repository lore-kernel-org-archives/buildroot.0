From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jun 2016 20:20:51 -0300
Subject: [Buildroot] [PATCH] hiawatha: bump to version 10.3
Message-ID: <1465255251-24256-1-git-send-email-gustavo@zacarias.com.ar>
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
index 5709076..a5207a1 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3892e0a1836661c8dcc649f9ae965289f701640a618baf2c2287da9b78e36cf1	hiawatha-10.1.tar.gz
+sha256	99d185fb16bb1ab706724494d3cac86464f1485ed4b0fff09a192eca6da5ff8e	hiawatha-10.3.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index d30b1a1..dc49216 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.1
+HIAWATHA_VERSION = 10.3
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPLv2
-- 
2.7.3
