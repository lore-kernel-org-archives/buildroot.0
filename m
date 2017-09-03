From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 13:55:28 +0200
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.20.1
Message-ID: <20170903114824.5E47F7FA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16ddb2ba24d3faafc7845464e549abca81734624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index bed2aef..22882c9 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 2a451bcf42dc0865840463f7efc3f51cebeb4ea8  sqlite-autoconf-3200000.tar.gz
+sha1 48593dcd19473f25fe6fcd08048e13ddbff4c983  sqlite-autoconf-3200100.tar.gz
 # Calculated based on the hash above
-sha256 3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0  sqlite-autoconf-3200000.tar.gz
+sha256 ec66595b29bc0798b023a5122021ea646ab4fa9e2f735937c5426feeba950742  sqlite-autoconf-3200100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1bfa6ca..39ea9ce 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3200000
+SQLITE_VERSION = 3200100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
