From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 20:14:21 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.10.1
Message-ID: <20160114191428.6C4B07FCF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80397cb2ff4e3edd4d29aebfaa128eae46e01a0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 4fca659..116bbba 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	7be6e6869d0d2d9fe3df71b5c65f065dd2325f58	sqlite-autoconf-3100000.tar.gz
+sha1	fedd95d402628ed0e0e3444ce50bcbd1fe2e7294	sqlite-autoconf-3100100.tar.gz
 # Calculated based on the hash above
-sha256	43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042	sqlite-autoconf-3100000.tar.gz
+sha256	3cb4e17137f7422554c8e8906b5a7274c7a0d362872e8aa25233c3f1246bda98	sqlite-autoconf-3100100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index fe115eb..e47e3c2 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3100000
+SQLITE_VERSION = 3100100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
