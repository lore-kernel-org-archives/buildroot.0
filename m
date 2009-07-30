From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Jul 2009 17:14:38 +0200
Subject: [Buildroot] [git commit] Bump sqlite package to 3.6.16
Message-ID: <20090730151457.9A39B763B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=00c8bdd5613927a94e0a92ff3833004db5f40c05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #509

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                           |    1 +
 package/database/sqlite/sqlite.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index bda651f..527383c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -49,6 +49,7 @@
 	#491: libxml2: Bump version to 0.7.3
 	#495: Bump bind package to 9.5.1-P3 (security)
 	#497: OpenSSL RSA key generation hangs on x86_64
+	#509: Bump sqlite package to 3.6.16
 
 2009.05, Released June 1st, 2009:
 
diff --git a/package/database/sqlite/sqlite.mk b/package/database/sqlite/sqlite.mk
index 9bceee2..564ea3e 100644
--- a/package/database/sqlite/sqlite.mk
+++ b/package/database/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.15
+SQLITE_VERSION = 3.6.16
 SQLITE_SOURCE = sqlite-amalgamation-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.6.3.3
