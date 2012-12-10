From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Dec 2012 11:23:30 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.7.14.1
Message-ID: <1355149410-19395-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0320cc4..bf4b921 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3071300
+SQLITE_VERSION = 3071401
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_LICENSE = Public domain
-- 
1.7.8.6
