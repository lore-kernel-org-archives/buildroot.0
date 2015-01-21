From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Jan 2015 08:15:53 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.8.8.1
Message-ID: <1421838953-26640-1-git-send-email-gustavo@zacarias.com.ar>
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
index def3b30..f282da7 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	abb7570b7e331ffede7f40f0037be6e0c03b73af	sqlite-autoconf-3080800.tar.gz
+sha1	a140e3ada8a91a7bacf7a58cfd8f5f0e76796258	sqlite-autoconf-3080801.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c1baae3..9207c5c 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080800
+SQLITE_VERSION = 3080801
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
-- 
2.0.5
