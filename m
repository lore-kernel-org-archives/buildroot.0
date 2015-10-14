From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:23:50 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.9.0
Message-ID: <20151014202428.C17A681EB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c521bad7e02015c4c52926ddae3114b8bb079f0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash |    4 +++-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 8b507f0..c149c67 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	d0e22d7e361b6f50830a3cdeafe35311443f8f9a	sqlite-autoconf-3081101.tar.gz
+sha1	6578aa8df05fd7777fbbc4fbf1912d981623f73b	sqlite-autoconf-3090000.tar.gz
+# Calculated based on the hash above
+sha256	a324143f4cc35cd7e9605a0a8dec9f9e4861d0be8305f3642e7d05008b77e60d	sqlite-autoconf-3090000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index afeae6c6..c6e95ee 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3081101
+SQLITE_VERSION = 3090000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
