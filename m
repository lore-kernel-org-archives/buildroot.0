From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2015 09:51:05 +0200
Subject: [Buildroot] [git commit] sqlite: security bump to 3.8.10
Message-ID: <20150508081947.10DFC81952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89f96ea96c16ba62117089e10f582b34c59623fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: CVE-2015-3414, CVE-2015-3415 and CVE-2015-3416.

For details, see the Debian advisory:
https://www.debian.org/security/2015/dsa-3252

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index b57fdfb..d524dbe 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	db70dee268700b312cbaa5b3e5cf8454e1c8b7b9	sqlite-autoconf-3080900.tar.gz
+sha1	7e92b4f78d4648fb2a97a4dc721490cc08653a0b	sqlite-autoconf-3081000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index d8ea1c7..fff219a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080900
+SQLITE_VERSION = 3081000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
