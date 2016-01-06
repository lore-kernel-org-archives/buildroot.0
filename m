From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Jan 2016 20:11:25 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.10.0
Message-ID: <1452121885-29413-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 435e5de..4fca659 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	dae1ae5297fece9671ae0c434a7ecd0cda09c76a	sqlite-autoconf-3090200.tar.gz
+sha1	7be6e6869d0d2d9fe3df71b5c65f065dd2325f58	sqlite-autoconf-3100000.tar.gz
 # Calculated based on the hash above
-sha256	064c0abe9c9177534d4c770bca7a5902f9924b629ac886b4c08956be6dfbc36b	sqlite-autoconf-3090200.tar.gz
+sha256	43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042	sqlite-autoconf-3100000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0758fe9..fe115eb 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3090200
+SQLITE_VERSION = 3100000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2015
+SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
-- 
2.4.10
