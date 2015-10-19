From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Oct 2015 21:58:39 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.9.1
Message-ID: <20151019202704.964BD81E87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=485fc7671c17314ae0fe5a80b064235d5f614fbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash |    4 ++--
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index c149c67..4c8caae 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	6578aa8df05fd7777fbbc4fbf1912d981623f73b	sqlite-autoconf-3090000.tar.gz
+sha1	6b7d22c24c9695118a2706c8e026fb3c31780a30	sqlite-autoconf-3090100.tar.gz
 # Calculated based on the hash above
-sha256	a324143f4cc35cd7e9605a0a8dec9f9e4861d0be8305f3642e7d05008b77e60d	sqlite-autoconf-3090000.tar.gz
+sha256	d89d0e1d93deafebd0aa067d20d9029d9914ccde244920d9dd09ea51944e1c6c	sqlite-autoconf-3090100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c6e95ee..6ae74ea 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3090000
+SQLITE_VERSION = 3090100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
