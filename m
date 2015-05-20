From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 20 May 2015 10:26:38 +0200
Subject: [Buildroot] [PATCH/next 7/7] package/sqlite: bump version to
	3.8.10.1
In-Reply-To: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432110398-22791-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1432110398-22791-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index d524dbe..908d33e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	7e92b4f78d4648fb2a97a4dc721490cc08653a0b	sqlite-autoconf-3081000.tar.gz
+sha1	86bfed5752783fb24c051f3efac5972ce11023f0	sqlite-autoconf-3081001.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index fff219a..41a900f 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3081000
+SQLITE_VERSION = 3081001
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
-- 
1.7.10.4
