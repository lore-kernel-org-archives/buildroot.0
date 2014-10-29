From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:38:22 +0100
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.8.7.1
Message-ID: <20141029203827.7C2B4B1F1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf3bc9c4be1bae44a7a682973c2a5b22a7c56edd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index e2a0f91..ad1b6c5 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	8b773b006db46f3ffcbabe065e927823d13bf5c0	sqlite-autoconf-3080700.tar.gz
+sha1	5601be1263842209d7c5dbf6128f1cc0b6bbe2e5	sqlite-autoconf-3080701.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 19bde83..ea8407c 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080700
+SQLITE_VERSION = 3080701
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
