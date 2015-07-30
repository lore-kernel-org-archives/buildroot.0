From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jul 2015 08:17:39 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.8.11.1
Message-ID: <1438255059-26620-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1c30137..8b507f0 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	da1322d883548bdb0f6312941b20ed497e3754fa	sqlite-autoconf-3081100.tar.gz
+sha1	d0e22d7e361b6f50830a3cdeafe35311443f8f9a	sqlite-autoconf-3081101.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 34eab2b..afeae6c6 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3081100
+SQLITE_VERSION = 3081101
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
-- 
2.3.6
