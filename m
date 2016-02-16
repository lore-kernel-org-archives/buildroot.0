From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:52:55 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.11.0
Message-ID: <20160302202752.5372680203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a8d20e33a2620e38c56a7874ee3d8f045a4c685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 1f07794..7a218dc 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	ea4156fc3f6a4a4a2752a5a3ac5c5b3fe7e1a24b	sqlite-autoconf-3100200.tar.gz
+sha1	e2d300e4b24af5ecd67a1396488893fa44864e36	sqlite-autoconf-3110000.tar.gz
 # Calculated based on the hash above
-sha256	a2b3b4bd1291ea7d6c8252f7edff36a4362f2f0e5d5370444ba6cbe313ae2971	sqlite-autoconf-3100200.tar.gz
+sha256	508d4dcbcf7a7181e95c717a1dc4ae3c0880b3d593be0c4b40abb6c3a0e201fb	sqlite-autoconf-3110000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1603e00..0a119cc 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3100200
+SQLITE_VERSION = 3110000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
