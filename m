From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Feb 2011 23:01:44 +0100
Subject: [Buildroot] [git commit master 1/1] sqlite: bump to version 3.7.5
Message-ID: <20110209220224.690E28F47E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4b5b0a65a49b5c7e39cd55c87fc1d0b8b2117093
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://www.sqlite.org/releaselog/3_7_5.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlite/sqlite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7b3a983..30e75a2 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3070400
+SQLITE_VERSION = 3070500
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.7.3.4
